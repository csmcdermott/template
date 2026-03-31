A scaffold for quickly launching new projects with agent-friendly structure and guardrails.

Includes:
- `AGENTS.md` — instructions for Claude, Gemini, and other AI agents
- `prds/` and `plans/` — templates for PRDs and implementation plans
- `docs/agent/` — persistent agent memory (project analysis, lessons learned)
- `Makefile` — stubbed lint, test, and coverage targets with a pre-commit hook installer
- `scripts/pre-commit.sh` — blocks commits when lint, coverage, or tests fail

## Setup

## Claude Code Skills

This project uses Claude Code with custom skills and agents that are not bundled by default. Install both before running AI-assisted workflows.

**Superpowers** — core agentic skills (planning, TDD, debugging, etc.):

```bash
/plugin install superpowers@claude-plugins-official
```

**McD's agentic tools** 
    - `project-analysis` and `self-improvement` skills
    - `quality-reviewer`, `security-reviewer`, and `architect-reviewer` agents

```bash
git clone git@github.com:csmcdermott/mcds_agentic_tools.git ~/mcds_agentic_tools
ln -s ~/mcds_agentic_tools/skills/* ~/.claude/skills/
ln -s ~/mcds_agentic_tools/agents/* ~/.claude/agents/

### Pre-commit Hook

```bash
make install-pre-commit
```

## Usage

1. Clone or use this repo as a GitHub template.
2. Replace `{PROJECT NAME}` placeholders in `CLAUDE.md` and `docs/agent/project-analysis.md`.
3. Add project-specific tech stack, architecture notes, and constraints to `CLAUDE.md`.
4. Run `make install-pre-commit` to enable the pre-commit hook.
5. Fill in the stub Makefile targets (`lint`, `test`, `coverage`) with real commands.
