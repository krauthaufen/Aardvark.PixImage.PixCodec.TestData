# Aardvark.PixImage.PixCodec test data

Third-party test files for the Aardvark.PixImage.PixCodec tests, kept out of the Aardvark.PixImage.PixCodec repository so that it holds only MIT
material. Nothing here is part of Aardvark.PixImage.PixCodec; every file keeps the licence of its source, which sits next to it.

The Aardvark.PixImage.PixCodec tests find this repository through the environment variable `PIXCODEC_TESTDATA` or as
`Aardvark.PixImage.PixCodec.TestData` next to the Aardvark.PixImage.PixCodec checkout. Without it the tests that need these files are skipped.

`fixtures/` mirrors `tests/fixtures` of Aardvark.PixImage.PixCodec: `name.ext.ref` and the other sidecars next to a file are what
reference decoders make of it, written by Aardvark.PixImage.PixCodec's `tests/oracle/gen_*.py`.

## Committed files

| Folder | Source | Licence |
| --- | --- | --- |
| `fixtures/png/pngsuite` | PngSuite by Willem van Schaik, http://www.schaik.com/pngsuite/ | free to use, copy, modify and distribute, see `PngSuite.LICENSE` |
| `fixtures/exr/official` | `ColorCodedLevels.exr`, `MirrorPattern.exr` and `Trunks.exr` of https://github.com/AcademySoftwareFoundation/openexr-images | BSD-3-Clause, see `LICENSE.openexr-images` |
| `fixtures/bmp/bmpsuite` | BMP Suite 2.8 by Jason Summers, https://entropymine.com/jason/bmpsuite/: the generated `g`, `q`, `b` files and the reference renderings (`ref/`, from its html folder), imported by Aardvark.PixImage.PixCodec's `tests/oracle/import_bmpsuite.py` | the generated images are public domain except for embedded ICC profiles (`README.bmpsuite.txt`); the generator itself (GPL-3.0) is not included |
| `fixtures/hdr` | `studio_small_09_1k.hdr` of Poly Haven, https://polyhaven.com/a/studio_small_09 | CC0 |
| `fixtures/metadata/exiftool` | sample images of ExifTool 13.59 | Perl terms (GPL or Artistic), see the README there |
| `fixtures/metadata/odm` | OpenDroneMap sample drone photos, truncated after the scan start | CC0, see the README there |
| `fixtures/icc` | Compact-ICC-Profiles by Clinton Ingram (https://github.com/saucecontrol/Compact-ICC-Profiles) and the ICC's `sRGB_v4_ICC_preference.icc`, unchanged | CC0 1.0 / ICC terms (copy and distribute unchanged), see the README there |
| `fixtures/gainmap/photos` | `pixel9pro_lounge.jpg`: [Capital One Lounge buffet Dulles Airport VA 2025-09-02 20-10-31 1.jpg](https://commons.wikimedia.org/wiki/File:Capital_One_Lounge_buffet_Dulles_Airport_VA_2025-09-02_20-10-31_1.jpg) by G. Edward Johnson (Google Pixel 9 Pro, Ultra HDR); `xiaomi_bromo_sunrise.jpg`: [Bromo-Tengger-Semeru National Park sunrise.jpg](https://commons.wikimedia.org/wiki/File:Bromo-Tengger-Semeru_National_Park_sunrise.jpg) by Dare2Leap (Xiaomi, Ultra HDR); both from Wikimedia Commons, unchanged | CC BY 4.0 / CC BY-SA 4.0 (https://creativecommons.org/licenses/by/4.0, https://creativecommons.org/licenses/by-sa/4.0) |
| `fixtures/lerc` | `bluemarble_256_256_3_byte.lerc2`, `california_400_400_1_float.lerc2` and `world.lerc1` of https://github.com/Esri/lerc (testData), renamed `esri_*.lerc` | Apache-2.0, see `LICENSE.Apache-2.0` and `ESRI-NOTICE.txt` |

The `.ref`, `.blocks.ref`, `.json` and `.sha256` sidecars and `fixtures/lerc/manifest.tsv` are reference decodes / hashes of these files.

## Downloaded files (not committed)

Some collections may not be redistributed, or come without a licence. Only lists and hashes of them are committed;
the scripts fetch the files themselves (git-ignored):

| Files | Fetched by | Used by |
| --- | --- | --- |
| `fixtures/webp/vectors/*.webp`: libwebp test vectors, https://chromium.googlesource.com/webm/libwebp-test-data (no licence file) | `fetch/fetch_webp_vectors.sh` | `WebpTests.VectorsMatchReference` |
| `fixtures/jp2/conformance/**`: Rec. ITU-T T.803 \| ISO/IEC 15444-4 conformance codestreams, https://gitlab.com/wg1/htj2k-codestreams (conformance testing only, 93 MB) | `fetch/fetch_jp2_conformance.sh` | `Jp2ConformanceTests` |
| `fixtures/tga/gimp/*.tga`, `*.png`: GIMP-written TGA files and their PNG renderings from Pillow 11.1.0 `Tests/images/tga/common` (no licence of their own) | `fetch/fetch_pillow_tga.sh` | `BmpTgaThirdPartyTests.GimpWrittenTga` |
| `fixtures/mpo/pillow/*.mpo`, `*.jpg`: MPO stereo samples and damaged variants of Pillow 11.1.0 `Tests/images` (no licence of their own) | `fetch/fetch_pillow_mpo.sh` | `GainMapTests.PillowMpoSamples` |
| `downloads/tiff-samples`: libtiff's sample pictures (pics-3.8.0, no licence) | Aardvark.PixImage.PixCodec's `tests/oracle/fetch_tiff_samples.py` | `TiffTests.RealWorldSamples` |
| `downloads/tiff-samples/JP2K-33003-1.svs`: OpenSlide test data (CC0, 64 MB) | `fetch_tiff_samples.py --aperio` | `TiffTests.AperioJpeg2000Sample` |
| `downloads/gdal-samples`: the TIFF files of the GDAL 3.11.0 autotest archive | `fetch_tiff_samples.py --gdal` | `TiffTests.GdalAutotestSamples` |
| `downloads/jpegls-conformance`: the ITU-T T.87 \| ISO/IEC 14495-1 conformance images, from CharLS 2.4.2 `test/conformance` (no licence of their own) | Aardvark.PixImage.PixCodec's `tests/oracle/fetch_jpegls_conformance.py` | `JpegLsTests.ConformanceImages` |
| `downloads/jxl-conformance`: the JPEG XL conformance suite, https://github.com/libjxl/conformance (BSD-3-Clause, source image licences in its testcases/README.md) | Aardvark.PixImage.PixCodec's `tests/oracle/fetch_jxl_conformance.py` | `JxlTests.Conformance` |
| `fixtures/av1/aom/*.ivf`, `*.md5`: the libaom AV1 test vectors (`av1-1-*`) and their per-frame MD5s, https://storage.googleapis.com/aom-test-data (AOMedia, no licence file; 242 streams, 8 MB) | `fetch/fetch_av1_test_vectors.sh` | `AvifTests.AomTestVector` |
| `fixtures/avif/libavif/**`: the AVIF files of libavif 1.2.1 `tests/data`, https://github.com/AOMediaCodec/libavif (licences per file in its `tests/data/README.md`, fetched with them: libavif's BSD-2-Clause, Kodak's unrestricted usage, ...; 51 files, 2 MB) | `fetch/fetch_libavif_testdata.sh` | `AvifTests.LibavifTestFiles` |
| `downloads/argon-av1`: the Argon AV1 conformance streams v2.1.1 of AOMedia, https://gitlab.com/AOMediaCodec/argon-streams (no licence stated; 7 GB zip) | `fetch/fetch_argon_av1.sh` | `AvifTests.ArgonConformance` (only with `PIXCODEC_ARGON=1`) |
| `downloads/dng-samples`: 14 camera DNG files of https://raw.pixls.us (CC0 1.0; Adobe DNG Converter lossy, Apple iPhone 6s Plus / 12 Pro, Blackmagic Pocket, Canon A410 CHDK, Canon 5D Mark III (2), Fujifilm X100S X-Trans, Google Pixel 2 XL, Leica M9 / M Monochrom 246, Nikon D80, Pentax K-x, Samsung Galaxy S23; 190 MB) with tifffile / LibRaw references | Aardvark.PixImage.PixCodec's `tests/oracle/fetch_dng_samples.py` | `DngTests.RealSamples*` |
| `downloads/dicom-samples`: pydicom 3.0.1's test files (those it ships, MIT licensed package, and the ones it downloads from https://github.com/pydicom/pydicom-data at the commit it pins, checked against its hashes; anonymised images obtained without restrictions per its README; 157 files, 60 MB) with pydicom / GDCM references (66 MB, gzipped) | Aardvark.PixImage.PixCodec's `tests/oracle/fetch_dicom_samples.py` | `DicomTests.SamplesMatchPydicom` |

`fixtures/tga/gimp/sha256.txt`, `fixtures/mpo/pillow/sha256.txt`, `fixtures/av1/aom/sha256.txt`, `fixtures/avif/libavif/refs.txt` (SHA-256 of each file and of avifdec's decoded planes), `fixtures/webp/vectors/refs.txt` (size, channels and SHA-256 of libwebp's decode per vector) and
`fixtures/jp2/conformance/limits.txt` (SHA-256 of codestreams and reference images, error bounds of the standard)
are committed.
