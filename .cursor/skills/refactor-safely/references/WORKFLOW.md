# Safe refactoring workflow

1. Capture current behavior with existing tests or a minimal characterization test.
2. Identify the exact boundary and invariants to preserve.
3. Plan the smallest reversible refactor.
4. Make one coherent change in the child repository.
5. Run the narrowest checks, then the broader available suite.
6. Compare diff and behavior evidence before preparing a PR.