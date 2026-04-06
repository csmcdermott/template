---
name: new-feature
description: Use when planning or implementing any new feature — when a new PRD exists, a plan needs to be written, or a feature needs to be built end-to-end.
---

## Overview

Mandatory standard operating procedure for all new feature work. Follow every step in order. Do not skip or reorder steps.

## When to Use
- When a new PRD exists in `prds/` and work has not started
- When starting any change that affects frontend or backend code and the user experience

## Skill Namespaces

- `superpowers:*` skills (e.g. `superpowers:brainstorming`, `superpowers:test-driven-development`) — Claude Code platform-level skills; invoke via the Skill tool, not local files.
- Bare-name platform skills (e.g. `quality-review`, `security-review`, `architecture-review`, `self-improvement`, `project-analysis`) — also platform-level; invoke via the Skill tool. They are not in `.agents/skills/`.
- Local project skills live in `.agents/skills/<name>/SKILL.md`.

## Standard Operating Protocol

Always follow this workflow precisely. Do not deviate. If anything is unclear, ask for clarification.

1. **Orient yourself.** Invoke the `project-analysis` skill. Read `docs/agent/project-analysis.md` and `docs/agent/lessons.md`. Look through the entire project and understand it in detail — don't just skim, but examine everything in depth. Then check `plans/` for any plan that has unchecked `- [ ]` items AND does not have a completed Implementation Review section — if such a plan exists, ask the user what to do next and stop here. Otherwise continue to step 2.
2. **Check for a new PRD in `prds/`.** If none exists, ask the user what to do next. Stop here.
3. **New PRD found.** Read it. If the PRD's `Document status` is already "Approved", confirm with the user before skipping the review cycle — they may want a fresh review or may want to proceed directly. Otherwise: invoke `superpowers:brainstorming` and `product-review` skills. Ask clarifying questions, update the PRD as it is refined, and repeat until the user confirms it is ready — then mark it "Approved" and commit it.
4. **Check PRD completeness.** If the PRD does not have clear "Main Acceptance Criteria", "Alternate Workflows", and "Exception Scenarios", return to step 3 and continue refining. Otherwise, continue.
5. **Generate tests.** Invoke `superpowers:test-driven-development`. Write tests for every acceptance criterion, alternate workflow, and exception scenario. Run them.
6. **Verify tests fail.** If all new tests are passing at this point, stop and ask the user for guidance — something is wrong (the feature hasn't been implemented yet so the tests should fail). Otherwise, continue.
7. **Write a plan.** Invoke `superpowers:writing-plans`. Write a plan to implement everything in the PRD and make all new tests pass. Invoke `quality-review`, `security-review`, and `architecture-review` skills to review and improve the plan. Do not implement anything yet. Refine the plan until the user confirms it is ready.
8. **Implement the plan.** Invoke `superpowers:executing-plans`. Work through the plan step by step. Mark items complete (`- [x]`) as you go. Provide a high-level summary after each step.
9. **Verify completeness.** Invoke `superpowers:verification-before-completion`. If any PRD specs are unmet, or any linters, tests, or coverage checks (>80%) are failing, re-evaluate the PRD, tests, and plan, then continue implementing. Repeat until everything passes.
10. **Document results.** Add a review section to the plan file.
11. **Ask the user to review.** If the user identifies gaps, get clarification and return to step 8. Repeat until the user confirms the work is fully complete.
12. **Wrap up.** Bump the version to the value specified in the PRD's "Target release" field. Invoke the `self-improvement` and `project-analysis` skills, then commit all changes.
