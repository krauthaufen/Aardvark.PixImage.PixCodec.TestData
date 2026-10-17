#!/bin/sh
# Fetches the MPO samples of Pillow 11.1.0 (Tests/images: two stereo files and damaged variants, no licence of their
# own) and checks them against fixtures/mpo/pillow/sha256.txt (not redistributed here).
set -e
dir="$(cd "$(dirname "$0")/../fixtures/mpo/pillow" && pwd)"
base=https://raw.githubusercontent.com/python-pillow/Pillow/11.1.0/Tests/images
cut -d' ' -f3 "$dir/sha256.txt" | while read -r f; do curl -sSfL -o "$dir/$f" "$base/$f"; done
cd "$dir" && sha256sum -c --quiet sha256.txt
