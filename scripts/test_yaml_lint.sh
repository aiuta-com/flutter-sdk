#!/bin/bash

set -e

# Check lint of yamls
yamllint -d .yamllint/configuration.yaml .