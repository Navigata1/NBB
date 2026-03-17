# North Star Framework — Project Context

## Identity

You are working on the North Star Framework itself — an AI-native development methodology. This is a documentation/methodology repo, not an application. Treat every edit as a framework change that affects downstream projects.

## Component Structure

| Component | Path | Role |
|-----------|------|------|
| Blueprint Segments | `projects/Segment Mods/NSBP6.0 -Segments/PART_1` through `PART_7` | **Source of truth** for North Star Blueprint |
| MBF Segments | `projects/Segment Mods/MBF2.0- Segments/MBF_PART_1` through `MBF_PART_4` | **Source of truth** for Master Build Framework |
| Blueprint Monolith | `north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md` | Generated — do not edit directly |
| MBF Monolith | `master-build-framework/MASTER_BUILD_FRAMEWORK_v2.1.md` | Generated — do not edit directly |
| BRIDGE.md | Root | Cross-reference routing between Blueprint and MBF |
| NORTH_STAR_BOOTSTRAP.md | Root | Project scaffolding ignition key (v1.4) |
| GLOBAL_IDE_RULES.md | Root | Cross-project IDE defaults |
| SKILLS_REGISTRY.md | Root | Canonical skills source map (v2.1) |
| HARD_STOPS.md | Root | Agent-forbidden commands (severity-tiered) |
| CHANGELOG.md | Root | Version history — check `[Unreleased]` for current batch state |
| `.claude/skills/` | 9 active skills | Local skill definitions |

## Segment Architecture

Segments are the source of truth. Monoliths are generated artifacts.

- **To update Blueprint content:** Edit the relevant `PART_N` segment, then run `bash scripts/merge_nsb_segments.sh`
- **To update MBF content:** Edit the relevant `MBF_PART_N` segment, then run `bash scripts/merge_mbf_segments.sh`
- **Never edit monolith files directly.** Changes will be overwritten on next merge.

## Batch Workflow

Development happens in numbered batches with multiple passes. Each pass has a specific scope. Always check `CHANGELOG.md` under `[Unreleased]` for current batch state before starting work.

## Key Rules

1. **Load HARD_STOPS.md at session start** — contains severity-tiered forbidden commands
2. **Load the relevant segment** (not the full monolith) when working on a specific Part
3. **Use BRIDGE.md** to find cross-references between Blueprint and MBF
4. **Never import external skills** without running the `skill-supply-chain-review` skill first
5. **Track deviations** in the Deviation Log
6. **Run the `retro` skill** at end of significant work sessions
7. **Stage specific files** when committing — never use `git add -A`

## Current State

- **Phase:** Batch 9 — Skills Integration & Safety Enhancements
- **Versions:** NSB v6.1 | MBF v2.1 | Bootstrap v1.4 | BRIDGE v1.2 | IDE Rules v1.1
- **License:** CC BY-NC-SA 4.0 | Author: @NavigatingTruth

## Skills Available

autoresearch, design-taste, mcp-builder, parallel-agent, plan-annotator, research-report, retro, skill-creator, skill-supply-chain-review

## Do NOT

- Edit monolith files directly (edit segments, then merge)
- Import external skills without supply chain review
- Use `git add -A` or `git add .` (stage specific files only)
- Compact mid-session (use sub-agents or fresh sessions instead)
- Use destructive git commands (`--force`, `reset --hard`, `checkout --`)
- Skip HARD_STOPS.md at session start
