Discovery Notes
===============

Facts discovered from this workspace scan:
- Repository root is empty of application source code.
- No child repositories are registered in `repos.json`.
- No CI/CD, IaC, or app language could be discovered in this parent repo.

TODOs (must be completed only when a child repo is intentionally onboarded):
- Fill `repos.json` with child repo names, local paths, remotes, roles, and tiers.
- Populate `.cursor/mcp.json.example` with the organization's actual MCP systems.
- Run discovery against each onboarded child repo before adding scoped rules or domain skills.
- Record facts separately from assumptions; never copy routes, APIs, credentials, or conventions into this parent.

This parent intentionally has no product-specific discovery facts because no child repo is currently onboarded. The discovery process belongs here as a repeatable control-plane step; its results must be recorded only after a child is linked or cloned under `repos/`.

