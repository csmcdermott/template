# {PROJECT NAME} - Overview

This document provides a technical overview of the {PROJECT NAME} project, intended to help AI Agents manage this project. 


## Project Structure

- **prds/**: A place to store and version all Product Requirement Documents
- **plans/**: A place to store and version all plans related to project development
- **docs/**: A place to keep documentation and reference material for this project (eg, an OpenAPI spec of all API endpoints)
- **docs/agent/**: A place for agents to store research files, code analysis, self-improvement lessons, etc
- **scripts/**: A place to put utility scripts, such as pre-commit and post-commit scripts, customer linters, etc.


## Architectural Notes

- Put any high-level relevant constraints here, such as language choices or components
- 

## Standard Operating Protocol

Always follow this workflow precisely. Do not deviate. If anything is unclear, ask for clarification.

1. **Orient yourself.** Invoke the `project-analysis` skill. Read `docs/agent/project-analysis.md` and `docs/agent/lessons.md`. Look through the entire project and understand it in detail - don't just skim, but examine everything in depth. Then check `plans/` for any plan with unchecked items — if one exists, ask the user what to do next. Stop here.
2. **Check for a new PRD in `prds/`.** If none exists, ask the user what to do next. Stop here.
3. **New PRD found.** Read it, invoke `superpowers:brainstorming` and the `product-manager` agent. Ask clarifying questions, and update the PRD as it is refined. Repeat until the user confirms it is ready, then mark it "Approved" and commit it.
4. **Check PRD completeness.** If the PRD does not have clear "Main Acceptance Criteria", "Alternate Workflows", and "Exception Scenarios", return to step 3 and continue refining. Otherwise, continue.
5. **Generate tests.** Invoke `superpowers:test-driven-development`. Write tests for every acceptance criterion, alternate workflow, and exception scenario. Run them.
6. **Verify tests fail.** If all new tests are passing at this point, stop and ask the user for guidance — something is wrong (the feature hasn't been implemented yet so the tests should fail). Otherwise, continue.
7. **Write a plan.** Invoke `superpowers:writing-plans`. Write a plan to implement everything in the PRD and make all new tests pass. Invoke `quality-reviewer`, `security-reviewer`, and `architect-reviewer` agents to review and improve the plan. Do not implement anything yet. Refine the plan until the user confirms it is ready.
8. **Implement the plan.** Invoke `superpowers:executing-plans`. Work through the plan step by step. Mark items complete as you go. Provide a high-level summary after each step.
9. **Verify completeness.** Invoke `superpowers:verification-before-completion`. If any PRD specs are unmet, or any linters, tests, or coverage checks (>80%) are failing, re-evaluate the PRD, tests, and plan, then continue implementing. Repeat until everything passes.
10. **Document results.** Add a review section to the plan file.
11. **Ask the user to review.** If the user identifies gaps, get clarification and return to step 8. Repeat until the user confirms the work is fully complete.
12. **Wrap up.** Bump the version, invoke the `self-improvement` skill and the `project-analysis` skill, and then commit the changes.


## Documentation
- Developer documentation for APIs should use the OpenAPI standard


## Core Principles

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **Secure by Default**: Security as a first-class concern. Keep attack surface area as small as possible.
- **Careful with Secrets**: Secrets (passwords, API keys, etc) MUST NOT be committed to version control in plain text.
- **No Laziness**: Find the root cause. No temporary fixes. Senior Engineer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
- **Minimal Dependencies**: Avoid introducing new external dependencies unless absolutely necessary. If a new dependency is required, state the reason.
- **Minimal Types**: Avoid introducing new types unless absolutely necessary. Continuously run typecheck to make sure you’re not introducing new issues.


## Quality Gates

- **PRD Completeness**: A plan is not complete until **ALL** requirements from the PRD spec have been **proven** working.
- **Tests Passing**: A plan is not complete until **ALL** tests are passing and test coverage is >80%.


## Coding Style

- Use 4 spaces for indentation.
- Use YYYY-MM-DD-HH:mm format for timestamps.
- Use semantic versioning.
