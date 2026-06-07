# PORTABILITY.md — Harness Load Guide & Caveats

> How NBB (Northstar Boot-strap edition) loads across agentic harnesses, and the
> honest verification status of each. ASCII-only (mojibake-safe).
>
> **Honesty note (per house values):** Where a June-2026 harness detail could
> not be verified in this build environment, it is marked **UNVERIFIED** rather
> than asserted. Live multi-harness validation (actually launching each tool and
> confirming auto-load) is **DEFERRED** — it cannot be performed from the build
> environment used to produce this edition. Confirm against each tool's current
> docs before relying on the auto-load column.

---

## 1. The generation model (why these files never drift)

One source -> four artifacts, by `scripts/build_bootstrap.sh`:

```
bootstrap/NBB_CORE.md
   |-- CLAUDE.md             (Anthropic harnesses)
   |-- AGENTS.md             (portable convention)
   |-- SKILL.md              (skills-add / marketplace front-matter)
   '-- dist/NBB_BOOTSTRAP.md (single self-contained drop-in)
```

Each generated file carries a `sha256` of the core in its banner. The anti-drift
gate is `bash scripts/build_bootstrap.sh --check` (exit 1 if any copy differs
from a fresh build). Run it in CI and pre-commit. **Never hand-edit the four
generated files — edit `bootstrap/NBB_CORE.md` and rebuild.**

---

## 2. Per-harness load matrix

| Harness | Convention file | Load location | Auto-load status | Caveat |
|---------|-----------------|---------------|------------------|--------|
| Claude Code (CLI) | `CLAUDE.md` | project / repo root | **Verified** (established) | Skills in `.claude/skills/`; commands in `.claude/commands/`; perms in `.claude/settings.json`. |
| Claude Desktop | `CLAUDE.md` + Skill | project folder / skill | **Expected** | Desktop loads project context + installed Skills; add via `skills add` -> `SKILL.md`. |
| Claude Cowork | Skill (`SKILL.md`) | installed skill | **UNVERIFIED** | Confirm Cowork's skill-install path; fall back to pasting `dist/NBB_BOOTSTRAP.md`. |
| Claude Code (web) | `CLAUDE.md` | repo root | **Expected** | Same convention as CLI; MCP/skills availability may differ in headless runs. |
| Codex (desktop/CLI) | `AGENTS.md` | repo root (and nested) | **Expected** (Codex targets AGENTS.md) | Codex reads the nearest `AGENTS.md`; keep root copy authoritative. |
| Cursor 3 | `AGENTS.md` | repo root / Agents Window | **UNVERIFIED** | Cursor 3 "Agents Window" behavior not verifiable here; legacy `.cursorrules` may also apply. Confirm current docs. |
| Antigravity 2 | config folder | tool config dir | **UNVERIFIED** | Antigravity 2.0 reportedly uses a config-folder convention that differs from a root file; you may need to point it at `dist/NBB_BOOTSTRAP.md`. Confirm current docs. |
| OpenCode / Zed / Gemini CLI | `AGENTS.md` | repo root | **Expected** | These honor the AGENTS.md convention; behavior varies by version. |
| Any harness w/o a convention | `dist/NBB_BOOTSTRAP.md` | paste as system/context | **Verified** (manual) | Self-contained single file; always works as a manual drop-in. |

Legend: **Verified** = confirmed established behavior. **Expected** = follows a
documented, stable convention but not launch-tested in this build. **UNVERIFIED**
= forward-looking/tool-specific detail not confirmable here.

---

## 3. What was verified vs. deferred (honest scope)

**Verified in this build:**
- The four files generate from one source and are byte-identical to a fresh
  build (`--check` PASS).
- All generated files are mojibake-clean (0x C3A2 scan = 0; U+FFFD = 0).
- The always-resident core footprint is small (measured ~7.7 KB / ~1.9k tokens),
  a small fraction of any modern context window.
- `SKILL.md` carries valid front-matter (`name`, `description`, `license`).

**Deferred (cannot be done from this environment):**
- Launching Claude Desktop/Cowork, Codex desktop, Antigravity 2, and Cursor 3 to
  confirm each actually auto-loads its convention file and self-describes.
- Marketplace ingestion test of `SKILL.md` via a live `skills add`.

---

## 4. Self-validation checklist (run in each target harness)

1. Drop the right file (table above) at the expected location.
2. Start a fresh session and ask the agent: *"What is your operating contract and
   how do you load deeper framework parts?"* — it should answer from Section 1
   and Section 4 of the core WITHOUT loading the Blueprint/MBF.
3. Ask: *"Where do I route a request about authentication?"* — it should answer
   from the mini-router (Blueprint Part X Sec 47 + MBF Category 50) without
   opening BRIDGE.
4. Confirm it refuses `--dangerously-skip-permissions` and classifies blast
   radius before any Tier 3+ action (Section 5).
5. Record the result and harness version in this file's matrix.
