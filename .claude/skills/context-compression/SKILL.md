---
name: context-compression
description: Optional tokenomics layer - compress tool outputs, logs, and RAG chunks BEFORE they enter the model context, so long-running and high-volume work stays within budget without losing signal. Use when tool outputs/logs are flooding context, before feeding large RAG results to a model, or when the user says "too much context", "compress this", "reduce tokens", "headroom", "context is full".
license: CC BY-NC-SA-4.0
metadata:
  version: "1.0"
  nbb_wave: "v6.5"
  status: new
  upstream: chopratejas/headroom (user-specified; UNPINNED - vendor via skill-supply-chain-review before adopting upstream code)
---

# Context-Compression Skill

## Purpose
The cheapest token is the one you never load. This skill is an optional layer that
shrinks high-volume inputs - verbose tool output, build/test logs, RAG retrievals -
BEFORE they hit the model, preserving the signal a human/agent actually needs while
dropping the noise. It encodes the North Star value "load balancing, not token
burning" mechanically. It wraps the Headroom approach (chopratejas/headroom,
user-specified) as an optional North Star tokenomics layer.

> Honesty note: the upstream repo is user-specified and NOT verified or pinned in
> this build. Run `skill-supply-chain-review` and pin a SHA before vendoring upstream
> code. The TECHNIQUES below are tool-agnostic and work without the upstream.

## When to Activate
- A command/tool emits hundreds of lines you only need a verdict from.
- Feeding large RAG / search results to a model (compress + rank first).
- Long autonomous runs where logs accumulate across iterations.
- User says "context is full", "too much output", "compress", "reduce tokens".

## What to compress (and how)
| Source | Keep | Drop / fold |
|--------|------|-------------|
| Test/build logs | failures, the first error, summary counts, exit code | passing lines, progress bars, repeated stack frames |
| Tool output (lists, JSON) | the fields the task needs, head+tail, total count | middle of long arrays (note "N omitted"), unused fields |
| RAG chunks | top-k by relevance, with source ids | low-score chunks, duplicate passages |
| Diffs | changed hunks + file list | unchanged context beyond a few lines |
| Stack traces | the top frame + your-code frames + the message | deep library frames (fold to "...N framework frames") |

## Principles
1. **Compress at the boundary, before the model sees it** - not after (post-hoc
   summarization still paid the input cost).
2. **Lossless verdict.** Never drop the signal that changes a decision (the error,
   the failing assertion, the count, the exit code).
3. **Always disclose the cut.** Emit "N lines/items omitted" so truncation is
   visible, never silent (a silent cut reads as "all clear" when it isn't).
4. **Deterministic + reproducible.** Same input -> same compression; keep the raw
   artifact on disk (`build/raw/`) so the full version is one fetch away.
5. **Measure it.** Report before/after token (or byte) counts for the run.

## Protocol
1. Identify the high-volume source and the ONE question it must answer.
2. Apply the matching reduction (table above); attach source pointers to raw.
3. Emit the compressed view + a one-line "compressed X -> Y (Z% saved); raw at <path>".
4. If a decision needs the dropped detail, fetch the raw artifact on demand.

## Integration
- `autoresearch`: compress VERIFY/GUARD output before logging each iteration.
- `research-report` / RAG: rank + compress retrieved chunks before synthesis.
- `parallel-agent`: have sub-agents return compressed typed results, raw on disk.
- Pairs with the Blueprint load-balancing tiers (Tier 1/2/3) and the Bootstrap
  Section 10 rules - this is the mechanical enforcement of those.

## When NOT to use
- Small outputs that already fit - compression overhead/risk for no gain.
- Anything where the FULL text is the deliverable (legal, exact logs for audit,
  a verbatim user document) - never compress what must be preserved verbatim.
- Security/forensic evidence where dropped lines could hide signal - keep raw.
- As an excuse to not fix a tool that is needlessly verbose at the source.

## Portability
Tool-agnostic text/JSON reduction - runs in any harness or as a CLI filter in a
pipe. The upstream Headroom tooling is an optional accelerator; vendor it via
`skill-supply-chain-review` if adopted. Keep raw artifacts on disk so compression
is always reversible.

## Anti-Patterns
- Silent truncation (no "N omitted") - the worst failure mode; looks complete.
- Dropping the error/verdict to save tokens (gaming the budget).
- Compressing after the model already ingested the full input (no savings).
- Discarding the raw artifact (can't recover detail when a decision needs it).
- Lossy compression of must-be-verbatim content.
