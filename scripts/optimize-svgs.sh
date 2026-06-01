#!/usr/bin/env bash
# Optional helper script to optimize SVGs locally using svgo
# Usage: ./scripts/optimize-svgs.sh [--in-place]

set -euo pipefail

IN_PLACE=0
if [ "${1-}" = "--in-place" ]; then
  IN_PLACE=1
fi

if ! command -v svgo >/dev/null 2>&1; then
  echo "svgo not found. Install via: npm install -g svgo"
  exit 1
fi

SRC_DIR="assets/svg"
BACKUP_DIR="$SRC_DIR/backup"

mkdir -p "$BACKUP_DIR"

for f in "$SRC_DIR"/*.svg; do
  [ -e "$f" ] || continue
  fname=$(basename "$f")
  echo "Optimizing $fname"
  if [ "$IN_PLACE" -eq 1 ]; then
    cp "$f" "$BACKUP_DIR/"
    svgo "$f" -o "$f"
  else
    mkdir -p "$SRC_DIR/optimized"
    svgo "$f" -o "$SRC_DIR/optimized/$fname"
  fi
done

echo "Done."
