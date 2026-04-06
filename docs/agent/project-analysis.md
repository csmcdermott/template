# Codebase Analysis

> **For agents**: Read this file before planning any changes. Update the relevant sections after fully implementing and validating a plan. Keep this accurate — stale information here causes bad plans.

---

## Project Overview

<!-- Fill in when starting a new project -->

| Field | Value |
| --- | --- |
| **Project name** | {PROJECT NAME} |
| **Purpose** | {One-sentence description of what this project does} |
| **Target release** | 0.0.0 |
| **Last updated** | 2026-03-31 |

---

## Tech Stack

<!-- List the languages, frameworks, and key libraries in use. Be specific about versions where they matter. -->

| Layer | Technology | Notes |
| --- | --- | --- |
| Backend | Rust | |
| Frontend | TypeScript + React | |
| Vector DB | PostgreSQL + pgvector | |
| Build | just | Stubbed recipes; replace with real tooling |

---

## Architecture Overview

<!-- Describe the high-level system structure in prose. Include a diagram or ASCII art if helpful.
     Focus on: what are the major subsystems, how do they relate, and what are the key design decisions? -->

_Not yet documented. Fill in after initial architecture is established._

```
[Add ASCII diagram or description here]
```

**Key design decisions:**

- _{Decision 1 and rationale}_
- _{Decision 2 and rationale}_

---

## Directory Structure

<!-- Annotate the top-level directory tree. Update when new top-level directories are added. -->

```
.
├── AGENTS.md              # Agent instructions (shared by CLAUDE.md, GEMINI.md)
├── CLAUDE.md              # Claude Code entrypoint → AGENTS.md
├── GEMINI.md              # Gemini entrypoint → AGENTS.md
├── LICENSE
├── justfile               # Build, lint, test, and utility recipes
├── README.md
├── .agents/
│   ├── skills/            # Local project skills (SKILL.md per skill)
│   │   └── new-feature/   # End-to-end new feature workflow skill
│   └── commands/          # Local slash commands
│       └── new-feature.md # /new-feature → invokes new-feature skill
├── .claude/
│   └── skills -> ../.agents/skills  # Symlink for Claude Code skill discovery
├── docs/
│   ├── agent/             # Agent-facing files: project analysis, lessons learned
│   │   ├── project-analysis.md  # This file — read before any session
│   │   └── lessons.md     # Correction log, patterns, anti-patterns
│   └── superpowers/       # Superpowers skill artifacts (plans, specs)
│       ├── plans/
│       └── specs/
├── plans/                 # Implementation plans (written before coding begins)
├── prds/                  # Product Requirement Documents
│   ├── 0000-template.md   # Blank PRD template
│   └── 0001-initial_setup.md
└── scripts/               # Utility scripts (pre-push hook, linters, etc.)
    └── pre-push.sh        # Runs lint, coverage, test before each push
```

---

## Core Components

<!-- Table of key components with a one-line description. Add rows as components are built. -->

| Component | Location | Description |
| --- | --- | --- |
| _{Component name}_ | _{path/to/module}_ | _{What it does}_ |

---

## Data Flow

<!-- Describe how data moves through the system end-to-end.
     Example structure: request → handler → service → repository → database
     Be concrete: name the actual modules/files involved. -->

_Not yet documented. Fill in once the core request path is implemented._

---

## External Integrations

<!-- List third-party APIs, SDKs, or services the project depends on.
     Cache any relevant API specs or docs in research/reference/. -->

| Integration | Purpose | Docs location |
| --- | --- | --- |
| _{Service name}_ | _{Why it's used}_ | _{research/reference/foo.md or URL}_ |

---

## Key Interfaces / API Surface

<!-- Describe the public-facing API or internal module interfaces.
     For HTTP APIs: link to the OpenAPI spec in docs/.
     For internal interfaces: describe the key traits/types/contracts. -->

_Not yet documented._

- OpenAPI spec: `docs/openapi.yaml` _(add when available)_

---

## Known Issues / Technical Debt

<!-- Running list of known problems, shortcuts taken, or areas that need rework.
     Format: [YYYY-MM-DD] Description -->

| Date | Area | Description |
| --- | --- | --- |
| | | |

---

## Recently Changed Areas

<!-- Updated during each implementation cycle. Helps agents avoid acting on stale assumptions.
     Remove entries older than 2 releases. -->

| Date | File / Area | What changed |
| --- | --- | --- |
| 2026-03-13 | entire repo | Initial scaffold — template structure only, no application code |
| 2026-03-31 | docs/agent/ | Moved agent files from research/ to docs/agent/; renamed code-analysis.md → project-analysis.md |
| 2026-03-31 | README.md | Added Claude Code skills installation instructions |
| 2026-04-06 | Makefile → justfile | Migrated build targets to justfile; updated README.md, pre-commit.sh, project-analysis.md, AGENTS.md |
| 2026-04-06 | .agents/skills/new-feature/ | Added new-feature skill and command; removed HomeHQ-specific skill refs |
| 2026-04-06 | scripts/pre-push.sh | Renamed from pre-commit.sh; justfile recipe updated to install-pre-push |
| 2026-04-06 | README.md | Restructured Skills Setup for Claude Code + OpenCode; trimmed intro to defer to AGENTS.md |
| 2026-04-06 | AGENTS.md | Added Session Start, Skills and Commands, Dev Workflow sections; added .agents/ dirs to Project Structure |
| 2026-04-06 | prds/ plans/ | Renamed files to 4-digit convention (000→0000, 001→0001); updated all references |
