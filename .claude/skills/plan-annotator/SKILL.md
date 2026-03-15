---
name: plan-annotator
version: 1.0
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
    * "// [HUMAN]: ..."
    * "<!-- correction: ... -->"
    * Lines starting with ">>" or "NOTE:"
    * Changes from optional to required
    * References to existing files/patterns

Step 2: Parse each annotation by type:
  - TYPE A (Constraint): something that was optional is now required or vice versa
  - TYPE B (Domain Knowledge): human pointing to existing code/patterns to use
  - TYPE C (Architecture Guard): preventing a specific approach
  - TYPE D (Data Shape): showing correct types/structures

Step 3: Update plan.md
  - Incorporate ALL annotations into the plan
  - Remove the annotation markers (clean plan)
  - Mark resolved annotations in "Changes Made" section at bottom

Step 4: Present summary
  "I've incorporated your annotations. Key changes:
   - [Change 1]: [what changed and why]
   - [Change 2]: [what changed and why]
   
   Updated plan.md is ready for final review. Shall I proceed to
   convert to a todo list and begin implementation?"

Step 5: Wait for explicit approval before any code

## Creating Initial Plans (when entering plan mode)

Structure every plan.md with:
```markdown
# Plan: [Feature Name]
**Issue:** #X | **Date:** [date] | **Status:** DRAFT

## Overview
## Approach
## Files to Touch
## Data Shapes
## Implementation Steps
- [ ] Step 1
- [ ] Step 2
## Edge Cases
## Success Criteria
## Questions for Human
[List anything ambiguous — ask before planning around assumptions]
```

## Anti-Patterns to Avoid
- Starting with code before plan is explicitly approved
- Making plan.md changes that weren't in the annotations
- Skipping the "Questions for Human" section when something is genuinely unclear
