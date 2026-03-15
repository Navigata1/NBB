---
name: parallel-agent-orchestration
version: 1.0
description: >
  Use when user wants to run multiple Claude Code sessions simultaneously,
  work on multiple features in parallel, use git worktrees, or wants to
  understand how to "multi-Claude". Triggers: "run in parallel", "multiple
  agents", "work on two features at once", "git worktree", "multi-claude",
  "parallel sessions", "conductor mode", "fleet of agents".
---

# Parallel Agent Orchestration Skill

## When to Activate
- User wants to work on multiple independent features simultaneously
- User asks about git worktrees
- User wants to maximize development throughput
- User is managing 2+ Claude sessions

## Core Principle
Each parallel agent needs:
1. Its own isolated git worktree (no shared file edits)
2. A clear brief with files it OWNS and files it must NOT touch
3. Measurable success criteria
4. A test command it can run independently

## Execution Protocol

### Phase 1: Decomposition
Help user identify which tasks are truly parallelizable:

Ask: "What features are you working on? I'll help identify which can run in parallel."

PARALLEL (safe):
  ✓ Features touching different file trees
  ✓ Independent bug fixes
  ✓ Documentation + feature work
  ✓ Tests for existing features + new feature

SEQUENTIAL (must wait):
  ✗ Feature B depends on code Feature A will create
  ✗ Shared database migrations
  ✗ Shared configuration files
  ✗ Features that need to coordinate on interfaces

### Phase 2: Worktree Setup
Provide the exact commands:

```bash
# Check current worktrees
git worktree list

# Claude Code built-in (recommended)
claude --worktree  # or claude -w

# Manual worktree creation (if needed)
git worktree add ../<project-name>-feature-a -b feature/feature-a
git worktree add ../<project-name>-feature-b -b feature/feature-b
```

### Phase 3: Brief Template
Generate a brief for each agent:

```
AGENT BRIEF — [Feature Name]
──────────────────────────────
Issue: #[number] (read via: gh issue view [number])
Branch: feature/[name]
Worktree: .claude/worktrees/feature-[name]/

FILES YOU OWN:
  [list files/directories]

FILES YOU MUST NOT TOUCH:
  [list files/directories]

SUCCESS CRITERIA:
  [ ] [Criterion 1]
  [ ] [Criterion 2]

WHEN DONE:
  1. Run: [test command]
  2. Verify: [manual check]
  3. Create PR: gh pr create --title "[title]" --body "Closes #[number]"
  4. Report back: "Feature [name] complete. PR #[number] created."

RPIT LOOP: Start with plan.md. Do not write code until plan is approved.
```

### Phase 4: Monitoring Advice
Recommend:
- Desktop App for visual monitoring of all sessions
- Context % in status line for each session
- Each session should auto-commit after each step

### Phase 5: Merge Order
After all agents complete:
1. Review each PR independently
2. Merge in dependency order
3. Run full integration test suite after each merge
4. Clean up worktrees: `git worktree remove <path>`
