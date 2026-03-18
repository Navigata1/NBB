#!/bin/bash
# Pre-write hook: Prevent direct edits to generated monolith files.
# Monoliths are generated from segments — edit segments instead, then run merge scripts.
# See CLAUDE.md for segment architecture details.

FILE="$1"

if [[ "$FILE" == *"north-star-blueprint/"* ]] || [[ "$FILE" == *"master-build-framework/"* ]] || [[ "$FILE" == *"NORTH_STAR_BLUEPRINT_v"* ]] || [[ "$FILE" == *"MASTER_BUILD_FRAMEWORK_v"* ]]; then
  echo "BLOCKED: Cannot edit monolith files directly."
  echo "  → Edit the corresponding segment in projects/Segment Mods/ instead."
  echo "  → Then run: bash scripts/merge_nsb_segments.sh (or merge_mbf_segments.sh)"
  echo "  → See CLAUDE.md for segment-to-monolith mapping."
  exit 1
fi
