#!/usr/bin/env bash
set -euo pipefail

# Start a local server in background
(cd site && hugo server -D --port 1313 >/tmp/hugo.log 2>&1 &) 
# Wait for server
for i in {1..15}; do
  if curl -sSf http://localhost:1313/ >/dev/null; then
    break
  fi
  sleep 1
done

# Check homepage contains Recent
curl -sSf http://localhost:1313/ | grep -q "Recent" || (echo "Missing 'Recent'" && exit 2)

echo "SMOKE: homepage OK"
