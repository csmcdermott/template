# PRD Template

## Initial Setup
| **Target release** | 0.0.0 |
| --- | --- |
| **Document status** | **DRAFT** |
| **Document owner** | @owner |

## **Objective**

Provide templates and skeleton files for a bare project.

## **Requirements**

1. The following directories are checked into git and have template/example files:
  - @prds/
  - @plans/
  - @research/
  - @scripts/
  - @docs/
1. Base example files exist for the following, the provide agents with a framework they can follow in the future:
  - @prds/000-template.md
  - @research/code-analysis.md
  - @research/lessons.md
  - @Makefile
1. The following make targets are stubbed out and just return a descriptive message and a successful return code:
  - 'make lint'
  - 'make coverage'
  - 'make test'
1. There is a file called @scripts/pre-commit.sh which runs 'make lint', 'make coverage', and 'make test' and ensures that they all pass - this should be executable
1. There is a make target called 'make install-pre-commit' which creates a symlink in @.git/pre-commit pointing to @scripts/pre-commit.sh

## **Open Questions**

| **Question** | **Answer** | **Date Answered** |
| --- | --- | --- |
|  |  |  |

## **Out of Scope**

- 


## **Reference materials**
