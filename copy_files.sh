
#!/usr/bin/env bash
set -euo pipefail

# Debug: show args and which shell
# (you can comment these three lines out later)
echo "ARG1=$1"
echo "ARG2=$2"
echo "SHELL=$0"

# Usage check
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <source_dir> <dest_dir>"
  exit 1
fi

src_dir="$1"
dest_dir="$2"

if [[ ! -d "$src_dir" ]]; then
  echo "❌ Source directory not found: $src_dir"
  exit 1
fi

mkdir -p "$dest_dir"

shopt -s nullglob
count=0
for file in "$src_dir"/*; do
  if [[ -f "$file" ]]; then
    cp -p "$file" "$dest_dir/"
    echo "✅ $(basename "$file") copied successfully."
    ((count++))
  fi
done

echo "———"
echo "📦 Total files copied: $count"
echo "📁 Destination: $dest_dir"
