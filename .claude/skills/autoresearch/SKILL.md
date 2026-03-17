---
name: autoresearch
version: 1.0
author: NavigatingTruth / NorthStarFramework
description: >
  Autonomous iteration loop for measurable improvement. Define a goal,
  a metric, and a verification command, then loop: make one atomic change,
  git commit, run verification, keep if improved or revert if regressed.
  Use for test coverage, bundle size, Lighthouse scores, performance
  optimization, or any measurable metric. Triggers: "autoresearch",
  "autonomous loop", "improve this metric", "optimize until",
  "run the loop", "iterate autonomously", "keep improving".
triggers:
  - "autoresearch"
  - "autonomous loop"
  - "improve this metric"
  - "optimize until"
  - "run the loop"
  - "iterate autonomously"
  - "keep improving"
---

# Autoresearch Skill

## Purpose
The autonomous iteration loop pattern. One goal, one metric, one verification
command. Loop forever making atomic improvements, committing each change,
verifying mechanically, and keeping only what improves the metric. Git is
memory — every kept change is committed, every failed attempt is logged.

Adapted from:
- **Karpathy's autoresearch** — the original pattern: fixed time budget, single
  metric (val_bpb), modify train.py only, git commit → verify → keep/revert,
  log to TSV, NEVER STOP until interrupted.
- **uditgoenka/autoresearch** — generalized to any domain: 8 critical rules,
  Guard command for regression prevention, crash recovery, bounded/unbounded loops.

## When to Activate
- Test coverage improvement ("get coverage above 90%")
- Bundle size reduction ("shrink the bundle")
- Lighthouse score optimization ("improve performance score")
- Performance metrics ("reduce p95 latency")
- Any task where improvement is mechanically measurable
- User says "autoresearch", "autonomous loop", "iterate autonomously"

## Core Principles

1. **One change per iteration (atomic).** Never combine multiple ideas in a
   single iteration. If a change improves the metric, you know exactly why.
   If it regresses, you know exactly what to revert.

2. **Mechanical verification only.** The metric comes from a command's output.
   No subjective judgment. "Looks better" is not a metric. A number is a metric.

3. **Automatic rollback on regression.** If the metric does not improve,
   `git revert --no-edit HEAD`. No exceptions. No "but it's cleaner now."

4. **Git is memory.** Every kept change is a committed checkpoint. The git log
   IS the research log. You can always trace back to any successful state.

5. **Simplicity wins.** If two changes produce equal metric improvement, keep
   the one with less code. If a change produces equal metric with fewer lines,
   KEEP — that's an improvement in maintainability.

6. **Read before write.** Before each iteration, re-read the in-scope files
   and the results log. Context drifts as changes accumulate.

7. **When stuck, think harder.** Re-read all in-scope files. Review the results
   log for patterns. Combine ideas from near-miss attempts. Try something
   radically different. Do NOT repeat a failed approach.

8. **Loop until interrupted or limit reached.** The loop is autonomous. Do not
   pause to ask "should I continue?" unless the metric has plateaued for 10+
   iterations or a crash cannot be recovered.

## Execution Protocol

### Phase 1: Setup

1. **Agree on a run tag** with the user (default: `YYYY-MM-DD`).
2. **Create branch:**
   ```bash
   git checkout -b autoresearch/<tag>
   ```
3. **Read all in-scope files** — understand the current state before touching anything.
4. **Define the five parameters** (confirm each with the user):

   | Parameter | Description | Example |
   |-----------|-------------|---------|
   | **GOAL** | What to improve (plain English) | "Increase test coverage" |
   | **METRIC** | The number to optimize | Coverage % across all files |
   | **VERIFY** | Command that outputs the metric | `npm test -- --coverage \| grep "All files"` |
   | **SCOPE** | Files that may be modified | `src/__tests__/**`, `src/utils/**` |
   | **GUARD** | Command that must also pass (optional) | `npm test` |

5. **Establish baseline** — run VERIFY, record as iteration #0.
6. **Initialize results.tsv:**
   ```
   iteration	commit	metric	delta	status	description
   0	<sha>	<baseline>	0.0	baseline	initial state
   ```
7. **Confirm with human**, then begin the loop.

### Phase 2: The Loop

```
LOOP (FOREVER or N times):

  1. Review current state:
     - Re-read in-scope files (they changed since last iteration)
     - Review git log (last 10 commits on this branch)
     - Review results.tsv (what worked, what failed, what's untried)

  2. Pick next change:
     - Based on what improved, what regressed, what hasn't been tried
     - Prioritize high-leverage changes (test new modules > tweak existing)
     - If last 5 attempts all failed, try a radically different approach

  3. Make ONE focused change:
     - Touch only files within SCOPE
     - One logical idea per iteration
     - Keep the diff small and reviewable

  4. Git commit (BEFORE verification):
     git add <only changed files>
     git commit -m "autoresearch #<N>: <short description>"

  5. Run VERIFY command, capture output

  6. If GUARD defined: run GUARD command too

  7. Parse metric from output

  8. Decision:
     IF metric improved (or equal with less code):
       → KEEP the commit
       → Log as "keep" in results.tsv
     IF metric equal or worse:
       → git revert --no-edit HEAD
       → Log as "discard" in results.tsv
     IF GUARD failed (but metric improved):
       → Attempt rework (max 2 tries to satisfy both)
       → If still failing → revert, log as "guard-fail"
     IF crashed:
       → Attempt fix (max 3 tries)
       → If unrecoverable → revert, log as "crash", move on

  9. Log result to results.tsv

  10. Repeat
```

### Phase 3: Results Tracking

- **Log every iteration** — kept, discarded, and crashed. Failed experiments
  contain information; do not skip them.
- **Print progress summary** every 10 iterations:
  ```
  === Autoresearch Progress (iterations 1-10) ===
  Baseline: 72.3%  →  Current: 81.7%  (+9.4%)
  Kept: 6  |  Discarded: 3  |  Crashed: 1
  ```
- **Bounded loops** (user specified N iterations) print a final summary:
  ```
  === Autoresearch Complete ===
  Run tag: 2026-03-16
  Total iterations: 25
  Baseline: 72.3%  →  Final: 89.1%  (+16.8%)
  Kept: 14  |  Discarded: 9  |  Crashed: 2
  Best single improvement: iteration #7 (+3.2%, "add integration tests for auth")
  Results: results.tsv (25 rows)
  Branch: autoresearch/2026-03-16 (14 commits ahead of main)
  ```

## Results TSV Format

```
iteration	commit	metric	delta	status	description
0	a1b2c3d	85.2	0.0	baseline	initial state
1	b2c3d4e	87.1	+1.9	keep	add tests for auth edge cases
2	-	86.5	-0.6	discard	refactor test helpers
3	c3d4e5f	87.1	0.0	keep	remove dead code (simplicity wins)
4	-	87.1	0.0	discard	extract shared fixtures (no improvement)
5	-	-	-	crash	syntax error in test runner config
6	d4e5f6g	88.4	+1.3	keep	cover error branches in payments module
```

- **commit:** Short SHA of the kept commit, or `-` if discarded/crashed.
- **metric:** The parsed metric value, or `-` if verification couldn't run.
- **delta:** Change from previous best, with sign.
- **status:** One of `baseline`, `keep`, `discard`, `guard-fail`, `crash`.

## Crash Recovery

| Crash Type | Action | Counts as Iteration? |
|---|---|---|
| Syntax error | Fix immediately, re-run verify | No |
| Runtime error | Attempt fix (max 3 tries), then revert and move on | Yes (log as "crash") |
| Resource exhaustion (OOM, disk) | Revert, try a smaller variant | Yes (log as "crash") |
| Infinite loop / hang | Kill after timeout, revert | Yes (log as "crash") |
| External dependency (network, API) | Skip, log, try different approach | Yes (log as "crash") |

After 3 consecutive crashes: pause, re-read all in-scope files, reassess
approach. If the domain is fundamentally broken, report to user.

## Guard Protocol

The GUARD is an optional safety net that prevents metric gaming at the expense
of correctness.

- **VERIFY** answers: "Did the metric improve?" (the goal)
- **GUARD** answers: "Did anything else break?" (the safety net)

Rules:
1. GUARD is run AFTER VERIFY, only if VERIFY shows improvement.
2. If metric improves but GUARD fails → attempt rework (max 2 tries to
   satisfy both VERIFY and GUARD).
3. If rework fails → revert the change, log as `guard-fail`.
4. Guard files (files checked by the guard command) are NEVER modified
   by the autoresearch loop.
5. Common guards: `npm test`, `npm run lint`, `npm run typecheck`,
   `cargo test`, `pytest`.

## Example Use Cases

**Test Coverage:**
```
GOAL:    Increase statement coverage above 90%
METRIC:  Coverage % from "All files" row
VERIFY:  npm test -- --coverage | grep "All files"
SCOPE:   src/__tests__/**, test/**
GUARD:   npm test (all existing tests must still pass)
```

**Bundle Size:**
```
GOAL:    Reduce production bundle below 200KB gzipped
METRIC:  Gzipped size in bytes
VERIFY:  npm run build 2>&1 | grep "gzipped"
SCOPE:   src/**, webpack.config.js
GUARD:   npm test && npm run e2e
```

**Lighthouse Performance:**
```
GOAL:    Achieve Lighthouse performance score ≥ 95
METRIC:  Performance score (0-100)
VERIFY:  lighthouse http://localhost:3000 --output=json | jq '.categories.performance.score * 100'
SCOPE:   src/components/**, src/pages/**, public/**
GUARD:   npm test
```

**API Response Time:**
```
GOAL:    Reduce p95 API response time below 200ms
METRIC:  p95 latency in ms
VERIFY:  npm run bench:api | grep "p95"
SCOPE:   src/api/**, src/middleware/**
GUARD:   npm test
```

## Quality Criteria
- Every iteration is logged — kept, discarded, and crashed.
- The results.tsv is a complete, reproducible record of the run.
- The git log on the autoresearch branch tells a clean improvement story.
- The metric moves in the right direction over the course of the run.
- No files outside SCOPE were modified.
- GUARD never failed in a kept commit.
- The loop ran autonomously without unnecessary human interruptions.

## Anti-Patterns
- Making multiple changes per iteration (can't isolate what worked)
- Subjective verification ("looks better" is not a metric)
- Forgetting to establish baseline first (iteration #0 is mandatory)
- Modifying files outside the defined SCOPE
- Not logging crashed experiments (they contain information)
- Stopping to ask "should I continue?" (the loop is autonomous)
- Using `git add -A` or `git add .` (may stage unrelated files)
- Repeating a failed approach without variation (insanity loop)
- Skipping the re-read step (context drifts as files change)
- Optimizing the metric at the expense of the GUARD (gaming)
