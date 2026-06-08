#!/bin/bash
# ==============================================================================
# EXAMPLE Stop hook - project invariants (template)
#
# Smooth + clean by design: every check is GUARDED (skips cleanly if the tool or
# config is absent - a missing tool is "not necessary here", never an error) and
# the hook WARNS without blocking (exit 0) by default. Set NBB_STRICT_HOOKS=1 to
# make real failures block (exit 2). ASCII-only.
#
# North Star Framework: Hooks Architecture (NSB Part XI). Tune to your stack.
# ==============================================================================
set -uo pipefail

issues=()
have() { command -v "$1" >/dev/null 2>&1; }

# Check 1: TypeScript - only if tsconfig + npx exist
if [ -f tsconfig.json ] && have npx; then
  echo "[hook] tsc --noEmit ..."
  npx --no-install tsc --noEmit --pretty false >/dev/null 2>&1 || issues+=("TypeScript errors")
else
  echo "[hook] skip tsc (no tsconfig.json / npx) - not necessary here"
fi

# Check 2: Lint - only if package.json declares a lint script
if [ -f package.json ] && have npm && grep -q '"lint"' package.json 2>/dev/null; then
  echo "[hook] npm run lint ..."
  npm run lint --silent >/dev/null 2>&1 || issues+=("Lint errors")
else
  echo "[hook] skip lint (no lint script) - not necessary here"
fi

# Check 3: Prisma - only if a schema exists
if [ -f prisma/schema.prisma ] && have npx; then
  echo "[hook] prisma validate ..."
  npx --no-install prisma validate >/dev/null 2>&1 || issues+=("Prisma schema invalid")
else
  echo "[hook] skip prisma (no schema) - not necessary here"
fi

# Check 4: .env never modified (advisory)
if git diff --name-only 2>/dev/null | grep -qE '^\.env'; then
  issues+=(".env was modified - secrets belong in a vault (op://)")
fi

# Report
if [ ${#issues[@]} -gt 0 ]; then
  printf '[hook] attention:\n' >&2
  for i in "${issues[@]}"; do printf '  - %s\n' "$i" >&2; done
  [ "${NBB_STRICT_HOOKS:-0}" = "1" ] && { echo "BLOCKED (NBB_STRICT_HOOKS=1)." >&2; exit 2; }
  exit 0   # non-blocking by default
fi
echo "[hook] all applicable checks passed"
exit 0
