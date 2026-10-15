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
| `fixtures/bmp/bmpsuite` | BMP Suite 2.8 by Jason Summers, https://entropymine.com/jason/bmpsuite/: the generated `g`, `q`, `b` files and the reference renderings (`ref/`, from its html folder), imported by PixCodec's `tests/oracle/import_bmpsuite.py` | the generated images are public domain except for embedded ICC profiles (`README.bmpsuite.txt`); the generator itself (GPL-3.0) is not included |
| `fixtures/hdr` | `studio_small_09_1k.hdr` of Poly Haven, https://polyhaven.com/a/studio_small_09 | CC0 |
| `fixtures/metadata/exiftool` | sample images of ExifTool 13.59 | Perl terms (GPL or Artistic), see the README there |
| `fixtures/metadata/odm` | OpenDroneMap sample drone photos, truncated after the scan start | CC0, see the README there |
| `fixtures/icc` | Compact-ICC-Profiles by Clinton Ingram (https://github.com/saucecontrol/Compact-ICC-Profiles) and the ICC's `sRGB_v4_ICC_preference.icc`, unchanged | CC0 1.0 / ICC terms (copy and distribute unchanged), see the README there |
| `fixtures/lerc` | `bluemarble_256_256_3_byte.lerc2`, `california_400_400_1_float.lerc2` and `world.lerc1` of https://github.com/Esri/lerc (testData), renamed `esri_*.lerc` | Apache-2.0, see `LICENSE.Apache-2.0` and `ESRI-NOTICE.txt` |

The `.ref`, `.json` and `.sha256` sidecars and `fixtures/lerc/manifest.tsv` are reference decodes / hashes of these files.

## Downloaded files (not committed)

Some collections may not be redistributed, or come without a licence. Only lists and hashes of them are committed;
the scripts fetch the files themselves (git-ignored):

| Files | Fetched by | Used by |
| --- | --- | --- |
| `fixtures/webp/vectors/*.webp`: libwebp test vectors, https://chromium.googlesource.com/webm/libwebp-test-data (no licence file) | `fetch/fetch_webp_vectors.sh` | `WebpTests.VectorsMatchReference` |
| `fixtures/jp2/conformance/**`: Rec. ITU-T T.803 \| ISO/IEC 15444-4 conformance codestreams, https://gitlab.com/wg1/htj2k-codestreams (conformance testing only, 93 MB) | `fetch/fetch_jp2_conformance.sh` | `Jp2ConformanceTests` |
| `fixtures/tga/gimp/*.tga`, `*.png`: GIMP-written TGA files and their PNG renderings from Pillow 11.1.0 `Tests/images/tga/common` (no licence of their own) | `fetch/fetch_pillow_tga.sh` | `BmpTgaThirdPartyTests.GimpWrittenTga` |
| `downloads/tiff-samples`: libtiff's sample pictures (pics-3.8.0, no licence) | PixCodec's `tests/oracle/fetch_tiff_samples.py` | `TiffTests.RealWorldSamples` |
| `downloads/tiff-samples/JP2K-33003-1.svs`: OpenSlide test data (CC0, 64 MB) | `fetch_tiff_samples.py --aperio` | `TiffTests.AperioJpeg2000Sample` |
| `downloads/gdal-samples`: the TIFF files of the GDAL 3.11.0 autotest archive | `fetch_tiff_samples.py --gdal` | `TiffTests.GdalAutotestSamples` |

`fixtures/tga/gimp/sha256.txt`, `fixtures/webp/vectors/refs.txt` (size, channels and SHA-256 of libwebp's decode per vector) and
`fixtures/jp2/conformance/limits.txt` (SHA-256 of codestreams and reference images, error bounds of the standard)
are committed.
