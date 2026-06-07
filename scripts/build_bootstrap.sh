#!/bin/bash
# ==============================================================================
# NBB — Portable Bootstrap Builder
#
# Generates the portable entry surface from ONE source of truth so the copies
# can never drift:
#
#   bootstrap/NBB_CORE.md  ->  CLAUDE.md          (Anthropic harnesses)
#                          ->  AGENTS.md          (portable: Codex/Cursor/etc.)
#                          ->  SKILL.md           (skills-add / marketplace)
#                          ->  dist/NBB_BOOTSTRAP.md (single distributable)
#
# Usage:
#   bash scripts/build_bootstrap.sh           # generate the 4 outputs
#   bash scripts/build_bootstrap.sh --check   # verify outputs match a fresh
#                                             # build; exit 1 on drift (CI gate)
#
# Deterministic: each output embeds sha256(core body), never a wall-clock date,
# so --check is stable. ASCII-only output (mojibake-safe).
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CORE="$REPO_ROOT/bootstrap/NBB_CORE.md"

CHECK_MODE=0
[ "${1:-}" = "--check" ] && CHECK_MODE=1

if [ ! -f "$CORE" ]; then
  echo "ERROR: source not found: $CORE" >&2
  exit 1
fi

# --- Extract the body: drop the leading build-comment (through first '-->')
#     and drop the trailing NBB_CORE_BODY_END marker line. ---
BODY="$(sed '1,/-->/d' "$CORE" | sed '/NBB_CORE_BODY_END/d')"

# --- Deterministic provenance stamp = short sha256 of the body ---
if command -v shasum >/dev/null 2>&1; then
  SHA8="$(printf '%s' "$BODY" | shasum -a 256 | cut -c1-8)"
else
  SHA8="$(printf '%s' "$BODY" | sha256sum | cut -c1-8)"
fi

banner() {
  cat <<EOF
<!-- GENERATED FILE - DO NOT EDIT. Source: bootstrap/NBB_CORE.md (sha256:$SHA8).
     Regenerate: bash scripts/build_bootstrap.sh   Verify: bash scripts/build_bootstrap.sh --check -->
EOF
}

# --- Renderers (each = header + banner + shared body [+ harness notes]) ---

render_claude() {
  echo "# CLAUDE.md"
  banner
  cat <<'EOF'

> **Anthropic harnesses** (Claude Code, Claude Desktop, Claude Cowork, Claude
> Code web). Auto-loaded as project context. Skills live in `.claude/skills/`,
> slash-commands in `.claude/commands/`, settings in `.claude/settings.json`.
> Harness caveats: `docs/PORTABILITY.md`.

EOF
  printf '%s\n' "$BODY"
}

render_agents() {
  echo "# AGENTS.md"
  banner
  cat <<'EOF'

> **Portable agent entry** (Codex, Cursor, Antigravity, OpenCode, Zed, Gemini
> CLI, and any harness honoring the AGENTS.md convention). This is the same
> contract as `CLAUDE.md`, generated from the same source. For multi-agent
> ownership/locking rules see `docs/MULTI_AGENT_COORDINATION.md`. Harness
> caveats (config-folder, agents-window, file-targeting): `docs/PORTABILITY.md`.

EOF
  printf '%s\n' "$BODY"
}

render_skill() {
  cat <<EOF
---
name: north-star
description: AI-native software-development methodology (North Star / NBB). Use to bootstrap a new project, classify its tier, choose architecture/stack/tools, enforce quality gates, and route to the Blueprint (HOW), Master Build Framework (WHAT), or BRIDGE (navigate). Applies the safety floor (hard stops, blast-radius tiers, least-privilege permissions) and the load-balancing/tokenomics rules. Portable across Claude Code/Desktop, Codex, Cursor, and Antigravity. Do NOT use for unrelated one-off code edits that need no methodology.
license: CC BY-NC-SA-4.0
metadata:
  source: bootstrap/NBB_CORE.md
  sha256: $SHA8
---
EOF
  banner
  echo
  printf '%s\n' "$BODY"
}

render_dist() {
  echo "# North Star - Distributable Bootstrap (NBB)"
  banner
  printf '%s\n' "$BODY"
  cat <<'EOF'

---

## Appendix: install into a harness

- **Claude Code / Desktop / Cowork:** place `CLAUDE.md` at the project (or repo)
  root. Add the framework skill with `skills add` pointing at `SKILL.md`.
- **Codex / Cursor / Antigravity / OpenCode / Zed:** place `AGENTS.md` at the
  project root (Codex targets `AGENTS.md`; Cursor 3 reads it in the Agents
  Window; Antigravity 2 uses its config folder - see `docs/PORTABILITY.md`).
- **Skill marketplaces / `skills add`:** use `SKILL.md` (front-matter wrapper).
- **Single-file drop-in:** this `dist/NBB_BOOTSTRAP.md` is self-contained; paste
  it as a system/context file in any harness that lacks a convention file.

## Appendix: load deeper on demand

This bootstrap is Tier 1 (always resident). Load Tier 2/3 only when the router
points there: `BRIDGE.md` (full navigation), `NORTH_STAR_BLUEPRINT_v6.5.md`
(methodology), `MASTER_BUILD_FRAMEWORK_v2.5.md` (technology). Never load the
Blueprint and MBF in full at the same time.
EOF
}

# --- Output targets ---
declare -a NAMES=("CLAUDE.md" "AGENTS.md" "SKILL.md" "dist/NBB_BOOTSTRAP.md")
render_for() {
  case "$1" in
    "CLAUDE.md") render_claude ;;
    "AGENTS.md") render_agents ;;
    "SKILL.md") render_skill ;;
    "dist/NBB_BOOTSTRAP.md") render_dist ;;
  esac
}

if [ "$CHECK_MODE" -eq 1 ]; then
  echo "NBB bootstrap --check (source sha256:$SHA8)"
  drift=0
  for name in "${NAMES[@]}"; do
    target="$REPO_ROOT/$name"
    if [ ! -f "$target" ]; then
      echo "  DRIFT: missing $name"; drift=1; continue
    fi
    if diff -q <(render_for "$name") "$target" >/dev/null 2>&1; then
      echo "  ok: $name"
    else
      echo "  DRIFT: $name differs from a fresh build"; drift=1
    fi
  done
  if [ "$drift" -ne 0 ]; then
    echo "FAIL: regenerate with 'bash scripts/build_bootstrap.sh'" >&2
    exit 1
  fi
  echo "PASS: all generated files match the source."
  exit 0
fi

# --- Generate ---
mkdir -p "$REPO_ROOT/dist"
echo "NBB bootstrap build (source sha256:$SHA8)"
for name in "${NAMES[@]}"; do
  target="$REPO_ROOT/$name"
  render_for "$name" > "$target"
  lines=$(wc -l < "$target" | tr -d ' ')
  bytes=$(wc -c < "$target" | tr -d ' ')
  printf '  wrote %-24s %5s lines  %6s bytes\n' "$name" "$lines" "$bytes"
done

# --- Footprint report (the "tiny always-resident" claim, measured) ---
core_bytes=$(wc -c < "$CORE" | tr -d ' ')
approx_tokens=$(( core_bytes / 4 ))
echo "----------------------------------------------------------------"
echo "Always-resident core: $core_bytes bytes (~$approx_tokens tokens, ~$(( approx_tokens * 100 / 200000 ))% of a 200k window)"
echo "Build complete."
