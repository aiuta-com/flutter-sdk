#!/bin/bash

set -e

# Check lint of yamls
yamllint --strict -d .yamllint/configuration.yaml .