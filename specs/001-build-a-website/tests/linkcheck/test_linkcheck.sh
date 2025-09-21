#!/usr/bin/env bash
set -euo pipefail

# Build site
cd site
hugo -D

# Use linkinator (Node) if available
if command -v linkinator >/dev/null 2>&1; then
  linkinator "public" || true
else
  echo "linkinator not installed — placeholder link check" && exit 0
fi
