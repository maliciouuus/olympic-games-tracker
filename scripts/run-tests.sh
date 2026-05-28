#!/usr/bin/env bash
# run-tests.sh – Execute tests and copy JUnit reports to test-results/
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"

cd "$APP_DIR"

echo "════════════════════════════════════════════"
echo "  Angular – Olympic Games Tracker – Tests"
echo "════════════════════════════════════════════"

# Clean previous artifacts
rm -rf test-results/

npm ci --cache .npm --prefer-offline
npm test

# karma outputs to test-results/ (see karma.conf.js junitReporter.outputDir)
echo ""
echo "  ✅ Tests passés. Rapports JUnit : test-results/"
