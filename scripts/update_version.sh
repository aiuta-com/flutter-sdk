#!/bin/bash

# Script to update the version in pubspec.yaml

# Check if version argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <new_version>"
  exit 1
fi

NEW_VERSION=$1

# File to update
PUBSPEC_FILE="pubspec.yaml"

# Check if pubspec.yaml file exists
if [ ! -f "$PUBSPEC_FILE" ]; then
  echo "Error: $PUBSPEC_FILE not found!"
  exit 1
fi

# Use sed to update the version in the pubspec.yaml file without creating a backup
sed -i -e "s/^version: .*/version: $NEW_VERSION/" "$PUBSPEC_FILE"

# Check if sed command was successful
if [ $? -eq 0 ]; then
  echo "Version updated to $NEW_VERSION in $PUBSPEC_FILE"
else
  echo "Error updating version in $PUBSPEC_FILE"
  exit 1
fi