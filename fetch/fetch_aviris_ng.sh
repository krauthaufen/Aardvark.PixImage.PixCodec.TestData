#!/bin/sh
# Fetches the geometry files of AVIRIS-NG flight line ang20150811t172724 (rdn v1h, NASA / JPL, no licence of its own;
# 34 MB) into downloads/aviris-ng: the orthocorrected lookup table (GLT; its ENVI header has map info rotation=-80) and
# the per-pixel input geometry (IGM: UTM easting, northing and elevation of each raw pixel centre), checked against
# fixtures/envi/aviris-ng/sha256.txt (not redistributed here). gdal.json there is what GDAL 3.12 reads from the GLT.
set -e
root="$(cd "$(dirname "$0")/.." && pwd)"
sums="$root/fixtures/envi/aviris-ng/sha256.txt"
dir="$root/downloads/aviris-ng"
mkdir -p "$dir"
base=https://avng.jpl.nasa.gov/pub/ZYang/ang20150811t172724_rdn_v1h
cut -d' ' -f3 "$sums" | while read -r f; do
  [ -f "$dir/$f" ] || curl -sSfL --retry 6 --retry-all-errors --retry-delay 10 -o "$dir/$f" "$base/$f" || { echo "failed: $base/$f" >&2; exit 1; }
done
cd "$dir" && sha256sum -c --quiet "$sums"
