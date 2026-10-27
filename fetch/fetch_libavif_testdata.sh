#!/bin/sh
# Fetches the AVIF files of libavif 1.2.1 tests/data (https://github.com/AOMediaCodec/libavif, licences per file in
# its tests/data/README.md, fetched alongside) listed in fixtures/avif/libavif/refs.txt and checks their hashes.
set -e
dir="$(cd "$(dirname "$0")/../fixtures/avif/libavif" && pwd)"
base=https://raw.githubusercontent.com/AOMediaCodec/libavif/v1.2.1/tests/data
[ -f "$dir/README.md" ] || curl -sSfL --retry 6 --retry-all-errors --retry-delay 10 -o "$dir/README.md" "$base/README.md"
grep -v '^#' "$dir/refs.txt" | cut -d' ' -f1 | while read -r f; do
  [ -f "$dir/$f" ] || { mkdir -p "$dir/$(dirname "$f")"; curl -sSfL --retry 6 --retry-all-errors --retry-delay 10 -o "$dir/$f" "$base/$f"; }
done
cd "$dir" && grep -v '^#' refs.txt | awk '{ print $2 "  " $1 }' | sha256sum -c --quiet
