<!--
Sync Impact Report
- Version change: 2.1.1 → 2.2.0
- Modified principles:
  - I. Code Quality & Maintainability (added/expanded)
  - II. Testing Standards (TDD First) (added/expanded)
  - III. User Experience Consistency (added)
  - IV. Performance & Resource Requirements (added)
  - V. Observability, Versioning & Simplicity (consolidated)
- Added sections:
  - Additional Constraints & Performance Standards
  - Development Workflow & Quality Gates
- Removed sections: none
- Templates reviewed:
  - .specify/templates/plan-template.md ✅ reviewed — no template changes required; references to "Constitution Check" align with updated principles
  - .specify/templates/spec-template.md ✅ reviewed — mandatory testable requirements guidance aligns with Testing Standards
  - .specify/templates/tasks-template.md ✅ reviewed — TDD-first and performance tasks already supported
- Follow-up TODOs:
  - RATIFICATION_DATE: TODO(RATIFICATION_DATE): original adoption date unknown — please supply the original ratification date or confirm this placeholder can be set to the date of first commit.
  - Manual review: verify any external agent-specific guidance files for language referring to prior principle names if present.
--> 

# kristen-website Constitution

## Core Principles

### I. Code Quality & Maintainability
All code MUST be written for clarity and long-term maintainability. This project REQUIRES adherence to a documented style guide and automated static analysis: linters, formatters, and type checkers where applicable. PRs MUST include meaningful tests and documentation for new public interfaces; TODO comments that indicate unfinished design or risk MUST be removed before merge or converted into tracked issues with an explicit owner. Modules MUST be small, single-responsibility, and have clear, documented contracts. Refactoring that reduces complexity is ENCOURAGED and MUST preserve existing behavior or follow the breaking-change governance described below.

Rationale: High-quality, well-typed, and linted code reduces review friction, lowers bug rates, and makes future changes safer and faster.

### II. Testing Standards (TDD First)
The project ADOPTS a tests-first discipline. For all new features and bug fixes, tests MUST be written before implementation (unit tests, contract tests, and integration tests as appropriate). CI gates MUST enforce that: unit tests and linters pass on every PR; contract and integration tests are executed for design-critical changes. Target minimum coverage is 80% for new code paths unless a justified exception is recorded in the PR description. Tests MUST be deterministic, isolated, and runnable locally.

Rationale: Tests-first reduces regressions, ensures intended behavior is specified, and enables safe refactors.

### III. User Experience Consistency
User-facing behavior and interfaces MUST be consistent across the project. This includes consistent component patterns, interaction affordances, copy tone, and accessibility standards (WCAG AA as a baseline). Design tokens, spacing, colors, and typography SHOULD be centralized and reused. UX acceptance criteria MUST be included in feature specs and used as part of automated or manual acceptance testing.

Rationale: Consistency builds user trust, accessibility improves inclusivity, and shared UI patterns reduce implementation and maintenance cost.

### IV. Performance & Resource Requirements
Every feature MUST have defined performance goals when performance is material to user experience or cost. Performance budgets (e.g., p95 latency, memory, bundle size) MUST be recorded in the feature spec and validated by automated performance tests in CI for any change that affects the budget. Profiling and benchmarking SHOULD be part of performance investigations. Optimizations MUST be measured and justified; premature optimization WITHOUT measured evidence is DISCOURAGED.

Rationale: Explicit performance requirements prevent regressions, control operational cost, and make user-facing features reliable.

### V. Observability, Versioning & Simplicity
All services and significant subsystems MUST expose adequate observability: structured logs, metrics (business + technical), and traces for high-risk flows. Semantic versioning (MAJOR.MINOR.PATCH) MUST be followed for published artifacts and public APIs. Breaking changes require a MAJOR bump and a migration plan. Simplicity is preferred: favor straightforward, well-documented approaches over complex designs unless complexity is justified and documented.

Rationale: Observability shortens incident resolution time; consistent versioning communicates compatibility; simplicity reduces cognitive load and maintenance cost.

## Additional Constraints & Performance Standards

- Technology choices SHOULD prioritize maintainability and community support. Where a choice materially affects the project (runtime, major framework), the decision MUST be documented in the feature spec with alternatives and rationale.
- Accessibility baseline: WCAG AA for user-facing web pages and components. Exceptions MUST be documented and approved in the PR.
- Performance budgets: default targets — p95 latency < 300ms for UI actions, server p95 < 200ms for API responses for interactive endpoints, bundle size budgets documented per app. Projects with different targets MUST state those explicitly in the related spec.
- Security & privacy: follow best practices for secret management, authentication, and data handling. Any regulatory requirement (e.g., GDPR) MUST be noted in the spec and reviewed by the team before release.

## Development Workflow & Quality Gates

- Pull requests MUST include: summary of intent, test plan, design rationale for non-trivial changes, and links to updated docs. Small, focused PRs are PREFERRED.
- Code reviews: at least one approving review from a maintainer or designated peer. Security- or infra-impacting PRs REQUIRE two reviewers, including at least one senior reviewer.
- CI gates: linting, type checks (when applicable), unit tests, and contract tests MUST pass. Integration and performance tests MUST run for changes that touch related areas or are marked as performance-sensitive.
- Release process: releases MUST include changelogs that summarize breaking changes and migration steps. Major bumps MUST include a published migration guide.
- Compliance: changes that deviate from core principles MUST document justification in the PR and be recorded in Complexity Tracking as part of the plan.

## Governance

The constitution is the source of truth for project-level norms. Amendments and exceptions follow this process:

1. Proposal: Create a documented proposal as a PR against this constitution file describing the change, rationale, and impact (including migration steps for breaking changes).
2. Review: The proposal MUST receive approval from at least two maintainers or one maintainer plus one domain owner (e.g., security, UX, performance). The proposal MUST list any required updates to templates and automation.
3. Testing & Migration: For changes that affect CI, templates, or runtime behavior, include a migration plan and runbook. Breaking changes require test plans and, where applicable, a deprecation window.
4. Ratification: On approval, update the constitution file and set Last Amended date to the amendment date. The contributor MUST update dependent templates or list follow-up tasks in the PR if automation changes are required.
5. Versioning: Bump CONSTITUTION_VERSION according to semantic rules: MAJOR for incompatible principle removals/redefinitions, MINOR for added or materially expanded principles, PATCH for clarifications and wording fixes. The Sync Impact Report at the top of this file MUST summarize the change.

All PRs and release notes MUST reference the constitution when claiming compliance with a principle.

**Version**: 2.2.0 | **Ratified**: TODO(RATIFICATION_DATE): original adoption date unknown | **Last Amended**: 2025-09-21