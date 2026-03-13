#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────────
# NORTH STAR BLUEPRINT — Segment Merge Script
#
# Merges the 7 development segments (+ front matter) into the monolith
# distribution file: NORTH_STAR_BLUEPRINT_v6.1.md
#
# Usage:
#   ./scripts/merge_nsb_segments.sh [output_file]
#
# Default output: north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md
#
# This script is for DEVELOPMENT OPERATIONS — not for end users.
# End users receive the pre-built monolith file from the repository.
#
# See: NS_SEGMENT_INDEX.md for segment structure
# ──────────────────────────────────────────────────────────────────────────────

set -euo pipefail

# ── Configuration ──
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_FILE="${1:-$REPO_ROOT/north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md}"

# Segment files in merge order
SEGMENTS=(
  "00_FRONT_MATTER.md"
  "01_PART_I_FOUNDATION.md"
  "02_PART_II_PRIMITIVES.md"
  "03_PART_III_DOCUMENTATION.md"
  "04_PART_IV_AI_ORCHESTRATION.md"
  "05_PART_V_AGENT_COMPOSITION.md"
  "06_PART_VI_MCP_TOOLS.md"
  "07_PART_VII_DESIGN_MASTERY.md"
  "08_PART_VIII_CODE_ARCHITECTURE.md"
  "09_PART_IX_TESTING.md"
  "10_PART_X_SECURITY.md"
  "11_PART_XI_DEVOPS.md"
  "12_PART_XII_FUTURE_PROOFING.md"
  "13_PART_XIII_QUICK_REFERENCE.md"
)

# Lines to skip at the top of each segment (segment navigation header)
# The front matter (segment 0) is included in full.
SKIP_LINES=10

# ── Validation ──
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  North Star Blueprint — Segment Merge                   ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

MISSING=()
for seg in "${SEGMENTS[@]}"; do
  if [ ! -f "$REPO_ROOT/$seg" ]; then
    MISSING+=("$seg")
  fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
  echo "❌ ERROR: Missing segment files:"
  for m in "${MISSING[@]}"; do
    echo "   → $m"
  done
  echo ""
  echo "   Run from the repository root, or ensure all segments exist."
  exit 1
fi

# ── Ensure output directory exists ──
mkdir -p "$(dirname "$OUTPUT_FILE")"

# ── Merge ──
echo "Merging ${#SEGMENTS[@]} segments..."
echo ""

# Start with empty file
> "$OUTPUT_FILE"

for i in "${!SEGMENTS[@]}"; do
  seg="${SEGMENTS[$i]}"
  filepath="$REPO_ROOT/$seg"
  line_count=$(wc -l < "$filepath")

  if [ "$i" -eq 0 ]; then
    # Front matter: include in full
    cat "$filepath" >> "$OUTPUT_FILE"
    echo "  ✅ $seg (full — $line_count lines)"
  else
    # Other segments: skip the navigation header
    tail -n +$((SKIP_LINES + 1)) "$filepath" >> "$OUTPUT_FILE"
    included=$((line_count - SKIP_LINES))
    echo "  ✅ $seg (skipped $SKIP_LINES header lines — $included lines included)"
  fi

  # Add separator between segments
  echo "" >> "$OUTPUT_FILE"
  echo "---" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
done

# ── Report ──
TOTAL_LINES=$(wc -l < "$OUTPUT_FILE")
TOTAL_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)

echo ""
echo "──────────────────────────────────────────────────────────"
echo "✅ Merge complete"
echo "   Output:  $OUTPUT_FILE"
echo "   Lines:   $TOTAL_LINES"
echo "   Size:    $TOTAL_SIZE"
echo "──────────────────────────────────────────────────────────"
echo ""
echo "Next steps:"
echo "  1. Review the merged file for formatting issues"
echo "  2. Verify cross-references resolve correctly"
echo "  3. Commit to repository for distribution"
