#!/bin/sh
# Fetches the NITF sample files of the NITFS Technical Board (the JITC / NTB test files for NITF 2.0, 2.1 and NSIF 1.0;
# terms of redistribution not stated) from GDAL's mirror at download.osgeo.org/gdal/data/nitf, and checks them against
# fixtures/nitf/jitc/sha256.txt (not redistributed here). sources.txt names the folder of each file on the mirror.
set -e
dir="$(cd "$(dirname "$0")/../fixtures/nitf/jitc" && pwd)"
base=https://download.osgeo.org/gdal/data/nitf
while read -r src; do curl -sSfL -o "$dir/$(basename "$src")" "$base/$src"; done < "$dir/sources.txt"
cd "$dir" && sha256sum -c --quiet sha256.txt
