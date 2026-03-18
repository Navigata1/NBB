# AGENTS.md — Multi-Agent Coordination Protocol

> **VERSION:** 1.0 | **Updated:** 2026-03-17 | **Batch:** 9
> **Compatible with:** Blueprint v6.1 | MBF v2.1 | Bootstrap v1.4

---

## Purpose

This file defines ownership boundaries and coordination rules when multiple agents (Claude Code, Codex, or other AI agents) work on this repository. It prevents edit collisions and ensures segment–monolith integrity.

---

## 1. File Ownership Rules

### 1.1 Blueprint Segments (Source of Truth)

| Path | Owner | Rule |
|------|-------|------|
| `projects/Segment Mods/NSBP6.0 -Segments/PART_1` through `PART_7` | Single agent per session | Claim before editing. Only one agent may edit a given PART_N file at a time. |
| `projects/Segment Mods/NSBP6.0 -Segments/OG -Originals/` | Same agent editing the corresponding PART_N | Changes to PART_N must be propagated to corresponding OG originals (see HANDOFF.md mapping table). |

### 1.2 MBF Segments (Source of Truth)

| Path | Owner | Rule |
|------|-------|------|
| `projects/Segment Mods/MBF2.0- Segments/MBF_PART_1` through `MBF_PART_4` | Single agent per session | Claim before editing. Only one agent may edit a given MBF_PART_N at a time. |

### 1.3 Generated Monoliths (Do NOT Edit)

| Path | Rule |
|------|------|
| `north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md` | Generated. Never edit directly. Protected by pre-write hook. |
| `master-build-framework/MASTER_BUILD_FRAMEWORK_v2.1.md` | Generated. Never edit directly. Protected by pre-write hook. |

To update monoliths: edit segments → run `bash scripts/merge_nsb_segments.sh` or `bash scripts/merge_mbf_segments.sh`.

### 1.4 Shared Files (Require Coordination)

| Path | Rule |
|------|------|
| `BRIDGE.md` | Shared. Coordinate before editing. Check for concurrent PRs. |
| `NORTH_STAR_BOOTSTRAP.md` | Shared. Coordinate before editing. |
| `GLOBAL_IDE_RULES.md` | Shared. Coordinate before editing. |
| `SKILLS_REGISTRY.md` | Shared. Version-bump on edit. |
| `HARD_STOPS.md` | Shared. Critical safety file — human approval required for all changes. |
| `CHANGELOG.md` | Append-only within `[Unreleased]` section. Multiple agents may append. |
| `CLAUDE.md` | Owner: primary session agent. Update after significant structural changes. |

### 1.5 Skills (Individual Ownership)

| Path | Rule |
|------|------|
| `.claude/skills/<skill-name>/SKILL.md` | One owner per skill. Claim by naming yourself in the commit. |

### 1.6 Research & Docs

| Path | Rule |
|------|------|
| `research/` | Any agent may create new files. Do not edit another agent's research files. |
| `docs/` | Any agent may create new files. Coordinate before editing existing files. |

---

## 2. Conflict Resolution Protocol

```
CONFLICT DETECTED (two agents touched the same file)
─────────────────────────────────────────────────────────────────────────────

1. STOP all affected agents immediately
2. Identify which agent's changes are correct:
   → Check git log for the most recent valid commit
   → Prefer the agent whose changes align with the current batch scope
3. Do NOT auto-merge — escalate to human orchestrator
4. After resolution:
   → The losing agent rebases or re-applies its changes
   → Document the conflict in CHANGELOG.md under [Unreleased]

PREVENTION:
  → Always check git status before starting edits
  → Use git worktrees for parallel agent work (one worktree per agent)
  → Claim files explicitly at session start
```

---

## 3. Session Handoff Between Agents

When one agent session ends and another begins:

1. **Outgoing agent** creates or updates `HANDOFF.md` with:
   - What was completed (with commit SHAs)
   - What remains (specific task list)
   - Known structural issues
   - Files that were modified

2. **Incoming agent** reads:
   - `CLAUDE.md` (project context)
   - `HANDOFF.md` (session state)
   - `CHANGELOG.md [Unreleased]` (batch state)
   - `HARD_STOPS.md` (safety rules)

3. **Incoming agent** does NOT:
   - Redo completed work
   - Edit files claimed by a concurrent agent
   - Skip reading handoff notes

---

## 4. Agent Types & Capabilities

| Agent | Typical Use | Autonomy Level |
|-------|-------------|----------------|
| Claude Code (local) | Primary development, segment editing, skill creation | Level 5-6 |
| Claude Code (remote/async) | Research, documentation, background tasks | Level 4-5 |
| Codex (OpenAI) | Parallel research, cross-validation, alternative approaches | Level 3-4 |
| Human orchestrator | Approval gates, conflict resolution, merge decisions | N/A |

---

## 5. Merge Script Ownership

Only one agent should run merge scripts at a time. After running a merge:
1. Verify the monolith was regenerated correctly (check line count, diff)
2. Commit the regenerated monolith with a descriptive message
3. Note the merge in CHANGELOG.md

---

*End of AGENTS.md v1.0*
