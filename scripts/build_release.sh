#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src_dir="$repo_root/datapack/blockwatch_siege"
dist_dir="$repo_root/dist"
stage_dir="$(mktemp -d)"
archive_path="$dist_dir/blockwatch_siege-release.zip"

cleanup() {
  rm -rf "$stage_dir"
}
trap cleanup EXIT

mkdir -p "$dist_dir"
rm -f "$archive_path"

cp -R "$src_dir" "$stage_dir/blockwatch_siege"
rm -rf "$stage_dir/blockwatch_siege/data/blockwatch/functions/debug"

# cd into the staged datapack so pack.mcmeta lands at the zip root,
# not nested under blockwatch_siege/ (Minecraft requires it at root for zip datapacks)
(
  cd "$stage_dir/blockwatch_siege"
  python3 -m zipfile -c "$archive_path" pack.mcmeta data
)

echo "Built release archive: $archive_path"
