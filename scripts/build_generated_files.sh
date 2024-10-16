#!/bin/bash

set -e

GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Generate lib
echo -e "${GREEN}Generate classes for /lib folder${NC}"
dart run build_runner build --build-filter="lib/**" --delete-conflicting-outputs

cd example

# Generate for example
echo -e "${GREEN}Generate classes for /example folder${NC}"
dart run build_runner build --delete-conflicting-outputs

echo -e "${GREEN}DONE!${NC}"
