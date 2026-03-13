# NS Framework — Workflow Cheatsheet

> Pin this. Reference it mid-session. Don't memorize the Blueprint — navigate it.

---

## RPIT LOOP

```
 ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐
 │ RESEARCH │──▶│   PLAN   │──▶│IMPLEMENT │──▶│   TEST   │
 └──────────┘   └──────────┘   └──────────┘   └──────────┘
  Read docs      Draft plan     Execute plan    Run tests
  Check APIs     Get approval   Use hooks       Verify output
  Verify vers.   Annotate       Track state     Run retro
```

| Phase | Skip When | Never Skip When |
|-------|-----------|-----------------|
| Research | API/lib is well-known AND recently used | Unfamiliar territory, new dependency, breaking changes possible |
| Plan | Truly trivial (rename, typo fix) | Multi-file changes, architecture decisions, >30 min of work |
| Implement | — | Never skip |
| Test | Change is documentation-only | Code changes of any kind |

---

## CONFIDENCE CALIBRATION

| Level | Range | Action | Example |
|-------|-------|--------|---------|
| **Certain** | 95%+ | Proceed | Verified from read files, tested code |
| **High** | 80-95% | Proceed + quick verify | Strong patterns, reliable source |
| **Medium** | 50-80% | Verify first, consider alternatives | Some assumptions, multiple approaches |
| **Low** | 20-50% | Must verify, don't proceed alone | Speculation, haven't seen the code |
| **Uncertain** | <20% | **STOP. Ask.** | Outside knowledge, conflicting info |

---

## AUTONOMY DIAL

```
  1-2          3-4           5-6           7
  SUGGEST      DRAFT &       EXECUTE +     FULL
  ONLY         WAIT          CHECKS        AUTONOMOUS

  ◂────────────────────────────────────────────▸
  Critical     Most work     Established    Routine
  Unfamiliar   Moderate      patterns       Low risk
```

**Auto-downgrade triggers:** File deletion, DB schema change, auth/security modification, production impact, confidence drop, irreversible action.

---

## CONTEXT MANAGEMENT

```
  0%          50%           70%           85%         100%
  ├───────────┼─────────────┼─────────────┼───────────┤
  │  WORKING  │  ASSESS     │  PLAN EXIT  │  STOP     │
  │           │  remaining  │  summarize  │  NEW      │
  │           │  work       │  + handoff  │  SESSION  │
```

| Budget | Allocation |
|--------|-----------|
| System context | 15-25% (context file, rules, constraints) |
| Task context | 75-85% (code, conversation, tool output) |

**Loading priority:** Task requirements → Relevant code → Type definitions → Tests → Docs → History

---

## MULTI-AGENT SETUP (5 Steps)

```
1. git worktree add ../project-agent-N -b feature/branch-name
2. Open new agent session in worktree directory
3. Load project context (claude.md) — same for all agents
4. Assign scoped task — agents must NOT touch shared files
5. Merge via PR when complete — review conflicts before merge
```

**Rule:** One agent per worktree. Never two agents on the same branch.

---

## HOOK LIFECYCLE

| Event | Hook | Purpose |
|-------|------|---------|
| Before file write | `pre-write.sh` | Block writes to protected paths |
| After file write | `post-write.sh` | Auto-format, update imports |
| Task completion | `stop.sh` | Type check, lint, test, validate |
| Before commit | `pre-commit.sh` | Final gate before code is committed |
| Session start | `init.sh` | Load context, verify environment |
| Error encountered | `on-error.sh` | Log error, suggest recovery |

**Minimum viable hooks:** `stop.sh` (type check + lint) and `pre-write.sh` (file protection).

---

## BRIDGE ROUTING SHORTCUTS

| "I need to..." | Load this |
|----------------|----------|
| Set up a new project | Bootstrap → Section 1-2 |
| Plan a feature | NSB Part III (Documentation & Workflow) |
| Choose a model/configure AI | NSB Part IV (AI Orchestration) |
| Set up multi-agent | NSB Part IV §12 + Part V |
| Pick technology for X | MBF → Use category index |
| Design UI/UX | NSB Part VII (Design Mastery) |
| Write architecture | NSB Part VIII (Code Architecture) |
| Set up tests | NSB Part IX (Testing) |
| Configure security | NSB Part X (Security) |
| Set up CI/CD | NSB Part XI (DevOps) |
| Plan for scale/migration | NSB Part XII (Future-Proofing) |
| Quick operational reference | NSB Part XIII (Quick Reference) |

---

## PLAN.md ANNOTATIONS

| Annotation | Meaning |
|-----------|---------|
| `[APPROVED]` | Human reviewed and approved — implement as written |
| `[MODIFIED: reason]` | Changed from original plan — reason documented |
| `[BLOCKED: reason]` | Cannot proceed — dependency or decision needed |
| `[DONE]` | Implementation complete and verified |
| `[SKIPPED: reason]` | Intentionally not implemented this cycle |

---

## QUALITY GATES (4 Gates)

| Gate | When | Core Checks |
|------|------|------------|
| **Planning** | Before implementation | Scope defined? Files identified? Approach reviewed? |
| **Implementation** | During coding | Hooks passing? Types compiling? Conventions followed? |
| **Review** | Before merge | Tests passing? Plan annotations complete? No silent deviations? |
| **Deployment** | Before ship | All gates green? CHANGELOG updated? Version bumped? |

---

## KEY COMMANDS

```bash
# Claude Code
claude --model sonnet           # Start with Sonnet (default work)
claude --model opus             # Start with Opus (architecture/debug)
claude /retro                   # Run retro skill (if configured)
claude /whats-next              # Show next task (if configured)

# Git Worktrees (parallel agents)
git worktree add ../proj-2 -b feature/X   # Create worktree
git worktree list                          # Show active worktrees
git worktree remove ../proj-2             # Clean up after merge

# Session management
# At 85% context → summarize → new session → paste handoff
```

---

## SESSION LIFECYCLE

```
START                          MIDDLE                         END
─────                          ──────                         ───
1. Load context file           3. Execute RPIT                6. Run /retro
2. Load relevant BRIDGE        4. Monitor context %           7. Update claude.md
   sections only               5. Use hooks for verification  8. Commit + handoff
```

---

> **v6.1** | Full docs: [github.com/Navigata1/NorthStarBuild_5.0](https://github.com/Navigata1/NorthStarBuild_5.0)
> [@NavigatingTruth](https://twitter.com/NavigatingTruth) | CC BY-NC-SA 4.0
