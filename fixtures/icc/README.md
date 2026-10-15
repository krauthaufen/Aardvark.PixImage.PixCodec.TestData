# ICC profiles

Third-party ICC profiles for Aardvark.PixImage.PixCodec's colour management tests (`IccTests.ThirdPartyMatchesLittleCms`), copied here
unchanged by Aardvark.PixImage.PixCodec's `tests/oracle/gen_icc.py`, with LittleCMS 2 reference conversions of a test pattern through them
(`in_*.ref` inputs, `<case>.ref` outputs, `cases.json`).

| Files | Source | Licence |
| --- | --- | --- |
| `AdobeCompat-*.icc`, `CGATS001Compat-v2-micro.icc`, `DisplayP3*.icc`, `ProPhoto-v2-micro.icc`, `Rec2020*.icc`, `scRGB-v2.icc`, `sGrey-*.icc`, `sRGB-v*.icc`, `WideGamutCompat-v4.icc` | Compact-ICC-Profiles by Clinton Ingram, https://github.com/saucecontrol/Compact-ICC-Profiles | CC0 1.0, see `LICENSE.Compact-ICC-Profiles` |
| `sRGB_v4_ICC_preference.icc` | International Color Consortium, https://www.color.org/srgbprofiles.xalter (also in https://github.com/InternationalColorConsortium/DemoIccMAX, `Testing/`) | ICC terms in `LICENSE.ICC-profiles.txt`: copy and distribute unchanged |
