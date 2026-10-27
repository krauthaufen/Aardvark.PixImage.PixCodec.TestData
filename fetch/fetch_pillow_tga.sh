#!/bin/sh
# Fetches the GIMP-written TGA samples of Pillow 11.1.0 (Tests/images/tga/common, no licence of their own) together with
# their PNG renderings, and checks them against fixtures/tga/gimp/sha256.txt (not redistributed here).
set -e
dir="$(cd "$(dirname "$0")/../fixtures/tga/gimp" && pwd)"
base=https://raw.githubusercontent.com/python-pillow/Pillow/11.1.0/Tests/images/tga/common
cut -d' ' -f3 "$dir/sha256.txt" | while read -r f; do curl -sSfL --retry 6 --retry-all-errors --retry-delay 10 -o "$dir/$f" "$base/$f"; done
cd "$dir" && sha256sum -c --quiet sha256.txt
