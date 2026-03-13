# /whats-next

Review the current project state and recommend the next task to work on.

## Steps

1. Read `claude.md` — check the "Current State" section for in-progress and planned items
2. Read `plan.md` — check for any `[BLOCKED]` or incomplete `[APPROVED]` items
3. Check `git status` for any uncommitted work from a previous session
4. Check for any `TODO` or `FIXME` comments in recently modified files

## Output Format

Present findings as:

```
CURRENT STATE
─────────────
In progress: [list items currently being worked on]
Blocked:     [list blocked items and why]
Uncommitted: [any staged or unstaged changes]

RECOMMENDED NEXT TASK
─────────────────────
[Task name]
Why: [brief rationale — highest impact, unblocks other work, or continues momentum]
RPIT phase: [Research / Plan / Implement / Test]
Estimated scope: [number of files, rough complexity]
```

## Do NOT
- Start working on the recommended task automatically
- Make any file changes — this is a read-only analysis
- Recommend tasks that are blocked without noting the blocker
