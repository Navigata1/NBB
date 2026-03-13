#!/bin/bash
# ──────────────────────────────────────────────────────────────
# PRE-WRITE HOOK — File protection
#
# Triggered before any file write operation.
# Blocks writes to protected files/directories.
# Receives the target file path as $1.
#
# North Star Framework: Hooks Architecture (NSB Part XI)
# ──────────────────────────────────────────────────────────────

set -euo pipefail

TARGET_FILE="${1:-}"

if [ -z "$TARGET_FILE" ]; then
  echo "⚠️  pre-write hook: no target file provided"
  exit 0
fi

# ── Protected paths ──
PROTECTED_PATTERNS=(
  "src/components/ui/"
  ".env"
  "package.json"
  "package-lock.json"
  "next.config"
  "vercel.json"
  "tsconfig.json"
  "prisma/schema.prisma"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$TARGET_FILE" == *"$pattern"* ]]; then
    echo ""
    echo "🛑 WRITE BLOCKED: $TARGET_FILE"
    echo "   This file is protected by pre-write hook."
    echo ""
    if [[ "$TARGET_FILE" == *"prisma/schema.prisma"* ]]; then
      echo "   → Schema changes require a plan.md entry first."
      echo "   → Create a migration plan, get approval, then modify."
    elif [[ "$TARGET_FILE" == *"package.json"* ]]; then
      echo "   → Dependency changes require explicit approval."
      echo "   → State the package, version, and reason in your plan."
    elif [[ "$TARGET_FILE" == *"src/components/ui/"* ]]; then
      echo "   → UI primitives are maintained separately."
      echo "   → Create new components in src/components/ instead."
    else
      echo "   → This file requires manual modification."
    fi
    exit 1
  fi
done

exit 0
