#!/bin/bash

set -e

# Check if a pull request title is provided
if [ -z "$1" ]; then
  echo "Error: Pull request title is required as the first argument."
  exit 1
fi

# Check if a pull request URL is provided
if [ -z "$2" ]; then
  echo "Error: Pull request URL is required as the second argument."
  exit 1
fi

# Check if a pull request number is provided
if [ -z "$3" ]; then
  echo "Error: Pull request number is required as the third argument."
  exit 1
fi

PR_TITLE="$1"
PR_URL="$2"
PR_NUMBER="$3"
PR_ENTRY="* $PR_TITLE ([#${PR_NUMBER}]($PR_URL))"

# Process the CHANGELOG.md file
awk -v entry="$PR_ENTRY" '
BEGIN { found = 0 }
/^#/ && found == 0 {
  print $0
  print ""
  print entry
  found = 1
  next
}
found == 1 { found = 2; next }  # Skip the next line after inserting entry
{ print $0 }
' CHANGELOG.md > CHANGELOG_NEW.md

# Replace the old CHANGELOG.md with the updated one
mv CHANGELOG_NEW.md CHANGELOG.md

echo "Add new point to CHANGELOG.md - ([#${PR_NUMBER}]($PR_URL)): $PR_TITLE"