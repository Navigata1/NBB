# Skill: Session Retrospective

## Purpose

Capture learnings from the current RPIT cycle and encode them into the project context file. This is the feedback loop that makes the framework compound — every retro makes the next session better.

## When to Use

Run at the end of every RPIT cycle, before closing the session. Also run when:
- A significant debugging session reveals a non-obvious pattern
- You discover a library behavior that contradicts documentation
- A convention decision is made that should persist across sessions

## Instructions

### Step 1: Gather Session Data

Review the current session and identify:
- **What worked well** — patterns, approaches, or tools that produced good results
- **What went wrong** — bugs, wrong assumptions, wasted effort
- **What surprised you** — behaviors that didn't match expectations
- **What was repeated** — any pattern that came up more than once

### Step 2: Generate Retro Report

Format:

```markdown
## Session Retro — [DATE]

### What Worked
- [Specific pattern or approach that succeeded]

### What Went Wrong
- [Specific failure and root cause]

### Discoveries
- [Non-obvious finding about the codebase, library, or pattern]

### Context File Updates
- [Section]: [Specific change to make in claude.md]

### Plan Adjustments
- [Any changes needed to plan.md or future plans]
```

### Step 3: Apply Updates

1. Add each "Discoveries" item to the "Session Learnings" section of `claude.md` with today's date
2. Update any "Conventions" or "Do NOT" items that should change based on findings
3. Update "Known Issues" if new issues were identified
4. If a plan item was completed, update its status in `plan.md`

### Step 4: Confirm

Present all proposed changes to the developer for review before writing.

## Quality Checklist

- [ ] Every learning is specific and actionable (not "be more careful")
- [ ] Date is included on every session learning entry
- [ ] Context file updates are targeted to the correct section
- [ ] No existing learnings were overwritten or removed
- [ ] Developer approved all changes before they were written

## Example Output

```
## Session Retro — 2026-03-11

### What Worked
- Using `useDeferredValue` for search debounce was cleaner than custom debounce hook
- Writing API tests first caught the missing projectId validation before implementation

### What Went Wrong
- Spent 20 min debugging filter URL state because `useSearchParams` returns ReadonlyURLSearchParams — can't mutate directly
- Initial Prisma query for combined filters used wrong AND/OR precedence

### Discoveries
- Next.js `useSearchParams()` requires `Suspense` boundary in App Router or it throws during SSR
- Prisma `where` with multiple optional filters needs explicit `undefined` handling — empty string ≠ undefined

### Context File Updates
- Conventions: Add "Wrap `useSearchParams()` usage in Suspense boundary"
- Session Learnings: Add Prisma undefined vs empty string note

### Plan Adjustments
- Step 7 (filter animation) remains BLOCKED — carry to next session
```
