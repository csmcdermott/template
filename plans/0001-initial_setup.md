# Plan: Initial Setup
| **PRD** | [prds/0001-initial_setup.md](../prds/0001-initial_setup.md) |
| --- | --- |
| **Status** | IN PROGRESS |
| **Target release** | 0.0.0 |

## Objective

Scaffold the template repository with placeholder directories, template files, structured research stubs, a Makefile, and a pre-commit hook — so that any project cloned from this template has a consistent, agent-friendly starting point.

---

## Current State

| File / Directory | Exists? | Notes |
| --- | --- | --- |
| `CLAUDE.md` | ✅ | Points to `AGENTS.md` |
| `GEMINI.md` | ✅ | Points to `AGENTS.md` |
| `AGENTS.md` | ✅ | Full agent instructions |
| `prds/0000-template.md` | ✅ | Blank PRD template |
| `prds/0001-initial_setup.md` | ✅ | The PRD for this work |
| `plans/0001-initial_setup.md` | ✅ | This file |
| `research/code-analysis.md` | ⚠️ | Exists but empty — needs structured content |
| `research/lessons.md` | ⚠️ | Exists but empty — needs structured content |
| `docs/.gitkeep` | ❌ | Missing |
| `Makefile` | ❌ | Missing |
| `scripts/pre-commit.sh` | ❌ | Missing |

---

## Implementation Plan

### Phase 1: Populate `research/code-analysis.md`

This file is read by agents before planning any changes (per `AGENTS.md`). It must have enough structure that an agent can fill it in incrementally as they learn the codebase, and that a fresh agent can quickly orient themselves.

**Sections to include:**

- **Project Overview** — name, purpose, target release, last updated
- **Tech Stack** — languages, frameworks, key libraries (filled in per-project)
- **Architecture Overview** — high-level description of how the system is structured; placeholder for a diagram or ASCII art
- **Directory Structure** — annotated tree of top-level directories
- **Core Components** — table of key components with a one-line description each
- **Data Flow** — description of how data moves through the system (e.g., request → handler → service → DB)
- **External Integrations** — third-party APIs, services, or SDKs in use
- **Key Interfaces / API Surface** — link to `docs/` OpenAPI spec or describe internal interfaces
- **Known Issues / Technical Debt** — running list with dates
- **Recently Changed Areas** — updated during implementation; helps agents avoid stale assumptions
- **Last Updated** — timestamp

Each section should have a brief instruction comment so the first agent to populate it knows what to write.

---

### Phase 2: Populate `research/lessons.md`

This file supports the self-improvement loop: agents log corrections and patterns here so they don't repeat mistakes. It must be structured enough to be scannable at session start.

**Sections to include:**

- **How to Use This File** — brief instructions: when to write, when to read
- **Correction Log** — table with columns: Date, What Went Wrong, Rule Learned
- **Patterns to Follow** — bulleted list of confirmed good approaches for this project
- **Anti-Patterns to Avoid** — bulleted list of things that have caused problems
- **Project-Specific Gotchas** — one-off facts that are easy to forget (e.g., a quirky build step, a non-obvious dependency)

---

### Phase 3: Create `docs/.gitkeep`

Create an empty `.gitkeep` file so the `docs/` directory is tracked by git. Git does not track empty directories, so without this file the directory would not be committed.

---

### Phase 4: Create `Makefile`

The Makefile must have five targets. Three are stubs; two are functional.

**`lint`, `coverage`, `test` (stubs):**
- Each prints a descriptive message explaining what the target will eventually do
- Each exits 0 (success)
- Decorated with `.PHONY` so Make never looks for files named `lint`, `coverage`, or `test`

**`install-pre-commit` (functional):**
- Creates a symlink at `.git/hooks/pre-commit` pointing to `scripts/pre-commit.sh`
- Uses `$(CURDIR)` (Make's built-in absolute path to the directory where make was invoked) for the symlink target — this makes the symlink absolute and portable regardless of where the hook is invoked from
- Command: `ln -sf $(CURDIR)/scripts/pre-commit.sh .git/hooks/pre-commit`
- Prints a confirmation message on success
- Decorated with `.PHONY`

**`help` (functional, default target):**
- Listed first in the Makefile so that `make` with no arguments shows help
- Prints a formatted summary of every target and a one-line description of what it does
- Decorated with `.PHONY`
- Implementation: use `@echo` lines or a self-documenting pattern (e.g. `##` comments parsed by awk) — either is acceptable; clarity is the goal

**Makefile header:**
- Include a brief comment block at the top explaining each target, so a developer (or agent) understands the file at a glance

---

### Phase 5: Create `scripts/pre-commit.sh`

**Behavior:**
- Runs `make lint`, `make coverage`, and `make test` in sequence
- If any command exits non-zero, the script exits immediately with a non-zero code, blocking the commit
- Prints a clear status message before each step and a final "all checks passed" on success

**Implementation details:**
- Shebang: `#!/bin/bash`
- Use `set -e` so any unexpected failure also aborts immediately (defense in depth)
- The script must be executable: `chmod +x scripts/pre-commit.sh`
  - This must be done as part of creating the file; it is **not** enough to just create the file — git must track the executable bit

**Important — git executable bit:**
- After `chmod +x`, the executable bit must be staged: `git add scripts/pre-commit.sh` captures the mode
- Verify with `git ls-files --stage scripts/pre-commit.sh` — mode should be `100755`, not `100644`

---

### Phase 6: Verification

Before marking the plan complete, verify every requirement from the PRD:

1. **Directories in git**: Confirm `prds/`, `plans/`, `research/`, `scripts/`, `docs/` all have tracked files via `git status` or `git ls-files`
2. **Template files present**: Confirm each required file exists with content
3. **`make lint`**: Run it; confirm it prints a message and exits 0
4. **`make coverage`**: Same
5. **`make test`**: Same
6. **`make install-pre-commit`**: Run it; confirm `.git/hooks/pre-commit` symlink is created and points to the correct absolute path
7. **Pre-commit script executable**: Confirm `ls -la scripts/pre-commit.sh` shows `x` bit; confirm `git ls-files --stage` shows mode `100755`
8. **Pre-commit script runs**: Execute `bash scripts/pre-commit.sh` directly; confirm it runs all three targets and exits 0
9. **Pre-commit hook fires on commit**: Run `git commit --allow-empty -m "test hook"` (then reset) to confirm the hook triggers

---

### Phase 7: Commit

Stage all new and modified files and create the initial commit. Commit message should reflect that this is the v0.0.0 template scaffold.

Files to stage:
- `research/code-analysis.md`
- `research/lessons.md`
- `docs/.gitkeep`
- `Makefile`
- `scripts/pre-commit.sh`
- `plans/0001-initial_setup.md` (this file)
- Any already-staged files from earlier sessions (`CLAUDE.md`, `GEMINI.md`, `AGENTS.md`, `prds/`)

---

## Review

Implemented 2026-03-13. All requirements from PRD 001 verified:

- All five directories tracked in git with appropriate placeholder/template files
- `research/code-analysis.md` and `research/lessons.md` populated with structured sections
- `Makefile` has five targets: `help` (default), `lint`, `test`, `coverage` (stubs), `install-pre-commit` (functional)
- `make help` is the default target; `make` with no args shows all targets
- `scripts/pre-commit.sh` is executable (`100755`), runs all three check targets in sequence
- `make install-pre-commit` correctly creates an absolute symlink at `.git/hooks/pre-commit`
- Pre-commit hook confirmed firing on `git commit` end-to-end

---

## Checklist

### Phase 1 — `research/code-analysis.md`
- [x] Add Project Overview section with placeholder fields
- [x] Add Tech Stack section
- [x] Add Architecture Overview section
- [x] Add Directory Structure section
- [x] Add Core Components section
- [x] Add Data Flow section
- [x] Add External Integrations section
- [x] Add Key Interfaces / API Surface section
- [x] Add Known Issues / Technical Debt section
- [x] Add Recently Changed Areas section
- [x] Add Last Updated timestamp

### Phase 2 — `research/lessons.md`
- [x] Add How to Use This File section
- [x] Add Correction Log table
- [x] Add Patterns to Follow section
- [x] Add Anti-Patterns to Avoid section
- [x] Add Project-Specific Gotchas section

### Phase 3 — `docs/.gitkeep`
- [x] Create `docs/.gitkeep`

### Phase 4 — `Makefile`
- [x] Add file header comment block
- [x] Add `.PHONY` declaration for all five targets
- [x] Add `help` as the default target (first in file) with all target descriptions
- [x] Add `lint` stub target
- [x] Add `coverage` stub target
- [x] Add `test` stub target
- [x] Add `install-pre-commit` functional target using `$(CURDIR)`

### Phase 5 — `scripts/pre-commit.sh`
- [x] Create `scripts/pre-commit.sh` with shebang and `set -e`
- [x] Add `make lint` step with status output
- [x] Add `make coverage` step with status output
- [x] Add `make test` step with status output
- [x] Add final "all checks passed" message
- [x] Run `chmod +x scripts/pre-commit.sh`
- [x] Verify `git ls-files --stage` shows mode `100755`

### Phase 6 — Verification
- [x] All required directories have tracked files (`git ls-files`)
- [x] `make` (no args) shows help output
- [x] `make help` exits 0 with all targets listed
- [x] `make lint` exits 0 with descriptive output
- [x] `make coverage` exits 0 with descriptive output
- [x] `make test` exits 0 with descriptive output
- [x] `make install-pre-commit` creates `.git/hooks/pre-commit` symlink
- [x] Symlink target path is correct (`ls -la .git/hooks/pre-commit`)
- [x] `scripts/pre-commit.sh` has executable bit (`ls -la`)
- [x] `git ls-files --stage scripts/pre-commit.sh` shows `100755`
- [x] `bash scripts/pre-commit.sh` runs successfully end-to-end
- [x] Pre-commit hook fires during a test commit

### Phase 7 — Commit
- [x] Stage all new and modified files
- [x] Create initial v0.0.0 commit
