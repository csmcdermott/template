#!/bin/bash
set -e

echo "Running pre-commit checks..."

echo ""
echo "==> make lint"
make lint

echo ""
echo "==> make coverage"
make coverage

echo ""
echo "==> make test"
make test

echo ""
echo "All pre-commit checks passed."
