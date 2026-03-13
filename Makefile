# Makefile
#
# Targets:
#   help              - Show this help message (default)
#   lint              - Run linters (stub — configure for your project)
#   test              - Run test suite (stub — configure for your project)
#   coverage          - Run tests with coverage reporting (stub — configure for your project)
#   install-pre-commit - Install the pre-commit hook via symlink

.PHONY: help lint test coverage install-pre-commit

help:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  help               Show this help message (default)"
	@echo "  lint               Run linters"
	@echo "  test               Run test suite"
	@echo "  coverage           Run tests with coverage reporting"
	@echo "  install-pre-commit Install pre-commit hook (symlink scripts/pre-commit.sh)"
	@echo ""

lint:
	@echo "Running lint checks..."
	@echo "No linter configured yet. Add your lint tooling here (e.g. cargo clippy, eslint)."

test:
	@echo "Running tests..."
	@echo "No test runner configured yet. Add your test tooling here (e.g. cargo test, jest)."

coverage:
	@echo "Running coverage checks..."
	@echo "No coverage tool configured yet. Add your coverage tooling here (e.g. cargo tarpaulin, istanbul)."

install-pre-commit:
	@echo "Installing pre-commit hook..."
	ln -sf $(CURDIR)/scripts/pre-commit.sh .git/hooks/pre-commit
	@echo "Pre-commit hook installed at .git/hooks/pre-commit -> $(CURDIR)/scripts/pre-commit.sh"
