# Initial Setup
| **Target release** | 0.0.0 |
| --- | --- |
| **Document status** | **DRAFT** |
| **Document owner** | @owner |

## **Objective**

Provide templates and skeleton files for a bare project.

## **Requirements**

1. The following directories are checked into git with the specified placeholder/template files:
  - `prds/` — contains `000-template.md` (PRD template) and this file
  - `plans/` — contains `001-initial_setup.md` (the plan for this work; serves as the template example)
  - `research/` — contains `code-analysis.md` and `lessons.md`, each pre-populated with structured sections useful to agents
  - `scripts/` — contains `pre-commit.sh`
  - `docs/` — contains `.gitkeep`
1. Base example/template files exist to give agents a framework to follow in the future:
  - `prds/000-template.md` — blank PRD template with all standard sections
  - `plans/001-initial_setup.md` — first real plan; doubles as the plans template example
  - `research/code-analysis.md` — pre-populated with structured sections (architecture, components, data flow, etc.)
  - `research/lessons.md` — pre-populated with structured sections (patterns, anti-patterns, corrections log)
  - `Makefile` — with stubbed targets, `install-pre-commit`, and `help`
1. The following make targets are stubbed out — they print a descriptive message and exit 0:
  - `make lint`
  - `make coverage`
  - `make test`
1. `scripts/pre-commit.sh` runs `make lint`, `make coverage`, and `make test` in sequence; exits non-zero if any fail; file must be executable (`chmod +x`)
1. `make install-pre-commit` creates a symlink at `.git/hooks/pre-commit` pointing to `scripts/pre-commit.sh`
1. `make help` prints a summary of all available targets and what they do; this should be the default target (i.e. running `make` with no arguments shows help)

## **Open Questions**

| **Question** | **Answer** | **Date Answered** |
| --- | --- | --- |
| Where should `000-template.md` live — repo root or `prds/`? | `prds/` | 2026-03-13 |
| What placeholder format for `docs/` and `plans/`? | `docs/` gets `.gitkeep`; `plans/` gets the first real plan as its example | 2026-03-13 |
| Should `research/` files be empty or pre-structured? | Pre-populated with structured sections useful to agents | 2026-03-13 |
| Should the pre-commit hook be symlinked automatically or manually? | `make install-pre-commit` creates the symlink manually on demand | 2026-03-13 |

## **Out of Scope**

- Actual lint, test, or coverage tooling (stubs only for now)
- CI/CD configuration
- Project-specific code


## **Reference materials**
