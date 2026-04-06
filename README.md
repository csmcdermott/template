A scaffold for quickly launching new projects with agent-friendly structure and guardrails. See `AGENTS.md` for directory structure and conventions.

## Setup

## Skills Setup

This project uses custom skills that are not bundled by default. Install both before running AI-assisted workflows.

### Claude Code

**Superpowers** — core agentic skills (planning, TDD, debugging, etc.):

```bash
/plugin install superpowers@claude-plugins-official
```

**McD's Agentic Tools** — `project-analysis`, `self-improvement`, and code review skills:

```bash
git clone git@github.com:csmcdermott/mcds_agentic_tools.git ~/mcds_agentic_tools
cp -r ~/mcds_agentic_tools/skills/* ~/.claude/skills/
```

### OpenCode

**Superpowers** — add to `~/.config/opencode/opencode.json`:

```json
{
  "plugin": [
    "superpowers@git+https://github.com/obra/superpowers.git"
  ]
}
```

**McD's Agentic Tools**:

```bash
git clone git@github.com:csmcdermott/mcds_agentic_tools.git ~/mcds_agentic_tools
mkdir -p ~/.config/agents/skills
cp -r ~/mcds_agentic_tools/skills/* ~/.config/opencode/skills/
cp -r ~/mcds_agentic_tools/commands/* ~/.config/opencode/commands/
```

## Dev Pre-Reqs
One-time install required before running any just recipes:

```bash
brew install just
```


### Pre-commit Hook

```bash
just install-pre-push
```

## Usage

1. Clone or use this repo as a GitHub template.
2. Replace `{PROJECT NAME}` placeholders in `AGENTS.md` and `docs/agent/project-analysis.md`.
3. Add project-specific tech stack, architecture notes, and constraints to `AGENTS.md`.
4. Run `just install-pre-push` to enable the pre-push hook.
5. Fill in the stub justfile recipes (`lint`, `test`, `coverage`) with real commands.
