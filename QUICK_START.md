# Quick Start Guide

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│                    NORTH STAR FRAMEWORK — QUICK START                        │
│                                                                              │
│                       Get running in under 5 minutes                         │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

## What Is This?

North Star Framework is an **AI-native development methodology** that helps you build software projects from zero to deployment using AI agents as intelligent collaborators.

**Core Philosophy:**
- **Load what you need, unload when done** — No context window bloat
- **Pause when uncertain** — Confidence calibration prevents runaway errors
- **Process defines tools** — Methodology first, technology second

---

## Step 1: Choose Your Entry Point

### Option A: Fresh Project (Recommended)

Copy this prompt into your AI assistant:

```
Read this bootstrap file and help me start a new project:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/NORTH_STAR_BOOTSTRAP.md

My project: [describe your project in 1-2 sentences]
```

The Bootstrap will:
1. Ask clarifying questions about your project
2. Route you to the right methodology sections
3. Guide you through architecture decisions
4. Set up your documentation structure

### Option B: Existing Project

If you already have a project and want to improve it:

```
Read this routing guide and help me navigate to the right section:
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/BRIDGE.md

I need help with: [describe your challenge]
```

### Option C: Cross-Project Global Rules (install once, use everywhere)

Copy GLOBAL_IDE_RULES.md to your global Claude config:

```
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/main/GLOBAL_IDE_RULES.md

Save to: ~/.claude/CLAUDE.md (Claude Code)
         ~/.cursor/global-rules.md (Cursor)
         ~/.windsurf/rules.md (Windsurf)
```

---

## Step 2: Let the Framework Guide You

The framework operates in layers:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  YOU → BOOTSTRAP → BRIDGE → BLUEPRINT/MBF → IMPLEMENTATION                  │
│                                                                              │
│  1. You describe what you want to build                                      │
│  2. Bootstrap interviews you to understand requirements                      │
│  3. BRIDGE routes you to the right sections                                  │
│  4. Blueprint provides methodology (HOW)                                     │
│  5. MBF provides technology options (WHAT)                                   │
│  6. You implement with AI assistance                                         │
└─────────────────────────────────────────────────────────────────────────────┘
```

**You don't need to read everything.** The framework fetches only what's relevant to your current task.

---

## Step 3: Understand the Components

| Component | Version | Purpose | When You Need It |
|-----------|---------|---------|------------------|
| **Portable core** | NBB | Tiny always-resident bootstrap (CLAUDE.md/AGENTS.md/SKILL.md) | Every session — load first |
| **Bootstrap** | v1.5 | Deep ignition reference | Starting any project |
| **BRIDGE** | v1.5 | Navigation + routing + decision trees | Finding specific guidance |
| **GLOBAL_IDE_RULES** | v1.5 | Universal agent operating principles | Cross-project consistency |
| **Blueprint** | v6.5 | HOW to build — 14 Parts / 59 sections | Methodology and process |
| **MBF** | v2.5 | WHAT to build with — 62 categories | Technology selection |

### File Purposes

- `CLAUDE.md` / `AGENTS.md` / `SKILL.md` — the portable core (generated from `bootstrap/NBB_CORE.md`). Tier 1, always resident (~2k tokens).
- `NORTH_STAR_BOOTSTRAP.md` v1.5 — Deep ignition reference (load on demand).
- `BRIDGE.md` v1.5 — Navigation. Routes queries to correct sections.
- `GLOBAL_IDE_RULES.md` v1.5 — Universal IDE rules for all projects.
- `NORTH_STAR_BLUEPRINT_v6.5.md` — 14 Parts / 59 sections of methodology.
- `MASTER_BUILD_FRAMEWORK_v2.5.md` — 62 categories of technology options.

---

## Step 4: Common Starting Paths

### "I want to build a web application"

```
Bootstrap → Requirements Interview → 
  Blueprint §4 (Vision Statement) → 
  Blueprint §37 (Architecture Selection) →
  MBF Category 1 (Web Apps) →
  Implementation
```

### "I want to build an AI/LLM application"

```
Bootstrap → Requirements Interview →
  Blueprint §37 (Architecture Selection) →
  MBF Category 29-35 (AI/ML Categories) →
  Blueprint §20-27 (Orchestration) →
  Implementation
```

### "I need to improve my testing"

```
BRIDGE → Quality Section →
  Blueprint §43-45 (Testing Strategy) →
  MBF Category 46 (Testing Frameworks) →
  Implementation
```

### "I need help with deployment"

```
BRIDGE → Deployment Section →
  Blueprint §50-53 (Deployment & Operations) →
  MBF Category 9-14 (Infrastructure) →
  Implementation
```

### "I want to build with multiple AI agents in parallel"

```
Bootstrap → Multi-Agent Startup Sequence →
  Blueprint Part IV (Parallel Agent Orchestration) →
  RPIT Loop per agent →
  Git Worktrees →
  MBF Category 57 (Agent Frameworks)
```

### "I want to set up hooks for automated quality gates"

```
BRIDGE → Hooks Architecture →
  Blueprint Part XI (DevOps, Hooks Architecture section) →
  Stop Hook setup →
  Pre-write Hook setup →
  Hookery Plugin
```

### "I want Claude to learn from every session and improve"

```
Bootstrap → RPIT Loop →
  Blueprint Part XII (Feedback Loop) →
  Retro Skill installation →
  Compound Engineering Plugin
```

### "I want to trigger development from my phone"

```
BRIDGE → OpenClaw Integration Guide →
  MBF Category 60 (Life OS Agents) →
  Bootstrap Async Delegation section
```

---

## Step 5: Best Practices

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

---

## Troubleshooting

### "The AI agent seems confused"

Try:
1. Use BRIDGE.md to get specific routing
2. Reference specific section numbers (e.g., "See Blueprint §37")
3. Ask the agent to summarize its current understanding

### "I'm hitting context limits"

The framework is designed for streaming:
1. Use handoff documents between sessions
2. Ask the agent to unload completed sections
3. Focus on one section at a time

### "I don't know which technology to choose"

MBF provides options, not mandates:
1. Look at the "Best For" column in each category
2. Consider your team's existing expertise
3. Start simple, optimize later

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
2. `claude -w`  (first worktree)
3. `claude -w`  (second worktree — new terminal tab)
4. Brief each with a GitHub issue number
5. Review PRs when both complete
Once you've done this twice, it's mechanical.

---

## Getting Help

- **Issues:** Report bugs or suggest improvements on GitHub
- **Discussions:** Ask questions, share experiences
- **Twitter:** [@NavigatingTruth](https://twitter.com/NavigatingTruth)

---

## Next Steps

1. **Read the Bootstrap** — It will guide everything else
2. **Describe your project** — Be specific about what you're building
3. **Follow the routing** — Let BRIDGE navigate you
4. **Build with confidence** — The framework has your back

---

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│                    "Build with intention. Ship with confidence."             │
│                                                                              │
│                              Happy building!                                 │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```
