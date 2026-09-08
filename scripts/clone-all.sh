#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$root/repos"

python - "$root/repos.json" "$root/repos" <<'PY'
import json
import subprocess
import sys
from pathlib import Path

catalog, repos_root = Path(sys.argv[1]), Path(sys.argv[2])
data = json.loads(catalog.read_text())
for repo in data.get("repos", []):
    remote = repo.get("remote", "")
    if not remote or remote == "TODO":
        raise SystemExit(f"Missing remote for {repo['name']}")
    destination = repos_root / repo["name"]
    if destination.exists():
        print(f"Already exists: {destination}")
        continue
    subprocess.run(["git", "clone", remote, str(destination)], check=True)
PY