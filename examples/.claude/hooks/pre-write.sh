#!/bin/bash
# ==============================================================================
# EXAMPLE PreToolUse(Write|Edit) hook - file protection (template)
#
# Smooth + clean by design: WARNS, does not block (exit 0) by default. Set
# NBB_STRICT_HOOKS=1 to turn the warning into a hard block (exit 2). Reads the
# Claude Code hook JSON from stdin (modern convention); falls back to $1; never
# errors on missing input. ASCII-only.
#
# North Star Framework: Hooks Architecture (NSB Part XI). Tune PROTECTED_PATTERNS
# to your project.
# ==============================================================================
set -uo pipefail

input="$(cat 2>/dev/null || true)"
file=""
if command -v python3 >/dev/null 2>&1 && [ -n "$input" ]; then
  file="$(printf '%s' "$input" | python3 -c 'import sys, json
try:
    print(json.load(sys.stdin).get("tool_input", {}).get("file_path", ""))
except Exception:
    print("")' 2>/dev/null || true)"
fi
[ -z "$file" ] && file="${1:-}"
[ -z "$file" ] && exit 0   # nothing to check; never error

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
  case "$file" in
    *"$pattern"*)
      msg="[hook] '$file' is a protected path."
      case "$file" in
        *prisma/schema.prisma*) msg="$msg Schema changes should go through a plan.md entry + migration." ;;
        *package.json*)         msg="$msg Dependency changes should be stated (package, version, reason) first." ;;
        *src/components/ui/*)   msg="$msg UI primitives are maintained separately; add new components under src/components/." ;;
        *.env*)                 msg="$msg Secrets belong in a vault (op://); never write values here." ;;
        *)                      msg="$msg Prefer a manual, reviewed change." ;;
      esac
      if [ "${NBB_STRICT_HOOKS:-0}" = "1" ]; then
        printf '%s\nBLOCKED (NBB_STRICT_HOOKS=1).\n' "$msg" >&2
        exit 2
      fi
      printf '%s\n' "$msg" >&2
      exit 0
      ;;
  esac
done
exit 0
