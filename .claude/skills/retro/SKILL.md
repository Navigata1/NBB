---
name: retro
version: 1.0
author: NavigatingTruth / NorthStarFramework
description: >
  Run after completing a feature, bug fix, or work session to capture what
  was learned and improve the development system. Use this skill when user
  says "retro", "retrospective", "session review", "what did we learn",
  "encode learnings", or "improve our workflow". Also trigger at the end of
  completed RPIT loops.
triggers:
  - "retro"
  - "retrospective"
  - "session review"
  - "encode learnings"
  - "improve our workflow"
  - "what went wrong"
  - "what did we learn today"
---

# Retro Skill

## Purpose
Capture learnings from this session and encode them into the development system
so every future session benefits from this experience.

## Execution Protocol

### Step 1: Gather Context (do not skip)
Run ALL of these before proceeding:
- `git log --oneline -20`
- `git diff HEAD~5 HEAD --stat` (files changed in session)
- Check for test results (look for test-results.txt, junit.xml, or similar)
- Review last 20 messages in current conversation

### Step 2: Generate Retro Report
Write to `/tmp/retro-[date].md`:

```
# Session Retro — [date]

## What Went Well
[List 3-5 things that worked]

## What Was Slow / Blocked
[List friction points]

## Mistakes / Corrections
[List each: what happened → what the correct approach was]

## Patterns Identified
[Recurring issues or successes worth encoding]
```

### Step 3: Extract Learnings
For each pattern/mistake, generate:

**Format A — claude.md Rule:**
```
RULE: [What Claude must always/never do]
REASON: [Why]
EXAMPLE: [Concrete example from this session]
```

**Format B — Slash Command:**
```
COMMAND: /[name]
PURPOSE: [What it does]
TRIGGER: [When user would want this]
DRAFT: [The command content]
```

**Format C — New Skill:**
```
SKILL NAME: [name]
TRIGGERS: [When Claude should auto-use it]
PURPOSE: [What specialized knowledge it encodes]
```

### Step 4: Present for Approval
Show the human:
1. Retro report summary (3-5 bullet highlights)
2. Proposed claude.md additions (as a diff)
3. Proposed new slash commands (with full draft)
4. Proposed new skills (with name + triggers only — ask if they want to create them)

Wait for explicit approval before making ANY changes.

### Step 5: Encode Approved Changes
For each approved item:
- claude.md updates: edit the file directly, show diff
- New slash command: create in .claude/commands/[name].md
- New skill: create skeleton in .claude/skills/[name]/SKILL.md

Final commit:
`git add -A && git commit -m "chore: encode session learnings $(date +%Y-%m-%d)"`

## Quality Criteria
A good retro encodes at least ONE actionable improvement per session.
A great retro identifies a pattern and prevents it from recurring.
The best retros create new skills that encode domain knowledge permanently.
