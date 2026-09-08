# Child repository workspace

Child application repositories are linked or cloned under this directory and are intentionally ignored by the parent Git repository.

- Use `scripts/link-existing.ps1` or `scripts/link-one.sh` for an existing local checkout.
- Use `scripts/clone-all.ps1` or `scripts/clone-all.sh` after populating `repos.json`.
- Do not commit application source code to the parent repository.
- Keep this directory empty until a child repository is intentionally onboarded.