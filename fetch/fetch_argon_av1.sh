#!/bin/sh
# Fetches the Argon AV1 conformance streams v2.1.1 (AOMedia, https://gitlab.com/AOMediaCodec/argon-streams; 7 GB zip,
# 30 GB unpacked) into downloads/argon-av1 and checks the archive's MD5.
set -e
dir="$(cd "$(dirname "$0")/.." && pwd)/downloads/argon-av1"
mkdir -p "$dir"
zip="$dir/argon.zip"
[ -f "$zip" ] || curl -sSfL -o "$zip" "https://aom-cwg-av1-argon-streams-public.s3.us-east-1.amazonaws.com/argon_coveragetool_av1_base_and_extended_profiles_v2.1.1.zip"
echo "5dd3554c3f73c80f06c7fceeaa1f5dd9  $zip" | md5sum -c --quiet
cd "$dir" && unzip -q -o argon.zip
