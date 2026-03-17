# Changelog

All notable changes to the North Star Framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

> **Versioning Note:** The North Star Framework is a multi-component system. Each component
> maintains its own version number. This changelog tracks coordinated releases across all components.
>
> | Component | Description |
> |-----------|-------------|
> | **North Star Blueprint (NSB)** | The methodology — HOW to build |
> | **Master Build Framework (MBF)** | The technology catalog — WHAT to build with |
> | **Bootstrap** | The ignition key — project scaffolding |
> | **BRIDGE** | The navigation layer — routing between NSB and MBF |
> | **Global IDE Rules** | Cross-project defaults for all IDEs |

---

## [Unreleased]

*Items under consideration for future releases. Submit proposals via [Enhancement Request](.github/ISSUE_TEMPLATE/enhancement_request.md).*

### Batch 9 — Skills Registry & Landscape Integration (2026-03-16)

#### Added
- **SKILLS_REGISTRY.md v2.0** — Canonical skills source map with four trust tiers (Official Vendor, Open Standards, Reviewed Community, Discovery Only). References 52 official skills (17 Anthropic + 35 OpenAI), 5 reviewed community sources, and 1,500+ discovery-only resources.
- **Skill Supply Chain Governance** — Vendoring protocol requiring source repo, pinned SHA, date checked, local reviewer, and security review status for every adopted external skill.
- **Skill Lifecycle States** — DISCOVERY → REVIEW → APPROVED → VENDORED → ACTIVE → DEPRECATED pipeline with human approval gates.
- **Self-Improving Skill Architecture** — Three documented patterns: Retro→Promotion Pipeline, Karpathy Autoresearch Loop, and Anthropic Skill Creator Meta-Loop.
- **Raw Download Links** — Copy-paste ready curl commands for all high-priority official skills from both Anthropic and OpenAI repositories.
- **2026 Skills Landscape Research** — `research/BATCH_9_SKILLS_LANDSCAPE_2026-03-16.md` documenting verified upstream sources, market signals, and academic references (arXiv:2602.12430v3).
- **Planned skills** for Pass 2: `design-taste`, `skill-supply-chain-review`, `autoresearch`, `mcp-builder`, `skill-creator`.
- **design-taste v1.0** (Pass 2) — Unified adaptation of `leonxlnx/taste-skill` (4 sub-skills → 1). 3-dial config (DESIGN_VARIANCE/MOTION_INTENSITY/VISUAL_DENSITY), named anti-slop rules (The Lila Ban, The Jane Doe Effect), ~15 creative arsenal patterns, performance guardrails, redesign audit protocol, pre-flight checklist. Anti-emoji policy, React/Next.js Server Components default, Tailwind version-locked.
- **skill-supply-chain-review v1.0** (Pass 2) — Original skill. 5-phase evaluation protocol (source verification → content audit → behavioral analysis → compatibility check → vendoring assessment). Trust tier classification (A–D), vendoring checklist with 13 security gates, upstream diff protocol, red flag patterns for automatic FAIL.
- **autoresearch v1.0** (Pass 2) — Adapted from Karpathy autoresearch (38K stars) + uditgoenka/autoresearch. 8 core principles, 3-phase execution (setup → loop → results tracking), TSV logging, Guard protocol for regression prevention, crash recovery table, 4 example use cases.
- **mcp-builder v1.0** (Pass 2) — Adapted from Anthropic official mcp-builder. 4-phase lifecycle (research → implement → test → evaluate), tool design guidelines, TypeScript/Python project templates, MCP Inspector testing, evaluation question generation.
- **skill-creator v1.0** (Pass 2) — Adapted from Anthropic official skill-creator. 7-phase meta-loop (intent capture → draft → test cases → run tests → evaluate → improve → description optimization), progressive disclosure architecture, NS Framework integration points, skill writing guidelines.

#### Changed
- **parallel-agent v1.0 → v1.1** — Added 4 orchestration patterns (worktree, separate checkout, local+remote split, agent teams), AGENTS.md handoff protocol, merge sequencing, session abandonment strategy.
- **research-report v1.0 → v1.1** — Added source tiering (Tier A–D), citation requirements, cross-referencing protocol, date verification, "Safe to Vendor?" assessment section, confidence ratings.
- **retro v1.0 → v1.1** — Added Skill Promotion Pipeline (5-stage: detect → draft → human review → activate → evaluate), metrics tracking, correction rate trending. Fixed `git add -A` anti-pattern.
- **plan-annotator v1.0 → v1.1** — Added TYPE E (Scope Change) annotation, conflict detection between annotations, complexity estimation guide, test plan section in template.

#### Fixed
- **NORTH_STAR_BOOTSTRAP.md line 1177** — Replaced stale `claude plugin install code-simplifier` with current skill-based code review reference.
- **SKILLS_REGISTRY.md** — File now exists (was referenced by GLOBAL_IDE_RULES.md but missing).

---

## [v6.1] — 2026-03-11

**Component Versions:** NSB v6.1 | MBF v2.1 | Bootstrap v1.4 | BRIDGE v1.2 | Global IDE Rules v1.1

The v6.1 release represents the framework's evolution from a structured methodology into a fully AI-native development operating system. Forty-one enhancements drawn from real-world Claude Code usage, community patterns, and professional methodology gap analysis.

### Added

#### Core Methodology (NSB)
- **RPIT Loop** (ENH-008) — Canonical feature development loop: Research → Plan → Implement → Test. Replaces ad-hoc workflows with a repeatable cycle that prevents research-less implementation.
- **Plan.md Annotation Pattern** (ENH-009) — Structured annotations (`[APPROVED]`, `[MODIFIED]`, `[BLOCKED]`) on plan items so agents track implementation state without losing human decisions.
- **Hooks Architecture** (ENH-010) — Determinism injection system using shell-based lifecycle hooks (pre-write, post-write, stop, notification) to enforce project invariants automatically.
- **Parallel Agent Orchestration** (ENH-012) — Multi-Claude sessions using Git worktrees for collision-free parallel development with shared-nothing architecture.
- **Planner/Worker/Judge Hierarchy** (ENH-011) — Structured multi-agent pattern separating planning, execution, and verification into distinct agent roles.
- **Agent Teams** (ENH-013) — Coordinated specialized roles (Architect, Implementer, Reviewer, Researcher) with defined handoff protocols.
- **Repository Maps** (ENH-014) — Tree-sitter AST + PageRank approach for intelligent codebase navigation without loading entire repos into context.
- **Feedback Loop / Retro Skill** (ENH-016) — Outer improvement loop that encodes session learnings back into project context, making the framework self-improving.
- **Context Compaction Recovery** (ENH-017) — Protocol for recovering from context window compression events without losing critical session state.
- **claude.md as Living Document** (ENH-018) — Iterative improvement protocol for project context files rather than set-and-forget.
- **Status Line Configuration** (ENH-019) — Context-aware session status for at-a-glance project state visibility.
- **Kiro Spec-Driven Hooks** (ENH-015) — Event-driven hook patterns inspired by Kiro's specification-first approach.

#### Bootstrap & Navigation
- **Multi-Agent Native Ignition** (ENH-001) — Bootstrap now detects and configures multi-agent environments on first run.
- **OpenClaw Async Delegation Bridge** (ENH-002) — Integration point for asynchronous task delegation to life management agents.
- **Permission Pre-Configuration** (ENH-003) — Protocol to configure `.claude/settings.json` permissions during scaffolding instead of runtime prompts.
- **New BRIDGE Decision Branches** (ENH-005) — Async workflow, specification-driven, and governance routing paths added to the BRIDGE decision tree.
- **Boris Cherny Parallel Checkout** (ENH-007) — Git worktree checkout pattern integrated into BRIDGE routing for multi-agent scenarios.
- **OpenClaw Integration Guide** (ENH-034) — BRIDGE addendum for routing to OpenClaw-based async delegation workflows.

#### Master Build Framework (MBF)
- **Category 57: Agent Orchestration Frameworks** (ENH-020) — CrewAI, AutoGen, LangGraph, OpenClaw coverage.
- **Category 58: AI-Native IDEs & Coding Agents** (ENH-021) — Claude Code, Cursor, Windsurf, Kiro, Zed+ACP, Antigravity.
- **Category 59: Prompt Orchestration & Evaluation** (ENH-022) — PromptLayer, Braintrust, Promptfoo, LangSmith evaluation tooling.
- **Category 60: Life OS Agents** (ENH-023) — OpenClaw and personal automation agent frameworks.
- **Category 61: Enterprise Agent Governance** (ENH-024) — Agent compliance, audit trails, and organizational control planes.
- **Category 62: Memory Infrastructure** (ENH-041) — Persistent memory systems for long-running agent workflows.
- **Category 44 Expansion** (ENH-025) — Data pipeline and human-in-the-loop pattern additions.
- **Category 29 Expansion** (ENH-026) — Context management systems coverage.
- **Benchmark Matrix Update** (ENH-027) — SWE-bench and Terminal-Bench scoring integration.

#### Skills Package
- **retro-skill.md** (ENH-028) — Post-RPIT feedback loop skill for encoding session learnings.
- **parallel-agent-orchestration.md** (ENH-029) — Skill for coordinating multi-Claude worktree sessions.
- **research-report.md** (ENH-030) — Structured research output skill for the Research phase of RPIT.
- **plan-annotator.md** (ENH-031) — Skill for managing Plan.md annotation state.

#### IDE & Configuration
- **Global IDE Rules Update** (ENH-035) — Hooks, multi-agent, RPIT, and permission patterns added to cross-project defaults.
- **Multi-IDE Configs** (ENH-036) — Kiro, Zed+ACP, and Antigravity IDE configuration profiles.

#### Repository & Community
- `CHANGELOG.md` — This file. Version history following Keep a Changelog format.
- `SECURITY.md` — Responsible disclosure policy.
- `.github/ISSUE_TEMPLATE/` — Bug report, enhancement request, and new MBF category templates.
- `.github/PULL_REQUEST_TEMPLATE.md` — PR checklist with philosophy alignment and testing requirements.
- `docs/NS_ANTI_PATTERNS.md` — Twelve concrete anti-patterns with correct alternatives.
- `docs/NS_PHILOSOPHY.md` — Framework manifesto and design philosophy.
- `docs/COST_OPTIMIZATION_GUIDE.md` — Model selection economics and token cost analysis.
- `docs/MIGRATION_v5_to_v6.md` — Step-by-step upgrade path from v5.0 to v6.1.
- `docs/NS_WORKFLOW_CHEATSHEET.md` — Dense one-page reference card for daily use.
- `examples/` — Complete working example set using a fictional Task Manager project.
- `scripts/merge_nsb_segments.sh` — Development utility for merging NSB segments into monolith.
- `scripts/merge_mbf_segments.sh` — Development utility for merging MBF segments into monolith.
- `.github/workflows/validate-links.yml` — Automated raw GitHub URL validation.

### Changed
- **BRIDGE MBF Routing** (ENH-006) — Updated routing table to include new categories 57–62.
- **Bootstrap Fetch URLs** (ENH-004) — All raw GitHub URLs updated from v5.0/v6.0 references to v6.1 targets.
- **Skill-Builder Meta-Integration** (ENH-032) — Bootstrap and Part I now reference the skill creation workflow.
- **Skill Descriptions** (ENH-033) — All existing skill descriptions refined for better auto-discovery.
- **README** (ENH-037) — Complete rewrite reflecting v6.1 architecture, components, and quick start.
- **QUICK_START.md** (ENH-038) — Updated URLs, paths, and component table for v6.1.
- **CONTRIBUTING.md** (ENH-039) — New category submission process, skills guide, ENH-XXX ID format.
- **Memory Architecture Integration** (ENH-040) — NS_MEMORY_ARCHITECTURE_PROPOSAL integrated into Part XII / new Part XIV; proposal file archived.

---

## [v6.0] — 2026-01

**Component Versions:** NSB v6.0 | MBF v1.1 | Bootstrap v1.3 | BRIDGE v1.1 | Global IDE Rules v1.0

The Definitive Synthesis Edition. Complete rewrite consolidating the v3.0–v4.9.8 lineage into a unified twelve-part architecture.

### Added
- Twelve-part Blueprint architecture (Foundation through Quick Reference).
- Confidence Calibration system with five levels and automatic downgrade triggers.
- Autonomy Dial (levels 1–7) for human-AI collaboration control.
- Context window management protocol with percentage thresholds and actions.
- Quality Gates framework (Planning, Implementation, Review, Deployment).
- Multi-model strategy (Opus/Sonnet/Haiku role assignments).
- Agent Composition patterns (memory, skills, verification, handoffs).
- MCP & Tools integration layer with IDE routing.
- Design Mastery section with UX-first development patterns.
- Security framework with threat modeling and secrets management.
- DevOps patterns including CI/CD, infrastructure, and monitoring.
- Future-proofing section with technology radar and migration planning.
- Quick Reference section with condensed operational guidance.

### Changed
- Complete structural reorganization from linear document to interconnected parts.
- BRIDGE navigation layer upgraded to v1.1 with decision tree routing.
- Bootstrap upgraded to v1.3 with self-cleaning scaffolding architecture.
- MBF expanded to 56 categories across four tiers.

---

## [v5.0] — 2025-01

**Component Versions:** NSB v5.0 | MBF v1.0 | Bootstrap v1.1 | BRIDGE v1.0

The original public release establishing the North Star Framework as a complete AI-native development methodology.

### Added
- North Star Blueprint — core methodology document.
- Master Build Framework — 56-category technology catalog organized in four tiers.
- Bootstrap — self-cleaning ignition key for project scaffolding.
- BRIDGE — navigation layer connecting Blueprint and MBF.
- Segment architecture for development-time context management.
- Load Balancing vs Token Burning philosophy.
- CC BY-NC-SA 4.0 licensing.
- GitHub repository at `Navigata1/NorthStarBuild_5.0`.

---

## Links

[Unreleased]: https://github.com/Navigata1/NorthStarBuild_5.0/compare/v6.1...HEAD
[v6.1]: https://github.com/Navigata1/NorthStarBuild_5.0/compare/v6.0...v6.1
[v6.0]: https://github.com/Navigata1/NorthStarBuild_5.0/compare/v5.0...v6.0
[v5.0]: https://github.com/Navigata1/NorthStarBuild_5.0/releases/tag/v5.0

---

> **North Star Framework** — Build with intention. Ship with confidence.
> Created by [@NavigatingTruth](https://twitter.com/NavigatingTruth)
> Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
