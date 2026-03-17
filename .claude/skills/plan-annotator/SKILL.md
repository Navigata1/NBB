---
name: plan-annotator
version: 1.1
description: >
  Guides the plan.md annotation workflow. Use when user is reviewing a plan
  and wants to annotate it, when reviewing Claude's implementation plan, or
  when in plan mode. Triggers: "annotate plan", "review plan", "I have notes
  on the plan", "plan corrections", "update plan with my notes",
  "I annotated plan.md".
---

# Plan Annotator Skill

## Core Workflow
This skill guides the Plan.md Annotation Protocol (NS Framework ENH-009).

## When User Says "I annotated plan.md"

Step 1: Read the annotated plan.md immediately
  - Look for ALL human annotations (different formatting, comments, etc.)
  - Common annotation patterns:
    * `// [HUMAN]: ...`
    * `<!-- correction: ... -->`
    * Lines starting with `>>` or `NOTE:`
    * `⚠️` or `❌` or `✅` markers
    * Strikethrough text (`~~removed~~`)
    * Bold additions (**new requirement**)
    * Changes from optional to required
    * References to existing files/patterns

Step 2: Parse each annotation by type:
  - **TYPE A (Constraint):** something that was optional is now required or vice versa
  - **TYPE B (Domain Knowledge):** human pointing to existing code/patterns to use
  - **TYPE C (Architecture Guard):** preventing a specific approach
  - **TYPE D (Data Shape):** showing correct types/structures
  - **TYPE E (Scope Change):** expanding or reducing the plan's scope

Step 3: Check for conflicts
  - If two annotations contradict each other, flag them:
    "Annotations at [location 1] and [location 2] appear to conflict:
     - [Annotation 1 summary]
     - [Annotation 2 summary]
     Which takes priority?"
  - Wait for resolution before proceeding

Step 4: Update plan.md
  - Incorporate ALL annotations into the plan
  - Remove the annotation markers (clean plan)
  - Mark resolved annotations in "Changes Made" section at bottom
  - If scope changed significantly, update effort estimate

Step 5: Present summary
  "I've incorporated your annotations. Key changes:
   - [Change 1]: [what changed and why]
   - [Change 2]: [what changed and why]

   Annotation stats:
   - [X] constraints added/modified
   - [X] domain knowledge references incorporated
   - [X] architecture guards applied
   - [X] data shapes corrected
   - [X] scope changes applied

   Updated plan.md is ready for final review. Shall I proceed to
   convert to a todo list and begin implementation?"

Step 6: Wait for explicit approval before any code

## Creating Initial Plans (when entering plan mode)

Structure every plan.md with:
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
[List every file that will be created or modified]

## Data Shapes
[TypeScript interfaces, database schemas, API contracts]

## Implementation Steps
- [ ] Step 1: [description] (~X min)
- [ ] Step 2: [description] (~X min)
[Include time estimates per step]

## Edge Cases
[What could go wrong, boundary conditions]

## Success Criteria
- [ ] [Measurable criterion 1]
- [ ] [Measurable criterion 2]

## Test Plan
- [ ] [Test 1: what to test and how]
- [ ] [Test 2: what to test and how]

## Questions for Human
[List anything ambiguous — ask before planning around assumptions]

## Changes Made
[This section is populated after annotations are incorporated]
```

## Complexity Estimation Guide
- **LOW:** 1-3 files, single concern, clear pattern exists
- **MEDIUM:** 4-10 files, multiple concerns, some new patterns
- **HIGH:** 10+ files, cross-cutting concerns, new architecture
- **CRITICAL:** Touches auth, payments, data migrations, or production infra

## Anti-Patterns to Avoid
- Starting with code before plan is explicitly approved
- Making plan.md changes that weren't in the annotations
- Skipping the "Questions for Human" section when something is genuinely unclear
- Silently resolving conflicting annotations without asking
- Not updating effort estimates when scope changes
- Creating plans without implementation steps (just a goal is not a plan)
