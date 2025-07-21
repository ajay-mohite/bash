#!/bin/bash

# Usage check
if [[ $# -ne 2 || ( "$1" != "fast" && "$1" != "slow" ) ]]; then
  echo "Usage: $0 [fast|slow] <log_file>"
  exit 1
fi

# Arguments
mode="$1"
file="$2"

# Check file existence
if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' not found."
  exit 1
fi

# Set sort order
if [[ "$mode" == "slow" ]]; then
  sort_order="-nr"
else
  sort_order="-n"
fi

# Core processing logic
grep -E 'Started|Completed' "$file" \
| paste - - \
| awk -F'"' '{ sub(/.*in /, "", $3); sub(/ms.*/, "", $3); print $3 , $2 }' \
| sort $sort_order \
| head -1
