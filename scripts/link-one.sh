#!/usr/bin/env bash
if [ "$#" -ne 2 ]; then
  echo "Usage: link-one.sh <path-to-child> <name>"
  exit 1
fi
SRC=$1
NAME=$2
DEST="$(dirname "$0")/../repos/$NAME"
mkdir -p "$DEST"
ln -s "$SRC" "$DEST"
echo "Linked $SRC -> $DEST"
