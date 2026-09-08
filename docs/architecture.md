# Platform architecture

This repository is a governance control plane. It does not contain application runtime code or application dependencies.

```text
Parent control plane
  rules + agents + skills + docs + catalog + scripts
                    |
                    v
        local junctions or clones under repos/
                    |
                    v
             child application repos
```

Ownership boundaries:
- Parent: governance, reusable workflows, connector configuration examples, catalog, workspace generation, and PR preparation.
- Child: application code, tests, application CI, infrastructure, and application PRs.
- Sibling: shared domain skills or libraries consumed through documented adapters; never fork a sibling into the parent.

Unknowns remain `TODO` until child discovery or organization input supplies facts. The parent never invents routes, APIs, environment variables, infrastructure names, or test commands.