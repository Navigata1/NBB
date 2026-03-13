#!/bin/bash
# ──────────────────────────────────────────────────────────────
# STOP HOOK — Prevent runaway execution
#
# Triggered when the agent completes a task or reaches a checkpoint.
# Enforces project invariants before allowing the session to continue.
#
# North Star Framework: Hooks Architecture (NSB Part XI)
# ──────────────────────────────────────────────────────────────

set -euo pipefail

ERRORS=()

# ── Check 1: TypeScript compilation ──
echo "🔍 Running TypeScript check..."
if ! npx tsc --noEmit --pretty 2>/dev/null; then
  ERRORS+=("TypeScript compilation errors detected")
fi

# ── Check 2: Linting ──
echo "🔍 Running linter..."
if ! npm run lint --silent 2>/dev/null; then
  ERRORS+=("Lint errors detected")
fi

# ── Check 3: Prisma schema validity ──
echo "🔍 Validating Prisma schema..."
if ! npx prisma validate 2>/dev/null; then
  ERRORS+=("Prisma schema validation failed")
fi

# ── Check 4: No .env modifications ──
if git diff --name-only 2>/dev/null | grep -q "^\.env"; then
  ERRORS+=("BLOCKED: .env file was modified — revert before continuing")
fi

# ── Check 5: No oversized files committed ──
LARGE_FILES=$(find src/ -name "*.ts" -o -name "*.tsx" | xargs wc -l 2>/dev/null | awk '$1 > 500 {print $2}' | head -5)
if [ -n "$LARGE_FILES" ]; then
  ERRORS+=("Warning: Files exceeding 500 lines: $LARGE_FILES — consider splitting")
fi

# ── Report ──
if [ ${#ERRORS[@]} -gt 0 ]; then
  echo ""
  echo "❌ STOP HOOK FAILED — Resolve before continuing:"
  for err in "${ERRORS[@]}"; do
    echo "   → $err"
  done
  exit 1
else
  echo "✅ All checks passed"
  exit 0
fi
