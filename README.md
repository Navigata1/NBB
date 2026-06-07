# North Star Build — NBB (Northstar Boot-strap edition)

## The portable, low-bloat edition of the North Star AI-native development framework

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Blueprint](https://img.shields.io/badge/Blueprint-v6.5-blue.svg)]()
[![MBF](https://img.shields.io/badge/MBF-v2.5-green.svg)]()
[![Bootstrap](https://img.shields.io/badge/Bootstrap-portable-orange.svg)]()

> "Build with intention. Ship with confidence." — the compass for AI-native development.

**NBB** is North Star v1, re-architected for the mid-2026 agentic landscape:
- **Portable** — drop it into Claude Code/Desktop/Cowork, Codex, Cursor, Antigravity, or any harness, from ONE source of truth.
- **Low-bloat** — the always-resident surface is ~2,000 tokens; the rest loads on demand. (The full framework is ~258k tokens — it does not even fit in a 200k window, so lazy-loading is mandatory, not optional.)
- **Governed & secured by default** — cost caps, action log, HITL gates, least privilege, secrets isolation, prompt-injection refusal.

---

## What it is

| Doc | Question | Size |
|-----|----------|------|
| **Portable core** (`CLAUDE.md` / `AGENTS.md` / `SKILL.md`) | the always-resident contract + router | ~2k tokens |
| **North Star Blueprint v6.5** | **HOW** to build — methodology, 14 Parts / 59 Sections | ~190k tokens (load per-Part) |
| **Master Build Framework v2.5** | **WHAT** to build with — 62 technology categories | ~40k tokens |
| **BRIDGE.md** | **NAVIGATE** — full routing tables | ~13k tokens |

Mnemonic: **NS = HOW · MBF = WHAT · BRIDGE = NAVIGATE.**

---

## Quick start

**Any harness:** put the right convention file at your project root and start.
- Anthropic (Claude Code/Desktop/Cowork): `CLAUDE.md`
- Codex / Cursor / Antigravity / OpenCode / Zed: `AGENTS.md`
- Skill marketplaces / `skills add`: `SKILL.md`
- No convention file: paste `dist/NBB_BOOTSTRAP.md` as context.

All four are GENERATED from `bootstrap/NBB_CORE.md` by `scripts/build_bootstrap.sh`
so they can never drift (verify with `bash scripts/build_bootstrap.sh --check`).
See `docs/PORTABILITY.md` for per-harness caveats.

The core gives you the contract, the ignition sequence, a mini-router, the load
rules, and the safety floor — enough to start almost any project without opening
the big docs. Load a Blueprint Part or MBF Category only when the router points
there.

---

## Repository structure

```
NBB/
  bootstrap/NBB_CORE.md          <- single source of truth (the always-resident core)
  bootstrap/context-budget.json  <- machine-readable per-Part token budgets
  CLAUDE.md  AGENTS.md  SKILL.md  <- GENERATED portable entry files (do not edit)
  dist/NBB_BOOTSTRAP.md          <- GENERATED single-file distributable
  BRIDGE.md                      <- navigation layer (v1.5)
  NORTH_STAR_BOOTSTRAP.md        <- deep ignition reference (v1.5)
  GLOBAL_IDE_RULES.md            <- cross-project IDE defaults (v1.5)
  north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.5.md   <- HOW (generated monolith)
  master-build-framework/MASTER_BUILD_FRAMEWORK_v2.5.md <- WHAT (generated monolith)
  .claude/skills/                <- 12 skills (portable SKILL.md spec)
  docs/PORTABILITY.md  docs/TOKENOMICS.md
  docs/protocols/                <- MCP / A2A / AG-UI / A2UI / ACP + memory backend
  docs/governance/               <- cost caps, permissions, secrets, local-first
  scripts/                       <- build_bootstrap.sh, merge_*_segments.sh, measure_context_budget.py
  superseded/                    <- prior v6.0 / v2.0 monoliths (provenance only)
  RECONCILIATION.md  CHANGELOG.md  SECURITY.md  CONTRIBUTING.md
```

Source is segmented for development (`projects/Segment Mods/...`); the monoliths
and portable files are generated. Edit segments / `NBB_CORE.md`, then run the
build scripts — never hand-edit a generated file.

---

## What's new in the NBB (.5) wave

- **Portable low-bloat bootstrap** — one source → `CLAUDE.md` / `AGENTS.md` / `SKILL.md` / `dist`, with an anti-drift `--check` gate. Always-resident footprint cut ~99% (measured).
- **Skills: 9 → 12** — `parallel-agent` modernized to Opus 4.8 dynamic workflows; `autoresearch` gained computer-use behavioral verification; new `computer-use-smoke`, `context-compression`, `understand-first`.
- **Interop protocols** — MCP / A2A / AG-UI / A2UI / ACP documented as optional layers + a swappable cross-harness memory backend (`docs/protocols/`).
- **Mechanical tokenomics** — measured per-Part budgets (`bootstrap/context-budget.json`) + lazy-load rules (`docs/TOKENOMICS.md`).
- **Governance & security** — cost caps + auto-throttle, immutable action log, HITL gates, least-privilege permissions, computer-use sandboxing, prompt-injection refusal, `op://`/Stripe-RAK secrets, fully-local path (`docs/governance/`).
- **Truth pass** — versions bumped to the .5 line; README/QUICK_START/MBF drifts fixed; canonical surface mojibake-clean. See `RECONCILIATION.md` for the evidence-cited baseline.

---

## Key differentiators

| Traditional | North Star |
|-------------|------------|
| Load everything into context | **Load balancing** — fetch only what you need |
| Execute until done or fail | **Confidence calibration** — pause when uncertain |
| Accumulate state indefinitely | **Self-cleaning** — scaffolding removes itself |
| Tool-first, then process | **Methodology-first** — process drives tool choice |
| Power without guardrails | **Governance co-equal with power** |

---

## Raw URLs for AI agents

```
CLAUDE.md (portable core):
https://raw.githubusercontent.com/Navigata1/NBB/main/CLAUDE.md
AGENTS.md (portable core):
https://raw.githubusercontent.com/Navigata1/NBB/main/AGENTS.md
dist/NBB_BOOTSTRAP.md (single-file drop-in):
https://raw.githubusercontent.com/Navigata1/NBB/main/dist/NBB_BOOTSTRAP.md
BRIDGE.md:
https://raw.githubusercontent.com/Navigata1/NBB/main/BRIDGE.md
NORTH_STAR_BLUEPRINT_v6.5.md:
https://raw.githubusercontent.com/Navigata1/NBB/main/north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.5.md
MASTER_BUILD_FRAMEWORK_v2.5.md:
https://raw.githubusercontent.com/Navigata1/NBB/main/master-build-framework/MASTER_BUILD_FRAMEWORK_v2.5.md
```

---

## License

Licensed under **Creative Commons Attribution-NonCommercial-ShareAlike 4.0
International** (CC BY-NC-SA 4.0).

- Share — copy and redistribute
- Adapt — remix, transform, build upon
- Attribution required · NonCommercial only · ShareAlike

"North Star Build" and "North Star Framework" are trademarks. The `design-taste`
skill adapts `leonxlnx/taste-skill`; other skills credit their upstreams in their
front-matter. For commercial licensing, contact the repository owner.

<p align="center"><strong>Build something remarkable.</strong><br>
<em>Created by @NavigatingTruth</em></p>
