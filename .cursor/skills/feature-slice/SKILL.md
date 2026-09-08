Skill: feature-slice
===================

Purpose: Implement a vertical feature slice in a child repo following platform governance.

Non-negotiables:
- No app code in parent.
- Smallest safe reversible change.
- Follow risk-tiered autonomy rules.

Workflow summary: read parent PROJECT_CONTEXT → load child PROJECT_CONTEXT → plan (if medium+) → implement minimal patch in child via junction → run narrow verification → prepare PR.

References: see `references/WORKFLOW.md` and `references/QUALITY_GATES.md`.

Reviewer pairing: verifier and test-strategist for every slice; add architect-reviewer, security-reviewer, privacy-reviewer, observability-reviewer, ux-reviewer, or release-reviewer according to risk.

Final response format: Goal; Risk tier; Files by child repository; Verification; Reviewers; Risks and follow-ups; PR status.
