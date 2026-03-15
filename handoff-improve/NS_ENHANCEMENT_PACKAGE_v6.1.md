# NORTH STAR ENHANCEMENT PACKAGE v6.1

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║              NORTH STAR ENHANCEMENT PACKAGE — v6.1                          ║
║                                                                              ║
║         Complete Upgrade Specification for the North Star Ecosystem          ║
║                                                                              ║
║                         ────────────────────                                 ║
║                                                                              ║
║          Compiled: March 2026  |  @NavigatingTruth  |  CC BY-NC-SA 4.0     ║
║                                                                              ║
║     "The landscape shifted. The framework evolves. The North Star holds."   ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

---

## WHAT THIS DOCUMENT IS

This is the **master specification** for upgrading every layer of the North Star Framework
ecosystem to v6.1. It is not a changelog — it is a complete implementation blueprint.

Every enhancement is:
- Assigned an **Enhancement ID** (ENH-XXX)
- Mapped to a **target file and section**
- Accompanied by **draft content** ready for insertion
- Rated by **complexity** (Low / Medium / High)
- Marked with a **priority** (🔴 Critical / 🟡 High / 🟢 Medium)

### Source Intelligence

This package synthesizes enhancements from four intelligence streams:
1. **52-Tip Claude Code Power User Transcript** — operational patterns from a year of production usage
2. **Opus 4.5 Landscape Research** — 8 gap categories, new tools, March 2026 benchmarks
3. **Live Web Research** — OpenClaw ecosystem, Boris Cherny workflow, skill ecosystem evolution,
   Boris Tane plan.md annotation pattern, Kiro spec-driven dev, ACP protocol
4. **Framework Gap Analysis** — cross-referenced against existing NS segments and MBF categories

---

## VERSION MAP

| Component | Current | → Upgrade Target |
|-----------|---------|------------------|
| Bootstrap | v1.3 | → **v1.4** |
| BRIDGE | v1.1 | → **v1.2** |
| North Star Blueprint | v6.0 | → **v6.1** |
| Master Build Framework | v2.0 | → **v2.1** |
| NS Segment Index | v5.0 ref | → **v6.1 ref** |
| MBF Segment Index | v1.1 ref | → **v2.1 ref** |

---

## ENHANCEMENT INDEX

| ID | Priority | Component | Topic | Complexity |
|----|----------|-----------|-------|------------|
| ENH-001 | 🔴 | Bootstrap v1.4 | Multi-agent native ignition sequence | Medium |
| ENH-002 | 🔴 | Bootstrap v1.4 | OpenClaw async delegation bridge | Medium |
| ENH-003 | 🟡 | Bootstrap v1.4 | Permission pre-configuration protocol | Low |
| ENH-004 | 🟡 | Bootstrap v1.4 | Fetch URL updates for v6.1 | Low |
| ENH-005 | 🔴 | BRIDGE v1.2 | New decision tree branches (async/spec/governance) | Medium |
| ENH-006 | 🟡 | BRIDGE v1.2 | MBF routing for new categories (57-64) | Low |
| ENH-007 | 🟡 | BRIDGE v1.2 | Boris Cherny parallel checkout pattern | Low |
| ENH-008 | 🔴 | NSB Part I | RPIT Loop — canonical feature development loop | High |
| ENH-009 | 🔴 | NSB Part II | Plan.md Annotation Pattern (human-in-the-loop planning) | High |
| ENH-010 | 🔴 | NSB Part II | Hooks Architecture — determinism injection system | High |
| ENH-011 | 🟡 | NSB Part IV | Planner/Worker/Judge hierarchy pattern | Medium |
| ENH-012 | 🔴 | NSB Part IV | Parallel agent orchestration (git worktrees + multi-Claude) | High |
| ENH-013 | 🟡 | NSB Part IV | Agent Teams — coordinated specialized roles | Medium |
| ENH-014 | 🟡 | NSB Part VIII | Repository maps — tree-sitter AST + PageRank context fitting | Medium |
| ENH-015 | 🟡 | NSB Part XI | Kiro Spec-Driven / Event-Driven hooks pattern | Medium |
| ENH-016 | 🔴 | NSB Part XII | Feedback Loop / Retro Skill — outer improvement loop | High |
| ENH-017 | 🟡 | NSB Part III | Context compaction recovery protocol | Medium |
| ENH-018 | 🟢 | NSB Part I | claude.md as living document — iterative improvement commands | Low |
| ENH-019 | 🟢 | NSB Part I | Status line configuration for context-aware sessions | Low |
| ENH-020 | 🔴 | MBF v2.1 | New Category 57: Agent Orchestration Frameworks | High |
| ENH-021 | 🔴 | MBF v2.1 | New Category 58: AI-Native IDEs & Coding Agents | High |
| ENH-022 | 🟡 | MBF v2.1 | New Category 59: Prompt Orchestration & Evaluation | Medium |
| ENH-023 | 🟡 | MBF v2.1 | New Category 60: Life OS Agents (OpenClaw ecosystem) | Medium |
| ENH-024 | 🟡 | MBF v2.1 | New Category 61: Enterprise Agent Governance | Medium |
| ENH-025 | 🟡 | MBF v2.1 | Category 44 expansion: Data Pipeline + HITL (Prefect/Dagster) | Medium |
| ENH-026 | 🟢 | MBF v2.1 | Category 29 expansion: Context Management Systems | Low |
| ENH-027 | 🟢 | MBF v2.1 | Benchmark matrix update: SWE-bench / Terminal-Bench 2026 | Low |
| ENH-028 | 🔴 | Skills | New skill: retro-skill.md (post-RPIT feedback loop) | High |
| ENH-029 | 🔴 | Skills | New skill: parallel-agent-orchestration.md | High |
| ENH-030 | 🟡 | Skills | New skill: research-report.md | Medium |
| ENH-031 | 🟡 | Skills | New skill: plan-annotator.md | Medium |
| ENH-032 | 🟡 | Skills | Skill-builder meta-integration: claudeception + skill-creator | Medium |
| ENH-033 | 🟢 | Skills | Update existing skill descriptions for improved auto-discovery | Low |
| ENH-034 | 🔴 | Bonus | OpenClaw Integration Guide — addendum to BRIDGE | High |

---

---

# SECTION A: BOOTSTRAP v1.4 ENHANCEMENTS

---

## ENH-001 — Multi-Agent Native Ignition Sequence
**Target:** `NORTH_STAR_BOOTSTRAP.md` → Section: QUICKSTART SEQUENCE  
**Priority:** 🔴 Critical | **Complexity:** Medium

### Problem
The current Bootstrap ignition assumes a single-agent, single-session workflow. The ecosystem has shifted: multi-Claude orchestration with git worktrees is now table stakes (Feb 2026), and the Bootstrap should reflect a first-class path for multi-agent project starts.

### Draft Content to Insert

**Insert after the existing "SOLO START" sequence block:**

```
MULTI-AGENT START SEQUENCE (for parallel feature development)
──────────────────────────────────────────────────────────────────────────────

WHEN TO USE: Building 2+ independent features simultaneously, or when
you want to delegate while continuing to work.

STEP 1: Identify parallel tracks
  → List features/tasks that have no shared file dependencies
  → Assign each to an isolated worktree

STEP 2: Bootstrap primary session (main orchestrator)
  → claude --model opus [or sonnet]
  → Load Bootstrap → BRIDGE → claude.md as normal

STEP 3: Spawn parallel worktree sessions
  → claude --worktree  [creates isolated branch automatically]
  → OR in Desktop App: New Session → check "Use worktree"
  → Each worktree lands in .claude/worktrees/<branch-name>/

STEP 4: Brief each agent
  → Give each agent its GitHub issue number or task description
  → Include: success criteria, files it owns, test commands
  → Do NOT give agents overlapping file ownership

STEP 5: Monitor via Desktop App or status line
  → Use sidebar session list to track progress
  → Each agent can run tests independently before PR creation

STEP 6: Merge protocol
  → Each agent creates a PR when feature is complete + tested
  → Review PRs before merging to prevent conflicts
  → Merge in dependency order

┌─────────────────────────────────────────────────────────────────┐
│  CONDUCTOR MINDSET                                              │
│  You are no longer a pair programmer.                           │
│  You are the conductor of an AI orchestra.                      │
│  Your job: clear briefs, success criteria, review PRs.         │
└─────────────────────────────────────────────────────────────────┘
```

---

## ENH-002 — OpenClaw Async Delegation Bridge
**Target:** `NORTH_STAR_BOOTSTRAP.md` → New subsection after multi-agent sequence  
**Priority:** 🔴 Critical | **Complexity:** Medium

### Problem
OpenClaw (199K+ GitHub stars as of March 2026) enables triggering Claude Code sessions via messaging apps (WhatsApp, Telegram, Slack). NS Framework users should understand how to use this as an async delegation layer — kicking off NS-powered builds from mobile without opening a terminal.

### Draft Content to Insert

```
ASYNC DELEGATION VIA OPENCLAW (Optional — Advanced)
──────────────────────────────────────────────────────────────────────────────

OpenClaw is a local-first AI life OS that connects messaging apps to AI agents.
It is NOT a coding tool — it is a dispatch layer. When combined with Claude Code
(which IS the coding tool), you get mobile-triggered autonomous development.

USE CASE: You're away from your desk. You think of a bug fix or feature.
You send a WhatsApp message → OpenClaw triggers a Claude Code loop → 
you come back to a PR ready to review.

SETUP OVERVIEW:
  1. Install OpenClaw on your dev machine (runs as a daemon)
  2. Connect your preferred messaging app (WhatsApp/Telegram/Slack)
  3. Create a skill in OpenClaw that triggers claude CLI commands
  4. Send task descriptions from your phone → PR appears on GitHub

EXAMPLE OPENCLAW SKILL TRIGGER (conceptual):
  Message: "Fix the auth bug in issue #47 and create a PR"
  OpenClaw routes to: claude --resume-or-new "Work on GitHub issue #47.
                       Use RPIT loop. Create PR when done."

NORTH STAR + OPENCLAW STACK:
  ┌────────────────────┐    ┌────────────────────┐    ┌────────────────────┐
  │  Your Phone        │───▶│  OpenClaw Daemon   │───▶│  Claude Code       │
  │  (WhatsApp/TG)     │    │  (Local Machine)   │    │  (NS Framework)    │
  │                    │    │  Routes message    │    │  RPIT Loop         │
  │  "Fix issue #47"   │    │  → claude CLI      │    │  Creates PR        │
  └────────────────────┘    └────────────────────┘    └────────────────────┘

⚠️  SECURITY NOTE: OpenClaw has full system access. Scope permissions to only
    the directories and commands needed. Never run with root privileges.

→ See ENH-034: OpenClaw Integration Guide (BRIDGE Addendum) for full details.
→ See MBF Category 60 for OpenClaw ecosystem tool matrix.
```

---

## ENH-003 — Permission Pre-Configuration Protocol
**Target:** `NORTH_STAR_BOOTSTRAP.md` → Section: PROJECT SETUP CHECKLIST  
**Priority:** 🟡 High | **Complexity:** Low

### Problem
Running Claude with `--dangerously-skip-permissions` is an anti-pattern. Bootstrap should codify the correct approach: pre-configure permissions once, check them into git.

### Draft Content to Insert

**Add to the project setup checklist:**

```
PERMISSION CONFIGURATION (do once, commit to git)
──────────────────────────────────────────────────────────────────────────────

❌ NEVER: claude --dangerously-skip-permissions
   This bypasses all safety guards. It has "dangerous" in the name for a reason.

✅ INSTEAD: Pre-configure exactly what Claude needs

STEP 1: Identify required permissions for your project
  Common: bash commands, file read/write, git operations, specific CLIs

STEP 2: Configure in .claude/settings.json
  {
    "permissions": {
      "allow": [
        "bash:git *",
        "bash:npm *",
        "bash:npx *",
        "file:read:**",
        "file:write:src/**"
      ],
      "deny": [
        "bash:rm -rf /",
        "file:write:.env"
      ]
    }
  }

STEP 3: Commit to git
  git add .claude/settings.json
  git commit -m "chore: configure Claude Code permissions"

BENEFIT: Claude runs autonomously within safe guardrails.
         Other team members (and future you) inherit the same config.
```

---

## ENH-004 — Fetch URL Updates for v6.1
**Target:** `NORTH_STAR_BOOTSTRAP.md` → Section: FRAMEWORK DOCUMENT LOCATIONS  
**Priority:** 🟡 High | **Complexity:** Low

### Change Required

Update all URL references from v5.0/v1.1 to v6.1/v2.1:

```
# OLD
NORTH STAR BLUEPRINT v5.0 (Methodology):
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/north-star-blueprint/NORTH_STAR_BLUEPRINT_v5.0.md

MASTER BUILD FRAMEWORK v1.1 (Technology):
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/master-build-framework/MASTER_BUILD_FRAMEWORK_v1.1.md

# NEW
NORTH STAR BLUEPRINT v6.1 (Methodology):
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md

MASTER BUILD FRAMEWORK v2.1 (Technology):
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/master-build-framework/MASTER_BUILD_FRAMEWORK_v2.1.md
```

Also update the Bootstrap header banner version from `v1.3` to `v1.4`.

---

---

# SECTION B: BRIDGE v1.2 ENHANCEMENTS

---

## ENH-005 — New Decision Tree Branches
**Target:** `BRIDGE.md` → Section 3: QUICK DECISION TREE  
**Priority:** 🔴 Critical | **Complexity:** Medium

### Add these branches to the existing decision tree:

```
WORK ASYNC / AWAY FROM DESK
├─ "How do I trigger builds from my phone?"    → OpenClaw Bridge (ENH-002)
├─ "How do I delegate and review later?"       → NS Section 0: Async Delegation
├─ "Can Claude work while I sleep?"            → GitHub Action + RALPH Loop
└─ "Multi-repo async management?"             → MBF Category 60 (OpenClaw)

SPEC-DRIVEN DEVELOPMENT
├─ "How do I prevent Claude writing wrong code?" → ENH-009: Plan.md Annotation
├─ "What's the best feature development loop?"   → ENH-008: RPIT Loop (NS Part I)
├─ "How do I define success before building?"    → NS Section 0: Spec Protocol
└─ "Kiro-style event-driven automation?"         → ENH-015: Hooks Architecture

MULTI-AGENT ORCHESTRATION
├─ "Run multiple Claudes safely?"              → ENH-012: Git Worktrees
├─ "Coordinate specialized agent roles?"       → ENH-013: Agent Teams
├─ "Independent parallel features?"           → ENH-001: Multi-Agent Bootstrap
└─ "What orchestration framework to use?"     → MBF Category 57

CHOOSE TOOLING (new categories)
├─ "Agent orchestration framework?"           → MBF Category 57 (CrewAI/ADK/Strands)
├─ "AI-native IDE beyond VS Code?"            → MBF Category 58 (Kiro/Zed/Cline)
├─ "Prompt evaluation and versioning?"        → MBF Category 59 (Vellum/PromptLayer)
├─ "Life OS / async agent?"                   → MBF Category 60 (OpenClaw)
└─ "Enterprise agent governance?"             → MBF Category 61 (ServiceNow/Boomi)

SELF-IMPROVEMENT / CONTINUOUS LEARNING
├─ "How does Claude learn from mistakes?"     → ENH-016: Retro Skill / Feedback Loop
├─ "Auto-creating skills from sessions?"      → ENH-032: Claudeception Integration
├─ "Improve claude.md automatically?"         → ENH-018: Living claude.md Protocol
└─ "RALPH loop implementation?"               → NS Section 23 + MBF Category 44
```

---

## ENH-006 — MBF Routing for New Categories 57–61
**Target:** `BRIDGE.md` → Section HOW vs WHAT table, plus routing maps  
**Priority:** 🟡 High | **Complexity:** Low

### Add to BRIDGE routing tables:

```
NEW CATEGORY ROUTING (v2.1 additions)
─────────────────────────────────────────────────────────────────
Category 57 | Agent Orchestration Frameworks  | MBF_PART_2_DATA_AI
Category 58 | AI-Native IDEs & Coding Agents  | MBF_PART_1_CORE
Category 59 | Prompt Orchestration & Eval      | MBF_PART_2_DATA_AI
Category 60 | Life OS Agents                   | MBF_PART_4_FOUNDATION
Category 61 | Enterprise Agent Governance      | MBF_PART_4_FOUNDATION
```

Also update the BRIDGE header table:
```
| North Star Blueprint v6.1 | HOW to build | ~1MB+ | Methodology, process, quality gates |
| Master Build Framework v2.1 | WHAT to build with | ~200KB+ | Technology selection, 61 categories |
```

---

## ENH-007 — Boris Cherny Parallel Checkout Pattern
**Target:** `BRIDGE.md` → new sub-section: CREATOR-PROVEN PATTERNS  
**Priority:** 🟡 High | **Complexity:** Low

### Draft Content

```
CREATOR-PROVEN PATTERNS — From the Claude Code Creator's Workflow
──────────────────────────────────────────────────────────────────────────────

Boris Cherny (Claude Code creator) shared his personal workflow in Jan 2026.
These are the patterns he uses at Anthropic — the most battle-tested approaches
available.

PARALLEL CHECKOUTS (not worktrees):
  → Cherny uses separate full git checkouts per session, NOT branches/worktrees
  → Reason: Maximum isolation, no shared state, simplest to reason about
  → Runs 5 local sessions + 5-10 remote on Anthropic's web app simultaneously
  → Remote sessions started with & from CLI for background execution
  → Uses --teleport to move sessions between web and local

PATTERN: "5 local + 5-10 remote"
  ┌──────────────────────────────────────────────────────────────┐
  │  LOCAL (5 sessions)          REMOTE (5-10 sessions)          │
  │  ─────────────────────       ──────────────────────          │
  │  Complex features            Background tasks                 │
  │  Needs testing/debugging     Fire-and-forget tasks            │
  │  Requires local tools        Review-later PRs                 │
  │  Sensitive code              Research/documentation           │
  └──────────────────────────────────────────────────────────────┘

SESSION ABANDONMENT STRATEGY:
  → Cherny accepts ~10-20% session abandonment as normal
  → If unexpected scenario arises, abandon and restart with better context
  → This is NOT failure — it's efficient resource management

NS FRAMEWORK RECOMMENDATION:
  → Use worktrees for most multi-agent work (simpler, built into Claude Code)
  → Use separate checkouts when you need maximum isolation for sensitive features
  → Use remote sessions for all research, documentation, and async tasks
```

---

---

# SECTION C: NORTH STAR BLUEPRINT v6.1 ENHANCEMENTS

---

## ENH-008 — RPIT Loop: The Canonical Feature Development Loop
**Target:** `01_PART_I_FOUNDATION.md` → Insert as new Section after Tier System  
**Priority:** 🔴 Critical | **Complexity:** High

### Problem
The framework has execution primitives but lacks a single, canonical feature-level workflow. RPIT (Research → Plan → Implement → Test) is the most validated loop pattern from year-one Claude Code power users and should be elevated to canonical status in the Foundation.

### Draft Content to Insert

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║              THE RPIT LOOP — CANONICAL FEATURE DEVELOPMENT CYCLE            ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

The RPIT Loop is the standard unit of feature development within the North Star
Framework. Every feature — from a one-line bug fix to a multi-day capability —
should be processed through this cycle.

RPIT = Research → Plan → Implement → Test

The power of RPIT lies not in the steps themselves but in the SEPARATION of
concerns. Each phase has a distinct purpose and distinct success criteria.
Collapsing phases is the #1 cause of wasted effort in AI-assisted development.

────────────────────────────────────────────────────────────────────────────────

PHASE 1: RESEARCH (Optional — scale to task complexity)

PURPOSE: Gather knowledge before touching code
WHEN TO USE: New APIs, unfamiliar tech stack decisions, external integrations

  Command: "Create a research report on [topic]. Focus on:
            - Best practices as of [current date]
            - Common pitfalls to avoid
            - How it fits our architecture (see architecture.md)
            Output: research/[feature-name].md"

OUTPUT: A structured research.md file that becomes permanent project knowledge
SKIP IF: The feature uses only familiar, stable technology

ANTI-PATTERN: Skipping research on new integrations and discovering the API
              changed 6 months ago halfway through implementation.

────────────────────────────────────────────────────────────────────────────────

PHASE 2: PLAN (Non-negotiable — always do this)

PURPOSE: Translate requirements into reviewable, approvable steps BEFORE code
THE RULE: Claude must not write a single line of implementation code until the
          plan has been reviewed and approved by the human.

  Command: "Use plan mode. Create plan.md for [feature]. Include:
            - Step-by-step implementation approach
            - Files that will be created/modified
            - Dependencies and order of operations
            - Success criteria for each step
            Use ask_user_question tool if any requirements are ambiguous."

HUMAN REVIEW PROTOCOL (the Boris Tane method):
  1. Claude writes plan.md
  2. Human opens plan.md in editor
  3. Human adds INLINE ANNOTATIONS directly to the document
     - "not optional" next to a parameter Claude marked optional
     - "use existing auth system, not new one" next to a proposed abstraction
     - Paste code snippets showing expected data shapes
  4. Human sends plan.md back to Claude: "Review my annotations and update plan"
  5. Iterate until plan is approved
  6. Convert to todo list: "Convert approved plan to sequential todo list"
  7. THEN begin implementation

ANNOTATION EXAMPLES:
  Claude writes: "Parameter: userId? (optional)"
  Human annotates: "userId — REQUIRED, never nullable, see User type in types.ts"

  Claude writes: "Create new auth middleware"
  Human annotates: "Use existing authMiddleware in /middleware/auth.ts — do NOT create new"

WHY THIS MATTERS:
  → Prevents wasted tokens on the wrong approach
  → Surfaces domain knowledge Claude doesn't have
  → Creates reviewable artifact before any risk is taken
  → The plan becomes permanent project documentation

────────────────────────────────────────────────────────────────────────────────

PHASE 3: IMPLEMENT

PURPOSE: Execute the approved plan, not improvise from scratch
THE RULE: Implementation follows the plan. If Claude needs to deviate
          significantly, STOP and update the plan first.

  Command: "Implement the approved todo list from plan.md. 
            Commit after each completed step.
            If you encounter a blocker not in the plan, STOP and report."

PERMISSIONS: Set pre-configured permissions (see ENH-003) so Claude can
             execute without interruption on approved operations.

QUALITY GATES DURING IMPLEMENTATION:
  ✓ Build still passes after each commit
  ✓ No new linting errors introduced
  ✓ Each step committed with descriptive message

────────────────────────────────────────────────────────────────────────────────

PHASE 4: TEST

PURPOSE: Verify the feature works — not just that it compiles
LEVELS OF VERIFICATION:
  L1: Unit tests (Claude writes, runs, fixes)
  L2: Integration tests (Claude writes, runs, fixes)
  L3: End-to-end / browser automation (Playwright MCP)
  L4: Human UX verification (screenshots, visual inspection)

  Command: "Run all tests. If any fail, fix them before proceeding.
            Then open a browser and verify [user journey] works end-to-end.
            Screenshot the final state and include in PR description."

VERIFY AT ABSTRACTION (not line-by-line):
  → Don't read every line of code Claude produced
  → DO run automated tests
  → DO verify success criteria from the plan
  → DO do a quick UX walkthrough
  → DO check for security/auth implications on the diff

────────────────────────────────────────────────────────────────────────────────

RPIT QUICK REFERENCE

  ┌─────────────────────────────────────────────────────────────────────────┐
  │   FEATURE SIZE    │  RESEARCH  │   PLAN   │  IMPLEMENT  │    TEST      │
  ├─────────────────────────────────────────────────────────────────────────┤
  │   Bug fix (small) │   Skip     │  5 min   │  10-30 min  │  L1+L4       │
  │   Small feature   │   Skip     │  15 min  │  30-60 min  │  L1+L2+L4    │
  │   Medium feature  │  Optional  │  30 min  │  2-4 hours  │  L1+L2+L3+L4 │
  │   Large feature   │  Required  │  1 hour  │  4-8 hours  │  All levels  │
  └─────────────────────────────────────────────────────────────────────────┘

OUTER LOOP: After RPIT completes, run the RETRO SKILL (see ENH-016)
            to capture learnings and improve the next cycle.
```

---

## ENH-009 — Plan.md Annotation Pattern
**Target:** `02_PART_II_PRIMITIVES.md` → New primitive section  
**Priority:** 🔴 Critical | **Complexity:** High

### Problem
The framework describes planning but doesn't codify the single most impactful human-AI collaboration pattern: annotating AI-generated plans inline before approving them. This is the primary mechanism by which human domain knowledge enters the build process.

### Draft Content to Insert

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                  PRIMITIVE: PLAN.MD ANNOTATION PROTOCOL                     ║
╚══════════════════════════════════════════════════════════════════════════════╝

PRINCIPLE: The gap between what Claude plans and what you actually want is
           not filled by more prompting — it is filled by annotation.

Annotation is the act of adding your domain knowledge, constraints, and
corrections DIRECTLY INTO Claude's plan document, then sending it back.

This is qualitatively different from prompting because:
  → It operates at the document level, not the conversation level
  → It creates a permanent record of architectural decisions
  → It is reviewable by humans and future Claude sessions
  → It naturally produces the spec that guides implementation

────────────────────────────────────────────────────────────────────────────────

THE ANNOTATION WORKFLOW

  Step 1: Request plan
    "Enter plan mode. Write plan.md for [feature].
     Include: approach, files to touch, data shapes, edge cases, success criteria.
     Use ask_user_question if anything is ambiguous."

  Step 2: Open in your editor
    → Open plan.md in VS Code, Cursor, or your preferred editor
    → Do NOT respond in the chat yet
    → Read the entire plan before annotating

  Step 3: Annotate inline
    Use a consistent annotation format, e.g.:
    
    Claude wrote:   "userId?: string (optional query param)"
    You annotate:   "userId: string // REQUIRED — never nullable. See UserType in /types/user.ts"
    
    Claude wrote:   "Create JWT validation middleware"  
    You annotate:   "USE EXISTING: /middleware/validateJWT.ts — do not create a new one"
    
    Claude wrote:   "Store result in database"
    You annotate:   "Use optimistic write pattern — don't block on DB confirmation. See pattern in /lib/db/optimistic.ts"

  Step 4: Return for revision
    "I've added annotations to plan.md. Read them carefully and update the plan
     to incorporate all my corrections. Ask if anything is unclear."

  Step 5: Approve or annotate again
    → If plan looks good: "Plan approved. Convert to sequential todo list."
    → If still issues: annotate again (Step 3)

  Step 6: Lock the plan
    → Commit plan.md to git: "chore: approved plan for [feature]"
    → This is now the architectural record

────────────────────────────────────────────────────────────────────────────────

ANNOTATION TAXONOMY

  TYPE A — Constraint Corrections
    Claude assumes optional → you mark required
    Claude assumes new → you point to existing
    Claude assumes mutable → you mark immutable

  TYPE B — Domain Knowledge Injection
    Existing file paths and patterns to use
    Business rules Claude can't know (e.g., "payments in USD cents only")
    User expectations ("this must complete in under 200ms")

  TYPE C — Architecture Guardrails
    "Don't add new dependencies for this"
    "This must be backward-compatible with v1 API"
    "Performance budget: no more than 50ms added to page load"

  TYPE D — Clarifying Data Shapes
    Paste actual TypeScript types
    Show example API responses
    Reference existing interfaces

────────────────────────────────────────────────────────────────────────────────

ANTI-PATTERNS

  ❌  Approving a plan you haven't read
  ❌  Correcting in chat ("actually, make userId required") without annotating
      the plan itself — this correction gets lost at compaction
  ❌  Annotating after implementation has started
  ❌  Skipping the plan for "small" changes — this is where bugs come from

────────────────────────────────────────────────────────────────────────────────

PLAN.MD TEMPLATE

```markdown
# Plan: [Feature Name]
**Issue:** #[number]  |  **Date:** [date]  |  **Status:** DRAFT / APPROVED

## Overview
[What this feature does and why]

## Approach
[The implementation strategy]

## Files to Touch
- `path/to/file.ts` — [what changes]
- `path/to/new-file.ts` — [what it contains]

## Data Shapes
\`\`\`typescript
// Input
// Output
\`\`\`

## Implementation Steps
1. [ ] Step one
2. [ ] Step two
...

## Edge Cases
- [Case]: [handling]

## Success Criteria
- [ ] [Measurable criterion]
- [ ] [Measurable criterion]

## Notes / Human Annotations
[This section accumulates during review]
```
```

---

## ENH-010 — Hooks Architecture: Determinism Injection System
**Target:** `11_PART_XI_DEVOPS.md` → New major section  
**Priority:** 🔴 Critical | **Complexity:** High

### Problem
Hooks are the most underused Claude Code capability. They are the mechanism by which you insert determinism into a non-deterministic AI workflow. The framework needs a complete hooks architecture guide.

### Draft Content to Insert

```
╔══════════════════════════════════════════════════════════════════════════════╗
║              HOOKS ARCHITECTURE — DETERMINISM INJECTION SYSTEM              ║
╚══════════════════════════════════════════════════════════════════════════════╝

PRINCIPLE: AI workflows are probabilistic. Hooks are deterministic.
           Use hooks to guarantee certain behaviors happen every time,
           regardless of what the AI decides.

Think of hooks as stitching a safety net into the fabric of your workflow —
they catch what the AI might miss.

────────────────────────────────────────────────────────────────────────────────

HOOK EVENT LIFECYCLE

  ┌─────────────────────────────────────────────────────────────────────────┐
  │                      CLAUDE CODE SESSION LIFECYCLE                      │
  │                                                                         │
  │  Session Start                                                          │
  │       │                                                                 │
  │       ▼                                                                 │
  │  [PreSessionHook] → load context, check git status, verify deps        │
  │       │                                                                 │
  │       ▼                                                                 │
  │  User Prompt Received                                                   │
  │       │                                                                 │
  │       ▼                                                                 │
  │  [PreToolUseHook] → validate before Claude uses a tool                 │
  │       │                                                                 │
  │       ▼                                                                 │
  │  Claude Executes Tool (bash, file write, etc.)                          │
  │       │                                                                 │
  │       ▼                                                                 │
  │  [PostToolUseHook] → verify output, run checks                         │
  │       │                                                                 │
  │       ▼                                                                 │
  │  Claude Prepares Response                                               │
  │       │                                                                 │
  │       ▼                                                                 │
  │  [StopHook] → ← THE MOST IMPORTANT HOOK                                │
  │       │         Fires every time Claude stops responding                │
  │       │         Use to: run tests, lint, enforce quality gates          │
  │       ▼                                                                 │
  │  [SessionEndHook] → commit work, update docs, clean up                 │
  └─────────────────────────────────────────────────────────────────────────┘

────────────────────────────────────────────────────────────────────────────────

THE STOP HOOK — START HERE

The Stop Hook fires every time Claude finishes a response. This is the single
highest-leverage hook to implement first.

WHAT IT ENABLES:
  → Claude never moves forward with broken code
  → Tests run automatically after every change
  → Quality gates are enforced without you watching

EXAMPLE STOP HOOK:
```bash
#!/bin/bash
# .claude/hooks/stop.sh
# Runs after every Claude response

# Only run checks if files were modified
if git diff --quiet HEAD; then
  exit 0  # No changes, nothing to check
fi

echo "🔍 Running quality gates..."

# Type check
if ! npx tsc --noEmit 2>&1; then
  echo "❌ TypeScript errors detected — Claude must fix before continuing"
  exit 1
fi

# Run affected tests
if ! npm test --passWithNoTests 2>&1; then
  echo "❌ Tests failing — Claude must fix before continuing"
  exit 1
fi

# Lint check
if ! npm run lint 2>&1; then
  echo "❌ Lint errors — Claude must fix before continuing"
  exit 1
fi

echo "✅ All quality gates passed"
exit 0
```

REGISTER IN .claude/settings.json:
```json
{
  "hooks": {
    "stop": ".claude/hooks/stop.sh"
  }
}
```

────────────────────────────────────────────────────────────────────────────────

RECOMMENDED HOOK SUITE (in implementation priority order)

1. STOP HOOK (implement first)
   Purpose: Run tests/lint after every Claude response
   Impact: Single highest-leverage hook, dramatically improves reliability

2. PRE-FILE-WRITE HOOK
   Purpose: Prevent Claude from writing to protected files
   Example: Prevent modification of .env, migrations already run, config files
   ```bash
   PROTECTED=(".env" ".env.production" "migrations/")
   # check if target file matches protected list, exit 1 if so
   ```

3. POST-BASH HOOK  
   Purpose: Log all bash commands for auditability
   Example: Append every command to .claude/audit.log with timestamp

4. SESSION-END HOOK
   Purpose: Auto-commit work, update CHANGELOG, close issues
   Example:
   ```bash
   # Auto-commit if there are uncommitted changes
   git add -A
   git commit -m "wip: session auto-commit [$(date)]" || true
   # Update changelog entry
   ```

5. KIRO-STYLE EVENT HOOKS (advanced)
   Inspired by Kiro IDE's spec-driven development model.
   Hooks respond to domain events, not just lifecycle events:
   ```json
   {
     "hooks": {
       "onFileCreated:src/**/*.ts": ".claude/hooks/new-component.sh",
       "onTestsFailing": ".claude/hooks/debug-mode.sh",
       "onPRCreated": ".claude/hooks/notify-team.sh"
     }
   }
   ```

────────────────────────────────────────────────────────────────────────────────

HOOKERY PLUGIN

The Hookery plugin from Anthropic makes it easy to browse, install, and 
customize hooks without writing bash from scratch.

Install: /plugin install hookery
Browse: /hooks

Recommended pre-built hooks from Hookery:
  • test-runner — runs your test suite after every response
  • git-guardian — prevents commits to protected branches  
  • context-watchdog — alerts when context exceeds 70%
  • doc-updater — prompts to update docs after feature completion

────────────────────────────────────────────────────────────────────────────────

QUALITY GATE: HOOKS CHECKLIST

  □ Stop hook implemented and tested
  □ Stop hook committed to git (so team shares it)
  □ Protected files list defined in pre-write hook
  □ Audit log configured for compliance-sensitive projects
  □ Hooks documented in claude.md so Claude knows they exist
```

---

## ENH-011 — Planner/Worker/Judge Hierarchy Pattern
**Target:** `04_PART_IV_AI_ORCHESTRATION.md` → New sub-section in Agent Composition  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
PLANNER / WORKER / JUDGE HIERARCHY
──────────────────────────────────────────────────────────────────────────────

Adapted from the Cursor FastRender architecture and now standard in production
multi-agent systems as of Q1 2026.

PROBLEM: A single agent trying to plan, execute, and verify simultaneously
         produces lower quality than specialized agents in distinct roles.

SOLUTION: Decompose work across three agent types with distinct responsibilities.

  ┌─────────────────────────────────────────────────────────────────────────┐
  │                        THREE-TIER AGENT HIERARCHY                       │
  │                                                                         │
  │  ┌──────────────┐                                                       │
  │  │   PLANNER    │  ← Orchestrates. Has full context. Makes decisions.   │
  │  │  (Opus 4.6)  │  → Receives task → creates plan → delegates units    │
  │  └──────┬───────┘                                                       │
  │         │ delegates work units                                          │
  │         ▼                                                               │
  │  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐               │
  │  │   WORKER A   │   │   WORKER B   │   │   WORKER C   │               │
  │  │  (Sonnet)    │   │  (Sonnet)    │   │  (Sonnet)    │               │
  │  │  Frontend    │   │  Backend     │   │  Tests       │               │
  │  └──────┬───────┘   └──────┬───────┘   └──────┬───────┘               │
  │         └──────────────────┴──────────────────┘                       │
  │                             │ results                                  │
  │                             ▼                                          │
  │                      ┌──────────────┐                                  │
  │                      │    JUDGE     │  ← Verifies quality. Strict.    │
  │                      │  (Opus 4.6) │  → Accept, request revision,     │
  │                      │             │    or escalate to human           │
  │                      └─────────────┘                                   │
  └─────────────────────────────────────────────────────────────────────────┘

IMPLEMENTATION IN CLAUDE CODE:
  → Planner: Your main orchestrator session (use Opus for highest-quality planning)
  → Workers: Parallel sub-agents or worktree sessions (Sonnet for cost efficiency)
  → Judge: A review sub-agent with a strict system prompt, or your stop hook

JUDGE SYSTEM PROMPT TEMPLATE:
  "You are a code reviewer with high standards. Review the following work against
   these criteria: [success criteria from plan.md]. Your only valid responses are:
   APPROVE / REQUEST_REVISION: [specific changes needed] / ESCALATE: [reason]
   Do not suggest. Do not soften. Be precise."

WHEN TO USE THIS PATTERN:
  ✓ Features with clear separation between frontend/backend/tests
  ✓ Large refactors that touch many files
  ✓ Any work where quality matters more than speed

WHEN NOT TO USE:
  ✗ Simple bug fixes
  ✗ Tasks requiring continuous human taste judgment
  ✗ Prototypes where iteration speed > quality
```

---

## ENH-012 — Parallel Agent Orchestration
**Target:** `04_PART_IV_AI_ORCHESTRATION.md` → Major expansion of existing multi-agent section  
**Priority:** 🔴 Critical | **Complexity:** High

### Draft Content to Insert

```
╔══════════════════════════════════════════════════════════════════════════════╗
║              PARALLEL AGENT ORCHESTRATION — COMPLETE PLAYBOOK               ║
╚══════════════════════════════════════════════════════════════════════════════╝

CAPABILITY: Multi-Claude + Git Worktrees = a week of features in hours.
STATUS: Table stakes as of February 2026. All major AI tools now ship this.
NS RECOMMENDATION: Start with 2-3 agents, scale as you get comfortable.

────────────────────────────────────────────────────────────────────────────────

GIT WORKTREES — THE ISOLATION PRIMITIVE

Git worktrees let you have multiple working copies of the same repo, each on
a different branch, sharing the same git history. This is how you run multiple
Claude sessions safely without collision.

BUILT-IN SUPPORT:
  claude --worktree        # Creates new worktree automatically
  claude -w                # Shorthand

WHAT HAPPENS:
  → New directory: .claude/worktrees/<branch-name>/
  → Fresh branch off current HEAD
  → Isolated file state (changes in worktree don't affect main checkout)
  → Each Claude session only sees its own worktree

DESKTOP APP METHOD:
  → New Session → check "Use worktree" option
  → App manages worktree creation, monitoring, and cleanup

────────────────────────────────────────────────────────────────────────────────

MULTI-CLAUDE ORCHESTRATION PLAYBOOK

  STEP 1: DECOMPOSE
    Identify which features/tasks are truly independent (no shared files)
    
    ✓ Feature A modifies: src/auth/, tests/auth/
    ✓ Feature B modifies: src/payments/, tests/payments/
    ✓ Feature C modifies: src/notifications/, tests/notifications/
    ✗ Feature D requires Feature A to complete first → sequential, not parallel

  STEP 2: BRIEF EACH AGENT
    Each agent needs a complete brief before starting. Template:
    
    "You are working on [Feature Name] in your isolated worktree.
     Issue: #[number] — read it via GitHub CLI before starting.
     Files you own: [list]
     Files you must NOT touch: [list]
     Success criteria: [measurable criteria from plan.md]
     When done: run tests, then 'gh pr create --title "[title]" --body "[body]'"
     Use RPIT loop. Start with plan.md before any code."

  STEP 3: LAUNCH
    # Terminal approach
    claude -w  # Session 1: Feature A
    claude -w  # Session 2: Feature B (in new terminal tab)
    claude -w  # Session 3: Feature C (in new terminal tab)
    
    # Desktop App approach
    New Session → worktree ✓ → brief Feature A
    New Session → worktree ✓ → brief Feature B
    New Session → worktree ✓ → brief Feature C

  STEP 4: MONITOR
    → Check Desktop App sidebar for session status
    → Each session shows current task and context %
    → Sessions can run overnight; check PRs in the morning

  STEP 5: REVIEW AND MERGE
    → Review each PR independently
    → Merge in dependency order (if any)
    → Delete worktrees after merge: git worktree remove <path>

────────────────────────────────────────────────────────────────────────────────

ANTI-PATTERNS TO AVOID

  ❌ Shared file ownership between parallel agents
     → Two agents editing the same file = merge conflicts

  ❌ Launching too many agents before establishing test suites
     → Without tests, you can't verify each agent's work independently

  ❌ No success criteria per agent
     → Agents without clear success criteria wander

  ❌ Not using worktrees
     → Two sessions on the same branch will corrupt each other

────────────────────────────────────────────────────────────────────────────────

CONTEXT: WHERE THIS SITS IN YOUR WORKFLOW

  SINGLE FEATURE:     1 Claude + RPIT Loop
  MULTIPLE FEATURES:  Multi-Claude + Worktrees + RPIT per agent
  COMPLEX FEATURE:    Planner/Worker/Judge hierarchy (ENH-011)
  OVERNIGHT BUILDS:   Multi-Claude + RALPH Loop + GitHub Action
```

---

## ENH-013 — Agent Teams Pattern
**Target:** `04_PART_IV_AI_ORCHESTRATION.md` → After parallel agent section  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
AGENT TEAMS — COORDINATED SPECIALIZED ROLES
──────────────────────────────────────────────────────────────────────────────

DISTINCTION: Agent Teams ≠ Multi-Clouding

  Multi-Clouding: Parallel agents working on DIFFERENT features independently
  Agent Teams:    Coordinated agents working on the SAME feature together

Agent Teams is Claude Code's newest capability. It splits complex work across
specialized instances that coordinate via a shared task list and messaging system.

IDEAL USE CASE: A large feature with clean role separation
  → Frontend Agent (owns: src/components/, src/pages/)
  → Backend Agent (owns: src/api/, src/services/, src/db/)
  → Testing Agent (owns: tests/, e2e/, writes tests for both other agents)

COORDINATION MECHANISM:
  → Shared task list (agents see each other's progress)
  → Messaging system (agents can request artifacts from each other)
  → Optional: worktree isolation per agent to prevent conflicts

SETUP:
  "Create an agent team for [feature]. Roles:
   - frontend-agent: implements UI components and pages
   - backend-agent: implements API endpoints and services
   - test-agent: writes tests for all code produced
   Each agent owns distinct files (see plan.md for file assignments).
   backend-agent completes API contracts before frontend-agent begins."

WORKTREE ISOLATION FOR TEAMS:
  By default, agent teammates share working directory → risk of conflicts.
  Add worktree isolation: each teammate gets its own repo copy.
  
  "Set up agent team with worktree isolation enabled."

WHEN TO USE VS. MULTI-CLOUDING:
  
  Use AGENT TEAMS when:
    ✓ Agents need to coordinate (frontend needs backend API contract)
    ✓ Work has clear role specialization within one feature
    ✓ You want built-in inter-agent communication
  
  Use MULTI-CLOUDING when:
    ✓ Features are truly independent (no coordination needed)
    ✓ You want maximum simplicity
    ✓ Features can be reviewed as isolated PRs
```

---

## ENH-014 — Repository Maps: Context-Efficient Codebase Navigation
**Target:** `08_PART_VIII_CODE_ARCHITECTURE.md` → New section: Codebase Intelligence  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
REPOSITORY MAPS — CONTEXT-EFFICIENT CODEBASE NAVIGATION
──────────────────────────────────────────────────────────────────────────────

PROBLEM: For large codebases, loading entire files into context is wasteful.
         Claude needs to know WHERE things are, not necessarily WHAT they contain.

SOLUTION: Repository maps — AST-based + PageRank-weighted codebase indexes
          that give Claude a navigational overview without loading full file content.

HOW IT WORKS:
  1. Parse codebase with tree-sitter (language-agnostic AST parser)
  2. Build a graph: files → functions → dependencies
  3. Apply PageRank to identify "important" symbols (frequently imported)
  4. Produce a compressed map: "what lives where and what uses what"

BENEFIT: Claude understands 100K+ line codebases in ~2K tokens of context

IMPLEMENTATION OPTIONS:

  Automatic (Claude Code built-in):
    Claude Code's Explore sub-agent (Haiku-powered) builds this automatically.
    Trigger explicitly:
    "Use the explore sub-agent to build an understanding of this codebase.
     Create architecture.md with a component map."

  Manual (aider-style repo map):
    ```bash
    pip install aider-chat
    aider --map-tokens 2048 --no-auto-commits
    # Generates repo-map.txt that can be included in claude.md
    ```

  Custom integration:
    ```typescript
    // tree-sitter based repo map generator
    import Parser from 'tree-sitter';
    
    // Extract all exported symbols and their locations
    // Build import graph
    // Apply importance scoring
    // Output: compact map for claude.md injection
    ```

NS FRAMEWORK RECOMMENDATION:
  1. Use Explore sub-agent for initial codebase orientation
  2. Commit architecture.md as living document (update via RPIT test phase)
  3. Link architecture.md from claude.md so it's always in context
  4. For very large codebases: use separate research session to build the map,
     then load the map (not full source) in implementation sessions
```

---

## ENH-015 — Kiro Spec-Driven Event Hooks Pattern
**Target:** `11_PART_XI_DEVOPS.md` → Alongside hooks architecture section  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
KIRO SPEC-DRIVEN DEVELOPMENT PATTERN
──────────────────────────────────────────────────────────────────────────────

Kiro is an AI-native IDE that popularized spec-driven development with
event-driven hooks. These patterns are now available in Claude Code workflows.

CORE CONCEPT: Instead of manually triggering agent actions, define SPECS that
              the agent follows, and HOOKS that fire on domain events.

THE SPEC FILE:
  A spec is a structured requirements document that Claude uses as its
  north star. It is MORE opinionated than a plan.md — it defines:
  - User stories
  - Acceptance criteria
  - Technical constraints
  - Design decisions
  
  Template: `.claude/specs/[feature-name].spec.md`
  
  ```markdown
  # Spec: User Authentication
  
  ## User Stories
  - As a user, I can log in with email/password
  - As a user, I stay logged in for 7 days
  - As a user, I can reset my password via email
  
  ## Acceptance Criteria
  - [ ] Login endpoint returns JWT on success
  - [ ] JWT contains userId, email, roles
  - [ ] Expired JWTs return 401, not 403
  - [ ] Password reset emails sent within 30 seconds
  
  ## Technical Constraints
  - Use existing auth middleware in /middleware/auth.ts
  - JWT secret from environment, never hardcoded
  - Passwords hashed with bcrypt, cost factor 12
  
  ## Out of Scope
  - OAuth (phase 2)
  - 2FA (phase 2)
  ```

EVENT-DRIVEN HOOKS PATTERN:
  Beyond lifecycle hooks, Kiro-style hooks respond to domain events.
  In Claude Code, these can be approximated with bash file watchers:
  
  ```bash
  # .claude/hooks/on-spec-approved.sh
  # Triggered when a spec file is moved to approved/
  
  SPEC_FILE=$1
  FEATURE_NAME=$(basename $SPEC_FILE .spec.md)
  
  echo "Spec approved for $FEATURE_NAME"
  echo "Starting RPIT loop..."
  claude --message "Work on spec: .claude/specs/approved/$SPEC_FILE. 
                    Follow the spec exactly. Use RPIT loop."
  ```

NS FRAMEWORK INTEGRATION:
  → Store specs in `.claude/specs/draft/` (under review)
  → Move to `.claude/specs/approved/` when reviewed and annotated
  → Hook fires on approval, automatically starting the RPIT loop
  → Completed features move spec to `.claude/specs/completed/`
  → This creates a full spec audit trail in git
```

---

## ENH-016 — The Feedback Loop: Retro Skill and Outer Improvement Loop
**Target:** `12_PART_XII_FUTURE_PROOFING.md` → Major new section  
**Priority:** 🔴 Critical | **Complexity:** High

### Draft Content to Insert

```
╔══════════════════════════════════════════════════════════════════════════════╗
║           THE FEEDBACK LOOP — OUTER IMPROVEMENT ARCHITECTURE                ║
╚══════════════════════════════════════════════════════════════════════════════╝

Most developers use AI as a tool. Power users use AI as a system that
improves itself. The Feedback Loop is how the North Star Framework compounds
over time — each build cycle makes the next one faster and higher quality.

TWO LOOPS:
  Inner Loop: RPIT (Research → Plan → Implement → Test) — per feature
  Outer Loop: RETRO (Reflect → Extract → Improve → Encode) — per milestone

────────────────────────────────────────────────────────────────────────────────

THE OUTER LOOP: RETRO PROTOCOL

Run after every feature completion OR at the end of every work session.

  PHASE 1: REFLECT
    "Review our session: git log --oneline -20, test results, and conversation
     history. Identify: What went well? What was slow? What went wrong?
     What did I have to correct more than once?"

  PHASE 2: EXTRACT
    "Extract concrete learnings from the reflection. Format as:
     - [PATTERN]: What Claude kept getting wrong
     - [FIX]: What instruction would prevent it
     - [TEMPLATE]: If a slash command would help, draft it
     - [SKILL]: If specialized knowledge is needed, draft a skill.md"

  PHASE 3: IMPROVE
    "Based on extracted learnings, suggest specific updates to:
     1. claude.md (rules Claude should always follow)
     2. Existing slash commands (improvements)
     3. New slash commands to create
     4. New skills to create"

  PHASE 4: ENCODE
    Human reviews suggestions and approves changes.
    Claude implements approved changes:
    - Updates claude.md
    - Creates/updates slash commands
    - Creates new skill files
    Commit: "chore: encode session learnings"

────────────────────────────────────────────────────────────────────────────────

THE RETRO SKILL

The retro skill automates the Outer Loop. Store in:
`.claude/skills/retro/SKILL.md`

```markdown
---
name: retro
description: >
  Run this skill after completing a feature or work session to reflect on
  what was learned and improve the development system. Triggers when user
  says "retro", "retrospective", "session review", or "what did we learn".
  Also run automatically at the end of RPIT loops when complete.
---

# Retro Skill

## Purpose
Capture learnings from this session and encode them into the development
system so future sessions benefit from this experience.

## Steps

1. GATHER CONTEXT
   - Run: git log --oneline -20
   - Run: cat test-results.txt (if exists)
   - Review the conversation history
   - Note any corrections the human made

2. REFLECT
   Generate a retro.md in /tmp/ with:
   - What went smoothly
   - What was slow or blocked
   - What patterns kept recurring
   - What the human had to correct

3. EXTRACT LEARNINGS
   For each pattern/problem, draft:
   - A rule for claude.md
   - A slash command if repetitive
   - A skill if specialized knowledge needed

4. PRESENT TO HUMAN
   Show proposed changes and ask for approval.
   Do NOT make changes without explicit approval.

5. ENCODE APPROVED CHANGES
   - Update claude.md with approved rules
   - Create any approved slash commands
   - Create any approved skill files
   - Commit with message: "chore: encode session learnings [date]"
```

────────────────────────────────────────────────────────────────────────────────

COMPOUND ENGINEERING PATTERN

The compound engineering plugin from Every.to formalizes this at a higher level.
Key commands:
  /re    — review session, extract learnings
  /compound — document patterns for future reuse

The Claudeception skill goes further: it watches what Claude does and
automatically extracts new skills from successful patterns, building a
skill library that grows with every session.

────────────────────────────────────────────────────────────────────────────────

THE RESULT: A SELF-IMPROVING SYSTEM

  Session 1: Claude makes 5 mistakes, you correct them
  Session 2: Retro runs, encodes fixes into claude.md
  Session 3: Claude doesn't make those 5 mistakes
  
  After 10 sessions: claude.md contains battle-tested rules
  After 20 sessions: You have 5+ custom skills for your domain
  After 30 sessions: Claude functions like a senior developer
                     who knows your codebase intimately

MEASUREMENT: Track "correction rate" — how many times per session you
             had to correct Claude. A well-tuned system should see this
             trend downward over time.
```

---

## ENH-017 — Context Compaction Recovery Protocol
**Target:** `03_PART_III_DOCUMENTATION.md` → New section: Context Management  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
CONTEXT COMPACTION RECOVERY PROTOCOL
──────────────────────────────────────────────────────────────────────────────

PROBLEM: Autocompaction (when Claude runs out of context and compresses the
         conversation) causes degraded results. Critical decisions, architectural
         context, and reasoning chains get lost.

RULE: Treat compaction as a session restart. Prevent it. When it happens, recover.

PREVENTION STRATEGY:
  1. Monitor context with /context command — know your % at a glance
  2. Customize status line to show context % always visible
  3. Use /clear liberally between distinct tasks (not just when stuck)
  4. Start new sessions for new tasks — don't stretch one session too long
  5. Aim to complete each RPIT loop within a single session

RECOVERY PROTOCOL (when compaction occurs):
  Step 1: Don't continue — compacted sessions compound errors
  
  Step 2: Start a fresh session
  
  Step 3: Load context from structured artifacts (not conversation):
    "We just had compaction. Reload context:
     1. Read claude.md
     2. Read plan.md for current feature
     3. Read git log --oneline -10
     4. Run the tests to see current state
     Tell me what you understand about where we were."
  
  Step 4: Verify Claude's understanding before continuing
    If Claude is missing context: have it read the relevant source files
    If Claude seems confused: re-brief explicitly
  
  Step 5: Continue from a clean state — don't try to "resume"

ARTIFACTS THAT SURVIVE COMPACTION:
  These are your continuity lifeline. Always keep them current:
  ✓ claude.md — project context
  ✓ plan.md — current feature plan with completed steps checked off
  ✓ architecture.md — system understanding
  ✓ git log — what actually happened
  ✓ test results — current pass/fail state

ANTI-PATTERN: Trying to summarize what happened to Claude after compaction.
              Always restore context from files, not conversation summaries.
              Files are ground truth. Conversation is ephemeral.

CONTEXT BUDGET GUIDELINES:
  ┌────────────────────────────────────────────────────────────────────────┐
  │  Context %  │  Action                                                  │
  ├────────────────────────────────────────────────────────────────────────┤
  │  0-50%      │  Normal operation                                        │
  │  50-70%     │  Finish current task, then /clear or new session         │
  │  70-85%     │  Finish current step ONLY, immediately start new session │
  │  85%+       │  STOP. New session NOW. Do not proceed.                  │
  └────────────────────────────────────────────────────────────────────────┘
```

---

## ENH-018 — claude.md as Living Document Protocol
**Target:** `01_PART_I_FOUNDATION.md` → Expand existing claude.md section  
**Priority:** 🟢 Medium | **Complexity:** Low

### Draft Content to Insert

```
CLAUDE.MD AS LIVING DOCUMENT — ITERATIVE IMPROVEMENT PROTOCOL
──────────────────────────────────────────────────────────────────────────────

Claude.md is not set-it-and-forget-it. It is a living document that should
improve with every session. The developers who get the best results treat
their claude.md as a codebase — it gets better through iteration.

CREATION: Use /init or "Create a claude.md. Use ask_user_question tool to
           interview me about the project before writing it."

SEVEN ESSENTIAL SECTIONS:
  1. Project Goals — what you're building and why
  2. Architecture Overview — key components and how they connect
  3. Design and Style Guides — UI patterns, naming conventions
  4. Constraints and Policies — what Claude must never do
  5. Repo and Git Etiquette — branch naming, commit style, PR format
  6. Frequently Used Commands — build, test, lint, deploy commands
  7. Testing Instructions — how to run tests, what coverage is required

LINKING PATTERN (keep claude.md concise):
  In claude.md: "For architecture details, see architecture.md"
  In claude.md: "For tech stack decisions, see docs/tech-stack.md"
  → Claude follows links when it needs deeper context
  → claude.md remains a fast-loading overview, not an encyclopedia

ITERATIVE IMPROVEMENT — THREE TRIGGERS:

  Trigger 1: After completing a feature
    Slash command: /update-claudemd
    "Review what we built. Update claude.md to reflect new components,
     commands, or patterns we established in this session."

  Trigger 2: When Claude repeats a mistake
    Immediately after correction: "Add a rule to claude.md that prevents
    this mistake: [describe what happened]."

  Trigger 3: After a retro session (ENH-016)
    Retro skill automatically suggests claude.md updates.
    Human approves → Claude implements.

EVOLUTION OVER PROJECT LIFETIME:
  Week 1:   Basic project overview, 20-30 lines
  Month 1:  Architecture documented, constraints captured, 50-80 lines
  Month 3:  Battle-tested rules, domain knowledge, links to docs, 80-120 lines
  Month 6+: Reference library. Claude functions as a senior team member.

WARNING: claude.md bloat is real. Periodically audit:
  "Review claude.md. Identify any rules that are outdated, redundant, or
   no longer apply. Propose pruning these sections."
```

---

## ENH-019 — Status Line Configuration
**Target:** `01_PART_I_FOUNDATION.md` → Add to practical setup section  
**Priority:** 🟢 Medium | **Complexity:** Low

### Draft Content to Insert

```
STATUS LINE CONFIGURATION — PROACTIVE SESSION MANAGEMENT
──────────────────────────────────────────────────────────────────────────────

The status line is the dashboard at the bottom of your Claude Code terminal.
Customize it once — it pays dividends every session.

RECOMMENDED STATUS LINE CONTENT:
  ✓ Git repo name — which project you're in
  ✓ Current branch — what feature you're on
  ✓ Context % used — critical for preventing autocompaction
  ✓ Active worktrees — how many parallel sessions exist

CONFIGURE:
  /statusline   → opens configuration
  
  Recommended format: "[repo] on [branch] | ctx: [context%] | worktrees: [count]"

WHY CONTEXT % MATTERS:
  Most developers only notice context is running out after compaction.
  Showing % always keeps it top of mind, enabling proactive management.

DESKTOP APP ALTERNATIVE:
  The Desktop App shows all active sessions in the sidebar, each with
  their progress state. For multi-agent work, this is preferable to
  the terminal status line.
```

---

---

# SECTION D: MASTER BUILD FRAMEWORK v2.1 NEW CATEGORIES

---

## ENH-020 — New Category 57: Agent Orchestration Frameworks
**Target:** `MBF_PART_2_DATA_AI.md` → After Category 35 (Agent Safety)  
**Priority:** 🔴 Critical | **Complexity:** High  
**Tier:** Tier 4 (AI & Agent Systems)

### Draft Content to Insert

```
## Category 57: Agent Orchestration Frameworks

### Scope
Multi-agent frameworks, visual agent builders, enterprise orchestration platforms,
swarm architectures, multi-model agent coordination.

### Technology Stack — Exhaustive

#### Enterprise Platforms
| Framework | Key Differentiator | Best For |
|-----------|-------------------|----------|
| **CrewAI AMP** | Visual editor + API, enterprise-grade, human-in-the-loop training | Enterprise teams, visual orchestration |
| **Google ADK** | Open-source, polyglot (Python/TS), deploys to Vertex AI Agent Engine | Google Cloud stacks, polyglot teams |
| **OpenAI Agents SDK** | Codex-1 (o3) reasoning, desktop command center for parallel agents | OpenAI-native stacks |
| **Strands Agent (AWS)** | Apache-licensed, swarm architectures, Bedrock integration | AWS-native, cloud-centric |
| **Agency Swarm** | Scalable MAS, simulation/visualization tools | Complex hierarchical agent systems |
| **LangGraph** | Graph-based state machines, stateful workflows | Complex branching logic |
| **AutoGen (Microsoft)** | Conversational agents, group chat, code execution | Research, prototyping |

#### Lightweight / Open Source
| Framework | Stars | Key Differentiator |
|-----------|-------|-------------------|
| **OpenCode** | 95K+ | Open-source Claude Code alternative, multi-LLM |
| **Cline** | 5M installs | BYOK, 80.8% SWE-bench with Opus 4.6 |
| **Aider** | High | Terminal-based, repo maps, 88% SWE-bench |
| **Agency Swarm** | Growing | Scalable, visualization |

#### Claude Code Native Orchestration
| Pattern | Implementation |
|---------|---------------|
| **Multi-Claude + Worktrees** | Built-in (`claude --worktree`) |
| **Agent Teams** | Built-in (specialized role coordination) |
| **Parallel Sub-Agents** | Built-in task sub-agent |
| **RALPH Loop** | Ralph Loop plugin from Anthropic |

### Selection Matrix
| Need | Recommended |
|------|-------------|
| Claude Code power user, multi-feature | Multi-Claude + Worktrees (built-in) |
| Enterprise, visual management | CrewAI AMP |
| Google Cloud native | Google ADK |
| AWS native | Strands Agent |
| Open-source maximum flexibility | OpenCode or Aider |
| Complex stateful workflows | LangGraph |

### Quality Gates
```
□ Agent isolation strategy defined (worktrees, containers, or sandboxes)
□ Success criteria defined per agent before launch
□ Human review points specified in orchestration plan
□ Failure modes documented (what happens if agent gets stuck)
□ Cost estimation done (parallel agents multiply token usage)
□ Merge/integration strategy defined for parallel work
```

### Benchmarks (March 2026)
| System | SWE-bench Verified |
|--------|-------------------|
| GPT-5 + Aider | 88% |
| Cline + Claude Opus 4.6 | 80.8% |
| Claude Code (native) | ~80% |
| Devin | 67% PR merge rate |

### Cross-Category Dependencies
- → Category 31 (Agent Frameworks) — foundational patterns
- → Category 44 (Workflow Orchestration) — pipeline integration
- → Category 58 (AI-Native IDEs) — development environment
- → NS Part IV (AI Orchestration) — methodology
```

---

## ENH-021 — New Category 58: AI-Native IDEs & Coding Agents
**Target:** `MBF_PART_1_CORE.md` → After Category 14 (Platform Engineering)  
**Priority:** 🔴 Critical | **Complexity:** High  
**Tier:** Tier 2 (Compute & Infrastructure)

### Draft Content to Insert

```
## Category 58: AI-Native IDEs & Coding Agents

### Scope
Purpose-built AI coding environments, terminal agents, spec-driven IDEs,
agent client protocols, IDE-agnostic coding agents.

### Technology Stack — Exhaustive

#### Terminal-Based Agents
| Tool | Key Differentiator | Monthly Cost |
|------|-------------------|-------------|
| **Claude Code** | NS Framework native, hooks, skills, plugins, worktrees | $20-200/mo |
| **Cline** | BYOK, 80.8% SWE-bench, VS Code extension, 5M installs | Free + API |
| **OpenCode** | Open-source, multi-LLM, Go-based TUI, 95K stars | Free + API |
| **Aider** | Repo maps, architect mode, 88% SWE-bench with GPT-5 | Free + API |

#### IDE Environments
| IDE | Key Differentiator | Price |
|-----|-------------------|-------|
| **Cursor** | FastRender planner/worker/judge, Claude + GPT-5 | $20/mo |
| **Windsurf** | SWE-grep RL-trained search, $15/mo value play | $15/mo |
| **Kiro (Amazon)** | Spec-driven development, event-driven hooks | TBD |
| **Zed + ACP** | Rust/GPU editor, Agent Client Protocol, open standard | $10/mo |
| **Google Antigravity** | Multi-agent visual dashboard, Gemini 3 Pro + Claude | Preview |

#### Agent Client Protocol (ACP) — Open Standard
| Aspect | Detail |
|--------|--------|
| Created by | Zed Industries |
| Purpose | Standard for plugging external agents into any IDE |
| Status | Open standard, growing adoption Feb 2026 |
| Benefit | Write an agent once, use in any ACP-compatible IDE |

### Selection Decision Tree
```
Do you use Claude Code as primary agent? YES → Enhance with skills/plugins
Need open-source, BYOK flexibility?    YES → OpenCode or Cline
Need spec-driven workflow natively?    YES → Kiro
Need GPU-accelerated Rust editor?      YES → Zed + ACP
Need enterprise multi-agent dashboard? YES → Google Antigravity
Want maximum SWE-bench performance?    YES → Aider with Opus 4.6
```

### Quality Gates
```
□ Agent is connected to your test runner
□ Hooks configured (at minimum: stop hook)
□ Permissions pre-configured and committed to git
□ claude.md or equivalent context file populated
□ Repository map available for large codebases
```

### Cross-Category Dependencies
- → Category 57 (Agent Orchestration) — for multi-agent coordination
- → Category 43 (CI/CD) — for automated validation
- → NS Part I (RPIT Loop) — feature development methodology
```

---

## ENH-022 — New Category 59: Prompt Orchestration & Evaluation
**Target:** `MBF_PART_2_DATA_AI.md` → After Category 35 or new Tier 4 addition  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
## Category 59: Prompt Orchestration & Evaluation

### Scope
Prompt versioning, A/B testing for prompts, LLM evaluation pipelines,
production prompt management, regression testing for AI behavior.

### Technology Stack — Exhaustive

#### Prompt Management Platforms
| Tool | Key Differentiator | Best For |
|------|-------------------|----------|
| **Vellum AI** | Prompt versioning + evaluation + controlled deployment | Production LLM deployments |
| **PromptLayer** | Observability, A/B testing, cost tracking | Teams iterating on prompts |
| **LangSmith** | LangChain-native, tracing, evaluation datasets | LangChain stacks |
| **Weave (W&B)** | ML-native, experiment tracking for prompts | ML teams |
| **Helicone** | Lightweight observability, caching, cost management | Cost-conscious teams |

#### Evaluation Frameworks
| Tool | Purpose |
|------|---------|
| **RAGAS** | RAG pipeline evaluation |
| **DeepEval** | Unit tests for LLM outputs |
| **Promptfoo** | CLI-based prompt testing, red-teaming |
| **Inspect (UK AISI)** | Safety-focused evaluation |

### Why This Category Matters (March 2026)
  Prompt regressions are the silent killer of production AI apps.
  A model update, a prompt change, or a new edge case can silently
  degrade quality without anyone noticing for days.
  
  Treat prompts as code. Version them. Test them. Deploy them carefully.

### Production Prompt Management Pattern
```
DEV (prompt draft)
  → STAGING (evaluation against test dataset: 50-200 examples)
  → CANARY (5% of production traffic)
  → PRODUCTION (full rollout with monitoring)
```

### Quality Gates
```
□ Prompts versioned in git or dedicated prompt management system
□ Evaluation dataset created (min 50 representative examples)
□ Automated regression test runs on every prompt change
□ Cost per prompt tracked and budgeted
□ Latency p95 monitored
□ Rollback procedure documented
```

### Cross-Category Dependencies
- → Category 33 (LLM Providers) — models being prompted
- → Category 35 (AI Safety) — safety evaluation
- → Category 47 (Testing) — evaluation methodology
- → Category 55 (Monitoring) — production observability
```

---

## ENH-023 — New Category 60: Life OS Agents (OpenClaw Ecosystem)
**Target:** `MBF_PART_4_FOUNDATION.md` → New section in Addendum  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert

```
## Category 60: Life OS Agents

### Scope
Always-on personal AI agents, messaging-app-connected automation,
autonomous task management, local-first AI assistants.

### What This Category Is
Life OS Agents are a distinct category from coding agents. They are:
- Always running (daemon processes)
- Connected to messaging apps (WhatsApp, Telegram, Slack, Discord)
- Model-agnostic (connect to any LLM)
- Optimized for non-developer tasks (scheduling, research, inbox management)

They complement coding agents like Claude Code — they are the DISPATCH LAYER,
while Claude Code is the EXECUTION LAYER.

### Technology Stack

#### Leading Platforms
| Tool | Stars | Key Differentiator | Status |
|------|-------|-------------------|--------|
| **OpenClaw** | 199K+ | Original, messaging-native, 5,700+ community skills, ClawHub | OpenAI-backed foundation |
| **NanoClaw** | Growing | Minimal OpenClaw (Raspberry Pi-compatible), ~80% features | Open-source |
| **Nanobot (HKU)** | 26,800 | 4,000 lines Python, readable codebase, learning platform | Open-source |
| **memU** | Growing | Memory-first, anticipatory, secretary model | Commercial |

#### OpenClaw Architecture
```
┌─────────────────────────────────────────────────────────────────────┐
│                        OPENCLAW STACK                               │
│                                                                     │
│  Messaging Layer:  WhatsApp │ Telegram │ Slack │ Discord │ iMessage │
│         │                                                           │
│         ▼                                                           │
│  OpenClaw Core: Message routing + Intent parsing + Memory          │
│         │                                                           │
│         ▼                                                           │
│  Skills Layer (ClawHub: 5,700+ skills):                            │
│    Spotify Control │ Grocery List │ Calendar │ Email │ Shell cmds  │
│         │                                                           │
│         ▼                                                           │
│  LLM Layer: Claude │ GPT-4o │ Gemini │ DeepSeek │ Ollama (local)  │
│         │                                                           │
│         ▼                                                           │
│  System Layer: File system │ Calendar │ Browser │ Smart Home       │
└─────────────────────────────────────────────────────────────────────┘
```

#### ClawHub vs NS Skills Architecture
| Aspect | ClawHub (OpenClaw) | NS Skills (.claude/skills/) |
|--------|-------------------|------------------------------|
| Discovery | Registry with 5,700+ skills | Progressive disclosure in session |
| Trigger | Keyword/intent matching | Description-based auto-discovery |
| Scope | Cross-app, always-on | Per-session, per-project |
| Best for | Life automation | Development workflows |

### High-Value Use Cases for Developers
1. **Async Claude Code triggers** — "Fix bug #47" from WhatsApp → OpenClaw → claude CLI → PR
2. **Multi-repo monitoring** — Morning summary of all open PR status
3. **Scheduled framework maintenance** — Weekly cron: run retro skill, update changelog
4. **Cross-platform context** — Meeting notes → OpenClaw → GitHub issue → Claude Code implements
5. **Development status updates** — Telegram notification when RALPH loop completes

### Security Considerations
```
⚠️  OpenClaw has FULL SYSTEM ACCESS by default. Scope carefully:
□ Run in Docker container with limited volume mounts
□ Never run as root
□ Whitelist only necessary directories
□ Audit installed skills before enabling
□ Use local LLM (Ollama) for sensitive/private data
□ Review OpenClaw's network traffic if concerned about data sovereignty
```

### Selection Guide
| Need | Recommendation |
|------|---------------|
| Maximum features + community skills | OpenClaw |
| Minimal, auditable, learning project | Nanobot |
| Raspberry Pi / low-resource device | NanoClaw |
| Privacy-first, no cloud | Nanobot + Ollama |
| Enterprise messaging integration | OpenClaw + Slack |

### Cross-Category Dependencies
- → Category 58 (AI-Native IDEs) — Claude Code as execution layer
- → Category 44 (Workflow Orchestration) — for automation pipelines
- → Category 31 (Agent Frameworks) — agent composition patterns
```

---

## ENH-024 — New Category 61: Enterprise Agent Governance
**Target:** `MBF_PART_4_FOUNDATION.md` → After Category 56 (Compliance)  
**Priority:** 🟡 High | **Complexity:** Medium  
**Tier:** Tier 8 (Security & Foundation)

### Draft Content to Insert

```
## Category 61: Enterprise Agent Governance

### Scope
Agent registries, guardrail systems, lifecycle management for AI agents,
audit trails for agent actions, enterprise oversight and control.

### Technology Stack

#### Enterprise Governance Platforms
| Tool | Key Differentiator | Best For |
|------|-------------------|----------|
| **ServiceNow AI Control Tower** | Governance for enterprise agents, workflow integration | ServiceNow shops |
| **Boomi AgentStudio** | Agent registry, guardrails, MCP support, lifecycle management | Boomi integration platform users |
| **LogicMonitor Edwin** | Enterprise monitoring with agent integration | Infrastructure-heavy enterprises |
| **Anthropic's Claude Trust Layer** | Built-in for Claude Code enterprise, constitutional AI | Claude-native stacks |

#### Governance Primitives
| Primitive | Purpose | Implementation |
|-----------|---------|---------------|
| Agent Registry | Catalog of all deployed agents | Boomi AgentStudio / custom |
| Guardrails | Pre/post filters on agent actions | Built-in hooks + LLM guard |
| Audit Trails | Complete log of agent actions | PostBash hooks → SIEM |
| Human Escalation | When agents must stop and ask | Confidence calibration gates |
| Cost Controls | Budget limits per agent/project | API quota management |
| Rollback Protocol | Undo agent changes | Git checkpoints + permissions |

### NS Framework Governance Model

For NS Framework projects, governance is built via:

1. PERMISSIONS (see ENH-003)
   Pre-configured, committed to git, reviewed by team

2. HOOKS AUDIT TRAIL
   ```bash
   # .claude/hooks/post-bash.sh
   echo "[$(date)] $(whoami) executed: $COMMAND" >> .claude/audit.log
   ```

3. HUMAN GATES (confidence calibration)
   Built into NS Foundation — agent stops and asks at specified uncertainty thresholds

4. CHECKPOINT PROTOCOL
   Every prompt creates a checkpoint. Use /rewind for instant rollback.
   For production: every agent action creates a git commit (atomic rollback).

5. PR-GATED DEPLOYMENT
   No agent work reaches production without human PR review.
   This is the enterprise-grade NS standard regardless of agent autonomy level.

### Quality Gates
```
□ Agent registry exists (even if just a README listing deployed agents)
□ All agent permissions documented and committed to version control
□ Audit log configured for all bash commands
□ Human escalation paths defined for each agent type
□ Cost monitoring alerts configured
□ Rollback procedure tested and documented
□ Compliance review: does agent have access to PII? If yes, data handling policy documented
```

### Cross-Category Dependencies
- → Category 52 (Security) — access control and audit
- → Category 56 (Compliance) — regulatory requirements
- → Category 55 (Monitoring) — agent observability
- → NS Part X (Security) — security-first development
```

---

## ENH-025 — Category 44 Expansion: Data Pipeline + HITL
**Target:** `MBF_PART_3_CONTENT_OPS.md` → Category 44 (Workflow Orchestration)  
**Priority:** 🟡 High | **Complexity:** Medium

### Add to existing Category 44:

```
#### Data Pipeline Orchestration (with HITL Patterns)

| Tool | Key Differentiator | HITL Support |
|------|-------------------|-------------|
| **Prefect** | Python-native, intelligent LLM retries, HITL workflows | ✓ Native |
| **Dagster** | Asset-based, observable, type-safe pipelines | ✓ Via sensors |
| **Airflow** | Mature, massive ecosystem, XML-heavy | Limited |
| **Temporal** | Durable execution, language-agnostic | ✓ Activities |

#### Prefect HITL Pattern (LLM Validation)
```python
from prefect import flow, task
from prefect.input import RunInput

@task
def process_with_llm(data: dict) -> dict:
    # LLM processing step
    result = claude_api.process(data)
    confidence = result.confidence_score
    
    if confidence < 0.85:
        raise Exception("Low confidence — needs human review")
    
    return result

@flow
def data_pipeline_with_hitl(data: list):
    results = []
    for item in data:
        try:
            result = process_with_llm(item)
            results.append(result)
        except Exception as e:
            # HITL gate: pause and wait for human input
            human_input = RunInput.receive(
                prompt=f"Low confidence on: {item}\nProvide correction or approve:",
                timeout=3600  # 1 hour timeout
            )
            results.append(human_input.value)
    
    return results
```

#### NS Framework Recommendation
For AI pipelines with validation requirements:
→ Prefect for Python-native AI teams (best LLM integration)
→ Dagster for data-intensive, asset-tracked pipelines
→ Temporal for long-running durable workflows (days/weeks)
```

---

## ENH-026 — Category 29 Expansion: Context Management Systems
**Target:** `MBF_PART_2_DATA_AI.md` → Category 29 (Agent Memory)  
**Priority:** 🟢 Medium | **Complexity:** Low

### Add to existing Category 29:

```
#### Context Management Systems

Beyond memory stores, modern agent frameworks need active context management:

| Pattern | Tool/Approach | Use Case |
|---------|--------------|----------|
| **Repo Maps** | tree-sitter + PageRank | Large codebase navigation |
| **Context Compaction** | /clear, session management | Prevent context degradation |
| **Progressive Disclosure** | Skills architecture | Load knowledge on demand |
| **Structured Handoffs** | plan.md + session artifacts | Cross-session continuity |
| **Context Budgets** | Context % monitoring | Proactive management |

#### Repo Map Generation
```bash
# Install aider for repo map generation
pip install aider-chat

# Generate repo map (can be added to claude.md or BRIDGE context)
aider --map-tokens 2048 --show-repo-map > docs/repo-map.txt
```

#### Context Efficiency Rules
1. Never load both NSB and MBF simultaneously (BRIDGE handles routing)
2. Link to files instead of embedding content in claude.md
3. Use skills for specialized knowledge (loaded on demand)
4. Clear context between distinct tasks, not just when stuck
5. Keep plan.md updated so it serves as session state
```

---

## ENH-027 — Benchmark Matrix Update
**Target:** `MBF_PART_1_CORE.md` → Framework Overview / Model Matrix section  
**Priority:** 🟢 Medium | **Complexity:** Low

### Update model/benchmark matrix:

```
CODING AGENT BENCHMARKS — MARCH 2026
──────────────────────────────────────────────────────────────────────────────

SWE-bench Verified (% of real GitHub issues resolved autonomously)
  GPT-5 + Aider:          88.0% 
  Cline + Claude Opus 4.6: 80.8%
  Claude Code (native):    ~80%
  GPT-4o + Cursor:         ~75%
  Devin:                   67% PR merge rate on defined tasks

Terminal-Bench 2.0
  GPT-5.3:                 77.3%

Real-World Production Metrics
  Claude Code at Anthropic: ~90% of Claude Code's own code is written by Claude Code
  Devin (enterprise):       67% PR merge rate on clearly scoped tasks
  Nubank (multi-agent):     12x efficiency on multi-million LOC ETL migration

Model Recommendation Matrix (NS Framework)
  ┌─────────────────────────────────────────────────────────────────────┐
  │  Task Type                    │  Recommended Model                  │
  ├─────────────────────────────────────────────────────────────────────┤
  │  Complex planning & design    │  Opus 4.6 (high effort mode)        │
  │  Standard feature development │  Sonnet 4.6 (default, cost balance) │
  │  Rapid codebase exploration   │  Haiku (via Explore sub-agent)      │
  │  Research reports             │  Sonnet 4.6 or Opus 4.6            │
  │  Parallel worker agents       │  Sonnet 4.6 (cost efficiency)       │
  │  Planner/Judge roles          │  Opus 4.6 (quality critical)        │
  └─────────────────────────────────────────────────────────────────────┘
```

---

---

# SECTION E: SKILLS PACKAGE v6.1 ENHANCEMENTS

---

## ENH-028 — New Skill: retro-skill.md
**Target:** `.claude/skills/retro/SKILL.md` (new file)  
**Priority:** 🔴 Critical | **Complexity:** High

### Full Skill Content

```markdown
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
```

---

## ENH-029 — New Skill: parallel-agent-orchestration.md
**Target:** `.claude/skills/parallel-agent/SKILL.md` (new file)  
**Priority:** 🔴 Critical | **Complexity:** High

### Full Skill Content

```markdown
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
```

---

## ENH-030 — New Skill: research-report.md
**Target:** `.claude/skills/research-report/SKILL.md` (new file)  
**Priority:** 🟡 High | **Complexity:** Medium

### Full Skill Content

```markdown
---
name: research-report
version: 1.0
description: >
  Use when user needs a research report on a technology, API, architecture
  decision, or tool comparison before building. Triggers: "research",
  "research report", "which should I use", "compare X and Y", "what's the
  best way to", "before I build this", "API research", "technology decision".
---

# Research Report Skill

## Purpose
Generate a structured research report that informs implementation decisions.
Always output to a file — reports are persistent knowledge.

## Output File Location
`research/[topic-slug]-[YYYY-MM-DD].md`

## Report Template

```markdown
# Research Report: [Topic]
**Date:** [date] | **Author:** Claude | **For:** [project/feature]

## Executive Summary
[2-3 sentence answer to the core question]

## Options Evaluated
| Option | Pros | Cons | Best For |
|--------|------|------|----------|

## Recommendation
**[Recommended option]** because [reasoning].

## Implementation Notes
[Specific notes for THIS project's constraints]
[Gotchas discovered]
[Version-specific details]

## Code Examples
[Working examples for the recommended approach]

## References
[Links to docs, GitHub repos, benchmarks used]
```

## Execution Protocol
1. Use web search to find current documentation (not training data — APIs change)
2. Search for "[topic] pitfalls", "[topic] alternatives", "[topic] 2026"
3. Check GitHub for recent issues/PRs that might indicate problems
4. Tailor recommendations to the project's existing stack (read architecture.md)
5. Include a "What NOT to do" section based on research

## Quality Bar
A good research report saves more time than it takes.
If the research doesn't change the implementation approach, it still
validates the original direction — that has value too.
```

---

## ENH-031 — New Skill: plan-annotator.md
**Target:** `.claude/skills/plan-annotator/SKILL.md` (new file)  
**Priority:** 🟡 High | **Complexity:** Medium

### Full Skill Content

```markdown
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
```

---

## ENH-032 — Skill-Builder Meta-Integration
**Target:** `NORTH_STAR_BOOTSTRAP.md` + NS Part I + Skills README  
**Priority:** 🟡 High | **Complexity:** Medium

### Draft Content to Insert (in Bootstrap and NS Part I)

```
SKILL CREATION META-SYSTEM
──────────────────────────────────────────────────────────────────────────────

NS Framework ships with a skill-building infrastructure. Every project should
create domain-specific skills that encode accumulated knowledge.

THREE SKILL CREATION METHODS:

METHOD 1: SKILL-CREATOR SKILL (structured, guided)
  → Install: find in Anthropic's example skills plugin
  → Command: /skill-creator
  → Walk-through: name, triggers, purpose, content
  → Best for: intentional skill creation after a retro session

METHOD 2: CLAUDECEPTION (automatic extraction)
  → Claude watches what works and extracts skills automatically
  → As you build, it identifies patterns worth encoding
  → Reviews: "I noticed we did X three times. Want me to create a skill?"
  → Best for: organic skill growth during active development

METHOD 3: MANUAL (from retro output)
  → Retro skill identifies needed skills (see ENH-028)
  → Human approves, Claude creates skeleton
  → Best for: encoding session learnings immediately

SKILL ANATOMY:
  .claude/skills/[skill-name]/
  ├── SKILL.md          (the skill itself — loaded on demand)
  ├── examples/         (reference examples for the skill to use)
  └── reference/        (additional reference files linked from SKILL.md)

CRITICAL: THE DESCRIPTION IS THE DISCOVERY MECHANISM
  If Claude doesn't use your skill automatically, the description needs work.
  
  Weak description: "Helps with authentication"
  Strong description: "Use when user asks about auth, login, JWT, session
                       management, OAuth, or says 'add authentication'.
                       Also triggers on: 'user registration', 'password reset',
                       'protected routes'. Contains [project]'s auth patterns."

TUNING SKILLS OVER TIME:
  If a skill isn't firing when it should:
  "Skill [name] didn't trigger when I said [X]. Update the description
   to include this scenario."
  
  If a skill fires too aggressively:
  "Skill [name] is loading when it shouldn't. Make the triggers more specific."
```

---

## ENH-033 — Update Existing Skill Descriptions for Better Auto-Discovery
**Target:** All existing skill SKILL.md files  
**Priority:** 🟢 Medium | **Complexity:** Low

### Changes Required

For each existing skill, audit and update the `description:` field to:
1. Start with "Use when..." not just a noun description
2. Include at least 5 specific trigger phrases
3. Mention what the skill contains (not just what it's for)
4. Include common synonyms and adjacent concepts

**Example upgrade pattern:**

```yaml
# BEFORE (weak)
description: "Frontend design skill for building UIs"

# AFTER (strong)
description: >
  Use when building any UI component, page, or interface. Triggers on:
  "design a UI", "build a component", "make it look good", "improve the design",
  "create a landing page", "style this", "make it beautiful", "fix the layout",
  "responsive design", "dark mode", "color scheme", "typography". Contains
  Anthropic's official frontend design principles, anti-patterns to avoid
  (purple gradients, generic layouts), and specific design direction framework.
  Always use this skill before writing any CSS or UI component code.
```

**Skills to audit and update:**
- frontend-design/SKILL.md
- docx/SKILL.md
- pdf/SKILL.md
- pptx/SKILL.md
- xlsx/SKILL.md
- (any project-specific skills)

---

---

# SECTION F: OPENCLAW INTEGRATION GUIDE

---

## ENH-034 — OpenClaw Integration Guide
**Target:** `BRIDGE.md` → New Addendum section at end  
**Priority:** 🔴 Critical | **Complexity:** High

### Full Addendum Draft

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║              OPENCLAW INTEGRATION GUIDE — NS FRAMEWORK ADDENDUM             ║
║                                                                              ║
║         Connecting the Life OS Layer to Your Development Stack              ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

## WHAT IS OPENCLAW?

OpenClaw is an open-source "Life OS" agent — a 24/7 personal AI assistant
that lives on your machine and connects to messaging apps you already use.

Created by Peter Steinberger (PSPDFKit founder) in Nov 2025. Reached 199K+
GitHub stars by Feb 2026. Creator joined OpenAI in Feb 2026. Now maintained
by an open-source foundation with OpenAI backing.

IMPORTANT DISTINCTION:
  OpenClaw ≠ Claude Code replacement
  OpenClaw = the DISPATCH LAYER that makes Claude Code hands-free

  Claude Code:  Coding agent. Lives in terminal. Does one thing excellently.
  OpenClaw:     Life OS. Lives in messaging apps. Does everything else.

────────────────────────────────────────────────────────────────────────────────

## THE NS FRAMEWORK + OPENCLAW ARCHITECTURE

```
                    YOUR PHONE OR MESSAGING APP
                           │
                    WhatsApp / Telegram / Slack
                           │
                    ┌──────▼──────────┐
                    │  OpenClaw       │
                    │  (always-on     │
                    │   daemon)       │
                    └──────┬──────────┘
                           │ Routes intent to action
                           │
              ┌────────────┼────────────┐
              │            │            │
        ┌─────▼────┐ ┌─────▼────┐ ┌───▼──────┐
        │ Claude   │ │ Calendar │ │ Email    │
        │ Code     │ │ /Notion  │ │ / Slack  │
        │ (RPIT)   │ │ (tasks)  │ │ (comms)  │
        └─────┬────┘ └──────────┘ └──────────┘
              │
        ┌─────▼────┐
        │ GitHub   │
        │ (PRs,    │
        │ Issues)  │
        └──────────┘
```

────────────────────────────────────────────────────────────────────────────────

## 5 HIGH-VALUE USE CASES FOR NS FRAMEWORK USERS

### USE CASE 1: Async Claude Code Triggering
Mobile-triggered development. Delegate without being at your desk.

  You send (WhatsApp): "Fix the bug in issue #47 and create a PR"
  OpenClaw executes:   claude --model sonnet "Work on GitHub issue #47.
                       Read it first. Use RPIT loop. When done, create PR."
  You receive:         "PR #83 created: Fix: resolved auth timeout bug in #47"

Setup:
  1. Create OpenClaw skill: dev-delegate
  2. Skill watches for: "fix", "implement", "work on", "build"
  3. Routes to: claude CLI with structured prompt
  4. Reports back: PR URL or error summary

### USE CASE 2: Multi-Repo Morning Briefing
Start every day knowing where all your projects stand.

  6:00 AM cron: OpenClaw runs briefing
  7:30 AM (you wake up and check Telegram):
    "DAILY BRIEFING:
     • project-alpha: 2 open PRs ready for review (#45, #46)
     • project-beta: Build failing on main (3 commits since fix)
     • project-gamma: 5 issues assigned to you, 2 due this week
     • Most urgent: project-beta build needs attention"

Setup:
  1. OpenClaw skill: morning-dev-briefing
  2. Runs at 6 AM via cron
  3. Uses GitHub CLI to fetch status across repos
  4. Formats and sends to your Telegram

### USE CASE 3: RALPH Loop Completion Notifications
Know when overnight builds complete without checking constantly.

  Night: You start RALPH loop on a complex refactor
  2:47 AM: RALPH completes successfully  
  Morning:  Telegram: "RALPH loop complete ✅
             52 iterations | 3 failures resolved
             Tests: 847/847 passing
             PR #91 created — ready for your review"

Setup:
  1. Add session-end hook to Claude Code that sends HTTP request
  2. OpenClaw skill receives webhook → formats → sends Telegram

### USE CASE 4: Spec-to-Issue Pipeline
Convert voice/text ideas into GitHub issues instantly.

  Sunday 9 PM (on couch): 
    WhatsApp: "we should add export to CSV on the data table, mobile-friendly,
               under 3 seconds, include filters"
  
  OpenClaw → Claude API:
    - Parses intent
    - Formats as GitHub issue with acceptance criteria
    - Creates: gh issue create --title "Feature: CSV export for data table"
               --body "[formatted spec]" --label "feature"
  
  Monday AM: Issue #52 waiting for you in GitHub

### USE CASE 5: Cross-Platform Context Bridge
Capture ideas wherever you are, automatically available in Claude Code.

  Meeting notes → OpenClaw → Creates .context/meeting-[date].md in repo
  When you start Claude Code: "There are new meeting notes from today,
                               shall I review them before we begin?"

────────────────────────────────────────────────────────────────────────────────

## SHOULD YOU USE OPENCLAW?

```
Do you frequently think of dev tasks away from your desk?    YES → worth trying
Are you running multi-day parallel agent workflows?          YES → high value
Do you want to delegate without opening terminal?            YES → good fit
Is your primary pain point coding quality, not delegation?   NO  → skip for now
Are you concerned about security/data privacy?               → read security section
Are you a team of 1 building solo?                          → medium value
```

────────────────────────────────────────────────────────────────────────────────

## SECURITY AND PRIVACY

OpenClaw has full system access by design. This is powerful and risky.

MINIMUM SECURITY SETUP:
  □ Run OpenClaw in Docker container with explicit volume mounts
  □ Create a dedicated user with minimal permissions
  □ Never run as root
  □ Whitelist only the directories it needs (your project repos, not /)
  □ Review each ClawHub skill source code before installing
  □ Use local LLM (Ollama + Kimi 2.5 or Llama 3.3) for anything sensitive
  □ Separate OpenClaw instance for work vs personal if mixing contexts

DATA SOVEREIGNTY OPTIONS:
  → Cloud models (Claude/GPT): your messages leave your machine
  → Local models (Ollama): completely offline, slower, comparable quality

────────────────────────────────────────────────────────────────────────────────

## GETTING STARTED

1. Install OpenClaw: github.com/OpenClaw-AI/OpenClaw
2. Connect one messaging app (start with Telegram — easiest setup)
3. Install one skill: dev-status (shows your GitHub notifications)
4. Verify it works before connecting to Claude Code automation
5. Add one automation: morning briefing (low risk, high value)
6. Then: async Claude Code triggering (higher risk — test thoroughly)

For the ClawHub skill registry: clawhu.b.io (5,700+ community skills)

────────────────────────────────────────────────────────────────────────────────

## SEE ALSO
- MBF Category 60: Life OS Agents (full technology matrix)
- ENH-002: Bootstrap async delegation bridge
- ENH-012: Parallel agent orchestration
- ENH-016: Feedback loop + RALPH completion notifications
```

---

---

# IMPLEMENTATION GUIDE

---

## SEQUENCING — RECOMMENDED EXECUTION ORDER

Execute enhancements in this order for maximum impact:

### SPRINT 1: Foundation (Highest ROI)
1. **ENH-008** — RPIT Loop into NS Part I (changes how every feature is built)
2. **ENH-009** — Plan.md Annotation into NS Part II (prevents wasted work)
3. **ENH-010** — Hooks Architecture into NS Part XI (determinism injection)
4. **ENH-016** — Feedback Loop / Retro Skill (compounds all improvements)

### SPRINT 2: Multi-Agent Core
5. **ENH-012** — Parallel Agent Orchestration (git worktrees playbook)
6. **ENH-001** — Bootstrap Multi-Agent Sequence
7. **ENH-011** — Planner/Worker/Judge hierarchy
8. **ENH-013** — Agent Teams pattern

### SPRINT 3: Skills Package
9. **ENH-028** — retro-skill.md
10. **ENH-029** — parallel-agent-orchestration.md
11. **ENH-030** — research-report.md
12. **ENH-031** — plan-annotator.md
13. **ENH-032** — Skill-builder meta-integration

### SPRINT 4: MBF New Categories
14. **ENH-020** — Category 57: Agent Orchestration Frameworks
15. **ENH-021** — Category 58: AI-Native IDEs
16. **ENH-022** — Category 59: Prompt Orchestration
17. **ENH-023** — Category 60: Life OS Agents
18. **ENH-024** — Category 61: Enterprise Agent Governance

### SPRINT 5: Infrastructure Updates
19. **ENH-005** — BRIDGE decision tree expansion
20. **ENH-006** — BRIDGE routing for new categories
21. **ENH-004** — Bootstrap fetch URL updates
22. **ENH-003** — Permission pre-configuration protocol
23. **ENH-007** — Boris Cherny parallel checkout pattern
24. **ENH-017** — Context compaction recovery protocol
25. **ENH-034** — OpenClaw Integration Guide addendum

### SPRINT 6: Polish
26. **ENH-014** — Repository maps (Code Architecture)
27. **ENH-015** — Kiro spec-driven patterns (DevOps)
28. **ENH-018** — claude.md living document protocol
29. **ENH-019** — Status line configuration
30. **ENH-025, 026, 027** — MBF expansions and benchmark updates
31. **ENH-033** — Skill description upgrades

---

## TARGET FILE MAP

| File to Update | Enhancements |
|----------------|-------------|
| `NORTH_STAR_BOOTSTRAP.md` → v1.4 | ENH-001, 002, 003, 004, 032 |
| `BRIDGE.md` → v1.2 | ENH-005, 006, 007, 034 |
| `01_PART_I_FOUNDATION.md` | ENH-008, 018, 019, 032 |
| `02_PART_II_PRIMITIVES.md` | ENH-009 |
| `03_PART_III_DOCUMENTATION.md` | ENH-017 |
| `04_PART_IV_AI_ORCHESTRATION.md` | ENH-011, 012, 013 |
| `08_PART_VIII_CODE_ARCHITECTURE.md` | ENH-014 |
| `11_PART_XI_DEVOPS.md` | ENH-010, 015 |
| `12_PART_XII_FUTURE_PROOFING.md` | ENH-016 |
| `MBF_PART_1_CORE.md` → v2.1 | ENH-021, 027 |
| `MBF_PART_2_DATA_AI.md` → v2.1 | ENH-020, 022, 025, 026 |
| `MBF_PART_3_CONTENT_OPS.md` → v2.1 | ENH-025 |
| `MBF_PART_4_FOUNDATION.md` → v2.1 | ENH-023, 024 |
| `.claude/skills/retro/SKILL.md` | ENH-028 (new file) |
| `.claude/skills/parallel-agent/SKILL.md` | ENH-029 (new file) |
| `.claude/skills/research-report/SKILL.md` | ENH-030 (new file) |
| `.claude/skills/plan-annotator/SKILL.md` | ENH-031 (new file) |
| `NS_SEGMENT_INDEX.md` | Update refs to v6.1 |
| `MBF_SEGMENT_INDEX.md` | Update refs to v2.1, add Cat 57-61 |

---

## COMPLEXITY BUDGET

| Priority | Count | Estimated Effort |
|----------|-------|-----------------|
| 🔴 Critical | 12 | ~3 focused sessions |
| 🟡 High | 14 | ~2 focused sessions |
| 🟢 Medium | 8 | ~1 focused session |
| **TOTAL** | **34** | **~6 sessions** |

---

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║  NS ENHANCEMENT PACKAGE v6.1 — COMPLETE                                     ║
║                                                                              ║
║  34 enhancements | 6 component upgrades | 4 new skills | 5 new MBF cats     ║
║                                                                              ║
║  "The framework evolves. The North Star holds."                              ║
║                                                                              ║
║  @NavigatingTruth | CC BY-NC-SA 4.0 | March 2026                           ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```
