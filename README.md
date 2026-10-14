# PixCodec test data

Third-party test files for the PixCodec tests, kept out of the PixCodec repository so that it holds only MIT
material. Nothing here is part of PixCodec; every file keeps the licence of its source, which sits next to it.

The PixCodec tests find this repository through the environment variable `PIXCODEC_TESTDATA` or as
`pixcodec-testdata` next to the PixCodec checkout. Without it the tests that need these files are skipped.

`fixtures/` mirrors `tests/fixtures` of PixCodec: `name.ext.ref` and the other sidecars next to a file are what
reference decoders make of it, written by PixCodec's `tests/oracle/gen_*.py`.

## Committed files

| Folder | Source | Licence |
| --- | --- | --- |
| `fixtures/png/pngsuite` | PngSuite by Willem van Schaik, http://www.schaik.com/pngsuite/ | free to use, copy, modify and distribute, see `PngSuite.LICENSE` |
| `fixtures/exr/official` | `ColorCodedLevels.exr`, `MirrorPattern.exr` and `Trunks.exr` of https://github.com/AcademySoftwareFoundation/openexr-images | BSD-3-Clause, see `LICENSE.openexr-images` |

The `.ref`, `.json` and `.sha256` sidecars are reference decodes / hashes of these files.

## Downloaded files (not committed)

Some collections may not be redistributed, or come without a licence. Only lists and hashes of them are committed;
the scripts fetch the files themselves (git-ignored):

| Files | Fetched by | Used by |
| --- | --- | --- |
| `fixtures/webp/vectors/*.webp`: libwebp test vectors, https://chromium.googlesource.com/webm/libwebp-test-data (no licence file) | `fetch/fetch_webp_vectors.sh` | `WebpTests.VectorsMatchReference` |
| `fixtures/jp2/conformance/**`: Rec. ITU-T T.803 \| ISO/IEC 15444-4 conformance codestreams, https://gitlab.com/wg1/htj2k-codestreams (conformance testing only, 93 MB) | `fetch/fetch_jp2_conformance.sh` | `Jp2ConformanceTests` |
| `downloads/tiff-samples`: libtiff's sample pictures (pics-3.8.0, no licence) | PixCodec's `tests/oracle/fetch_tiff_samples.py` | `TiffTests.RealWorldSamples` |
| `downloads/tiff-samples/JP2K-33003-1.svs`: OpenSlide test data (CC0, 64 MB) | `fetch_tiff_samples.py --aperio` | `TiffTests.AperioJpeg2000Sample` |
| `downloads/gdal-samples`: the TIFF files of the GDAL 3.11.0 autotest archive | `fetch_tiff_samples.py --gdal` | `TiffTests.GdalAutotestSamples` |

`fixtures/webp/vectors/refs.txt` (size, channels and SHA-256 of libwebp's decode per vector) and
`fixtures/jp2/conformance/limits.txt` (SHA-256 of codestreams and reference images, error bounds of the standard)
are committed.
