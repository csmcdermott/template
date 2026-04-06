# Show this help message (default)
help:
    @echo ""
    @echo "Usage: just <recipe>"
    @echo ""
    @echo "Recipes:"
    @echo "  help               Show this help message (default)"
    @echo "  lint               Run linters"
    @echo "  test               Run test suite"
    @echo "  coverage           Run tests with coverage reporting"
    @echo "  install-pre-push   Install pre-push hook (symlink scripts/pre-push.sh)"
    @echo ""

# Run linters
lint:
    @echo "Running lint checks..."
    @echo "No linter configured yet. Add your lint tooling here (e.g. cargo clippy, eslint)."

# Run test suite
test:
    @echo "Running tests..."
    @echo "No test runner configured yet. Add your test tooling here (e.g. cargo test, jest)."

# Run tests with coverage reporting
coverage:
    @echo "Running coverage checks..."
    @echo "No coverage tool configured yet. Add your coverage tooling here (e.g. cargo tarpaulin, istanbul)."

# Install pre-push hook (symlink scripts/pre-push.sh)
install-pre-push:
    @echo "Installing pre-push hook..."
    ln -sf {{justfile_directory()}}/scripts/pre-push.sh .git/hooks/pre-push
    @echo "Pre-push hook installed at .git/hooks/pre-push -> {{justfile_directory()}}/scripts/pre-push.sh"
