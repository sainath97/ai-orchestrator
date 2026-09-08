name: refactor-safely
description: Refactor child-repository code while preserving behavior through characterization evidence.

Non-negotiables:
- No behavior change without explicit acceptance criteria.
- Establish characterization coverage before restructuring when practical.
- Preserve public contracts, error behavior, configuration, and side effects unless requested.

Workflow summary: baseline → characterize → plan → smallest refactor → narrow verification → diff review → prepare PR.

Reviewer pairing: verifier, test-strategist, architect-reviewer; security-reviewer when boundaries or sensitive data are affected.

References: `references/WORKFLOW.md`, `references/QUALITY_GATES.md`, `references/examples/prompt-example.md`.

Final response format: Baseline; Refactor; Verification; Behavior risks; Reviewers; PR status.