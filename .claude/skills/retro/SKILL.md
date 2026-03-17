---
name: retro
version: 1.1
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
so every future session benefits from this experience. The retro skill is the
outer loop of the self-improving system — it detects patterns and promotes them
into permanent skills, rules, and commands.

## Execution Protocol

### Step 1: Gather Context (do not skip)
Run ALL of these before proceeding:
- `git log --oneline -20`
- `git diff HEAD~5 HEAD --stat` (files changed in session)
- Check for test results (look for test-results.txt, junit.xml, or similar)
- Review last 20 messages in current conversation

### Step 2: Generate Retro Report
Write to `research/retro-[YYYY-MM-DD].md`:

```markdown
# Session Retro — [date]

## What Went Well
[List 3-5 things that worked]

## What Was Slow / Blocked
[List friction points]

## Mistakes / Corrections
[List each: what happened → what the correct approach was]

## Patterns Identified
[Recurring issues or successes worth encoding]

## Metrics
- Correction count: [how many times human corrected agent]
- Session duration: [estimate]
- Features completed: [count]
- Tests added/passing: [count]
```

### Step 3: Extract Learnings
For each pattern/mistake, generate one or more of:

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

**Format C — Skill Promotion Candidate:**
```
SKILL NAME: [name]
TRIGGERS: [When Claude should auto-use it]
PURPOSE: [What specialized knowledge it encodes]
PATTERN OCCURRENCES: [How many times this pattern appeared]
PROMOTION STATUS: CANDIDATE → requires human approval
```

### Step 4: Skill Promotion Pipeline
When a pattern is detected 3+ times across sessions:

```
STAGE 1: Pattern Detected (3+ occurrences)
    → Log in retro report under "Patterns Identified"
    → Tag as PROMOTION CANDIDATE

STAGE 2: Draft Skill
    → Create skeleton in .claude/skills/[name]/SKILL.md
    → Include: name, triggers, purpose, execution protocol
    → Set lifecycle state to DRAFT in SKILLS_REGISTRY.md
    → Do NOT activate yet

STAGE 3: Human Review Gate
    → Present draft to human with:
      - Pattern evidence (which sessions, what happened)
      - Proposed skill behavior
      - Expected trigger scenarios
    → Wait for explicit "approve" or "modify" or "reject"

STAGE 4: Activation
    → Move lifecycle state to ACTIVE in SKILLS_REGISTRY.md
    → Skill now triggers automatically
    → Log activation in CHANGELOG.md

STAGE 5: Continuous Evaluation
    → Track skill trigger count per session
    → If skill triggers but produces corrections → flag for revision
    → If skill hasn't triggered in 30 days → flag for deprecation review
```

### Step 5: Present for Approval
Show the human:
1. Retro report summary (3-5 bullet highlights)
2. Proposed claude.md additions (as a diff)
3. Proposed new slash commands (with full draft)
4. Proposed skill promotions (with evidence and draft)
5. Correction rate trend (improving/stable/degrading)

Wait for explicit approval before making ANY changes.

### Step 6: Encode Approved Changes
For each approved item:
- claude.md updates: edit the file directly, show diff
- New slash command: create in .claude/commands/[name].md
- New skill: create skeleton in .claude/skills/[name]/SKILL.md
- Registry update: add entry to SKILLS_REGISTRY.md

Final commit (stage only related files):
```bash
git add .claude/skills/[name]/SKILL.md
git add .claude/commands/[name].md
git add claude.md
git add SKILLS_REGISTRY.md
git commit -m "chore: encode session learnings [date]"
```

## Quality Criteria
- A good retro encodes at least ONE actionable improvement per session.
- A great retro identifies a pattern and prevents it from recurring.
- The best retros create new skills that encode domain knowledge permanently.
- Track correction rate over time — a well-tuned system trends downward.

## Anti-Patterns
- Using `git add -A` in the final commit (may stage unrelated files)
- Skipping the human approval gate for skill promotion
- Creating skills for one-time patterns (wait for 3+ occurrences)
- Not tracking metrics — makes improvement invisible
- Self-activating skills without human review
