Agentic Engineering Platform - Parent Control Plane
====================================================

This repository is a repo-agnostic governance control plane for engineering agents. It contains rules, review agents, reusable skills, connector templates, child-repository catalog metadata, and workspace scripts.

It does not contain application source code, application dependencies, or secrets. Application code remains in child repositories under `repos/`.

## Quick start

Clone the parent repository:

```powershell
git clone https://github.com/sainath97/ai-orchestrator.git ai-orchestrator
cd ai-orchestrator
```

Register child repositories in `repos.json`, then either link an existing local checkout or clone cataloged remotes:

```powershell
.\scripts\link-one.ps1 -Path 'C:\path\to\child-repo' -Name child-repo
# or: .\scripts\clone-all.ps1
```

Generate the local child-inclusive workspace and open it:

```powershell
.\scripts\generate-workspace.ps1
code .\generated-workspace.code-workspace
```

The committed `parent.code-workspace` is parent-only. The generated `generated-workspace.code-workspace` is ignored by Git.

For POSIX systems, use the `.sh` equivalents in `scripts/`.

## GitHub MCP setup

The repository includes `.cursor/mcp.json.example` for GitHub's remote MCP server. Set `GITHUB_PERSONAL_ACCESS_TOKEN` in your user environment, copy the example to `.cursor/mcp.json`, and restart Cursor. Use the GitHub connector to discover repositories and confirm metadata; then add approved entries to `repos.json` and clone them with the repository scripts. Never commit the token or `.cursor/mcp.json`.

## What lives here

- `.cursor/rules/`: always-on governance rules.
- `.cursor/agents/`: readonly specialist review agents.
- `.cursor/skills/`: reusable engineering workflows and quality gates.
- `scripts/`: child-repository linking, cloning, pulling, and workspace generation.
- `repos.json`: child-repository catalog; empty until repositories are intentionally onboarded.
- `docs/`: architecture, discovery, connector, and workflow guidance.

## What does not live here

- Application source code or tests.
- Child-repository commits or pull requests.
- Production credentials, tokens, PII, or PHI.
- Invented routes, APIs, environment variables, infrastructure names, or test commands.

## Agent execution loop

1. Classify risk before editing. When uncertain, choose the higher tier.
2. Read parent `PROJECT_CONTEXT.md`, the ticket if supplied, and the child `PROJECT_CONTEXT.md`.
3. Inspect the nearest implementation, tests, contracts, and configuration.
4. Plan before Medium, High, or Critical work. Critical work stops for explicit human approval.
5. Implement the smallest reversible change in the child repository.
6. Verify with the narrowest meaningful check and report honestly.
7. Invoke specialist reviewers according to risk.
8. Prepare a PR in the child repository. Never commit application code to this parent.

## Prompt template

```text
Goal:
Context: ticket ID/URL, child repo path, relevant PROJECT_CONTEXT files
Constraints: scope, compatibility, security/privacy, prohibited changes
Acceptance criteria:
Verification: commands or checks expected
```

## Risk examples

Low-risk documentation change:

```text
Goal: Correct onboarding wording in repos/<child-name>/docs.
Context: Read parent and child PROJECT_CONTEXT files.
Constraints: Documentation only; no runtime or dependency changes.
Acceptance criteria: Links remain valid and the diff is limited to docs.
Verification: Inspect the diff and run any documented link check.
```

Medium-risk behavior change:

```text
Goal: Add the requested behavior to repos/<child-name>.
Context: Fetch ticket <ticket-id>; inspect the nearest implementation and tests.
Constraints: Preserve public contracts and existing error conventions.
Acceptance criteria: <criteria from ticket>
Verification: Run the narrowest relevant test, then the documented suite.
```

High-risk auth, privacy, or infrastructure change:

```text
Goal: Propose a change affecting <auth/PII/infra path> in repos/<child-name>.
Context: Read parent and child PROJECT_CONTEXT; inspect actual configuration and deployment patterns.
Constraints: Synthetic data only; no production changes; explicit approval for Critical work.
Acceptance criteria: <criteria from ticket>
Verification: Security/privacy review, tests, rollback evidence, and honest unavailable checks.
```

## Child dependency order

- Register catalog metadata first.
- Link or clone prerequisite/core repositories before downstream repositories.
- Read dependency documentation and package version constraints from actual child repositories.
- Record cross-repository order in the PR body; do not guess package names or versions.

## Iron rules

1. Application PRs go to child repositories; parent PRs contain only platform assets.
2. Sibling domain skills are consumed through adapters and never forked into this parent.
3. Use synthetic data only in prompts, tests, fixtures, and docs.
4. Critical paths require human approval; the agent stops before editing.
5. Never commit secrets; rotate immediately if exposed.
6. Never claim tests passed unless they ran.
7. Use full child paths such as `repos/<name>/...` in a multi-root workspace.

## No child repositories yet

This parent is ready to govern child repositories when they exist. Add entries to `repos.json` using `repos.example.json` as a schema reference, then run the linking and workspace-generation steps above. Discovery-dependent rules and domain skills are added only after a child repository is intentionally onboarded.

See `docs/guides/story-to-pr-guide.md` for the complete story-to-PR workflow.

