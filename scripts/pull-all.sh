#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
if [ ! -d "$root/repos" ]; then
  exit 0
fi
for repo in "$root"/repos/*; do
  if [ -d "$repo/.git" ]; then
    git -C "$repo" pull --ff-only
  fi
done