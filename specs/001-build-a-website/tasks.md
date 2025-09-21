# Tasks: Professional Portfolio Website

**Input**: Design documents from `/specs/001-build-a-website/`  
**Prerequisites**: plan.md (required), research.md, data-model.md, contracts/

## Execution Flow (main)
```
1. Load plan.md from feature directory
   → If not found: ERROR "No implementation plan found"
   → Extract: tech stack, libraries, structure
2. Load optional design documents:
   → data-model.md: Extract entities → model tasks
   → contracts/: Each file → contract test task
   → research.md: Extract decisions → setup tasks
3. Generate tasks by category:
   → Setup: project init, dependencies, linting
   → Tests: contract tests, integration tests
   → Core: content templates, listing/detail pages
   → Integration: CI, deploy, monitoring
   → Polish: unit tests, performance, docs
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness
9. Return: SUCCESS (tasks ready for execution)
```

## Phase 3.1: Setup
- [ ] T001 Initialize site scaffold (Hugo starter) in `site/` and commit
    - Path: `site/`  
    - Description: create Hugo site (`hugo new site .`), add theme or minimal templates. DO NOT implement pages beyond placeholders.
- [ ] T002 [P] Setup dev environment docs: `specs/001-build-a-website/quickstart.md`
    - Path: `specs/001-build-a-website/quickstart.md`  
    - Description: include local dev commands (`hugo server`), build, and deploy notes.
- [ ] T003 Configure linting/formatting and tooling
    - Files: `.github/workflows/ci.yml`, `site/package.json` (if Node tools used)
    - Description: ensure consistent formatting (prettier/stylelint) and add commit hooks if desired.

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**

- [ ] T004 [P] Create a failing link-check job (CI/locally) referencing sample content
    - Path: `specs/001-build-a-website/tests/linkcheck/test_linkcheck.sh`  
    - Description: script invoking `htmlproofer` or `broken-link-checker` against `site/public` (failing because site not yet built or links missing).
- [ ] T005 [P] Create a failing a11y test harness using axe or lighthouse
    - Path: `specs/001-build-a-website/tests/a11y/run_a11y.sh`
    - Description: run axe/lighthouse against local server; initially fails until pages are implemented.
- [ ] T006 [P] Create a failing smoke test that asserts homepage returns 200 and contains "Recent"
    - Path: `specs/001-build-a-website/tests/smoke/test_homepage.sh`
    - Description: curl http://localhost:1313/ and assert 200 and expected placeholder content.
- [ ] T007 [P] Create content schema validation tests for frontmatter
    - Path: `specs/001-build-a-website/tests/schema/test_frontmatter.js` (or .py)
    - Description: validate required fields (date, title, source_url) in `content/*/*.md` — tests should fail when no content exists.
- [ ] T008 [P] Create a failing CI workflow that runs the above tests on push
    - Path: `.github/workflows/ci.yml` (CI job has failing steps by design initially)

## Phase 3.3: Core Implementation (ONLY after tests are failing)
- [ ] T009 Create content type templates (frontmatter examples) for Talk, Paper, Media
    - Path: `site/layouts/_default/single.html`, `site/content/templates/talk.md` etc.
- [ ] T010 [P] Implement listing pages for Talks, Papers, Media with reverse-chronological ordering
    - Path: `site/layouts/section/talks.html`, `site/layouts/section/papers.html`, `site/layouts/section/media.html`
- [ ] T011 Implement detail pages to show metadata and assets
    - Path: `site/layouts/_default/single.html` (content-driven)
- [ ] T012 [P] Add homepage with "Recent" aggregated feed showing newest items across types
    - Path: `site/layouts/index.html`
- [ ] T013 Implement filtering by tag/year (client-side JS or prebuilt pages)
    - Path: `site/static/js/filter.js` or `site/layouts/partials/filters.html`
- [ ] T014 Add RSS feed and sitemap generation
    - Path: `site/config.toml` (enable RSS), `site/static/sitemap.xml` generation
- [ ] T015 [P] Add metadata and SEO templates (OG tags, canonical)
    - Path: `site/layouts/partials/seo.html`

## Phase 3.4: Integration
- [ ] T016 Create GitHub Actions workflow for build + deploy to GitHub Pages (or Azure)
    - Path: `.github/workflows/deploy.yml`
    - Description: build site, run tests (linkcheck, a11y), and deploy to `gh-pages` or `gh-pages`/`docs` branch.
- [ ] T017 [P] Implement CI accessibility and performance checks (axe/lighthouse CI)
    - Path: `.github/workflows/ci.yml` (add jobs)
- [ ] T018 Add link-check and scheduled monitoring job
    - Path: `.github/workflows/linkcheck.yml` (scheduled)
- [ ] T019 Configure custom domain and DNS records (if domain transfer requested)
    - Files/Notes: `CNAME` in site/static or repo root; document DNS steps in `quickstart.md`.

## Phase 3.5: Polish
- [ ] T020 [P] Migrate existing content from www.kristenwomack.io
    - Path: `specs/001-build-a-website/migration/` (scripts and output), final content under `site/content/{talks,papers,media}`
    - Description: run scraper or manual conversion, add frontmatter, dedupe.
- [ ] T021 [P] Optimize images and media (generate responsive sizes, webp)
    - Path: `site/static/images/optimized/` and build scripts `site/package.json` tasks
- [ ] T022 Run accessibility manual review and fix issues
    - Path: `specs/001-build-a-website/reports/a11y-report.md`
- [ ] T023 Add analytics and privacy notes (config in `SiteConfig` and `privacy.md`)
- [ ] T024 Write release notes and migration guide (include changelog and domain cutover steps)

## Dependencies
- Tests (T004-T008) before implementation (T009-T015)
- T009 blocks T010/T011
- CI/deploy (T016) requires tests passing

## Parallel Example
```
# Launch T004-T007 together (tests)
Task: "Create a failing link-check job"
Task: "Create a failing a11y test harness"
Task: "Create a failing smoke test for homepage"
Task: "Create frontmatter schema validation tests"
```

## Notes
- [P] tasks = different files, no dependencies
- Verify tests fail before implementing
- Commit after each task
- Avoid: vague tasks, same file conflicts

## Validation Checklist
*GATE: Checked by main() before returning*

- [ ] All contracts have corresponding tests
- [ ] All entities have model tasks
- [ ] All tests come before implementation
- [ ] Parallel tasks truly independent
- [ ] Each task specifies exact file path
- [ ] No task modifies same file as another [P] task
