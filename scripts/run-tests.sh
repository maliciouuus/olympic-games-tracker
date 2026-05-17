#!/usr/bin/env bash
# run-tests.sh – Execute Angular test suite and report results.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"

echo "════════════════════════════════════════════"
echo "  Angular – Olympic Games Tracker – Tests"
echo "════════════════════════════════════════════"

cd "$APP_DIR"
npm ci --cache .npm --prefer-offline
npm test

echo ""
echo "  ✅ Tests passés."
