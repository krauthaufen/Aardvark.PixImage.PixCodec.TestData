#!/bin/sh
# Fetches the libaom AV1 test vectors and their per-frame MD5 files listed in fixtures/av1/aom/sha256.txt
# (https://storage.googleapis.com/aom-test-data, not redistributed here) and checks their hashes.
set -e
dir="$(cd "$(dirname "$0")/../fixtures/av1/aom" && pwd)"
cut -d' ' -f3 "$dir/sha256.txt" | while read -r f; do
  [ -f "$dir/$f" ] || curl -sSfL -o "$dir/$f" "https://storage.googleapis.com/aom-test-data/$f"
done
cd "$dir" && sha256sum -c --quiet sha256.txt
