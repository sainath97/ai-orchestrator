# Risk tiers

- Low: documentation or isolated non-runtime change. Implement after context.
- Medium: behavior change with bounded blast radius. Plan, tests, and verification required.
- High: auth, PII, secrets, production, shared contracts, or cross-repository change. Minimal patch, specialist review, rollback notes.
- Critical: listed sensitive path, broad IAM, production data operation, or data-exposure risk. Stop and obtain explicit human approval before editing.