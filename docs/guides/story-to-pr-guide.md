# Story to PR Guide

1. Setup: clone the parent, populate `repos.json`, and link or clone child repositories under `repos/`.
2. Fetch the ticket through the configured MCP connector, or use the manual fallback with a sanitized ticket copy.
3. Read the parent `PROJECT_CONTEXT.md`, then the ticket, then the child `PROJECT_CONTEXT.md`.
4. Classify risk using rule 030. Medium and above requires a plan; Critical requires explicit human approval before editing.
5. Select the relevant skill, then inspect the nearest implementation, tests, contracts, and configuration.
6. Implement the smallest safe change in the child repository only.
7. Run the narrowest meaningful verification first, followed by broader checks when available.
8. Review the diff yourself and invoke specialist subagents based on risk.
9. Prepare the PR in the child repository with the template from `prepare-pr`.
10. Human reviews, commits, pushes, and opens the PR on the child remote.

## Team-setup prompt

```text
Set up this parent Agentic Engineering Platform for our organization.
Product: <name or TODO>
Domain/sensitivity: <domain or TODO>
SCM host: <host or TODO>
Issue tracker: <tracker or none>
Wiki: <wiki or none>
Child repos: <name, remote, role, tier, or none yet>
OS for scripts: <Windows, POSIX, or both>

Discover only from supplied repositories and mark unknowns TODO. Configure the catalog and connector examples without committing secrets. Do not edit any child application code during setup.
```

## Daily-task prompt

```text
Goal: <one sentence>
Ticket: <ID/URL or manual description>
Child repository: repos/<name>
Constraints: <compatibility, security/privacy, scope>
Acceptance criteria:
- <criterion>
Verification:
- <command or check>

Read parent PROJECT_CONTEXT.md, the ticket, and child PROJECT_CONTEXT.md before editing. Classify risk, plan if Medium+, use the smallest safe change, invoke applicable reviewers, and report run/not run/failed/unavailable verification. Do not commit or push.
```

## PR handoff

The agent may prepare the PR body and diff summary, but the human owner commits, pushes, and opens the PR on the child remote. Parent changes must remain limited to governance and platform assets.
