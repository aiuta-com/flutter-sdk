#!/bin/bash

# Check if CHANGELOG.md exists
if [ ! -f CHANGELOG.md ]; then
  echo "Error: CHANGELOG.md file not found."
  exit 1
fi

# Get the latest version from CHANGELOG.md
latest_version=$(grep -oE '^# [0-9]+\.[0-9]+\.[0-9]+' CHANGELOG.md | head -n 1)

if [ -z "$latest_version" ]; then
  echo "Error: No version found in CHANGELOG.md."
  exit 1
fi

# Parse the major, minor, and patch numbers
IFS='.' read -r major minor patch <<< "$latest_version"

# Increment the patch version
new_version="$major.$minor.$((patch + 1))"

# Add the new version section at the top of CHANGELOG.md
{
  echo "$new_version - In progress"
  echo ""
  echo ""
  cat CHANGELOG.md
} > CHANGELOG_TEMP.md

# Replace the old CHANGELOG.md with the updated one
mv CHANGELOG_TEMP.md CHANGELOG.md

# Inform the user
echo "Added new version $new_version - In progress at the top of CHANGELOG.md."