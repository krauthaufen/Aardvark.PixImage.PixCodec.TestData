#!/bin/sh
# Fetches the codestreams and reference images of the Rec. ITU-T T.803 | ISO/IEC 15444-4 conformance suite that
# fixtures/jp2/conformance/limits.txt lists (about 93 MB; not redistributed here: their copyright notice
# restricts them to JPEG 2000 conformance testing). Aardvark.PixImage.PixCodec's Jp2ConformanceTests run them.
set -e
dir="$(cd "$(dirname "$0")/../fixtures/jp2/conformance" && pwd)"
repo=https://gitlab.com/wg1/htj2k-codestreams.git
rev=f6b9ede094a0bd6e1e0427e12721e3f3ee1b704b
files="$(grep -v '^#' "$dir/limits.txt" | tr ' ' '\n' | grep -E '\.(j2k|pgx)$' | sort -u)"
missing=0
for f in $files; do [ -f "$dir/$f" ] || missing=1; done
if [ "$missing" = 1 ]; then
    # one sparse, blob-filtered fetch: gitlab rate-limits a request per raw file
    tmp="$(mktemp -d)"
    trap 'rm -rf "$tmp"' EXIT
    git -C "$tmp" init -q
    git -C "$tmp" remote add origin "$repo"
    git -C "$tmp" sparse-checkout set --no-cone $files
    git -C "$tmp" fetch -q --depth 1 --filter=blob:none origin "$rev"
    git -C "$tmp" checkout -q FETCH_HEAD
    for f in $files; do mkdir -p "$(dirname "$dir/$f")"; cp "$tmp/$f" "$dir/$f"; done
fi
# every file must be the one the limits were taken for
grep -v '^#' "$dir/limits.txt" | tr ' ' '\n' | awk 'prev ~ /\.(j2k|pgx)$/ { print $0 "  " prev } { prev = $0 }' | sort -u | (cd "$dir" && sha256sum -c --quiet -)
echo "conformance files are in $dir"
