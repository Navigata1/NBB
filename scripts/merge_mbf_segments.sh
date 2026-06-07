#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────────
# MASTER BUILD FRAMEWORK — Segment Merge Script
#
# Merges the 4 development segments into the monolith distribution file:
# MASTER_BUILD_FRAMEWORK_v2.5.md
#
# Usage:
#   ./scripts/merge_mbf_segments.sh [output_file] [source_dir]
#
# Default output: master-build-framework/MASTER_BUILD_FRAMEWORK_v2.5.md
# Default source: projects/Segment Mods/MBF2.0- Segments
#
# This script is for DEVELOPMENT OPERATIONS — not for end users.
# End users receive the pre-built monolith file from the repository.
#
# See: MBF_SEGMENT_INDEX.md for segment structure
# ──────────────────────────────────────────────────────────────────────────────

set -euo pipefail

# ── Configuration ──
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_FILE="${1:-$REPO_ROOT/master-build-framework/MASTER_BUILD_FRAMEWORK_v2.5.md}"
SOURCE_DIR="${2:-$REPO_ROOT/projects/Segment Mods/MBF2.0- Segments}"

# Segment files in merge order
SEGMENTS=(
  "MBF_PART_1_CORE.md"
  "MBF_PART_2_DATA_AI.md"
  "MBF_PART_3_CONTENT_OPS.md"
  "MBF_PART_4_FOUNDATION.md"
)

# Lines to skip at the top of each segment (segment navigation header)
# Part 1 includes the MBF front matter, so we include more of it.
SKIP_LINES_FIRST=8
SKIP_LINES_REST=8

# ── Validation ──
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  Master Build Framework — Segment Merge                  ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

if [ ! -d "$SOURCE_DIR" ]; then
  echo "ERROR: Source directory not found: $SOURCE_DIR"
  echo ""
  echo "   Usage: ./scripts/merge_mbf_segments.sh [output_file] [source_dir]"
  exit 1
fi

MISSING=()
for seg in "${SEGMENTS[@]}"; do
  if [ ! -f "$SOURCE_DIR/$seg" ]; then
    MISSING+=("$seg")
  fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
  echo "❌ ERROR: Missing segment files:"
  for m in "${MISSING[@]}"; do
    echo "   → $m"
  done
  echo ""
  echo "   Check that source_dir contains all segment files."
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
  filepath="$SOURCE_DIR/$seg"
  line_count=$(wc -l < "$filepath")

  if [ "$i" -eq 0 ]; then
    # First segment: skip only the segment header, keep MBF front matter
    tail -n +$((SKIP_LINES_FIRST + 1)) "$filepath" >> "$OUTPUT_FILE"
    included=$((line_count - SKIP_LINES_FIRST))
    echo "  ✅ $seg (skipped $SKIP_LINES_FIRST header lines — $included lines included)"
  else
    # Subsequent segments: skip segment navigation header
    tail -n +$((SKIP_LINES_REST + 1)) "$filepath" >> "$OUTPUT_FILE"
    included=$((line_count - SKIP_LINES_REST))
    echo "  ✅ $seg (skipped $SKIP_LINES_REST header lines — $included lines included)"
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
echo "  2. Verify category numbering is continuous (1-62)"
echo "  3. Verify BRIDGE routing table matches category locations"
echo "  4. Commit to repository for distribution"
