# Lessons Learned

## How to Use This File

**When to read**: At the start of every session, scan this file for entries relevant to your current task. Pay particular attention to Anti-Patterns and the Correction Log.

**When to write**: After any correction from the user — immediately update this file with the pattern. Be specific: record what went wrong, what the rule is, and how to apply it. Vague entries are useless.

**Goal**: Ruthlessly reduce mistake rate. If you find yourself making the same error twice, the entry wasn't specific enough — rewrite it.

---

## Correction Log

<!-- Append a row every time the user corrects your approach.
     Be honest and specific — the point is to not repeat the mistake. -->

| Date | What went wrong | Rule learned |
| --- | --- | --- |
| 2026-04-06 | Called Edit on files that hadn't been read yet — tool rejected every call | Always Read a file before calling Edit on it, even when the change seems obvious |
| 2026-04-06 | Called WebFetch without its schema loaded — tool rejected the call with a parameter validation error | Deferred tools must be loaded via ToolSearch before they can be called; do this before the first use |

---

## Patterns to Follow

<!-- Confirmed good approaches for this project. Add entries as they are validated. -->

- _(None yet — add entries as patterns are confirmed)_

---

## Anti-Patterns to Avoid

<!-- Things that have caused problems or been explicitly called out as wrong for this project. -->

- _(None yet — add entries as mistakes are made and corrected)_

---

## Project-Specific Gotchas

<!-- One-off facts that are easy to forget: quirky build steps, non-obvious dependencies,
     environment requirements, ordering constraints, etc. -->

- PRD and plan files use a **4-digit** numeric prefix (e.g. `0001-`, `0002-`). Do not use 3-digit prefixes when creating new files.
- `.claude/skills` is a symlink to `.agents/skills` — skills are authored once in `.agents/skills/` and discovered by Claude Code via the symlink.
- OpenCode global config lives at `~/.config/opencode/opencode.json`; plugins are declared in the `"plugin"` array using npm package syntax or git URLs.
