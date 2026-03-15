#!/bin/bash
echo "Running version check across all files in Segment Mods..."
# We expect OLD versions not to remain: v5.0, v1.1 (for BRIDGE), v6.0
# However, MBF 1.1 might be valid past history. But we can grep for common occurrences and review.

grep -rnw "projects/Segment Mods" -e "v5\.0" -e "v6\.0" --exclude-dir=".git" --exclude-dir="_quarantine*"
echo "Version check complete."
