#!/bin/bash

# Check if CHANGELOG.md exists
if [ ! -f CHANGELOG.md ]; then
  echo "Error: CHANGELOG.md file not found."
  exit 1
fi

# Find headers with "- In progress" and update them without creating a backup
# Detect the operating system and set the appropriate sed in-place flag
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i '' -E 's/^(# [0-9]+\.[0-9]+\.[0-9]+) - In progress/\1/' CHANGELOG.md
else
  # Linux and other Unix-like systems
  sed -i -E 's/^(# [0-9]+\.[0-9]+\.[0-9]+) - In progress/\1/' CHANGELOG.md
fi

# Inform the user
echo "Updated version headers by removing '- In progress'."