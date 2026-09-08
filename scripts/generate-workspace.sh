#!/usr/bin/env bash
WORKSPACE_DIR="$(dirname "$0")/.."
WORKSPACE_FILE="$WORKSPACE_DIR/generated-workspace.code-workspace"
echo "{" > "$WORKSPACE_FILE"
echo "  \"folders\": [" >> "$WORKSPACE_FILE"
echo "    { \"path\": \".\" }," >> "$WORKSPACE_FILE"
for d in "$WORKSPACE_DIR/repos"/*/ ; do
  name=$(basename "$d")
  echo "    { \"path\": \"repos/$name\" }," >> "$WORKSPACE_FILE"
done
echo "  ]," >> "$WORKSPACE_FILE"
echo "  \"settings\": {}" >> "$WORKSPACE_FILE"
echo "}" >> "$WORKSPACE_FILE"
echo "Generated $WORKSPACE_FILE"
