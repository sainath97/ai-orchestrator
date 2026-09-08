Prompt example

Goal: Make a small bugfix in child repo `repos/my-app` that fixes failing unit test X.

Context: See parent PROJECT_CONTEXT and child PROJECT_CONTEXT at `repos/my-app/PROJECT_CONTEXT.md`.

Constraints: Minimal change, add test, do not touch infra.

Verification: Run `pytest tests/unit/test_x.py` and report results.
