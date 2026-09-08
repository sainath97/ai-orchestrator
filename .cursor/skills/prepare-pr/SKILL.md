name: prepare-pr
description: Prepare a complete pull request in the affected child repository without committing or pushing.

Non-negotiables:
- Application changes belong in the child repository.
- Never commit, push, or open a PR unless explicitly authorized.
- Do not invent ticket IDs, reviewers, commands, APIs, or deployment details.
- Report run, not run, failed, and unavailable verification honestly.

Workflow summary:
1. Identify the child repository and ticket.
2. Read parent and child context.
3. Classify risk and confirm required reviewers.
4. Inspect the diff and verification evidence.
5. Draft the child PR body using `PR_TEMPLATE.md`.
6. Stop before commit/push/open unless explicitly approved.

Reviewer pairing: verifier, test-strategist, architect-reviewer, and security-reviewer when relevant.

References: `references/WORKFLOW.md`, `references/QUALITY_GATES.md`, `references/PR_TEMPLATE.md`, `references/PR_REVIEW_MATRIX.md`, `references/RISK_TIERS.md`.

Final response format: Summary; Files by repository; Verification; Reviewers; Risks and follow-ups; PR status.