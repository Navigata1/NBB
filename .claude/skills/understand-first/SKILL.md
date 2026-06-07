---
name: understand-first
description: Pre-build comprehension step - before writing or changing code in an unfamiliar system, build a knowledge-graph map (entities, relations, entry points, data flow, invariants) so implementation is grounded, not guessed. Use when onboarding to a repo, before a non-trivial change, or when the user says "understand this first", "map the codebase", "how does this work", "before you change anything".
license: CC BY-NC-SA-4.0
metadata:
  version: "1.0"
  nbb_wave: "v6.5"
  status: new
  upstream: Lum1104/Understand-Anything (user-specified; UNPINNED - vendor via skill-supply-chain-review before adopting upstream code)
---

# Understand-First Skill

## Purpose
Most bad changes come from acting before understanding. This skill makes
comprehension an explicit, gated step that precedes implementation: build a
compact knowledge graph of the relevant slice of the system, confirm it, THEN
build. It wraps the "understand anything" knowledge-graph approach
(Lum1104/Understand-Anything, user-specified) as a North Star pre-build phase.

> Honesty note: the upstream repo is user-specified and NOT verified or pinned in
> this build. Run `skill-supply-chain-review` and pin a SHA before vendoring any
> upstream code. The METHOD below is harness-native and works without the upstream.

## When to Activate
- Onboarding to an unfamiliar repo or subsystem.
- Before any non-trivial change (new feature, refactor, cross-cutting fix).
- When a request spans modules and the dependency/data flow is unclear.
- User says "understand this first", "map it", "how does X work end to end".

## The comprehension map (the deliverable)
Produce a compact graph - nodes + edges, not prose - covering only the relevant
slice. Keep it in a file (`build/understanding/<topic>.md`), not just in context.

| Node kind | Capture |
|-----------|---------|
| Entity | key modules/types/services and their one-line responsibility |
| Entry point | where execution starts for this concern (route, handler, CLI, job) |
| Data | the shapes that flow (schemas, DTOs, DB tables) |
| Invariant | rules that must hold (auth, ordering, idempotency, money) |
| Boundary | external systems, side effects, the blast-radius edges |

| Edge kind | Meaning |
|-----------|---------|
| calls / imports | static dependency |
| reads / writes | data flow to a store or service |
| guards | an invariant or check gating a path |

## Protocol
1. **Scope it.** State the ONE concern you must understand (not "the whole repo").
2. **Locate entry points.** Grep/trace from the user-visible action inward.
3. **Trace the path.** Follow calls + data from entry point to side effects;
   record nodes/edges as you go. Use parallel read-only explorers for breadth
   (see `parallel-agent` Mode A) and have each return a typed slice of the graph.
4. **Mark invariants + boundaries.** What must not break; what touches the outside.
5. **Find the seams.** Where does a change plug in with least blast radius?
6. **Confirm.** Restate the map to the user in 5-8 bullets and the proposed seam.
   Cheap to correct now, expensive after code is written.
7. **Hand off to build.** The map becomes the brief for implementation / for
   `plan-annotator` / for a `parallel-agent` fan-out.

## Output contract
A `build/understanding/<topic>.md` with: the graph (nodes/edges), the invariants,
the chosen seam, and open questions. Anything uncertain is listed as a QUESTION,
never asserted. This file is provenance - keep it; it explains why the change is shaped as it is.

## When NOT to use
- Trivial, local, well-understood changes - the mapping overhead exceeds the value.
- Greenfield code with no existing system to understand - go straight to plan/build.
- When the user explicitly wants a quick throwaway spike (note the skipped step).

## Portability
Pure read-only investigation (grep/trace/read) + a markdown artifact - fully
portable across harnesses. The optional upstream knowledge-graph tooling
(Lum1104/Understand-Anything) is a convenience, not a dependency; vendor it via
`skill-supply-chain-review` if adopted.

## Anti-Patterns
- Mapping the whole repo instead of the one concern (analysis paralysis).
- Writing prose instead of a graph (loses the structure that makes it useful).
- Asserting an unverified relationship instead of marking it a QUESTION.
- Keeping the map only in context (bloat + lost on compaction) - write it to a file.
- Skipping the confirm step, then building on a wrong mental model.
