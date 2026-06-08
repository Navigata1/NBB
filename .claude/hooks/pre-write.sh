#!/bin/bash
# PreToolUse(Write|Edit) hook for NBB.
# Purpose: gently remind that the Blueprint/MBF MONOLITHS are GENERATED from
# segments (edit the segment, then run scripts/merge_*_segments.sh).
#
# Design goals (smooth + clean): ALWAYS succeeds (exit 0) by default - it warns,
# it does not block. Reads the Claude Code hook JSON from stdin (the modern
# convention) and degrades gracefully if python3 is missing or input is empty.
# Set NBB_STRICT_HOOKS=1 to turn the reminder into a hard block (exit 2).
set -uo pipefail

input="$(cat 2>/dev/null || true)"
file=""
if command -v python3 >/dev/null 2>&1; then
  file="$(printf '%s' "$input" | python3 -c 'import sys, json
try:
    d = json.load(sys.stdin)
    print(d.get("tool_input", {}).get("file_path", ""))
except Exception:
    print("")' 2>/dev/null || true)"
fi

case "$file" in
  *north-star-blueprint/*|*master-build-framework/*|*NORTH_STAR_BLUEPRINT_v*|*MASTER_BUILD_FRAMEWORK_v*)
    msg="[NBB] '$file' is a GENERATED monolith. Prefer editing the segment in 'projects/Segment Mods/' then 'bash scripts/merge_nsb_segments.sh' (or merge_mbf_segments.sh). See CLAUDE.md."
    if [ "${NBB_STRICT_HOOKS:-0}" = "1" ]; then
      printf '%s\nBLOCKED (NBB_STRICT_HOOKS=1).\n' "$msg" >&2
      exit 2
    fi
    printf '%s\n' "$msg" >&2
    exit 0
    ;;
esac
exit 0
