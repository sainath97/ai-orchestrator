# GitHub source connector

The parent platform supports the GitHub remote MCP server for repository discovery, issue context, pull-request context, and source metadata.

## Setup

1. Create a GitHub token with the minimum read permissions required by your organization. Do not paste it into this repository.
2. Set the token in the user environment:

```powershell
$env:GITHUB_PERSONAL_ACCESS_TOKEN = '<token entered locally>'
```

3. Copy `.cursor/mcp.json.example` to `.cursor/mcp.json`. The destination is gitignored.
4. Restart Cursor and enable the `github` MCP server.

The example uses GitHub's remote MCP endpoint:
`https://api.githubcopilot.com/mcp/`

## Repository discovery workflow

Use GitHub MCP to discover repository names, remotes, default branches, and relevant issue or pull-request context. After confirming the repositories with a human, add sanitized metadata to `repos.json`, then use `scripts/clone-all.ps1` or `scripts/clone-all.sh` to clone them under `repos/`.

MCP discovery does not replace cloning. The child source remains local under `repos/` and is never committed to the parent.

## Guardrails

- Use read-only permissions for discovery whenever possible.
- Keep write tools disabled unless explicitly required and approved.
- Never place tokens in `repos.json`, prompts, logs, docs, or committed configuration.
- Child application PRs must target child repositories, not this parent.

Manual fallback: open the child repository locally under `repos/` and use its Git CLI metadata.