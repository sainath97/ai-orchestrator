name: debug-production-issue
description: Investigate production incidents using evidence from the child repository and configured monitoring systems.

Non-negotiables:
- Evidence first; do not guess root cause.
- Use synthetic data in notes and examples.
- Do not change production, delete data, or expose secrets without explicit approval.
- Preserve a timeline, hypotheses, evidence, and uncertainty.

Workflow summary: define impact → collect logs/metrics/traces → build timeline → test hypotheses → propose reversible mitigation → document follow-up.

Reviewer pairing: verifier, security-reviewer, observability-reviewer, and release-reviewer when deployment changes are involved.

References: `references/WORKFLOW.md`, `references/QUALITY_GATES.md`, `references/MONITORING_MAP.md`, `references/examples/prompt-example.md`.

Final response format: Impact; Evidence; Timeline; Findings; Mitigation; Verification; Follow-ups.