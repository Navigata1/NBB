# Migration Guide: v5.0 → v6.1

## Upgrading Your North Star Framework Installation

This guide walks you through upgrading from North Star Framework v5.0 to v6.1. The upgrade is backward compatible at the core level — your existing Bootstrap ignition prompt and BRIDGE routing still work — but v6.1 introduces significant new capabilities that require configuration to use.

**Estimated time:** 30-45 minutes for a typical project.

---

## What's Backward Compatible

These continue to work without changes:

- **Bootstrap ignition prompt** — Still fetches and scaffolds. Updated URLs are handled internally.
- **BRIDGE routing** — Existing routing queries still resolve. New routes have been added, not changed.
- **MBF category references** — Categories 1-56 are unchanged. Categories 57-62 are additions.
- **Existing `claude.md` / `.cursorrules`** — Your project context file still works. New sections are additive.
- **Quality Gates** — Existing gate structures are preserved.

---

## What Changed and Requires Action

### 1. Version References

**Update all raw GitHub URLs** in your project files from v5.0 references to v6.1:

```
# Old
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/.../NORTH_STAR_BLUEPRINT_v5.0.md

# New
https://raw.githubusercontent.com/Navigata1/NorthStarBuild_5.0/.../NORTH_STAR_BLUEPRINT_v6.5.md
```

Similarly for MBF references:
```
# Old: MASTER_BUILD_FRAMEWORK_v1.1.md
# New: MASTER_BUILD_FRAMEWORK_v2.5.md
```

### 2. Project Context File Updates

Add these new sections to your `claude.md` (or equivalent):

**Session Learnings section** (after Known Issues):
```markdown
## Session Learnings (from retros)

- [Date]: [Learning from retro skill]
```

**Do NOT section** (if you don't have one):
```markdown
## Do NOT

- [Project-specific restrictions for the agent]
```

### 3. Install Global IDE Rules

v6.1 introduces `GLOBAL_IDE_RULES.md` as a cross-project configuration file. If you're running multiple NS Framework projects, install it once:

```bash
# Copy to your global IDE config location
# For Claude Code:
cp GLOBAL_IDE_RULES.md ~/.claude/

# Or reference it in your project's claude.md:
# "Also follow the global rules at: [URL to GLOBAL_IDE_RULES.md]"
```

### 4. Set Up Hooks (New in v6.1)

The Hooks Architecture is the biggest operational change. Create the hooks directory:

```bash
mkdir -p .claude/hooks
```

At minimum, create a `stop.sh` hook for automated verification:

```bash
#!/bin/bash
# Minimum viable stop hook
set -euo pipefail

# Type check
npx tsc --noEmit 2>/dev/null || { echo "❌ TypeScript errors"; exit 1; }

# Lint
npm run lint --silent 2>/dev/null || { echo "❌ Lint errors"; exit 1; }

echo "✅ Checks passed"
```

See `examples/.claude/hooks/` for complete examples.

### 5. Configure Permissions (New in v6.1)

Replace `--dangerously-skip-permissions` with explicit permission configuration:

```bash
# Create settings file
mkdir -p .claude
```

Create `.claude/settings.json` with allow/deny lists for your project. See `examples/.claude/settings.json` for a complete example.

### 6. Add the Retro Skill

Copy the retro skill into your project:

```bash
mkdir -p .claude/skills/retro
# Copy SKILL.md from examples/.claude/skills/retro/SKILL.md
```

Then run it at the end of every RPIT cycle to start accumulating project-specific learnings.

---

## New Workflow Patterns to Adopt

### RPIT Loop

v5.0 had a general "plan then implement" workflow. v6.1 formalizes this as the four-phase RPIT Loop:

| Phase | v5.0 Equivalent | v6.1 Pattern |
|-------|-----------------|-------------|
| **Research** | Ad hoc, often skipped | Structured research with report output |
| **Plan** | "Create a plan" | plan.md with annotations (`[APPROVED]`, `[MODIFIED]`, `[BLOCKED]`) |
| **Implement** | "Implement the plan" | Execute with hooks verification, confidence checks |
| **Test** | "Write tests" | Automated via stop hooks + manual test cycle |

**How to adopt:** Start using "Research first" for unfamiliar territory. Create a `plan.md` file for each feature. Use annotations to track state.

### Confidence Calibration

v5.0 didn't formalize confidence. v6.1 makes it explicit:

| Level | Meaning | Agent Action |
|-------|---------|-------------|
| Certain (95%+) | Verified directly | Proceed |
| High (80-95%) | Strong patterns | Proceed with quick verification |
| Medium (50-80%) | Some assumptions | Verify before proceeding |
| Low (20-50%) | Speculation | Must verify, don't proceed without confirmation |
| Uncertain (<20%) | Insufficient info | STOP and ask |

**How to adopt:** Add to your `claude.md`: "State your confidence level before major actions. Follow the Confidence Calibration levels from NSB Part IV."

### Multi-Agent Development

v5.0 was single-agent. v6.1 supports parallel agents via Git worktrees:

```bash
# Create isolated worktrees for parallel agents
git worktree add ../taskflow-agent-2 -b feature/search
git worktree add ../taskflow-agent-3 -b feature/filters
```

**How to adopt:** Start with single-agent RPIT. Graduate to parallel agents when features have independent file scopes.

---

## Migration Checklist

Use this checklist to verify your migration is complete:

### Essential (do these first)
- [ ] Updated raw GitHub URLs to v6.1 references
- [ ] Added "Session Learnings" section to project context file
- [ ] Added "Do NOT" section to project context file
- [ ] Created `.claude/settings.json` with permissions
- [ ] Created `.claude/hooks/stop.sh` with at minimum type check + lint

### Recommended (do within first week)
- [ ] Installed `GLOBAL_IDE_RULES.md` for cross-project defaults
- [ ] Added retro skill to `.claude/skills/retro/SKILL.md`
- [ ] Created first `plan.md` using annotation format
- [ ] Ran first retro and added learnings to context file
- [ ] Added confidence calibration instruction to context file

### Advanced (adopt as needed)
- [ ] Set up Git worktrees for parallel agent sessions
- [ ] Created project-specific slash commands in `.claude/commands/`
- [ ] Added `pre-write.sh` hook for file protection
- [ ] Configured MBF categories 57-62 routing in BRIDGE usage

---

## Mapping v5.0 Concepts to v6.1

If you're already doing something in v5.0, here's how it maps:

| v5.0 Pattern | v6.1 Equivalent | What Changed |
|-------------|-----------------|-------------|
| "Create a plan first" | RPIT Loop (Plan phase) | Now includes Research phase before planning |
| Manual permission prompts | `.claude/settings.json` | Pre-configured, no runtime interruptions |
| "Check if it compiles" (manual) | Hooks Architecture | Automated via `stop.sh` |
| Single long session | Session lifecycle management | Stop at 85% context, fresh sessions per RPIT |
| "Remember for next time" (verbal) | Retro Skill → `claude.md` updates | Structured, persistent, compounding |
| Loading full Blueprint | BRIDGE routing | Load only relevant sections |
| Quality review (manual) | Quality Gates + Hooks | Automated gates with human checkpoints |

---

## Troubleshooting

**"My hooks aren't running"**
- Verify hooks are executable: `chmod +x .claude/hooks/*.sh`
- Check hook naming matches your IDE's expected hook names
- Verify the shebang line: `#!/bin/bash`

**"BRIDGE can't find new categories (57-62)"**
- You're likely loading a cached v1.1 BRIDGE. Clear cache and fetch v1.2.
- Verify your BRIDGE URL points to the v6.1 version.

**"My old context file seems to conflict with new patterns"**
- v6.1 is additive — nothing in v5.0 context files is wrong, just incomplete
- Add the new sections without removing existing content
- Run a retro to audit and update stale entries

---

> **North Star Framework v6.1** — Build with intention. Ship with confidence.
> Created by [@NavigatingTruth](https://twitter.com/NavigatingTruth)
> Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
