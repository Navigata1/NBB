---
name: plan-annotator
description: >
  Validate and incorporate human annotations into plan.md before implementation.
  Use when user has reviewed a plan and added corrections, notes, or scope changes.
  Triggers: "I annotated plan.md", "annotate plan", "review plan", "plan corrections",
  "update plan with my notes".
license: CC BY-NC-SA-4.0
metadata:
  framework: NorthStarBuild
  version: 1.2
---

# Plan Annotator Skill

## Purpose

Enable rapid plan iteration by parsing human annotations, detecting conflicts,
and systematically incorporating feedback into plan.md before implementation begins.
Prevents scope creep through conflict detection; enables scope expansion when
intentional.

## When to Activate

- User reports annotations added to plan.md (comments, strikethrough, notes)
- Reviewing Claude's generated plan for changes or clarifications
- Updating a DRAFT plan based on human feedback before code generation
- Resolving conflicting guidance within the same plan

## Core Workflow

### Step 1: Read and Identify Annotations

Read plan.md in full. Identify all human annotations using these patterns:

- `// [HUMAN]: ...` or `<!-- human: ... -->`
- Lines prefixed with `>>`, `NOTE:`, `ISSUE:`, `FIX:`
- Strikethrough text (`~~removed~~`)
- Bold or italic emphasis (`**required**`, `_clarification_`)
- Inline color/formatting changes
- Scope shifts (optional → required, or vice versa)
- References to external files, patterns, or code

### Step 2: Parse by Type

Classify each annotation into one of five categories:

- **TYPE A (Constraint):** Changes what is required/optional. "Make this mandatory" or "This part is optional."
- **TYPE B (Domain Knowledge):** Points to existing patterns, files, or code to reuse. "Use the pattern in auth/middleware.ts."
- **TYPE C (Architecture Guard):** Prevents a specific approach. "Don't use X pattern" or "Avoid database stored procedures."
- **TYPE D (Data Shape):** Corrects types, schemas, or API contracts. Shows correct structure for interfaces or data.
- **TYPE E (Scope Change):** Expands or reduces what will be built. "Add feature X" or "Cut feature Y from this PR."

### Step 3: Detect Conflicts

Compare ALL annotations for contradictions. If two notes conflict:

```
Annotations at [location 1] and [location 2] appear to conflict:
  - [Annotation 1 summary]
  - [Annotation 2 summary]

Which takes priority? Please clarify before I update the plan.
```

Wait for explicit resolution before proceeding.

### Step 4: Update plan.md

Incorporate each annotation into the plan:

1. Merge TYPE A constraints into "Implementation Steps" and "Success Criteria"
2. Link TYPE B pattern references into "Approach" and "Data Shapes" sections
3. Add TYPE C guards to "Anti-Patterns" or "Edge Cases"
4. Correct TYPE D schemas in "Data Shapes"
5. Update "Estimated Complexity" and "Estimated Files" for TYPE E scope shifts

Remove all annotation markers from the final plan (clean output).

### Step 5: Present Summary

Format:
```
I've incorporated your annotations. Key changes:

- [Change 1]: [what and why, in one sentence each]
- [Change 2]: [concrete impact on the plan]

Annotation stats:
  - [X] constraints added/modified
  - [X] domain knowledge references incorporated
  - [X] architecture guards applied
  - [X] data shape corrections
  - [X] scope changes

Updated effort: [original] → [new] (if changed)
Updated file count: [original] → [new] (if changed)

Plan is ready for final review. Shall I proceed to implementation?
```

Wait for explicit "yes" before converting to code.

## Plan.md Template

Use this structure for all plans:

```markdown
# Plan: [Feature Name]
**Issue:** #X | **Date:** [date] | **Status:** DRAFT
**Estimated Complexity:** [LOW | MEDIUM | HIGH | CRITICAL]
**Estimated Files:** [count]

## Overview
[What we're building and why]

## Approach
[How we'll build it — architecture decisions]

## Files to Touch
[Exhaustive list of every file created or modified]

## Data Shapes
[TypeScript interfaces, database schemas, API contracts]

## Implementation Steps
- [ ] Step 1: [description] (~X min)
- [ ] Step 2: [description] (~X min)
[Include time estimates per step]

## Edge Cases
[What could go wrong, boundary conditions, error states]

## Success Criteria
- [ ] [Measurable criterion 1]
- [ ] [Measurable criterion 2]

## Test Plan
- [ ] [Test 1: what to test and how]
- [ ] [Test 2: what to test and how]

## Questions for Human
[List anything ambiguous before planning around assumptions]

## Changes Made
[Populated after annotations are incorporated]
```

## Complexity Estimation Reference

- **LOW:** 1-3 files, single concern, clear existing pattern
- **MEDIUM:** 4-10 files, multiple concerns, new patterns required
- **HIGH:** 10+ files, cross-cutting concerns, new architecture
- **CRITICAL:** Touches authentication, payments, data migrations, or production infrastructure

## When NOT to Use

Use a different approach if:

- **User is asking for ad-hoc clarifications** (not written in plan.md).
  Instead, ask them directly in conversation; don't pretend they annotated.
- **Plan.md doesn't exist yet.** Use skill-creator or spec-init instead.
- **User wants to entirely rewrite the plan from scratch.**
  Use plan mode (spec-plan) for fresh planning, not annotation merge.
- **Annotations are ambiguous or incomplete.** Ask for clarification;
  do not guess at intent or make annotations more specific on your own.
- **Scope change is so large it invalidates the approach.** Stop and
  ask: "Should we restart planning, or refine the existing plan?"

## Portability

This skill is portable across Claude Code, Cursor, Codex, and Antigravity.

- All steps are text-based and editor-independent.
- No Claude-Code-only dependencies (no special file watcher syntax, no .claude/ config).
- Works equally well in any IDE with plan.md file editing.
- Annotation detection relies on plain-text patterns, not IDE-specific markup.

## Anti-Patterns to Avoid

- **Starting code before plan approval.** Always wait for explicit "yes" after plan summary.
- **Adding annotations not present in plan.md.** Only incorporate what the human wrote.
- **Silently resolving conflicting annotations.** Always ask; don't choose unilaterally.
- **Inflating effort estimates without justification.** If scope increases, show the delta clearly.
- **Skipping the "Questions for Human" section.** If something is genuinely unclear, ask.
- **Merging contradictory annotations.** Flag them and wait for resolution.
- **Creating plans without measurable success criteria.** A goal is not a plan; steps are required.
