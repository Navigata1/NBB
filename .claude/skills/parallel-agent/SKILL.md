---
name: parallel-agent-orchestration
description: Orchestrate multiple agents on independent work, either as an in-session dynamic workflow (orchestrator + schema-typed sub-agents with bounded fan-out and adversarial verification) or as parallel human-driven sessions (git worktrees / separate checkouts). Use for "run in parallel", "multiple agents", "fan out", "git worktree", "agent team", "multi-claude", "dynamic workflow", "orchestrate sub-agents".
license: CC BY-NC-SA-4.0
metadata:
  version: "2.0"
  nbb_wave: "v6.5"
  modernized: "Opus 4.8 dynamic workflows / Ultra Code"
---

# Parallel Agent Orchestration

Two orchestration modes. Pick by who drives:

- **Mode A - Dynamic Workflow (in-session, agent-driven).** ONE orchestrator
  runs a deterministic script that fans out schema-typed sub-agents, verifies
  adversarially, and synthesizes. This is the modern default for work that fits
  in one session. (Opus 4.8 dynamic workflows / Ultra Code.)
- **Mode B - Parallel Sessions (human-driven).** Several full agent sessions run
  in isolated git worktrees / checkouts, each owning a file scope. Use when work
  exceeds one context or needs separate machines/clouds.

---

## Mode A - Dynamic Workflow Orchestration (default)

### Principle
The orchestrator holds the PLAN in script variables, not in the model context.
Sub-agents receive a typed brief, return a typed result, and are cheap to spawn
and discard. Control flow (loops, fan-out, conditionals) is deterministic code,
not model improvisation.

### The bounded role fleet (start 5-10 sub-agents)
| Role | Typed input | Typed output |
|------|-------------|--------------|
| explorer | target area, question | file map, findings, entry points |
| patch-drafter | one bounded change spec | diff/edits + rationale |
| test-writer | behavior under test | tests + how-to-run |
| diff-reviewer | a draft diff | findings[] with severity + verdict |
| doc-updater | what changed | doc edits |

Spawn only the roles the task needs. Scale count to task size, not ego.

### Typed I/O contract (mandatory)
Every sub-agent call declares an output schema and is forced to return a
validated object - no free-text parsing. Example shape:
```
schema = { findings: [{ file, line, severity, claim }], verdict: "pass|fail" }
```
A sub-agent that dies returns null; filter nulls before use.

### Adversarial verification BEFORE merge
Never merge a draft on the strength of the drafter alone. For each candidate
change, spawn N independent skeptics (prompted to REFUTE, default to rejecting
if uncertain) or perspective-diverse judges (correctness / security / does-it-
reproduce). Accept only on majority survival. This is the single biggest quality
lever - it kills plausible-but-wrong output.

### Concurrency and total caps (explicit)
- Concurrent sub-agents: cap at min(16, cores-2); excess queue.
- Total sub-agents per run: hard ceiling (e.g. 1000) as a runaway backstop.
- Fan-out width per stage: keep bounded (typically 5-12 per stage).
- Token budget: scale depth to budget; log anything dropped (no silent caps).

### Canonical pipeline (pipeline by default, barrier only when needed)
```
1. SCOUT (1 explorer)            -> work-list (the items to fan out over)
2. FAN OUT (pipeline over items) -> each item: draft -> self-verify
3. ADVERSARIAL JUDGE (parallel)  -> confirm/reject each candidate
4. SYNTHESIZE (orchestrator)     -> merge survivors; report rejected + why
```
Use a barrier (collect ALL before next stage) only when a stage genuinely needs
the full set (dedup, early-exit on zero, cross-item comparison). Otherwise
pipeline so fast items are not blocked by slow ones.

### Discipline
- Keep the plan and long logs in script variables / files, NOT in chat context.
- One concern per sub-agent; small typed contracts beat big vague ones.
- Loop-until-dry for unknown-size discovery; loop-until-budget when a target is set.
- The orchestrator is the ONLY writer of record for shared state.

---

## Mode B - Parallel Human Sessions (worktree isolation)

Use when work spans multiple contexts/machines. Each session needs: its own
git worktree (no shared edits), a brief naming files it OWNS and must NOT touch,
measurable success criteria, an independent test command, and an AGENTS.md in
the worktree root.

### Patterns
1. **Worktree isolation (default)** - 2-5 features, one machine.
2. **Separate checkouts (max isolation)** - full clones per session (Cherny pattern).
3. **Local + remote split** - complex/needs-testing local; fire-and-forget/research remote.
4. **Specialized teams** - orchestrator + implementer(s) + tester + reviewer + researcher.

### Setup
```bash
git worktree list
claude --worktree                       # built-in (or: claude -w)
git worktree add ../proj-feat-a -b feature/feat-a
git clone <repo-url> ../proj-isolated-a # max isolation
```

### Per-worktree AGENTS.md (brief)
Role; FILES YOU OWN; FILES YOU MUST NOT TOUCH; task + issue (`gh issue view N`);
success criteria; when-done (test -> verify -> `gh pr create` -> report);
escalation (if you must touch a file outside your boundary: STOP, report, await).

### Decompose: parallel-safe vs sequential
PARALLEL: different file trees, independent fixes, docs+feature, tests+new feature.
SEQUENTIAL: B depends on A's code; shared migrations; shared config; interface coordination.

### Merge sequencing
Merge in dependency order; full integration tests after each merge; on conflict
escalate to human (never auto-resolve); `git worktree remove <path>`; run `retro`.
Accept ~10-20% session abandonment as normal resource management, not failure.

---

## When NOT to use
- A single linear task that fits one agent - orchestration overhead is pure cost.
- Tasks with tight cross-file coupling that cannot be partitioned - you will spend
  more on coordination than the work saves; do it sequentially.
- Anything where you cannot define a typed success check per sub-unit - without
  verification, fan-out just multiplies unverified output.
- Letting EXTERNAL models (Codex/Gemini) write directly - use them for bounded
  analysis/review only; a Claude orchestrator remains the writer.

## Portability
- Mode A maps to any harness with an orchestration/sub-agent primitive (Claude
  Code dynamic workflows / Task tool; Codex and others via their agent APIs). The
  ROLE contracts and adversarial-verify discipline are harness-agnostic.
- Mode B (`git worktree`, `gh`) is fully portable; `claude --worktree` is a
  Claude Code convenience - the manual `git worktree add` path works anywhere.

## Anti-patterns
- Two writers on one file -> conflicts. One writer per file/scope, always.
- Merging on the drafter's word alone -> plausible-but-wrong bugs ship.
- Unbounded fan-out / no token budget -> cost blowups; cap and log drops.
- Plan living in model context instead of script variables -> drift and bloat.
- Auto-resolving merge conflicts -> silent correctness bugs.
