---
name: retro
description: Capture session learnings and encode them into rules/commands/skills—use after completing features, bug fixes, or sessions; trigger on "retro", "retrospective", "what did we learn", "encode learnings".
license: CC BY-NC-SA-4.0
metadata:
  lineage_author: NavigatingTruth / NorthStarFramework
---

# Retro Skill

## Purpose
Encode learnings from this session into permanent improvements (rules, commands, skills) so future sessions benefit from this experience.

## Execution Protocol

### Gather Context (Step 1)
Before proceeding, collect:
- `git log --oneline -20` (recent commits)
- `git diff HEAD~5 HEAD --stat` (files changed)
- Test results (test-results.txt, junit.xml, or equiv.)
- Last 20 conversation messages

### Generate Retro Report (Step 2)
Write to `research/retro-[YYYY-MM-DD].md`:

```markdown
# Session Retro — [date]

## What Went Well
[3-5 things that worked]

## What Was Slow / Blocked
[Friction points]

## Mistakes / Corrections
[each: what happened → correct approach]

## Patterns Identified
[Recurring issues worth encoding]

## Metrics
- Correction count: [human corrections of agent]
- Session duration: [hours]
- Features completed: [count]
- Tests added/passing: [count]
```

### Extract Learnings (Step 3)
For each pattern, generate one or more of:

**Rule Format:**
```
RULE: [What Claude must always/never do]
REASON: [Why]
EXAMPLE: [Concrete case from this session]
```

**Command Format:**
```
COMMAND: /[name]
PURPOSE: [What it does]
TRIGGER: [When user needs this]
DRAFT: [Command content]
```

**Skill Promotion Format:**
```
SKILL NAME: [name]
TRIGGERS: [Auto-use scenario]
PURPOSE: [Knowledge it encodes]
OCCURRENCES: [Pattern count across sessions]
STATUS: CANDIDATE [requires human approval]
```

### Skill Promotion Pipeline (Steps 4-6)
When a pattern recurs 3+ times:

**Stage 1: Pattern Detected**
- Log in retro report under "Patterns Identified"
- Tag as PROMOTION CANDIDATE

**Stage 2: Draft Skill**
- Create `.claude/skills/[name]/SKILL.md` skeleton
- Include: name, triggers, purpose, execution protocol
- Mark lifecycle as DRAFT in SKILLS_REGISTRY.md
- Do NOT activate yet

**Stage 3: Human Review Gate**
Present draft with:
- Pattern evidence (which sessions, occurrences)
- Proposed skill behavior
- Expected trigger scenarios

Wait for explicit "approve", "modify", or "reject" before proceeding.

**Stage 4: Activation**
- Move lifecycle to ACTIVE in SKILLS_REGISTRY.md
- Skill now triggers automatically
- Log activation in CHANGELOG.md

**Stage 5: Continuous Evaluation**
- Track trigger count per session
- Flag for revision if triggers but produces corrections
- Flag for deprecation if unused for 30+ days

### Present for Approval (Step 5)
Show the human:
1. Retro report summary (3-5 bullet highlights)
2. Proposed claude.md additions (as diff)
3. Proposed new slash commands (full draft)
4. Proposed skill promotions (evidence + draft)
5. Correction rate trend

Wait for explicit approval before making ANY changes.

### Encode Approved Changes (Step 6)
For each approved item:
- Rules: edit claude.md directly, show diff
- Commands: create `.claude/commands/[name].md`
- Skills: create `.claude/skills/[name]/SKILL.md`
- Registry: add entry to SKILLS_REGISTRY.md

Commit (stage only related files):
```bash
git add .claude/skills/[name]/SKILL.md
git add .claude/commands/[name].md
git add claude.md
git add SKILLS_REGISTRY.md
git commit -m "chore: encode session learnings [date]"
```

## Quality Criteria
- Minimum: At least ONE actionable improvement per session.
- Better: Identify a pattern and prevent recurrence.
- Best: Create new skills that encode domain knowledge.
- Success signal: Correction rate trends downward over time.

## When NOT to Use
**Do not run retro when:**
- Session involved only a single, isolated fix with no systemic pattern (use /commit instead for quick documentation).
- Feedback loop infrastructure (SKILLS_REGISTRY.md, claude.md, .claude/skills/) not yet initialized (set up framework first).
- Session was exploratory/research only (no actionable learnings; log findings in notes instead).

**Use instead:**
- Single-issue fix: `/commit` for concise changelog entry.
- Exploratory session: document notes in research/ directory without promotion pipeline.
- Cross-team retro: use formal retrospective tooling (Jira, Slack huddle) before encoding into code system.

## Portability
This skill is CLI/git-native and portable across Claude Code, Cursor, Codex, and any editor with Bash + git access.

**For non-CLI environments (e.g., web-only IDE):**
- Git operations: use your IDE's built-in source control UI or web git client.
- File creation: use IDE file explorer instead of shell commands.
- Markdown report: save to project instead of shell redirect.
- Skip Bash examples; adapt steps to your environment's native capabilities.

**Deprecated:** Invoking Bash commands directly in Step 1. Instead, use native IDE/editor commands (Ctrl+P git log, source control panel) for portability.

## Anti-Patterns
- Using `git add -A` in final commit (may stage unrelated files).
- Skipping human approval gate for skill promotion.
- Creating skills for one-time patterns (wait 3+ occurrences).
- Not tracking metrics (makes improvement invisible).
- Self-activating skills without human review.
