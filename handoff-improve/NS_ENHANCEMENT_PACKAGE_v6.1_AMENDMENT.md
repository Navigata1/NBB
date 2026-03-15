# NS ENHANCEMENT PACKAGE v6.1 — AMENDMENT A

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║         NS ENHANCEMENT PACKAGE v6.1 — AMENDMENT A                           ║
║                                                                              ║
║              Five Files Not Covered in the Original Package                 ║
║                                                                              ║
║  Files addressed:                                                            ║
║    • GLOBAL_IDE_RULES.md  → v1.1                                            ║
║    • README_REPO.md       → v6.1                                            ║
║    • QUICK_START.md       → v6.1                                            ║
║    • CONTRIBUTING.md      → v6.1                                            ║
║    • NS_MEMORY_ARCHITECTURE_PROPOSAL.md → Full integration (ENH-035–041)   ║
║                                                                              ║
║  Append this document to NS_ENHANCEMENT_PACKAGE_v6.1.md                    ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

---

## AUDIT SUMMARY — WHY THESE WERE MISSED

| File | Why Significant | Gap in Original Package |
|------|-----------------|------------------------|
| `GLOBAL_IDE_RULES.md` | Universal baseline for ALL agent sessions across all IDEs | 100% missed — no ENH entry |
| `README_REPO.md` | First impression for every GitHub visitor | 100% missed |
| `QUICK_START.md` | Primary onboarding path for new users | 100% missed |
| `CONTRIBUTING.md` | Community growth + ecosystem development | 100% missed |
| `NS_MEMORY_ARCHITECTURE_PROPOSAL.md` | Complete integration blueprint sitting unimplemented | Treated as done — it is NOT yet integrated into NSB or MBF |

---

## UPDATED ENHANCEMENT INDEX (Amendment Additions)

| ID | Priority | Component | Topic | Complexity |
|----|----------|-----------|-------|------------|
| ENH-035 | 🔴 | GLOBAL_IDE_RULES v1.1 | Full update: hooks, multi-agent, new IDEs, RPIT, permissions | High |
| ENH-036 | 🟡 | GLOBAL_IDE_RULES v1.1 | Add Kiro, Zed+ACP, Antigravity IDE-specific configs | Medium |
| ENH-037 | 🔴 | README_REPO.md v6.1 | Complete rewrite: version sync, repo structure, differentiation, benchmarks | High |
| ENH-038 | 🟡 | QUICK_START.md v6.1 | Update: fix placeholder URLs, new paths, v6.1 component table | Medium |
| ENH-039 | 🟢 | CONTRIBUTING.md v6.1 | Update: new categories, skills contribution guide, enhancement ID format | Low |
| ENH-040 | 🔴 | NSB Part III / New Part | Memory Architecture integration: 3 Pillars + Memory Types Taxonomy | High |
| ENH-041 | 🔴 | MBF v2.1 | New Category 62: Memory Infrastructure (Mem0, Zep, MemGPT, Letta) | High |

**Revised total: 41 enhancements across 6.1 upgrade cycle.**

---

---

# SECTION G: GLOBAL IDE RULES v1.1 ENHANCEMENTS

---

## ENH-035 — Full Update: Hooks, Multi-Agent, RPIT, Permissions
**Target:** `GLOBAL_IDE_RULES.md` → v1.1 — multiple sections  
**Priority:** 🔴 Critical | **Complexity:** High

### Problem
GLOBAL_IDE_RULES is version 1.0 from January 2025. It predates every major capability added in 2025-2026: hooks, worktrees, multi-agent orchestration, the RPIT loop, permission pre-configuration, plan.md annotation, and the retro skill. Since this file applies to ALL sessions across ALL IDEs, any gap here propagates to every project that uses the framework.

The current Section 6.1 (Claude Code specific) says hooks are supported "if supported" — they are now fully supported and there is a complete hooks architecture (ENH-010).

### Changes Required

---

#### UPDATE: Header Banner + Version Block

```
# GLOBAL_IDE_RULES.md

## Universal Agent Operating Principles

> **SCOPE:** These rules apply to ALL projects, ALL sessions, ALL IDEs.
> Project-specific rules in `claude.md` or `.cursorrules` override these defaults.
>
> **VERSION:** 1.1 | **Updated:** March 2026
> **Compatible with:** Bootstrap v1.4 | Blueprint v6.1 | MBF v2.1
>
> **LOCATION:** Place in your global IDE config directory:
> - Claude Code: `~/.claude/CLAUDE.md` or project root
> - Cursor: `~/.cursor/global-rules.md`
> - Windsurf: `~/.windsurf/rules.md`
> - Kiro: `~/.kiro/rules.md`
> - Zed: `~/.config/zed/agent-rules.md` (via ACP)
> - Anti-Gravity: `~/.raps/gemini.md`
```

---

#### UPDATE: Section 1 — Framework Reference

**Add after the existing FRAMEWORK HIERARCHY block:**

```
FEATURE DEVELOPMENT STANDARD (All Projects):
─────────────────────────────────────────────────────────────────────────────

The RPIT Loop is the canonical unit of feature development. Always apply it:

  1. RESEARCH  → Research report for unfamiliar tech (optional for simple tasks)
  2. PLAN      → Write plan.md in plan mode before writing any code
  3. IMPLEMENT → Execute approved plan; commit each step
  4. TEST      → Run tests, verify UX, confirm success criteria

HUMAN APPROVAL GATES:
  → Plan must be approved before implementation begins (no exceptions)
  → For annotated plans: incorporate ALL inline annotations before proceeding
  → If scope changes during implementation: STOP, update plan, re-approve

QUALITY LOOP (After Each Feature):
  → Run retro skill: capture learnings, encode improvements to claude.md
```

---

#### UPDATE: Section 2.2 — Autonomy Dial

**Add to the existing Autonomy Dial block:**

```
MULTI-AGENT AUTONOMY RULES:
─────────────────────────────────────────────────────────────────────────────

When operating as part of a multi-agent team:

  PRIMARY ORCHESTRATOR: Level 5-6 (full execution + coordination)
  WORKER AGENT:         Level 6 for files in your worktree only
                        Level 1 for any file outside your worktree
  JUDGE AGENT:          Level 1-2 only (review and report, do not modify)

WORKTREE BOUNDARY RULE (critical):
  A worker agent MUST NOT modify files outside its assigned worktree.
  If a task requires touching another agent's files:
    → STOP
    → Report the dependency to orchestrator
    → Await reassignment or coordination instruction

BACKGROUND SESSION RULE:
  When running as a background/async session (web app, OpenClaw trigger):
    → Always create a PR, never merge directly to main
    → Include test results in PR description
    → Tag with [ASYNC] prefix in PR title
```

---

#### UPDATE: Section 3.2 — Code Quality Defaults

**Add to existing quality standards:**

```
AI-ASSISTED DEVELOPMENT STANDARDS:
─────────────────────────────────────────────────────────────────────────────

□ Stop hook configured (runs tests after every Claude response)
□ Pre-write hook configured (protects .env, production configs, migrations)
□ Permissions pre-configured in .claude/settings.json (not dangerously-skip)
□ claude.md exists and is current (not more than 2 weeks stale)
□ plan.md created and approved before each significant feature
□ Repository map / architecture.md exists for codebases > 5K lines

CONTEXT MANAGEMENT STANDARDS:
□ Start fresh session for each distinct task (use /clear between tasks)
□ Monitor context % via status line — stop at 85%+
□ Never rely on autocompaction — treat it as a session restart event
□ Keep plan.md current (checked-off steps) to survive session boundaries

NEVER DO:
  ✗ claude --dangerously-skip-permissions (use pre-configured permissions)
  ✗ Approve a plan you haven't read
  ✗ Allow agent to modify files outside its assigned scope
  ✗ Skip tests because "it looks right"
```

---

#### UPDATE: Section 5.1 — Starting a Session

**Replace existing block with:**

```
SESSION START PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STANDARD SESSION START:
  □ Check for project-specific rules (claude.md, .cursorrules)
  □ If project rules exist → Load and follow them
  □ If no project rules → Run /init to create claude.md, interview with
    ask_user_question tool before proceeding
  □ Review recent changes: git log --oneline -5
  □ Check current test status: run test suite
  □ Identify next action: GitHub issues, plan.md todo list, or user prompt

MULTI-AGENT SESSION START (when running as a parallel worker):
  □ Read the brief provided by the orchestrator
  □ Confirm file ownership scope (what you own, what you cannot touch)
  □ Read the GitHub issue assigned to you
  □ Write plan.md before writing any code
  □ Confirm plan with orchestrator if complex

ASYNC SESSION START (web app / OpenClaw triggered):
  □ Read the task description carefully
  □ Check context: git status, recent log, test results
  □ Create plan.md for the task
  □ Execute RPIT loop
  □ Create PR when done — never push direct to main
  □ Include test results and screenshots in PR description

RECOVERY SESSION START (after compaction or restart):
  □ Read claude.md
  □ Read plan.md (current feature) — note checked vs unchecked steps
  □ Run: git log --oneline -10
  □ Run: test suite — understand current pass/fail state
  □ DO NOT rely on conversation history — use files as ground truth
  □ Report understanding before continuing
```

---

#### UPDATE: Section 5.3 — Ending a Session

**Replace existing block with:**

```
SESSION END PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STANDARD END:
  □ Summarize what was accomplished
  □ List any incomplete items with current status
  □ Update plan.md (check off completed steps)
  □ Commit any uncommitted work with descriptive message
  □ Update claude.md "Current State" section if significant changes
  □ Create handoff note if mid-task and session must end

RETRO TRIGGER (after completing a feature or milestone):
  □ Run retro skill: /retro or "let's do a retro"
  □ Encode approved learnings into claude.md
  □ Create any new slash commands or skills identified
  □ Commit: "chore: encode session learnings [date]"

MULTI-AGENT END:
  □ Run test suite — confirm all tests pass in your worktree
  □ Create PR with: feature description, test results, screenshot if UI
  □ Tag orchestrator in PR for review
  □ Do NOT delete worktree — let orchestrator manage cleanup

NEVER END WITHOUT:
  ✗ Leaving uncommitted changes with no note
  ✗ Leaving tests failing without documenting why
  ✗ Leaving plan.md outdated (it's the continuity document)
```

---

#### UPDATE: Section 6.1 — Claude Code Specific

**Replace existing block with the fully expanded version:**

```
CLAUDE CODE SPECIFIC — v6.1
─────────────────────────────────────────────────────────────────────────────

CLAUDE.md LOCATION:
  Global: ~/.claude/CLAUDE.md  (applies to all projects)
  Project: ./claude.md         (overrides global)

MANDATORY HOOKS (configure on every project):
  Stop hook:       Run tests after every response
  Pre-write hook:  Protect .env, migrations, production configs
  
  Minimum stop.sh:
  ─────────────────────────────────────────────────────────────────────
  #!/bin/bash
  if git diff --quiet HEAD; then exit 0; fi
  npx tsc --noEmit && npm test --passWithNoTests || exit 1
  ─────────────────────────────────────────────────────────────────────
  Register: .claude/settings.json → "hooks": { "stop": ".claude/hooks/stop.sh" }

PERMISSIONS (REQUIRED — never use --dangerously-skip-permissions):
  Configure in .claude/settings.json and commit to git.
  Minimum for most projects:
  { "permissions": { "allow": ["bash:git *", "bash:npm *", "file:read:**",
                               "file:write:src/**", "file:write:tests/**"] } }

WORKTREES (for parallel agent work):
  Start with: claude --worktree  OR  claude -w
  Desktop App: New Session → check "Use worktree"
  Cleanup after merge: git worktree remove <path>

CONTEXT MANAGEMENT:
  Status line: configure to show context % always
  /clear: use liberally between distinct tasks
  /context: check usage before long tasks
  Rule: never continue past 85% context on important work

KEY COMMANDS:
  /init              Create claude.md via interview
  /clear             Reset context (keep code)
  /rewind            Roll back to previous checkpoint
  /context           Check context usage
  claude -w          Start new worktree session
  claude --resume    Resume last session
  --teleport         Move web session to local terminal

RECOMMENDED PLUGINS (install for all projects):
  • frontend-design  — dramatically improves UI quality
  • ralph-loop       — autonomous iteration on well-defined tasks
  • hookery          — browse/install pre-built hooks
  • compound         — self-improvement workflows (/re, /compound)
  • code-simplifier  — 20-30% token reduction on codebase bloat

RECOMMENDED SKILLS (install globally):
  • retro            — post-RPIT improvement loop
  • parallel-agent   — multi-Claude orchestration guide
  • research-report  — structured research before building
  • plan-annotator   — plan.md annotation workflow
  • frontend-design  — Anthropic's design principles skill
```

---

#### UPDATE: Section 9 — Emergency Protocols

**Add new emergency scenario:**

```
CONTEXT COMPACTION OCCURRED:
  1. STOP immediately — don't continue on compacted context
  2. Start fresh session
  3. Reload context from files (NOT from conversation):
     → Read claude.md
     → Read plan.md for current feature
     → Run git log --oneline -10
     → Run test suite
  4. Report understanding to human: "I've reloaded context. Here's where
     I believe we are: [summary]. Does this match your understanding?"
  5. Continue only after human confirms
  KEY: Files are ground truth. Conversation is ephemeral.

AGENT COLLISION DETECTED (two agents touched same file):
  1. STOP all affected agents immediately
  2. Check git diff on the conflicted file
  3. Identify which agent's version is correct
  4. Do not auto-merge — escalate to human orchestrator
  5. After resolution: document in project's Deviation Log

PERMISSIONS DENIED / UNEXPECTED TOOL FAILURE:
  1. Do NOT attempt workarounds
  2. Report exactly: what tool, what args, what error
  3. Ask human to update permissions config
  4. Do not retry more than once without human input
```

---

#### UPDATE: Section 10 — Continuous Improvement

**Replace vague existing block with:**

```
CONTINUOUS IMPROVEMENT — THE OUTER LOOP
─────────────────────────────────────────────────────────────────────────────

SYSTEMATIC IMPROVEMENT CYCLE:
  Every session builds the system. Apply this cycle to compound gains.

  AFTER EVERY FEATURE (inner cycle):
    1. Run retro skill
    2. Encode learnings → claude.md updates
    3. Create new slash commands for repeated workflows
    4. Create new skills for specialized domain knowledge
    5. Commit: "chore: encode session learnings"

  AFTER EVERY MILESTONE (outer cycle):
    1. Audit claude.md for bloat and outdated rules
    2. Review all custom skills — are they being triggered appropriately?
    3. Review all slash commands — are they still relevant?
    4. Update architecture.md to reflect current system
    5. Review hooks — add any new quality gates discovered

CORRECTION RATE METRIC:
  Track: how many times per session did you have to correct Claude?
  Goal: trend downward over time.
  A well-tuned system (30+ sessions): rarely needs correction on known patterns.

UPDATING THESE GLOBAL RULES:
  If you find a pattern that should be universal (not just project-specific):
  1. Test it in one project's claude.md first
  2. Verify it works across 3+ sessions
  3. Promote to global rules with version bump
  4. Increment GLOBAL_IDE_RULES version number
  5. Update "Compatible with" block in header
```

---

#### UPDATE: Version Block (Footer)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         VERSION INFORMATION                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  GLOBAL_IDE_RULES.md                                                         │
│  Version: 1.1                                                                │
│  Created: January 2025                                                       │
│  Updated: March 2026                                                         │
│                                                                              │
│  COMPATIBLE WITH:                                                            │
│  • North Star Bootstrap v1.4                                                 │
│  • North Star Blueprint v6.1                                                 │
│  • Master Build Framework v2.1                                               │
│                                                                              │
│  CHANGELOG:                                                                  │
│  v1.1 (March 2026) — Major update for Claude Code v6.1 era                 │
│    • RPIT Loop as default feature development standard                       │
│    • Hooks: mandatory stop hook + pre-write hook                             │
│    • Multi-agent autonomy rules and worktree boundary enforcement            │
│    • Permission pre-configuration protocol (no --dangerously-skip)          │
│    • Session start/end protocols updated for all session types               │
│    • Context compaction emergency protocol added                             │
│    • Outer improvement loop with retro skill integration                     │
│    • Claude Code section fully rewritten for v6.1 capabilities              │
│    • New IDEs added: Kiro, Zed+ACP (see ENH-036)                           │
│                                                                              │
│  v1.0 (January 2025) — Initial release                                      │
│    • Universal operating principles                                          │
│    • IDE-specific configurations                                             │
│    • Quality gate enforcement                                                │
│    • Session management protocols                                            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## ENH-036 — Add Kiro, Zed+ACP, Antigravity IDE Configs
**Target:** `GLOBAL_IDE_RULES.md` → Section 6 (IDE-Specific Configurations)  
**Priority:** 🟡 High | **Complexity:** Medium

### Add three new subsections after Section 6.4 (Anti-Gravity RAPS):

```
### 6.5 Kiro (Spec-Driven Development)

KIRO SPECIFIC
─────────────────────────────────────────────────────────────────────────────

RULES FILE: .kiro/rules.md or project root kiro.md

KIRO'S CORE PARADIGM: Spec → Hooks → Implementation
  • Write a spec file BEFORE asking Kiro to build anything
  • Kiro generates code from specs, not freeform prompts
  • Hooks fire on domain events (file creation, test failure, etc.)

SPEC FILES: .kiro/specs/[feature].spec.md
  • Define: user stories, acceptance criteria, technical constraints
  • Kiro reads specs as ground truth for implementation
  • Human annotates spec (same as plan.md annotation pattern)

HOOKS INTEGRATION:
  • Kiro hooks are more expressive than lifecycle hooks
  • Define event-driven triggers: onFileCreated, onTestFail, onSpecApproved
  • Map hooks to claude.md updates and retro skill runs

NS FRAMEWORK INTEGRATION:
  • Kiro specs = enhanced version of NS plan.md
  • Use NS quality gates as Kiro acceptance criteria templates
  • MBF categories map directly to Kiro's technology suggestion engine


### 6.6 Zed + Agent Client Protocol (ACP)

ZED + ACP SPECIFIC
─────────────────────────────────────────────────────────────────────────────

RULES FILE: ~/.config/zed/agent-rules.md

ZED'S DIFFERENTIATOR: Rust/GPU-accelerated editor + ACP open standard
  • ACP = write an agent once, plug into any ACP-compatible IDE
  • External agents connect via HTTP/SSE, not proprietary APIs
  • Performance: significantly faster than Electron-based editors

ACP INTEGRATION PATTERN:
  • Build NS Framework skills as ACP-compliant agents
  • Each skill becomes a portable agent: research, retro, plan-annotator
  • Any ACP host (Zed, future IDEs) can invoke them without changes

CONFIGURATION:
  • Agent rules in agent-rules.md follow same format as claude.md
  • ACP agents registered in ~/.config/zed/agents.json
  • Permissions scoped per-agent, per-project

NS FRAMEWORK NOTE:
  The ACP standard could become the distribution format for NS skills.
  Skills authored as ACP agents = IDE-agnostic, framework-portable.
  Watch this space for NS ACP skill packages in future releases.


### 6.7 Google Antigravity

ANTIGRAVITY SPECIFIC
─────────────────────────────────────────────────────────────────────────────

RULES FILE: ~/.raps/gemini.md (inherits from Anti-Gravity RAPS)

ANTIGRAVITY'S DIFFERENTIATOR: Visual multi-agent orchestration dashboard
  • "Manager view" — see all agents and their status simultaneously
  • Built-in browser (no need for Playwright MCP for many tasks)
  • Supports both Gemini 3 Pro and Claude Sonnet 4.5 simultaneously
  • Multi-model orchestration: route by task type to best model

MULTI-MODEL ROUTING PATTERN:
  ┌────────────────────────────────────────────────────────────────┐
  │  Task Type              │  Recommended Model                   │
  ├────────────────────────────────────────────────────────────────┤
  │  Code generation        │  Claude Sonnet 4.5 / Opus 4.6        │
  │  Web research/browsing  │  Gemini 3 Pro (native browser)       │
  │  Visual analysis        │  Gemini 3 Pro (multimodal strength)  │
  │  Architecture decisions │  Claude Opus 4.6 (reasoning depth)   │
  └────────────────────────────────────────────────────────────────┘

VISUAL ORCHESTRATION:
  • Use manager view to supervise multi-agent NS workflows
  • Each agent panel shows: current task, context %, status
  • Built-in coordination for Planner/Worker/Judge pattern (ENH-011)

NS FRAMEWORK INTEGRATION:
  • BRIDGE routing works the same — Antigravity agents read BRIDGE.md
  • Quality gates enforced via Antigravity's hook system
  • Parallel agent sessions visible in manager dashboard
```

---

---

# SECTION H: README_REPO.md v6.1

---

## ENH-037 — Complete README Rewrite
**Target:** `README_REPO.md` → Full replacement  
**Priority:** 🔴 Critical | **Complexity:** High

### Problem
The current README references:
- "North Star Build **5.0**" — needs to be 6.1
- Bootstrap v1.1 (now v1.4)
- Blueprint v5.0 (now v6.1)
- MBF v1.1 with "60 categories" (now v2.1 with 62 categories)
- Placeholder repo structure (missing CONTRIBUTING.md, QUICK_START.md, new segment files)
- No differentiation section ("Why NS Framework?")
- No benchmark/performance data that would drive adoption
- No community/ecosystem section
- Raw URLs all point to v5.0 files

### Full Draft Replacement

```markdown
# North Star Build 6.1

## The AI-Native Development Framework

---

╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║                         NORTH STAR BUILD 6.1                                 ║
║                                                                              ║
║          The Comprehensive Framework for Human-AI Software Development       ║
║                                                                              ║
║                          ────────────────                                    ║
║                                                                              ║
║               "Build with intention. Ship with confidence."                 ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

---

## What Is This?

North Star Framework is a complete methodology for building production software
using AI agents as intelligent collaborators — not autocomplete tools.

While other developers are prompting and praying, NS Framework users are:
- Running multi-Claude orchestration on parallel features
- Using proven RPIT loops that produce reviewable, testable work
- Building systems that get better with every session via feedback loops
- Deploying quality gates that prevent AI-generated technical debt

---

## Why North Star Framework?

| Without NS Framework | With NS Framework |
|---------------------|-------------------|
| Ad-hoc prompting, inconsistent results | Structured methodology, repeatable quality |
| Single agent, sequential features | Multi-agent orchestration, parallel development |
| Context lost between sessions | Persistent memory via structured artifacts |
| No quality gates — ship and pray | Quality gates at every stage |
| Agent repeats same mistakes | Retro skill encodes learnings permanently |
| Tool-first thinking | Methodology-first: process defines tools |

**The differentiator**: This is not a prompt template. It is a complete 
development methodology with 62 technology categories, proven workflow patterns,
and a self-improving architecture.

---

## 📁 Repository Structure

NorthStarBuild_6.1/
├── README.md                              ← You are here
├── LICENSE                                ← CC BY-NC-SA 4.0
├── CONTRIBUTING.md                        ← How to contribute
├── QUICK_START.md                         ← Get running in 5 minutes
│
├── NORTH_STAR_BOOTSTRAP.md               ← Ignition key (v1.4)
├── BRIDGE.md                             ← Navigation layer (v1.2)
├── GLOBAL_IDE_RULES.md                   ← Cross-project IDE rules (v1.1)
│
├── north-star-blueprint/
│   └── NORTH_STAR_BLUEPRINT_v6.1.md      ← HOW to build (59 sections)
│
└── master-build-framework/
    └── MASTER_BUILD_FRAMEWORK_v2.1.md    ← WHAT to build with (62 categories)

---

## 🚀 Quick Start

### For AI Agents (paste into Claude, Cursor, or any coding agent)

Fetch and follow the Bootstrap:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/NORTH_STAR_BOOTSTRAP.md

### For Humans

1. Read `QUICK_START.md` — understand the system in 5 minutes
2. Copy the Bootstrap URL into your AI agent to start a project
3. Follow BRIDGE.md for navigation to specific guidance
4. Install GLOBAL_IDE_RULES.md for cross-project agent defaults

---

## 📚 Document Purposes

| Document | Purpose | Size |
|----------|---------|------|
| **NORTH_STAR_BOOTSTRAP.md** v1.4 | Project ignition + multi-agent startup | ~70KB |
| **BRIDGE.md** v1.2 | Navigation + routing + decision trees | ~55KB |
| **GLOBAL_IDE_RULES.md** v1.1 | Universal agent operating principles | ~25KB |
| **NORTH_STAR_BLUEPRINT_v6.1.md** | HOW to build — 59 sections, methodology | ~1MB+ |
| **MASTER_BUILD_FRAMEWORK_v2.1.md** | WHAT to build with — 62 categories | ~200KB+ |

---

## 🆕 Version 6.1 What's New

### North Star Blueprint v6.1
- **RPIT Loop** — Canonical feature development cycle (Research → Plan → Implement → Test)
- **Plan.md Annotation Protocol** — Human-in-the-loop planning before any code
- **Hooks Architecture** — Determinism injection: stop hooks, pre-write hooks, audit trails
- **Parallel Agent Orchestration** — Complete git worktrees + multi-Claude playbook
- **Planner/Worker/Judge Hierarchy** — Proven multi-agent pattern
- **Feedback Loop / Retro Skill** — Outer improvement loop that compounds gains
- **Memory Architecture** — Three-pillar memory system (Core + Manager + Harness)
- **Context Compaction Recovery** — Protocol for restoring sessions after compaction
- **Agent Teams** — Coordinated specialized multi-agent roles

### Master Build Framework v2.1
- **Category 57**: Agent Orchestration Frameworks (CrewAI AMP, Google ADK, Strands, Agency Swarm)
- **Category 58**: AI-Native IDEs & Coding Agents (Kiro, Zed+ACP, Antigravity, OpenCode, Cline)
- **Category 59**: Prompt Orchestration & Evaluation (Vellum AI, Promptfoo, DeepEval)
- **Category 60**: Life OS Agents (OpenClaw, NanoClaw, memU)
- **Category 61**: Enterprise Agent Governance (ServiceNow, Boomi AgentStudio)
- **Category 62**: Memory Infrastructure (Mem0, Zep, MemGPT, Letta)

### Skills Package v6.1
- **retro-skill** — Post-feature improvement loop
- **parallel-agent** — Multi-Claude orchestration guide
- **research-report** — Structured pre-build research
- **plan-annotator** — Plan.md annotation workflow

### Bootstrap v1.4 + BRIDGE v1.2 + GLOBAL_IDE_RULES v1.1
See individual file changelogs for details.

---

## 📊 Performance Context (March 2026)

The AI coding agent ecosystem benchmarks that validate framework design choices:

| System | SWE-bench Verified |
|--------|-------------------|
| GPT-5 + Aider | 88.0% |
| Cline + Claude Opus 4.6 | 80.8% |
| Claude Code (native) | ~80% |
| Devin | 67% PR merge rate |

Claude Code at Anthropic: ~90% of Claude Code's own code is written by Claude Code.

**NS Framework positions you to approach these numbers** through structured
methodology, not just raw model capability.

---

## 📖 GitHub Raw URLs

# Entry Points (fetch these first)
BOOTSTRAP:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/NORTH_STAR_BOOTSTRAP.md

BRIDGE:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/BRIDGE.md

GLOBAL_IDE_RULES:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/GLOBAL_IDE_RULES.md

# Core Framework Documents
NORTH_STAR_BLUEPRINT_v6.1:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md

MASTER_BUILD_FRAMEWORK_v2.1:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/master-build-framework/MASTER_BUILD_FRAMEWORK_v2.1.md

---

## 🏗️ Architecture Overview

YOU → BOOTSTRAP → BRIDGE → BLUEPRINT (HOW) + MBF (WHAT) → IMPLEMENTATION

The framework operates on three principles:
  1. LOAD BALANCE — fetch only what's needed, unload when done
  2. CONFIDENCE CALIBRATE — stop and ask when uncertain, never run away
  3. COMPOUND — every session makes the next session faster

---

## 📜 License

CC BY-NC-SA 4.0 — Creative Commons Attribution-NonCommercial-ShareAlike

- ✅ Use — for any personal or organizational project
- ✅ Share — copy and redistribute freely
- ✅ Adapt — remix, transform, build upon
- ⚠️ Attribution required — credit @NavigatingTruth / North Star Framework
- ⚠️ NonCommercial — no selling the framework itself
- ⚠️ ShareAlike — derivatives use same license

"North Star Build" and "North Star Framework" are trademarks of @NavigatingTruth.
Commercial licensing: contact via GitHub or @NavigatingTruth on X/Twitter.

---

## 🤝 Community

- **Issues** — Bug reports, enhancement requests
- **Discussions** — Questions, use cases, methodology debate
- **Twitter/X** — [@NavigatingTruth](https://twitter.com/NavigatingTruth)
- **Contributing** — See CONTRIBUTING.md

---

*Build something remarkable.*
```

---

---

# SECTION I: QUICK_START.md v6.1

---

## ENH-038 — QUICK_START.md Update
**Target:** `QUICK_START.md` → Full update  
**Priority:** 🟡 High | **Complexity:** Medium

### Problems in Current Version
1. Placeholder URLs: `https://raw.githubusercontent.com/[your-repo]/` — never filled in
2. Component table references v5.0 / v1.1 — now v6.1 / v2.1
3. Blueprint section references are stale (§37 for architecture, etc. — sections may have moved)
4. MBF description says "56+" categories — now 62
5. Missing starting paths for: multi-agent development, hooks setup, OpenClaw
6. Troubleshooting section doesn't mention RPIT, plan.md, retro skill
7. Step 5 Best Practices doesn't reflect v6.1 patterns
8. "5 minutes" claim is reasonable but needs accurate path to first working session

### Changes Required

#### UPDATE: Step 1 — URLs

**Replace both placeholder URL blocks with actual URLs:**

```
### Option A: Fresh Project (Recommended)

Copy this prompt into your AI assistant (Claude, Cursor, Windsurf, etc.):

─────────────────────────────────────────────────────────────────────────────
Read this bootstrap file and help me start a new project:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/NORTH_STAR_BOOTSTRAP.md

My project: [describe your project in 1-2 sentences]
─────────────────────────────────────────────────────────────────────────────

### Option B: Existing Project

─────────────────────────────────────────────────────────────────────────────
Read this routing guide and help me navigate to the right section:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/BRIDGE.md

I need help with: [describe your challenge]
─────────────────────────────────────────────────────────────────────────────

### Option C: Cross-Project Global Rules (install once, use everywhere)

Copy GLOBAL_IDE_RULES.md to your global Claude config:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/GLOBAL_IDE_RULES.md

Save to: ~/.claude/CLAUDE.md (Claude Code)
         ~/.cursor/global-rules.md (Cursor)
         ~/.windsurf/rules.md (Windsurf)
```

---

#### UPDATE: Step 3 — Components Table

```markdown
| Component | Version | Purpose | When You Need It |
|-----------|---------|---------|------------------|
| **Bootstrap** | v1.4 | Entry point + ignition | Starting any project |
| **BRIDGE** | v1.2 | Navigation + routing + decision trees | Finding specific guidance |
| **GLOBAL_IDE_RULES** | v1.1 | Universal agent operating principles | Cross-project consistency |
| **Blueprint** | v6.1 | HOW to build — 59 sections | Methodology and process |
| **MBF** | v2.1 | WHAT to build with — 62 categories | Technology selection |
```

#### UPDATE: File Purposes list

```markdown
- `NORTH_STAR_BOOTSTRAP.md` v1.4 — Start here. Always.
- `BRIDGE.md` v1.2 — Navigation. Routes queries to correct sections.
- `GLOBAL_IDE_RULES.md` v1.1 — Universal IDE rules for all projects.
- `NORTH_STAR_BLUEPRINT_v6.1.md` — 59 sections of methodology.
- `MASTER_BUILD_FRAMEWORK_v2.1.md` — 62 categories of technology options.
```

---

#### UPDATE: Step 4 — Add New Starting Paths

Add after the existing four paths:

```markdown
### "I want to build with multiple AI agents in parallel"

Bootstrap → Multi-Agent Startup Sequence →
  Blueprint Part IV (Parallel Agent Orchestration) →
  RPIT Loop per agent →
  Git Worktrees →
  MBF Category 57 (Agent Frameworks)

### "I want to set up hooks for automated quality gates"

BRIDGE → Hooks Architecture →
  Blueprint Part XI (DevOps, Hooks Architecture section) →
  Stop Hook setup →
  Pre-write Hook setup →
  Hookery Plugin

### "I want Claude to learn from every session and improve"

Bootstrap → RPIT Loop →
  Blueprint Part XII (Feedback Loop) →
  Retro Skill installation →
  Compound Engineering Plugin

### "I want to trigger development from my phone"

BRIDGE → OpenClaw Integration Guide →
  MBF Category 60 (Life OS Agents) →
  Bootstrap Async Delegation section
```

---

#### UPDATE: Step 5 — Best Practices

**Replace existing Do/Don't lists:**

```markdown
### The Three Laws

1. **PLAN BEFORE YOU CODE** — Write plan.md and get it approved before
   implementation begins. Every time. This single habit eliminates 80% of wasted work.

2. **NEVER EXCEED 85% CONTEXT** — Monitor context %, use /clear between tasks.
   Autocompaction degrades output quality. Prevention is instant; recovery costs time.

3. **RUN THE RETRO** — After every feature, run the retro skill. Encode learnings.
   The compounding effect is real: 30 sessions in, Claude knows your codebase like
   a senior developer who's been there from day one.

### Do ✅
- Start with Bootstrap for new projects
- Use RPIT Loop for every feature (Research → Plan → Implement → Test)
- Configure hooks on every project (minimum: stop hook)
- Pre-configure permissions — never use --dangerously-skip-permissions
- Run retro after each feature to encode learnings
- Let BRIDGE navigate you — don't try to memorize section numbers

### Don't ❌
- Skip plan.md ("it's a small change") — this is where bugs are born
- Continue past 85% context without /clear or new session
- Try to read everything at once — the framework fetches what's needed
- Use --dangerously-skip-permissions — it has dangerous in the name for a reason
- Skip the retro — the improvement loop is the whole point
```

---

#### UPDATE: Troubleshooting Section

**Add new troubleshooting entries:**

```markdown
### "The plan mode produces plans I have to correct constantly"

Use the Plan.md Annotation Protocol:
1. Open plan.md in your editor
2. Add inline annotations directly — don't just respond in chat
3. Send back: "I've annotated plan.md — review and update"
4. Corrections encoded in the document outlast context windows

### "Claude is making the same mistakes session after session"

Run a retro:
1. Type: "let's do a retro on this session"
2. Retro skill reviews git history and identifies patterns
3. Approve proposed claude.md updates
4. Future sessions inherit the fix

### "Tests pass but the feature doesn't actually work"

Apply the "verify at abstraction" principle:
1. Don't just run unit tests — run the full RPIT Test phase
2. Use Playwright MCP to actually navigate your app as a user
3. Screenshot the completed feature and include in PR
4. "Works" means a user can use it, not just tests pass

### "Running multiple Claude instances seems complex"

Start with 2, not 5:
1. Identify 2 independent features (no shared files)
2. claude -w  (first worktree)
3. claude -w  (second worktree — new terminal tab)
4. Brief each with a GitHub issue number
5. Review PRs when both complete
Once you've done this twice, it's mechanical.
```

---

---

# SECTION J: CONTRIBUTING.md v6.1

---

## ENH-039 — CONTRIBUTING.md Update
**Target:** `CONTRIBUTING.md` → Multiple section updates  
**Priority:** 🟢 Medium | **Complexity:** Low

### Changes Required

#### UPDATE: Version references throughout

All references to Blueprint v5.0 → v6.1, MBF v1.1 → v2.1, Bootstrap v1.1 → v1.4.

#### UPDATE: MBF Contributing Guidelines

**Replace existing MBF section:**

```markdown
### Master Build Framework v2.1

The MBF contains technology options by category. When contributing:

- Add tools to appropriate categories (1-62+)
- Include for each tool: name, type/provider, best use case, links
- Add cross-category dependencies where relevant
- Match the existing category format (scope, tech stack table, quality gates)
- Include quality gates relevant to the category
- For new categories: use the existing category template structure

**New Category Criteria:**
A new MBF category is warranted when:
- A technology domain requires 3+ distinct tools for comparison
- The domain has distinct quality gates from existing categories
- It represents a meaningfully different architectural decision space

**Currently accepting additions for:**
- Category 57-62 (new in v2.1 — still being refined)
- Any category with tools launched after January 2025
```

#### ADD: Skills Contributing Section

```markdown
### Contributing New Skills

Skills are the fastest-growing part of the NS ecosystem.

**Skill Requirements:**
- Must have a SKILL.md with name, description, and trigger keywords
- Description must use "Use when..." format with 5+ specific trigger phrases
- Include concrete examples of when the skill should and should not fire
- Skill should encode genuinely specialized knowledge (not just restate docs)

**Skill Submission:**
- Place in: `.claude/skills/[skill-name]/SKILL.md`
- Test auto-discovery: does Claude load it without being explicitly asked?
- Test trigger accuracy: does it fire on intended scenarios, not others?
- PR title format: `skill: add [skill-name] skill`

**Good candidate skills:**
- Domain-specific patterns (e.g., specific framework best practices)
- Workflow automation (e.g., deployment checklist for a specific platform)
- Company/org-specific knowledge (your fork)
- Language-specific patterns (e.g., Rust error handling patterns)
```

#### ADD: Enhancement ID Format Reference

```markdown
### Enhancement ID Format

When suggesting improvements that align with the v6.1 enhancement system:

Format: ENH-NNN — [Component] — [Topic] — [Priority]

Example: ENH-042 — MBF v2.1 — New Category 63: WebAssembly Runtimes — 🟡 High

This helps maintainers evaluate and queue enhancements systematically.
Include an Enhancement ID proposal in your issue or PR description.
```

#### UPDATE: Component table

```markdown
| Component | Style Notes |
|-----------|-------------|
| Blueprint v6.1 | Methodology-focused, platform-agnostic, section-numbered |
| MBF v2.1 | Tool-specific, exhaustive options, quality gates per category |
| Bootstrap v1.4 | Action-oriented, beginner-friendly, self-cleaning philosophy |
| BRIDGE v1.2 | Navigation-focused, routing clarity, decision trees |
| GLOBAL_IDE_RULES v1.1 | Universal principles, IDE-specific configs |
| Skills | Description-first, trigger-accurate, specialized knowledge |
```

---

---

# SECTION K: MEMORY ARCHITECTURE INTEGRATION

---

## ENH-040 — Memory Architecture: Full Integration into Blueprint
**Target:** `12_PART_XII_FUTURE_PROOFING.md` (or new Part XIV extension) → New major section  
**Priority:** 🔴 Critical | **Complexity:** High

### Problem
`NS_MEMORY_ARCHITECTURE_PROPOSAL.md` is a PROPOSAL document — a complete, detailed integration blueprint that **has not yet been merged into the actual blueprint**. It represents some of the highest-quality thinking in the project (the three-pillar architecture, memory weighting algorithm, frontloading principle, compaction strategies). All of it is currently dead weight — documented but unimplemented.

This enhancement integrates the core concepts from the proposal into the blueprint as a living, usable section.

### Target Location
New Section: `Part XIV — Memory Architecture` (or extend existing Part XII)
Source: Synthesize from NS_MEMORY_ARCHITECTURE_PROPOSAL.md

### Draft Content to Insert

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║              MEMORY ARCHITECTURE — THE THIRD ENGINEERING LAYER              ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

The North Star Blueprint has always excelled at two things:
  • Prompt Engineering — how to talk to models
  • Context Engineering — how to select and route optimal tokens (BRIDGE, Load Balancing)

Memory Engineering is the third layer. It is what transforms:
  "agents that do tasks in a session" → "agents that learn and compound over time"

THE ENGINEERING EVOLUTION LADDER:

  ┌─────────────────────────────────────────────────────────────────────────┐
  │                                                                         │
  │  MEMORY ENGINEERING    ← "How do agents LEARN and ADAPT?"              │
  │  ──────────────────────   Persistent intelligence across sessions      │
  │         │                 THIS SECTION                                  │
  │         ▼                                                               │
  │  CONTEXT ENGINEERING   ← "How do we get OPTIMAL tokens into context?"  │
  │  ──────────────────────   BRIDGE routing, Load Balancing (existing)    │
  │         │                                                               │
  │         ▼                                                               │
  │  PROMPT ENGINEERING    ← "How do we talk to the model?"                │
  │  ──────────────────────   Superprompt architecture (existing)          │
  │                                                                         │
  │  Each level CONTAINS the one below it.                                  │
  └─────────────────────────────────────────────────────────────────────────┘

────────────────────────────────────────────────────────────────────────────────

## THE THREE-PILLAR MEMORY ARCHITECTURE

Memory in AI systems comprises three distinct pillars. The NS Framework maps
perfectly to this structure — the proposal adds the Memory Core and Memory Manager
that the framework was previously missing.

  ┌─────────────────────────────────────────────────────────────────────────┐
  │                                                                         │
  │  PILLAR 1: MEMORY CORE  "The Database as Brain"                        │
  │  ─────────────────────────────────────────────                         │
  │  One unified database — not separate vector/JSON/graph DBs.            │
  │  Handles: vectors, documents, graph traversal, relational queries      │
  │  Principle: "You don't have multiple brains. You have one."            │
  │                                                                         │
  │         │                                                               │
  │         ▼                                                               │
  │                                                                         │
  │  PILLAR 2: MEMORY MANAGER  "The Software Engineering Around Memory"    │
  │  ─────────────────────────────────────────────────────────────────     │
  │  CRUD operations for memory units:                                      │
  │  Create → Read → Update → Delete → Compact → Weight → Forget           │
  │                                                                         │
  │         │                                                               │
  │         ▼                                                               │
  │                                                                         │
  │  PILLAR 3: AGENT HARNESS  "Everything Around the LLM"                  │
  │  ─────────────────────────────────────────────────────                 │
  │  This IS the existing NS Blueprint:                                     │
  │  BRIDGE routing, Confidence Calibration, Quality Gates,                │
  │  Four Archetypes, Thread Models, Handoff Protocol, Fix Ledger          │
  │                                                                         │
  └─────────────────────────────────────────────────────────────────────────┘

────────────────────────────────────────────────────────────────────────────────

## MEMORY TYPES TAXONOMY

WORKING MEMORY (in-context, volatile)
  → The LLM's active context window: what's loaded right now
  → NS pattern: claude.md + plan.md + relevant files = working memory
  → Key constraint: context window limit — manage via BRIDGE routing

PROCEDURAL MEMORY (how to do things)
  → NS patterns already encode this:
    • Fix Ledger — "this approach failed, use this instead"
    • Skills — packaged instructions for specialized tasks
    • Slash commands — encoded repeatable workflows
    • RPIT Loop — the canonical procedure for feature development

EPISODIC MEMORY (what happened)
  → Structured artifacts that survive session boundaries:
    • plan.md (current feature history, checked-off steps)
    • CHANGELOG.md (what changed and when)
    • architecture.md (how the system evolved)
    • git log (immutable record of what actually happened)
  → Cross-session continuity: these ARE your episodic memory

SEMANTIC MEMORY (what things are — knowledge)
  → MBF categories: 62 technology domains, searchable knowledge
  → architecture.md: what your specific system IS
  → research reports: domain knowledge captured before building
  → BRIDGE.md: navigational knowledge of the framework itself

ASSOCIATIVE MEMORY (what connects to what)
  → Cross-category dependencies in MBF
  → Section references in Blueprint
  → Fix Ledger linking symptoms to solutions
  → Repository maps: function → caller → dependent relationships

────────────────────────────────────────────────────────────────────────────────

## MEMORY WEIGHTING ALGORITHM

From the Stanford Generative Agents paper. When multiple memories compete for
limited context space, prioritize by:

  weight(memory) = α·relevance + β·importance + γ·recency

  Where α + β + γ = 1.0 (tunable per use case)

  relevance = cosine_similarity(query, memory)    ← how related to current task
  importance = normalize(reference_count)         ← how central to knowledge graph
  recency = exp(-λ × hours_since_creation)        ← how fresh

TUNING BY USE CASE:
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Use Case          │  α (Relevance) │  β (Importance) │  γ (Recency) │
  ├──────────────────────────────────────────────────────────────────────┤
  │  Research/Knowledge │     0.6        │      0.3        │     0.1      │
  │  Conversational     │     0.4        │      0.2        │     0.4      │
  │  Task Execution     │     0.5        │      0.4        │     0.1      │
  │  Real-time Agent    │     0.3        │      0.2        │     0.5      │
  └──────────────────────────────────────────────────────────────────────┘

NS PRACTICAL APPLICATION:
  When choosing what to load into context for a session, weight by:
  → How relevant is this document to what we're building today? (relevance)
  → How often is this referenced by other documents? (importance)
  → How recently was this updated? (recency)
  
  Example: architecture.md (high importance, medium recency) > 
           old research report (medium relevance, low recency)

────────────────────────────────────────────────────────────────────────────────

## CONTEXT COMPACTION STRATEGIES

Two strategies — choose based on whether you can afford information loss:

LEVEL 1: SUMMARIZATION (lossy — accept information loss)
  When to use: Long conversation history, background context
  How: LLM compresses conversation into summary
  NS pattern: "Summarize the last 20 turns into 5 key decisions and
              current state" → store in session-summary.md

LEVEL 2: EXTERNALIZATION WITH REFERENCE IDs (lossless — no loss)
  When to use: Tool results, code blocks, detailed data
  How: Move content to file, leave pointer in context
  Pattern:
    BEFORE: Full database query result (2000 tokens)
    AFTER:  "[Externalized: query_result_2024.json] 
             Summary: 502 records. Call retrieve() if needed."
  NS implementation: Write verbose tool results to /tmp/session-[id]/
                     Keep only summary + reference path in context

DECISION:
  Tool results → Externalize (Level 2)
  Conversation history → Summarize (Level 1)
  Knowledge context → Selective retrieval via BRIDGE routing

────────────────────────────────────────────────────────────────────────────────

## THE FRONTLOADING PRINCIPLE

"Pre-process everything so the LLM can focus on reasoning."

The fundamental insight: LLMs perform better when they don't have to BOTH
select information AND reason about it simultaneously. Separate the concerns.

NS IMPLEMENTATION — STRUCTURED CONTEXT TEMPLATE:

  <context>
    <procedural_memory>
      <!-- Things Claude can DO — skills, tools, workflows -->
      Active skills: [list of loaded skills]
      Available commands: [slash commands]
      Known patterns: [relevant entries from Fix Ledger]
    </procedural_memory>

    <semantic_memory>
      <!-- Things Claude KNOWS about this project -->
      Architecture: [see architecture.md]
      Tech stack: [current tech choices]
      Domain rules: [business constraints from claude.md]
    </semantic_memory>

    <episodic_memory>
      <!-- What HAS HAPPENED in this project -->
      Recent: [git log --oneline -5]
      Current feature: [plan.md summary, completed steps]
      Key decisions: [from CHANGELOG.md]
    </episodic_memory>

    <working_memory>
      <!-- What we're DOING NOW -->
      Task: [current step from plan.md]
      Success criteria: [from plan.md]
      Constraints: [active constraints]
    </working_memory>
  </context>

WHY THIS MATTERS: When context is structured this way, Claude instantly
knows which "drawer" to open for each type of reasoning. This produces
measurably better output than undifferentiated context.

────────────────────────────────────────────────────────────────────────────────

## MEMORY QUALITY GATES

□ Memory Core selected and documented (see MBF Category 62)
□ Memory types identified for your use case
□ Compaction strategy selected (summarization vs externalization)
□ Episodic artifacts current: plan.md, architecture.md, CHANGELOG.md
□ Retrieval accuracy tested: does semantic search return expected results?
□ Forgetting threshold set: low-weight memories archived or pruned
□ Cross-session continuity verified: new session recovers state from files

## MEMORY ARCHITECTURE QUALITY GATE FOR DEFINITION OF DONE
□ Memory architecture documented for the feature
□ Episodic artifacts updated (plan.md checked off, CHANGELOG entry)
□ Any new patterns encoded into skills or claude.md rules
```

---

## ENH-041 — New MBF Category 62: Memory Infrastructure
**Target:** `MBF_PART_2_DATA_AI.md` → After Category 35 or new Tier 4 entry  
**Priority:** 🔴 Critical | **Complexity:** High

### Draft Content to Insert

```markdown
## Category 62: Memory Infrastructure

### Scope
Agent memory systems, cross-session persistence frameworks, memory managers,
long-term knowledge stores for AI agents, semantic caching.

### Technology Stack — Exhaustive

#### Production Memory Manager Frameworks
| Framework | Key Differentiator | Best For |
|-----------|-------------------|----------|
| **Mem0** | Production-ready, all memory types, Python/TS SDK, hosted or self-hosted | Teams needing production memory fast |
| **Zep** | Long-term memory for LLMs, temporal awareness, user preference learning | Conversational agents, user modeling |
| **MemGPT / Letta** | Self-editing memory, agent controls its own memory, tiered storage | Autonomous long-running agents |
| **Cognee** | Knowledge graph memory, decision trail, team memory sharing | Complex reasoning, multi-agent teams |
| **mem.ai** | Personal AI memory layer, cross-app, long-form notes | Personal assistant agents |

#### Minimal / Build-Your-Own
| Approach | Complexity | Best For |
|----------|-----------|----------|
| **SQLite + pgvector** | Low | Learning, POC, small projects |
| **Supabase + pgvector** | Low | Managed, production-capable |
| **Chroma** | Low | In-process vector store, rapid prototyping |
| **Custom MemoryManager class** | Medium | Full control, specific requirements |

#### Semantic Caching
| Tool | Purpose |
|------|---------|
| **GPTCache** | Semantic cache for LLM calls — cache similar queries |
| **Redis + embedding index** | Production semantic cache |

### The Three-Pillar Selection Guide

Select based on your position in the three-pillar architecture (NS Blueprint, Memory Architecture section):

MEMORY CORE selection:
  Learning / POC:         SQLite + pgvector extension
  Professional team:      Supabase or Neon (managed Postgres)
  Production / scale:     Dedicated solution matching your scale (Qdrant, Weaviate, or Oracle)

MEMORY MANAGER selection:
  "I want to understand it first":    Build minimal MemoryManager (~50-100 lines Python)
  "I need it to work now":            Mem0 (most comprehensive SDK)
  "My agents are conversational":     Zep (temporal + conversational focus)
  "My agents are autonomous/long-running": MemGPT / Letta (self-managing memory)
  "I need team/multi-agent memory":   Cognee (knowledge graph approach)

### Memory Unit Schema Reference
```json
{
  "type": "workflow | conversation | knowledge | entity | association | tool",
  "content": "string",
  "embedding": "vector[1536]",
  "metadata": {
    "created_at": "ISO8601",
    "source": "string",
    "relevance_score": "float",
    "importance_score": "float",
    "recency_decay": "float"
  },
  "weight": "α·relevance + β·importance + γ·recency"
}
```

### Quality Gates
```
□ Memory Core selected based on tier and data type requirements
□ Memory Manager chosen (or custom built and understood)
□ All 5 memory types mapped to your use case
□ Compaction strategy implemented (summarization or externalization)
□ Memory weighting algorithm calibrated (α, β, γ values tuned)
□ Forgetting threshold set (recommend 0.1)
□ Cross-session continuity tested (session ends → new session recovers state)
□ Privacy/security: PII in memory? Data handling policy documented
□ Cost model: memory retrieval calls counted in token budget
```

### NS Framework Integration Points
→ Fix Ledger becomes Workflow Memory (procedural, captures failure+resolution)
→ plan.md + CHANGELOG = Episodic Memory (what happened)
→ architecture.md + MBF = Semantic Memory (what things are)
→ Skills + slash commands = Procedural Memory (how to do things)
→ Repository maps = Associative Memory (what connects to what)

### Cross-Category Dependencies
- → Category 16 (Vector Databases) — storage layer for semantic memory
- → Category 29 (Agent Memory) — existing memory patterns
- → Category 31 (Agent Frameworks) — harness layer above memory
- → Category 35 (AI Safety) — memory access control and privacy
- → NS Part XIV (Memory Architecture) — full methodology
```

---

---

# UPDATED IMPLEMENTATION GUIDE (Amendment)

## REVISED SPRINT SEQUENCING — Incorporating Amendment

Add **Sprint 7** to the existing 6-sprint plan from the original package:

### SPRINT 7: Previously Missed Files (Amendment A)
35. **ENH-035** — GLOBAL_IDE_RULES v1.1 full update (hooks, multi-agent, RPIT, permissions)
36. **ENH-036** — GLOBAL_IDE_RULES: Kiro, Zed+ACP, Antigravity IDE configs
37. **ENH-037** — README_REPO.md complete rewrite
38. **ENH-038** — QUICK_START.md update (URLs, paths, practices)
39. **ENH-039** — CONTRIBUTING.md update (categories, skills, enhancement IDs)

### SPRINT 8: Memory Architecture Integration
40. **ENH-040** — Memory Architecture integration into NSB (Part XIV)
41. **ENH-041** — MBF Category 62: Memory Infrastructure

---

## REVISED TARGET FILE MAP (Amendment additions)

| File to Update | Enhancements |
|----------------|-------------|
| `GLOBAL_IDE_RULES.md` → v1.1 | ENH-035, ENH-036 |
| `README_REPO.md` → v6.1 | ENH-037 |
| `QUICK_START.md` → v6.1 | ENH-038 |
| `CONTRIBUTING.md` → v6.1 | ENH-039 |
| `12_PART_XII_FUTURE_PROOFING.md` or new Part XIV | ENH-040 |
| `MBF_PART_2_DATA_AI.md` → v2.1 | ENH-041 |
| `NS_MEMORY_ARCHITECTURE_PROPOSAL.md` | Archive as IMPLEMENTED after ENH-040+041 complete |

---

## REVISED COMPLEXITY BUDGET (Total Package)

| Priority | Original | Amendment | Total |
|----------|----------|-----------|-------|
| 🔴 Critical | 12 | 5 | **17** |
| 🟡 High | 14 | 1 | **15** |
| 🟢 Medium | 8 | 1 | **9** |
| **TOTAL** | **34** | **7** | **41** |

Estimated additional effort: ~2 focused sessions (Sprints 7+8)
**Grand total: ~8 sessions for complete v6.1 upgrade**

---

## ONE FINAL NOTE ON NS_MEMORY_ARCHITECTURE_PROPOSAL.md

This file should be **archived, not deleted**, once ENH-040 and ENH-041 are implemented. Suggested action:

```bash
# After ENH-040 and ENH-041 are complete:
git mv NS_MEMORY_ARCHITECTURE_PROPOSAL.md \
       archive/NS_MEMORY_ARCHITECTURE_PROPOSAL_IMPLEMENTED_v6.1.md

# Add to README note: 
# "Memory Architecture Proposal — fully integrated into Blueprint v6.1 Part XIV
#  and MBF v2.1 Category 62. See archive/ for original proposal document."
```

The proposal is too valuable to delete — it contains Richmond Alake source quotes,
the full memory weighting derivation, and detailed schemas that serve as reference
for implementers. It should live on as an archived source document.

---

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║  NS ENHANCEMENT PACKAGE v6.1 — AMENDMENT A — COMPLETE                       ║
║                                                                              ║
║  7 additional enhancements | 5 previously missed files | 2 new MBF/NSB     ║
║  sections from Memory Architecture Proposal                                  ║
║                                                                              ║
║  Combined with original package:                                             ║
║  41 total enhancements | 8 component upgrades | 4 new skills                ║
║  6 new MBF categories | 8 sprints to complete                               ║
║                                                                              ║
║  @NavigatingTruth | CC BY-NC-SA 4.0 | March 2026                           ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```
