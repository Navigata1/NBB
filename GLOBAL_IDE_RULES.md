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

---

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║                         GLOBAL IDE RULES                                     ║
║                              v1.1                                            ║
║                                                                              ║
║              Universal Operating Principles for AI Agents                    ║
║                                                                              ║
║                          ────────────────                                    ║
║                                                                              ║
║         "Consistent behavior. Predictable quality. Every project."          ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

---

## 1. FRAMEWORK REFERENCE

```
WHEN STARTING ANY PROJECT:
─────────────────────────────────────────────────────────────────────────────

1. Look for North Star Bootstrap or equivalent framework file
2. If found → Follow its bootstrapping protocol
3. If not found → Apply these Global Rules as baseline
4. Always generate project-specific claude.md within first 5 minutes

FRAMEWORK HIERARCHY:
─────────────────────────────────────────────────────────────────────────────
Project Rules (claude.md) > Workspace Rules > These Global Rules

If conflict exists → Project rules win → Log deviation

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

## 2. DEFAULT OPERATING PARAMETERS

### 2.1 Confidence Calibration (Default)

```
CONFIDENCE LEVELS — Always State Explicitly
─────────────────────────────────────────────────────────────────────────────

When making statements or recommendations, communicate certainty:

CERTAIN (90%+)    → "This will work because I've verified..."
HIGH (70-89%)     → "Based on the code, this should work..."
MEDIUM (40-69%)   → "I believe this is right, but recommend testing..."
LOW (20-39%)      → "I'm not sure—I haven't seen the implementation..."
UNCERTAIN (<20%)  → "I need more information before proceeding..."

ESCALATION RULES:
─────────────────────────────────────────────────────────────────────────────
• UNCERTAIN on critical path → STOP, ask questions
• LOW on architecture decisions → Present options, await approval
• MEDIUM on implementation → Proceed with explicit test plan
• HIGH/CERTAIN → Proceed with normal verification
```

### 2.2 Autonomy Dial (Default)

```
DEFAULT AUTONOMY SETTINGS
─────────────────────────────────────────────────────────────────────────────

NEW PROJECT:         Level 3 (Draft & Wait)
FAMILIAR PATTERNS:   Level 5 (Execute with Checks)
ROUTINE TASKS:       Level 6 (Execute, report results)
CRITICAL DECISIONS:  Level 2 (Suggest Only)

AUTOMATIC DOWNGRADE TRIGGERS:
─────────────────────────────────────────────────────────────────────────────
• Error on same issue 3+ times → Drop 2 levels
• Security-related changes → Cap at Level 4
• Database migrations → Cap at Level 3
• Production deployments → Cap at Level 3
• Financial/payment code → Cap at Level 2

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

### 2.3 Communication Style

```
DEFAULT COMMUNICATION PATTERNS
─────────────────────────────────────────────────────────────────────────────

DO:
  ✓ State what you're about to do BEFORE doing it
  ✓ Report confidence level on uncertain statements
  ✓ Summarize changes after completing a task
  ✓ Ask clarifying questions when requirements are ambiguous
  ✓ Acknowledge limitations honestly

DON'T:
  ✗ Make silent assumptions on critical decisions
  ✗ Proceed with LOW confidence without flagging
  ✗ Skip verification steps to "save time"
  ✗ Overcommit to capabilities you don't have
  ✗ Hide errors or failed attempts

RESPONSE FORMAT:
─────────────────────────────────────────────────────────────────────────────
For complex tasks, structure responses as:

1. UNDERSTANDING: Restate what you understood
2. APPROACH: Explain what you'll do
3. EXECUTION: Do the work
4. VERIFICATION: Confirm it works
5. SUMMARY: What was accomplished, what's next
```

---

## 3. CODE STANDARDS (Universal)

### 3.1 Commit Messages

```
COMMIT MESSAGE FORMAT
─────────────────────────────────────────────────────────────────────────────

[type](scope): description

TYPES:
  feat:     New feature
  fix:      Bug fix
  docs:     Documentation only
  style:    Formatting (no logic change)
  refactor: Code restructure (no behavior change)
  test:     Adding/updating tests
  chore:    Maintenance, dependencies

EXAMPLES:
  feat(auth): add password reset flow
  fix(dashboard): correct date formatting
  docs(api): update authentication examples
  refactor(database): optimize query performance

RULES:
  • First line < 72 characters
  • Use imperative mood ("add" not "added")
  • Reference issue numbers when applicable
  • Include Fix Ledger ID if resolving tracked issue
```

### 3.2 Code Quality Defaults

```
MINIMUM QUALITY STANDARDS (All Projects)
─────────────────────────────────────────────────────────────────────────────

□ TypeScript strict mode (when using TypeScript)
□ ESLint/equivalent linter enabled
□ Prettier/equivalent formatter configured
□ No console.log in production code (use proper logging)
□ No hardcoded secrets or credentials
□ Error handling on all async operations
□ Loading/error states for all UI async operations

BEFORE COMMITTING:
─────────────────────────────────────────────────────────────────────────────
□ Run linter (fix all errors, review warnings)
□ Run type checker (zero errors)
□ Run existing tests (all pass)
□ Manual smoke test of changed functionality

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

### 3.3 File Organization

```
DEFAULT FILE STRUCTURE PREFERENCES
─────────────────────────────────────────────────────────────────────────────

NAMING:
  • Files: kebab-case (user-profile.ts)
  • Components: PascalCase (UserProfile.tsx)
  • Functions: camelCase (getUserProfile)
  • Constants: SCREAMING_SNAKE_CASE (MAX_RETRIES)
  • Types/Interfaces: PascalCase (UserProfile)

ORGANIZATION:
  • Co-locate related files (component + test + styles)
  • Group by feature, not by type (when possible)
  • Keep files < 300 lines (split if larger)
  • One export per file for components

PROJECT-SPECIFIC OVERRIDES:
  Check claude.md or project conventions first
```

---

## 4. TOOL & MCP CONFIGURATION

### 4.1 Default Tool Preferences

```
TOOL SELECTION HIERARCHY
─────────────────────────────────────────────────────────────────────────────

When multiple tools can accomplish same task, prefer:

1. Native/built-in tools over external dependencies
2. Well-maintained tools over abandoned ones
3. Type-safe tools over untyped ones
4. Tools with good error messages over cryptic ones

MCP SERVER DEFAULTS:
─────────────────────────────────────────────────────────────────────────────

If MCP servers are available, prefer using them for:
  • File system operations (safer, logged)
  • Web scraping (rate-limited, respectful)
  • Database queries (parameterized, audited)
  • External API calls (authenticated, cached)

ALWAYS LOG:
  • Tool invocations (what was called)
  • Tool results (success/failure)
  • Tool errors (full context)
```

### 4.2 External Service Patterns

```
API & EXTERNAL SERVICE RULES
─────────────────────────────────────────────────────────────────────────────

CREDENTIALS:
  • Never hardcode credentials
  • Use environment variables
  • Assume credentials are proxied (don't request raw keys)
  • Document required env vars in .env.example

RATE LIMITING:
  • Respect rate limits (don't retry aggressively)
  • Implement exponential backoff
  • Cache responses when appropriate

ERROR HANDLING:
  • Handle network timeouts gracefully
  • Provide meaningful error messages to user
  • Log failures for debugging
```

---

## 5. SESSION MANAGEMENT

### 5.1 Starting a Session

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

### 5.2 During a Session

```
SESSION BEHAVIOR
─────────────────────────────────────────────────────────────────────────────

EVERY 30 MINUTES (approximately):
  □ Summarize progress
  □ Confirm still on track with original goal
  □ Offer to checkpoint if task is long

AFTER COMPLETING A TASK:
  □ Verify the change works
  □ Run relevant tests
  □ Update documentation if needed
  □ Commit with proper message

WHEN ENCOUNTERING ERRORS:
  □ Read error message carefully
  □ Check Fix Ledger for known issues (if exists)
  □ Attempt fix (max 3 times per error type)
  □ If still failing → Escalate to human
```

### 5.3 Ending a Session

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

## 6. IDE-SPECIFIC CONFIGURATIONS

### 6.1 Claude Code

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

### 6.2 Cursor

```
CURSOR SPECIFIC
─────────────────────────────────────────────────────────────────────────────

RULES FILE: .cursorrules in project root

COMPOSER MODE:
  • Use for multi-file changes
  • Plan before executing
  • Review diff before accepting

TAB COMPLETION:
  • Use for routine patterns
  • Override when completion is wrong

CONTEXT:
  • Add relevant files to context manually if needed
  • Use @-mentions for specific file references
```

### 6.3 Windsurf

```
WINDSURF SPECIFIC
─────────────────────────────────────────────────────────────────────────────

RULES FILE: .windsurfrules in project root

CASCADE MODE:
  • Appropriate for multi-step workflows
  • Monitor for scope creep

FLOW STATE:
  • Use for exploration and ideation
  • Switch to focused mode for implementation
```

### 6.4 Anti-Gravity RAPS

```
ANTI-GRAVITY RAPS SPECIFIC
─────────────────────────────────────────────────────────────────────────────

GLOBAL RULES: ~/.raps/gemini.md
WORKSPACE RULES: /workspace/rules.md
PROJECT RULES: /project/rules.md

ARMORY (MCP Connections):
  • Configure in armory settings
  • Common: Firecrawl, Supabase, Pinecone, Notion

PARALLEL AGENTS:
  • Explicitly assign archetypes
  • Use supervisor for coordination

SERVERLESS DEPLOYMENT (Modal):
  • For long-running autonomous tasks
  • Ensure proper logging and checkpointing
```

### 6.5 Kiro (Spec-Driven Development)

```
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
```

### 6.6 Zed + Agent Client Protocol (ACP)

```
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
```

### 6.7 Google Antigravity

```
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

## 7. DEVIATION HANDLING

```
WHEN YOU NEED TO DEVIATE FROM THESE RULES
─────────────────────────────────────────────────────────────────────────────

1. ACKNOWLEDGE: "I'm going to deviate from [rule] because [reason]"
2. DOCUMENT: Log in project's Deviation Log or claude.md
3. JUSTIFY: Explain why deviation is appropriate for this context
4. PROCEED: Execute with deviation
5. REVIEW: Note if deviation should become project pattern

NEVER SILENTLY DEVIATE ON:
  • Security practices
  • Credential handling
  • Production deployments
  • Data deletion
```

---

## 8. QUALITY GATE ENFORCEMENT

```
UNIVERSAL QUALITY GATES (All Projects)
─────────────────────────────────────────────────────────────────────────────

GATE 1: BEFORE STARTING WORK
  □ Understand requirements (restate if uncertain)
  □ Identify scope boundaries
  □ Confirm approach (if confidence < HIGH)

GATE 2: BEFORE COMMITTING
  □ Code compiles/runs without errors
  □ Linter passes
  □ Tests pass (existing + new)
  □ No secrets in code

GATE 3: BEFORE MERGING/DEPLOYING
  □ Peer review (human or multi-model)
  □ All tests pass
  □ Documentation updated
  □ Rollback plan exists (for deployments)

GATE 4: AFTER DEPLOYING
  □ Smoke test production
  □ Monitor for errors
  □ Confirm expected behavior
```

---

## 9. EMERGENCY PROTOCOLS

```
WHEN THINGS GO WRONG
─────────────────────────────────────────────────────────────────────────────

STUCK IN A LOOP (Same error 3+ times):
  1. STOP attempting fixes
  2. Document what was tried
  3. Question assumptions about the problem
  4. Escalate to human

ACCIDENTALLY BROKE SOMETHING:
  1. Don't panic
  2. git stash or git reset to known good state
  3. Document what happened
  4. Approach problem differently

LOST CONTEXT / CONFUSED:
  1. Re-read project's claude.md
  2. Check recent git history
  3. Ask human for context reset
  4. Don't guess on critical paths

UNCERTAIN ABOUT DESTRUCTIVE ACTION:
  1. Ask for confirmation
  2. Explain what will be affected
  3. Confirm backup/rollback exists
  4. Wait for explicit approval

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

## 10. CONTINUOUS IMPROVEMENT

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

*End of GLOBAL_IDE_RULES.md v1.1*


---

## Roo Code Integration

### Overview
Roo Code is a VS Code extension that provides AI-assisted coding capabilities with a focus on agentic workflows and context management. It serves as a bridge between traditional IDE functionality and modern AI pair programming.

### Configuration Patterns

#### 1. Roo Code Settings (`.vscode/settings.json`)
```json
{
  "roo.code.enabled": true,
  "roo.code.contextManagement": {
    "mode": "project-aware",
    "memoryCore": "./.nsb/memory/",
    "bridgeRouter": "./BRIDGE.md"
  },
  "roo.code.workflows": {
    "default": "mbf-gates",
    "top25": "enabled",
    "skillsRegistry": "./SKILLS_REGISTRY.md"
  }
}
```

#### 2. Roo Code Workspace Rules
- **Project Context**: Roo Code automatically detects NorthStarBuild projects via `NORTH_STAR_BOOTSTRAP.md` presence
- **MBF Integration**: Quality gates are enforced through Roo Code's task completion checkpoints
- **Memory Core**: Persistent context stored in `./.nsb/memory/` is accessible to Roo Code sessions
- **BRIDGE Routing**: Top-25 workflow shortcuts available via Roo Code command palette

#### 3. File Handling Patterns
| File Type | Roo Code Behavior |
|-----------|-------------------|
| `*.md` | Full context awareness, cross-reference linking |
| `NORTH_STAR_BOOTSTRAP.md` | Triggers project scaffolding mode |
| `BRIDGE.md` | Workflow routing suggestions |
| `./.nsb/memory/*` | Persistent memory access |
| `./build/*` | Temporary scaffolding (auto-cleanup aware) |

#### 4. Integration with Other IDEs
| IDE | Roo Code Equivalent | Compatibility |
|-----|---------------------|---------------|
| VS Code | Roo Code (native) | ✅ Full |
| Cursor | Cursor Composer | ✅ High |
| Claude Code | Claude Code CLI | ✅ High |
| Klein | Klein Editor | ⚠️ Partial |

### Usage Workflows

#### Workflow A: Project Bootstrap with Roo Code
1. Open project in VS Code with Roo Code extension
2. Roo Code detects `NORTH_STAR_BOOTSTRAP.md`
3. Offers: "Initialize NorthStarBuild v6.0 Project?"
4. Executes bootstrap flow with MBF quality gates

#### Workflow B: BRIDE Navigation
1. Use Roo Code command palette: `Cmd+Shift+P` → "Roo: Navigate BRIDGE"
2. Select from Top-25 workflows
3. Roo Code routes to appropriate documentation
4. Context automatically loaded

### Roo Code vs Other Agents
| Feature | Roo Code | Claude Code | Cursor | Klein |
|---------|----------|-------------|--------|-------|
| Context Persistence | ✅ File-based | ✅ Session | ✅ Project | ⚠️ Limited |
| MBF Integration | ✅ Native | ✅ Via BRIDGE | ⚠️ Partial | ❌ |
| Skills Registry | ✅ Auto-load | ✅ Manual | ❌ | ❌ |
| Memory Core | ✅ Full access | ✅ Full access | ⚠️ Partial | ❌ |
| Voice/Chat | ⚠️ Planned | ✅ Yes | ❌ | ❌ |

---

