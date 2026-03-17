---
name: parallel-agent-orchestration
version: 1.1
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
- User asks about git worktrees or parallel checkouts
- User wants to maximize development throughput
- User is managing 2+ agent sessions (Claude, Codex, or mixed)
- User asks about subagent orchestration or agent teams
- User mentions "conductor mode" or "fleet of agents"

## Core Principle
Each parallel agent needs:
1. Its own isolated git worktree (no shared file edits)
2. A clear brief with files it OWNS and files it must NOT touch
3. Measurable success criteria
4. A test command it can run independently
5. An AGENTS.md or instruction handoff document in its worktree root

## Orchestration Patterns

### Pattern 1: Worktree Isolation (Default)
Best for: 2-5 parallel features on a single machine.

### Pattern 2: Separate Checkouts (Maximum Isolation)
Best for: Sensitive features, maximum isolation, no shared state.
Reference: Boris Cherny's pattern — separate full git checkouts per session.

### Pattern 3: Local + Remote Split
Best for: Maximizing throughput across local and cloud sessions.
```
LOCAL (up to 5 sessions)          REMOTE (5-10 sessions)
─────────────────────────         ──────────────────────
Complex features                  Background tasks
Needs testing/debugging           Fire-and-forget tasks
Requires local tools              Review-later PRs
Sensitive code                    Research/documentation
```

### Pattern 4: Specialized Agent Teams
Best for: Complex features requiring multiple specializations.
```
ORCHESTRATOR (1 agent)
├── IMPLEMENTER (1-3 agents)  → Write code in assigned worktrees
├── TESTER (1 agent)          → Run tests, report results
├── REVIEWER (1 agent)        → Review PRs, suggest improvements
└── RESEARCHER (1 agent)      → Gather docs, find examples
```

## Execution Protocol

### Phase 1: Decomposition
Help user identify which tasks are truly parallelizable:

Ask: "What features are you working on? I'll help identify which can run in parallel."

PARALLEL (safe):
  ✓ Features touching different file trees
  ✓ Independent bug fixes
  ✓ Documentation + feature work
  ✓ Tests for existing features + new feature
  ✓ Research tasks alongside implementation

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

# For maximum isolation (Cherny pattern)
git clone <repo-url> ../<project-name>-isolated-a
```

### Phase 3: Agent Brief + AGENTS.md
Generate a brief for each agent AND an AGENTS.md in the worktree root:

```markdown
# AGENTS.md — [Feature Name] Worktree
## Agent Role: [IMPLEMENTER | TESTER | REVIEWER | RESEARCHER]
## Ownership Boundary
FILES YOU OWN:
  [list files/directories]

FILES YOU MUST NOT TOUCH:
  [list files/directories]

## Task
Issue: #[number] (read via: gh issue view [number])
Branch: feature/[name]

## Success Criteria
  [ ] [Criterion 1]
  [ ] [Criterion 2]

## When Done
  1. Run: [test command]
  2. Verify: [manual check]
  3. Create PR: gh pr create --title "[title]" --body "Closes #[number]"
  4. Report back: "Feature [name] complete. PR #[number] created."

## RPIT Loop
Start with plan.md. Do not write code until plan is approved.

## Escalation
If you need to modify a file outside your ownership boundary:
  → STOP
  → Report the dependency to the orchestrator
  → Await reassignment or coordination instruction
```

### Phase 4: Monitoring
Recommend:
- Desktop App for visual monitoring of all sessions
- Context % in status line for each session
- Each session should auto-commit after each step
- Accept ~10-20% session abandonment as normal (not failure)
- Use `--teleport` to move sessions between web and local

### Phase 5: Merge Sequencing
After all agents complete:
1. Identify dependency order between PRs
2. Merge in dependency order (independent PRs can merge in any order)
3. Run full integration test suite after each merge
4. If merge conflict: escalate to human orchestrator, do NOT auto-resolve
5. Clean up worktrees: `git worktree remove <path>`
6. Run retro skill to capture orchestration learnings

## Session Abandonment Strategy
- If unexpected scenario arises, abandon and restart with better context
- This is efficient resource management, NOT failure
- Log abandoned sessions for retro analysis

## Anti-Patterns
- Two agents editing the same file → guaranteed conflicts
- Skipping AGENTS.md → agents drift outside their boundary
- Auto-merging conflicts → silent correctness bugs
- Running all agents at max autonomy → coordination chaos
- Forgetting to clean up worktrees → disk bloat
