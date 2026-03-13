# {PROJECT NAME} - Overview

This document provides a technical overview of the {PROJECT NAME} project, intended to help AI Agents manage this project. 


## Project Structure

- **prds/**: A place to store and version all Product Requirement Documents
- **plans/**: A place to store and version all plans related to project development
- **research/**: A place for agents to store research files, code analysis, self-improvement lessons, and API specs for integrations
- **docs/**: A place to keep documentation and reference material for this project (eg, an OpenAPI spec of all API endpoints)
- **scripts/**: A place to put utility scripts, such as pre-commit and post-commit scripts, customer linters, etc.


## Architectural Notes

- Put any high-level relevant constraints here, such as language choices or components
- Backend code is written in Rust
- Frontend code is written in Typescript and React
- The vector database is PostreSQL using pgvector


## Workflow Orchestration

### 1. Plan Mode Default
- Read @research/code-analysis.md before planning any changes
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately - don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs up front to reduce ambiguity
- All plans must be written to the 'plans' directory **prior** to implementation
- Plans should have a detailed and specific to-do list at the bottom, including every phase and task necessary to implement the plan
- Every plan should be checked into git, and every change to a plan file should be committed with the prompt that drove it

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One tack per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction from the user: update @research/lessons.md with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

### 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes - don't over-engineer
- Challenge your own work before presenting it

### 6. Documentation
- Copies of any reference materials like API specs, docs sites, how-to guides, readme files, manifests and anything else used during planning and research phases should be cached locally in @research/reference/. When investigating and planning, use those cached copies to reduce the number of web searches necessary.
- Developer documentation for APIs should use the OpenAPI standard
- After fully implementing and validating a plan, update @research/codebase-analysis.md to keep it accurate and relevant


## Task Management

1. **Plan First**: Write plan to @plans/ directory with checkable items
1. **Verify Plan**: Check in before starting implementation
1. **Track Progress**: Mark items complete as you go
1. **Explain Changes**: High-level summary at each step
1. **Validate Results**: Run tests, check logs, prove to yourself that the change worked
1. **Document Results**: Add review section to the plan file
1. **Capture Lessons**: Update @research/lessons.md after correction


## Core Principals

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **Secure by Default**: Security as a first-class concern. Keep attack surface area as small as possible.
- **Careful with Secrets**: Secrets (passwords, API keys, etc) MUST NOT be committed to version control in plain text.
- **No Laziness**: Find the root cause. No temporary fixes. Senior Engineer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
- **Minimal Dependencies**: Avoid introducing new external dependencies unless absolutely necessary. If a new dependency is required, state the reason.
- **Minimal Types**: Avoid introducing new types unless absolutely necessary. Continuously run typecheck to make sure you’re not introducing new issues.


## Quality Gates

- **PRD Completeness**: A plan is not complete until ALL requirements from implementation plan have been proven working.
- **Tests Passing**: A plan is not complete until ALL tests are passing and test coverage is >80%. 


## Coding Style

- Use 4 spaces for indentation.
- Use YYYY-MM-DD-HH:mm format for timestamps.
- Use semantic versioning.
