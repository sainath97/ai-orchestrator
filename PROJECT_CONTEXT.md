PROJECT CONTEXT
===============

Product: TODO — product name not discoverable from this repo.

Business problem: This parent repo governs agentic engineering processes for one or more child product repositories.

Primary users: Platform engineers, senior engineers, reviewers, and autonomous agents operating under governance.

Core workflow (high level):
1. Agent/classifier inspects ticket and project context.
2. Agent fetches child PROJECT_CONTEXT and nearest implementations.
3. Agent proposes smallest-safe-change in child repo.
4. Specialist reviewers invoked per risk tier.
5. PR prepared in child repo; child repo owners merge.

Critical constraints: No application source code in parent. No secrets committed. Human approval required for critical changes.

Key integrations: See `.cursor/mcp.json.example` for MCP connectors (fill per-org).

Discovery notes: See `docs/discovery.md` for automated inspection results and TODOs.
