---
name: autoresearch
description: Autonomous improvement loop - define GOAL/METRIC/VERIFY/SCOPE/GUARD, then loop atomic change -> commit -> verify -> keep-or-revert. VERIFY can be a numeric command OR a computer-use/browser-use behavioral smoke test (launch, click, screenshot, assert). Use for "autoresearch", "autonomous loop", "improve this metric", "optimize until", "iterate autonomously", "smoke-test the built app".
license: CC BY-NC-SA-4.0
metadata:
  version: "2.0"
  nbb_wave: "v6.5"
  adapted_from: karpathy/autoresearch (https://github.com/karpathy/autoresearch, SHA 32a1460f626e28479d427c033ee485bf5f86875a) + uditgoenka/autoresearch (SHA 89aa3324beec399fc11a01c2fe1532b80f3eff42)
  upstream_pinned: 2026-03-18
  modernized: "computer-use / browser-use behavioral verification"
---

# Autoresearch Skill

## Purpose
The autonomous iteration loop: one GOAL, one VERIFY, one loop. Make an atomic
change, commit it (git is memory), verify mechanically, keep if it improved or
`git revert` if not. v2 adds **behavioral verification**: VERIFY no longer has to
be a number from a command - it can be a real computer-use/browser-use check that
launches the built app, interacts, and asserts (so "the loop" can optimize toward
"the signup flow actually works", not just a coverage percentage).

## When to Activate
- Mechanically measurable improvement: coverage, bundle size, Lighthouse, p95 latency.
- **Behavioral correctness of a built app**: "keep iterating until the checkout
  flow works end-to-end" (verified by clicking through it, not by a metric).
- User says "autoresearch", "autonomous loop", "iterate autonomously",
  "smoke-test until it works".

## Core Principles
1. **One change per iteration (atomic).** You always know what caused a delta.
2. **Mechanical verification only.** A number from a command, OR a deterministic
   pass/fail from a behavioral check. "Looks better" is never a verdict.
3. **Automatic rollback on regression.** No improvement -> `git revert --no-edit HEAD`.
4. **Git is memory.** Kept changes are commits; the log IS the research log.
5. **Simplicity wins.** Equal result with less code -> keep the smaller one.
6. **Read before write.** Re-read in-scope files + the results log each iteration.
7. **When stuck, think harder.** Combine near-misses; never repeat a failed approach.
8. **Loop until interrupted or limit/plateau.** Autonomous; don't ask "continue?"
   unless plateaued 10+ iterations or unrecoverable.

## The five parameters
| Parameter | Description | Example (metric) | Example (behavioral) |
|-----------|-------------|------------------|----------------------|
| GOAL | what to improve | "raise coverage" | "signup flow works" |
| METRIC/CHECK | the verdict source | coverage % | flow passes end-to-end |
| VERIFY | command OR smoke script | `npm test -- --coverage \| grep "All files"` | `bash scripts/smoke_signup.sh` (see below) |
| SCOPE | files that may change | `src/**` | `src/**` |
| GUARD | must-also-pass | `npm test` | `npm test` |

## Execution Protocol

### Phase 1: Setup
1. Agree a run tag (default `YYYY-MM-DD`); `git checkout -b autoresearch/<tag>`.
2. Read all in-scope files.
3. Define the five parameters (confirm with user).
4. Establish baseline (iteration #0); init `results.tsv`:
   `iteration  commit  metric  delta  status  description`.
5. Confirm with human, then loop.

### Phase 2: The Loop
```
LOOP (N times or until interrupted/plateau):
  1. Review: re-read in-scope files + git log (last 10) + results.tsv.
  2. Pick ONE next change (prefer high-leverage; if last 5 failed, go radical).
  3. Make ONE focused change inside SCOPE.
  4. git add <changed files>; git commit -m "autoresearch #<N>: <desc>"   (BEFORE verify)
  5. Run VERIFY (numeric command OR behavioral smoke - see Phase 2b).
  6. If GUARD defined: run GUARD.
  7. Decision:
       improved (or equal w/ less code) -> KEEP, log "keep"
       equal/worse                      -> git revert --no-edit HEAD, log "discard"
       GUARD fails but metric improved  -> rework (max 2), else revert, log "guard-fail"
       crashed                          -> fix (max 3), else revert, log "crash"
  8. Log to results.tsv. Repeat.
```

### Phase 2b: Behavioral verification (computer-use / browser-use)  [NEW in v2]
When the GOAL is "the app actually works", VERIFY is a behavioral smoke test, not
a number. Delegate it to the `computer-use-smoke` skill (the reusable primitive)
or inline a script that:
1. Launches the built app (dev server / binary / packaged build).
2. Drives it: navigate, fill, click - the real user path.
3. Asserts observable state (text present, URL changed, network 2xx, no console errors).
4. Captures a screenshot per checkpoint into `build/smoke/<iteration>/`.
5. Exits 0 (pass) or non-zero (fail) - that exit code IS the verdict.

The loop treats a passing smoke run exactly like an improved metric (KEEP) and a
failing run like a regression (revert). Screenshots are evidence, not the verdict
- the deterministic assertion is. Prefer a stable selector/text assertion over
pixel diffing (pixel diffs are flaky). See `computer-use-smoke` for the harness
matrix (Playwright / browser-use / computer-use) and the anti-flake rules.

### Phase 3: Results tracking
- Log EVERY iteration (kept, discarded, crashed - failures carry information).
- Progress summary every 10 iterations; final summary on bounded runs (baseline ->
  final, kept/discarded/crashed counts, best single improvement, branch state).

## results.tsv format
```
iteration  commit   metric  delta  status   description
0          a1b2c3d  85.2    0.0    baseline initial state
1          b2c3d4e  87.1    +1.9   keep     cover auth edge cases
2          -        86.5    -0.6   discard  refactor test helpers
3          c3d4e5f  pass    +     keep     signup smoke now passes (behavioral)
5          -        -       -      crash    test runner config syntax error
```
commit = short SHA or `-`; metric = number, `pass`/`fail`, or `-`; status in
{baseline, keep, discard, guard-fail, crash}.

## Guard Protocol
GUARD answers "did anything ELSE break?" Run AFTER VERIFY, only on improvement.
Guard files are NEVER modified by the loop. If improve+GUARD-fail: rework max 2,
else revert (`guard-fail`). Common guards: `npm test`, `lint`, `typecheck`,
`cargo test`, `pytest`.

## Crash Recovery
Syntax error -> fix, re-run (not counted). Runtime/OOM/hang/external -> fix max 3
then revert+move on (counted as `crash`). After 3 consecutive crashes: pause,
re-read scope, reassess; if the domain is broken, report to user.

## When NOT to use
- One-shot fixes with no measurable/behavioral verdict - just make the change.
- Subjective/aesthetic goals with no deterministic check ("make it prettier")
  - use `design-taste` + human review, not an autonomous loop.
- Irreversible or production-mutating work - the loop's revert assumes safe,
  cheap rollback; never point it at prod data or Tier 3+ actions.
- Before a human has run the workflow manually enough times (no RALPH until reps).

## Portability
The loop is pure git + a verify command - portable to any harness and CI. The
behavioral mode needs a computer-use/browser-use backend: Playwright (portable,
recommended default), browser-use, or a harness-native computer-use tool. The
`computer-use-smoke` skill abstracts the backend so the loop stays harness-agnostic.

## Anti-Patterns
- Multiple changes per iteration (can't isolate cause).
- Subjective verification; pixel-diff as the sole verdict (flaky).
- Skipping baseline (#0 mandatory) or the re-read step (context drifts).
- Modifying files outside SCOPE; not logging crashes.
- Gaming the metric at the GUARD's expense.
- Pointing the loop at anything it cannot safely revert.
