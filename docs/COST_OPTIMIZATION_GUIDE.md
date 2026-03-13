# Cost Optimization Guide

## Making AI-Native Development Economically Sustainable

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│  "The most expensive token is the one you burn without purpose.             │
│   The cheapest token is the one you didn't need to spend."                  │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

The #1 question from developers evaluating the North Star Framework: **"What does this actually cost?"** This guide answers that with real math, practical model selection strategies, and the specific NS Framework patterns that reduce costs.

---

## The Model Triangle

Every AI coding task has three dimensions. No single model optimizes all three.

```
                    QUALITY
                      ▲
                     ╱ ╲
                    ╱   ╲
                   ╱     ╲
            Opus ◆       ╲
                 ╱         ╲
                ╱           ╲
               ╱    Sonnet   ╲
              ╱       ◆       ╲
             ╱                 ╲
            ╱                   ╲
           ╱        Haiku ◆      ╲
          ▼─────────────────────▶
        COST                   SPEED
```

| Model | Strength | Typical Use | When to Choose |
|-------|----------|-------------|----------------|
| **Opus** | Highest reasoning quality | Architecture decisions, complex debugging, critical path planning | When being wrong costs more than the model cost |
| **Sonnet** | Best quality-per-token | 90% of implementation work, code generation, refactoring | Default choice for most RPIT cycles |
| **Haiku** | Fastest, lowest cost | Codebase exploration, research sub-tasks, quick lookups | When you need breadth over depth |

---

## What a Typical RPIT Cycle Costs

A standard RPIT loop (Research → Plan → Implement → Test) on a medium-complexity feature generates roughly:

| Phase | Input Tokens | Output Tokens | Notes |
|-------|-------------|---------------|-------|
| Research | ~8K | ~3K | Reading docs, checking APIs |
| Plan | ~12K | ~4K | Context file + codebase + plan draft |
| Implement | ~30K | ~15K | Code generation, file reads, iterations |
| Test | ~10K | ~5K | Test writing, running, fixing |
| **Total** | **~60K** | **~27K** | Per feature, single RPIT cycle |

### Cost per RPIT cycle by model (API pricing)

| Model | Input Cost | Output Cost | **Total per Cycle** |
|-------|-----------|-------------|---------------------|
| Opus | $0.90 | $1.35 | **~$2.25** |
| Sonnet | $0.18 | $0.27 | **~$0.45** |
| Haiku | $0.05 | $0.07 | **~$0.12** |

*Based on approximate API pricing at time of writing. Check current rates at anthropic.com/pricing.*

### Cost per RPIT cycle with Claude Pro/Max plans

| Plan | Monthly Cost | Included Usage | Effective Cost per Cycle |
|------|-------------|---------------|------------------------|
| Pro ($20/mo) | $20 | ~30-45 Sonnet cycles | ~$0.45-0.67 |
| Max ($100/mo) | $100 | Effectively unlimited Sonnet + significant Opus | ~$0.00* |
| Max ($200/mo) | $200 | Unlimited Sonnet + generous Opus | ~$0.00* |

*Max plan cycles are included in the flat rate — individual cycle cost approaches zero with sufficient usage.*

---

## Model Selection Strategy

### The 90/8/2 Rule

For most NS Framework projects, the optimal model allocation is:

- **90% Sonnet** — Implementation, testing, documentation, standard RPIT cycles
- **8% Opus** — Architecture decisions, complex debugging, critical path planning, ambiguous requirements
- **2% Haiku** — Codebase exploration via sub-agents, quick research lookups, file search

### When Opus ROI Is Positive

Use Opus when the cost of a wrong decision exceeds the price difference. Concrete triggers:

- **Choosing between architectures** — A bad choice costs days of rework. Opus's better reasoning at $2.25/cycle vs Sonnet's $0.45 is trivial compared to 8+ hours of refactoring.
- **Debugging a mystery failure** — When you've spent 30+ minutes and Sonnet can't find it. Opus on the same problem often identifies the issue in one pass.
- **Security-sensitive code** — Auth flows, payment handling, data access controls. The risk of a subtle vulnerability outweighs any model cost.
- **Multi-file refactoring** — Changes that touch 10+ files need the strongest reasoning to maintain consistency.

### When Haiku Is the Right Choice

- **Sub-agent codebase exploration** — "Find all files that import the auth module" doesn't need deep reasoning
- **Research breadth** — Checking 5 different API docs for compatibility info
- **Simple transformations** — Renaming, reformatting, mechanical code changes
- **Parallel workers** — When running 3 parallel Haiku agents is cheaper and faster than 1 Sonnet agent

---

## Multi-Agent Cost Model

Running parallel agents multiplies cost linearly but can reduce wall-clock time dramatically.

### Example: 3-File Feature Implementation

**Single Sonnet agent (sequential):**
- 3 RPIT cycles × $0.45 = $1.35
- Wall clock: ~90 minutes

**3 Sonnet agents in parallel (worktrees):**
- 3 RPIT cycles × $0.45 = $1.35 (same total cost)
- Wall clock: ~35 minutes
- Plus coordination overhead: ~$0.15
- **Total: $1.50, 35 minutes**

**1 Opus planner + 3 Sonnet workers:**
- Planning: $2.25
- Implementation: 3 × $0.45 = $1.35
- **Total: $3.60, 30 minutes**
- Best for complex features where planning quality is critical

### When to parallelize:
- Feature touches 3+ independent files/modules
- You have the Max plan (parallel agents are "free")
- Wall-clock time matters more than total tokens

### When NOT to parallelize:
- Files have shared dependencies (collision risk)
- On API billing without high-volume tier (costs add up)
- Feature requires sequential decisions (each step depends on the previous)

---

## Plan ROI Analysis

### When Does Pro Pay for Itself?

**Break-even calculation:**
- Pro plan: $20/month
- Sonnet API cost per RPIT cycle: ~$0.45
- Break-even: ~44 RPIT cycles/month
- That's roughly **2-3 features per working day**

If you're running 2+ RPIT cycles per day, Pro is cheaper than API billing.

### When Does Max Pay for Itself?

**$100/month Max:**
- Equivalent API spend at Sonnet rates: ~222 RPIT cycles
- At 5 cycles/day × 22 working days = 110 cycles
- Plus any Opus usage (even 10 Opus cycles = $22.50 on API)
- **Break-even: ~4-5 RPIT cycles per working day, or ~2/day with occasional Opus**

**$200/month Max:**
- Best value for developers doing this full-time
- Unlimited Sonnet means you never think about cost during implementation
- Generous Opus allocation for architecture and debugging sessions
- **Break-even: If you would spend >$200/month on API, this is the right choice**

---

## NS Framework Patterns That Reduce Costs

The framework isn't just a methodology — several patterns directly reduce token spend:

### 1. BRIDGE Routing (saves ~40% context per session)
Loading the full Blueprint + MBF burns ~60-80% of context before you start. BRIDGE routing loads only the relevant 2-3 sections. Less context loaded = fewer input tokens per message = lower cost.

### 2. RPIT Loop (prevents rework cycles)
Research-less implementation (Anti-Pattern 11) causes failed builds that require debugging cycles. Each debugging cycle is an additional RPIT's worth of tokens. One Research phase ($0.12-0.45) prevents one rework cycle ($0.45-2.25).

### 3. Hooks (automated verification)
Without hooks, the agent spends tokens running manual checks — "let me verify the types compile," "let me check if tests pass." Hooks do this automatically in the shell, zero tokens spent.

### 4. Retro Skill (compounding efficiency)
Each retro adds project-specific intelligence to `claude.md`. Session 1 might need 3 correction cycles. Session 10 (with accumulated retro learnings) might need 0. The retro investment pays compound dividends.

### 5. Plan.md Annotations (eliminates silent deviation)
Without annotations, plan deviation causes rework — you implement the wrong thing and start over. Annotations catch deviations early, when the cost of correction is one message, not one full cycle.

### 6. Fresh Sessions at 85% Context
Running past 85% context causes degraded output that requires correction. The correction tokens often exceed what you'd spend on a clean session start. Stop early, start fresh, save tokens.

---

## Quick Decision Matrix

| Your Situation | Recommended Plan | Model Strategy |
|---------------|-----------------|----------------|
| Hobby/side project, <1 hr/day | Pro | 100% Sonnet |
| Regular development, 2-4 hrs/day | Max ($100) | 90% Sonnet, 10% Opus for planning |
| Full-time AI-native development | Max ($200) | 85% Sonnet, 12% Opus, 3% Haiku sub-agents |
| Team/enterprise | API billing | Custom allocation per developer role |
| Evaluating the framework | Pro (or free tier) | Sonnet only — sufficient to learn the methodology |

---

> **North Star Framework v6.1** — Build with intention. Ship with confidence.
> Created by [@NavigatingTruth](https://twitter.com/NavigatingTruth)
> Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
