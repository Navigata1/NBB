#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────────
# NORTH STAR BLUEPRINT — Segment Merge Script (Consolidated)
#
# Merges the 7 PART_* development segments into the monolith distribution file:
#   NORTH_STAR_BLUEPRINT_v6.5.md
#
# CONSOLIDATION NOTE (2026-03-18):
#   This script was rewritten to source from the 7-file PART_* scheme, which
#   is now the sole source of truth for Blueprint content. The previous 14-file
#   OG Originals scheme has been archived to _archived_OG_Originals/.
#   See HANDOFF.md for migration history.
#
# Usage:
#   ./scripts/merge_nsb_segments.sh [output_file] [source_dir]
#
# Default output: north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.5.md
# Default source: projects/Segment Mods/NSBP6.0 -Segments
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
OUTPUT_FILE="${1:-$REPO_ROOT/north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.5.md}"
SOURCE_DIR="${2:-$REPO_ROOT/projects/Segment Mods/NSBP6.0 -Segments}"

# The 7 PART_* files in merge order (sole source of truth)
SEGMENTS=(
  "PART_1_FOUNDATION.md"
  "PART_2_DOCUMENTATION.md"
  "PART_3_ORCHESTRATION.md"
  "PART_4_DESIGN.md"
  "PART_5_IMPLEMENTATION.md"
  "PART_6_QUALITY.md"
  "PART_7_ADVANCED.md"
)

# Each segment has an 8-line navigation header to strip:
#   Line 1: # NORTH STAR BLUEPRINT v6.5 — SEGMENT N of 7
#   Line 2: ## PART_N_NAME
#   Line 3: ### Contents: ...
#   Line 4: ### Lines: ...
#   Line 5: ---
#   Line 6: > **SEGMENT NAVIGATION:** ...
#   Line 7: > For BRIDGE routing: ...
#   Line 8: ---
HEADER_LINES=8

# ── Validation ──
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  North Star Blueprint — Segment Merge (7-file PART_*)   ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

if [ ! -d "$SOURCE_DIR" ]; then
  echo "ERROR: Source directory not found: $SOURCE_DIR"
  echo ""
  echo "   Usage: ./scripts/merge_nsb_segments.sh [output_file] [source_dir]"
  exit 1
fi

MISSING=()
for seg in "${SEGMENTS[@]}"; do
  if [ ! -f "$SOURCE_DIR/$seg" ]; then
    MISSING+=("$seg")
  fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
  echo "ERROR: Missing segment files:"
  for m in "${MISSING[@]}"; do
    echo "   -> $m"
  done
  echo ""
  echo "   Check that source_dir contains all 7 PART_* segment files."
  exit 1
fi

# ── Ensure output directory exists ──
mkdir -p "$(dirname "$OUTPUT_FILE")"

# ── Merge ──
echo "Merging ${#SEGMENTS[@]} segments from PART_* scheme..."
echo "Source: $SOURCE_DIR"
echo ""

# Start with empty file
> "$OUTPUT_FILE"

for i in "${!SEGMENTS[@]}"; do
  seg="${SEGMENTS[$i]}"
  filepath="$SOURCE_DIR/$seg"
  line_count=$(wc -l < "$filepath")

  # Strip the 8-line segment navigation header from every file
  tail -n +$((HEADER_LINES + 1)) "$filepath" >> "$OUTPUT_FILE"
  included=$((line_count - HEADER_LINES))
  echo "  [OK] $seg (skipped $HEADER_LINES header lines -- $included lines included)"

  # Add separator between segments (not after the last one)
  if [ "$i" -lt $((${#SEGMENTS[@]} - 1)) ]; then
    echo "" >> "$OUTPUT_FILE"
  fi
done

# ── Report ──
TOTAL_LINES=$(wc -l < "$OUTPUT_FILE")
TOTAL_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)

echo ""
echo "──────────────────────────────────────────────────────────"
echo "Merge complete"
echo "   Output:  $OUTPUT_FILE"
echo "   Lines:   $TOTAL_LINES"
echo "   Size:    $TOTAL_SIZE"
echo "──────────────────────────────────────────────────────────"
echo ""
echo "Next steps:"
echo "  1. Review the merged file for formatting issues"
echo "  2. Verify cross-references resolve correctly"
echo "  3. Commit to repository for distribution"
