Agents and Skills
=================

See `.cursor/agents/` for review subagents and `.cursor/skills/` for enterprise skills. Skills contain SKILL.md, references, and examples.

Review subagents:
- Core: `verifier`, `security-reviewer`, `test-strategist`, `architect-reviewer`, `release-reviewer`, `observability-reviewer`, `ux-reviewer`.
- Conditional: `privacy-reviewer` is included for privacy-sensitive work; add integration, API, data, package, or SAST specialists only after child discovery justifies them.

Risk-tier invocation matrix:

| Tier | Required action | Reviewers |
| --- | --- | --- |
| Low | Context, minimal change, narrow check | verifier, test-strategist |
| Medium | Plan, tests, verification, diff review | verifier, test-strategist, architect-reviewer when boundaries change |
| High | Human-visible plan, minimal patch, rollback notes | all relevant core reviewers; security/privacy for sensitive work |
| Critical | Stop before edit; explicit human approval | named human approver plus relevant specialists |

Invoke reviewers by risk tier (see rule 030). When unsure, choose the higher tier.

Discovery-dependent items intentionally omitted:
- API, integration, data, package-coordinator, and SAST remediation skills/agents are not installed until child discovery demonstrates the relevant boundary.
- Deploy-change is not installed until a child repository exposes deployment or infrastructure files.
- Domain pattern files are not invented; they must be derived from actual child conventions during onboarding.
