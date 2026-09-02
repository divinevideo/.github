# Repository Guidelines

## Project Structure & Purpose
- This repo backs the org-wide GitHub profile content under `profile/`.
- Keep changes focused on public-facing org metadata, profile content, and lightweight GitHub repo guidance.

## Contribution Guardrails
- PR and issue titles must use Conventional Commit format: `type(scope): summary` or `type: summary`.
- Allowed PR types are `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`, `build`, `ci`, `style`, and `revert`. Issues may also use `task` (work to be done) and `epic` (a tracking issue whose content is its child issues).
- Prefer a scope over inventing a type: `fix(security):`, not `security:`.
- Set the correct title when opening the PR or filing the issue. Do not rely on fixing it afterward.
- `gh issue create --title` bypasses the issue templates, so the type prefix they seed never fires. Supply it yourself; nothing rejects a malformed issue title.
- A green `Semantic PR` check is not by itself proof a title was validated. Confirm the step ran, not just that the job passed. See "The title check is not a safety net" in `divine-context/PR_REVIEW.md`.
- Keep PRs tightly scoped. Do not mix unrelated cleanup or speculative copy changes into the same PR.
- PR descriptions must include a short summary, motivation, linked issue, and manual review notes.
- Temporary or transitional content must include `TODO(#issue):` with the tracking issue for removal.

## Sensitive Information
- Do not mention corporate partners, customers, brands, campaign names, or other sensitive external identities in public issues, PRs, branch names, screenshots, or descriptions unless a maintainer explicitly approves it.
- Use generic descriptors instead when discussing sensitive external relationships.
