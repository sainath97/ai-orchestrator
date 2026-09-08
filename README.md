Agentic Engineering Platform — Parent Control Plane
===============================================
.\scripts\generate-workspace.ps1

What this repo is NOT
3. Open the generated child-inclusive workspace (`generated-workspace.code-workspace`) in VS Code. The committed `parent.code-workspace` remains parent-only.
- No secrets or credentials.

Quick start (Windows PowerShell)

1. Clone this repo:

```powershell
git clone <parent-repo-remote> parent-repo
cd parent-repo
```

2. Link or clone your child repos (see `scripts/`):

```powershell
.\scripts\link-existing.ps1 -Path 'C:\path\to\child-repo' -Name child-repo
.\scripts\generate-workspace.ps1
```

3. Open the generated multi-root workspace (`parent.code-workspace`) in VS Code.

Design principles
- Smallest safe reversible change.
- App code always lives in child repos.
- Secrets never committed. Use environment variables or vaults.

Agent execution loop
1. Classify risk before editing. When uncertain, choose the higher tier.
2. Read this parent `PROJECT_CONTEXT.md`, the ticket if supplied, and the child `PROJECT_CONTEXT.md`.
3. Inspect the nearest existing implementation, tests, contracts, and configuration.
4. Plan before Medium, High, or Critical work; Critical work stops for explicit human approval.
5. Implement the smallest reversible change in the child repository.
6. Verify with the narrowest meaningful check first and report honestly.
7. Invoke specialist reviewers according to risk.
8. Prepare a PR in the child repository. Never commit application code to this parent.

Structured prompt template

```text
Goal:
Context: ticket ID/URL, child repo path, relevant PROJECT_CONTEXT files
Constraints: scope, compatibility, security/privacy, prohibited changes
Acceptance criteria:
Verification: commands or checks expected
```

Worked examples

Low risk — docs:
```text
Goal: Correct the onboarding wording in repos/<child-name>/docs.
Context: Read parent and child PROJECT_CONTEXT files.
Constraints: Documentation only; no runtime or dependency changes.
Acceptance criteria: Existing links remain valid and the diff is limited to docs.
Verification: Inspect diff and run any documented link check.
```

Medium risk — typical behavior change:
```text
Goal: Add the requested behavior to repos/<child-name>.
Context: Fetch ticket <ticket-id>; inspect the nearest implementation and tests.
Constraints: Preserve public contracts and existing error conventions.
Acceptance criteria: <criteria from ticket>
Verification: Run the narrowest relevant test, then the documented suite.
```

High risk — auth, privacy, or infrastructure:
```text
Goal: Propose a change affecting <auth/PII/infra path> in repos/<child-name>.
Context: Read parent and child PROJECT_CONTEXT; inspect actual configuration and deployment patterns.
Constraints: Synthetic data only; no production changes; explicit approval required for Critical work.
Acceptance criteria: <criteria from ticket>
Verification: Security/privacy review, tests, rollback evidence, and honest unavailable checks.
```

Child dependency order
- Register catalog metadata first.
- Link or clone prerequisite/core repositories before downstream repositories.
- Read dependency documentation and package version constraints from the actual child repos.
- Record cross-repository order in the PR body; do not guess package names or versions.

Iron rules
1. Application PRs go to child repos; parent PRs contain only governance, skills, docs, scripts, and catalog changes.
2. Domain skills in sibling repos are consumed through adapters and never forked into this parent.
3. Use synthetic/fake data only in prompts, tests, fixtures, and docs.
4. Critical paths require human approval; the agent stops before editing.
5. Never commit secrets; rotate immediately if exposed.
6. Never claim tests passed unless they ran.
7. Always use full child paths such as `repos/<name>/...` in a multi-root workspace.

Next steps
- Edit `repos.json` to register child repositories and their roles.
- Fill `.cursor/mcp.json.example` with connector info (DO NOT commit secrets).

If you currently have no child repositories
- This parent repo is ready to govern child repos when they exist. To get started later:
	1. Create or obtain a child repo (your application code) and either clone it under `repos/` or link it with `scripts/link-existing.ps1`.
	2. Add the child entry to `repos.json` or use `repos.example.json` as a template.
	3. Run `scripts/generate-workspace.ps1` to include the child repo in the VS Code multi-root workspace.

Want a demo child repo?
- If you'd like, I can scaffold a minimal `repos/sample-app` to demonstrate the end-to-end flow (link → generate workspace → run a sample agent prompt).

