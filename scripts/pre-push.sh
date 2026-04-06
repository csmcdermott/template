#!/bin/bash
set -e

echo "Running pre-push checks..."

echo ""
echo "==> just lint"
just lint

echo ""
echo "==> just coverage"
just coverage

echo ""
echo "==> just test"
just test

echo ""
echo "All pre-push checks passed."
