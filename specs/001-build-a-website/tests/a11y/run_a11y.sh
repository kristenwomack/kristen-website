#!/usr/bin/env bash
set -euo pipefail

# Build site
cd site
hugo -D

# Placeholder for a11y checks — recommend installing Pa11y or lighthouse-ci
if command -v pa11y >/dev/null 2>&1; then
  pa11y http://localhost:1313/
else
  echo "pa11y not installed — placeholder a11y check" && exit 0
fi
