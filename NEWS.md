# hpar 1.41

## Changes in version 1.41.1

- Drop `getHpa()` function and use base R or tidyverse (as illustrated
  in the vignette).
- Repalce `getHpa(type = "details")` by `browseHPA()`.
- Serve data through ExperimentHub.
- Update to HPA release 21.1 <2022-05-31 Tue>
- New datasets added: `rnaConsensusTissue`, `rnaHpaTissue`,
  `rnaGtexTissue`, `rnaFantomTissue`.
- The dataset `rnaGeneTissue` becomes `rnaGeneTissue21.0` as no longer
  available in version 21.1

# hpar 1.37

## Changes in version 1.37.1

- Update to HPA release 21.0 <2021-11-22 Mon>

# hpar 1.35

## Changes in version 1.35.1

- Suggest rmarkdown

## Changes in version 1.35.0

- New Bioc devel version

# hpar 1.33

## Changes in version 1.33.3

- Private `getHpaRelease()` and `newHpaVersion()` functions that
  extracts the version, date and ensembl version from the Human
  Protein Atlas webpage and compares the version to the data in
  `hpar`.

## Changes in version 1.33.2

- Update to HPA release 20.0 <2020-11-24 Thu>

## Changes in version 1.33.1

- Update to HPA release 19.3 (2020.03.06) <2020-10-26 Mon>
- New release for Bioconductor devel 3.12 <2020-10-26 Mon>
- Updated R version (>= 3.5.0) in Depends field <2020-10-26 Mon>
- Added the Secretome data <2020-10-28 Wed>
- Updated the documentation and docs folder for pkgdown <2020-10-29 Thu>
- Automated `allHparData()` <2020-10-29 Thu>

## Changes in version 1.33.0

- New Bioc devel version

# hpar 1.29

## Changes in version 1.29.1

- Update email address <2020-03-29 Sun>

# hpar 1.25

## Changes in version 1.25.1

- Update to HPA release 18.1 <2019-01-21 Mon>

## Changes in version 1.25.0

- New release for Bioconductor devel 3.9

# hpar 1.24

## Changes in version 1.24.0

- New release for Bioconductor 3.8

# hpar 1.23

## Changes in version 1.23.4

- Update README to use BiocManager <2018-09-03 Mon>

## Changes in version 1.23.3

- Use BiocManager for installation <2018-07-19 Thu>

## Changes in version 1.23.2

- Rename 16.1 objects <2018-05-23 Wed>

## Changes in version 1.23.1

- New Bioconductor devel
- Update to HPA version 18

# hpar 1.22

## Changes in version 1.22.0

- New Bioconductor release

# hpar 1.21

## Changes in version 1.21.1

- use html_document (rather that deprecated html_document2)
  <2018-01-19 Fri>

# hpar 1.19

## Changes in version 1.19.1

- Re-generate data sets from scripts/getHpaData.R, as discrepancies
   with the data downloaded form the hpa site were documented by
   Martin Bush <2017-07-19 Wed>

## Changes in version 1.19.0

- new Bioconductor devel

## Changes in version 1.18.0

- new Bioconductor release

## Changes in version 1.17.2

- Update to HPA version 16.1 (2017.01.31) <2017-02-14 Tue>

## Changes in version 1.17.1

- Using travis and codecov <2016-12-22 Thu>
- Migrate vignette to BiocStyle's html2 <2016-12-22 Thu>

## Changes in version 1.17.0

- Bioconductor devel 3.5

## Changes in version 1.16.0

- Bioconductor release 3.4

## Changes in version 1.15.3

- Updating to HPA version 15, with new datasets <2016-09-14 Wed>

## Changes in version 1.15.2

- Version bump to trigger package rebuilding now that purl()'ing issue
  has been correctly identified. knitr does not create purl()'ed
  (Stangle equivalent) .R files if _R_CHECK_TIMINGS_ is set, which the
  build system was setting. Now it's not set, so these .R files are
  now created. See https://github.com/yihui/knitr/issues/1212 for
  more. r117512 | d.tenenbaum | 2016-05-15 21:14:22 +0100 (Sun, 15 May
  2016) | 6 lines

## Changes in version 1.15.1

- Bump version of all packages that use knitr for vignettes. This is
  because of an issue (now fixed) in knitr which failed to create
  purl()'ed R files from vignette sources and include them in the
  package. This version bump will cause these packages to propagate
  with those R files included. r117081 | d.tenenbaum | 2016-05-03
  22:30:44 +0100 (Tue, 03 May 2016) | 2 lines

## Changes in version 1.15.0

- Bioc version 3.3

## Changes in version 1.13.0

- Bioc version 3.1

## Changes in version 1.11.1

- unit tests <2015-06-30 Tue>

## Changes in version 1.11.0

- Bio version 3.2 (devel)

## Changes in version 1.10.0

- Bio version 3.1 (release)

## Changes in version 1.9.1

- Updated to HPA version 13 <2014-11-15 Sat>
- Use BiocStyle for vignette <2014-11-15 Sat>

## Changes in version 1.3.1

- Updated to HPA version 11 <2013-04-11 Thu>

## Changes in version 1.3.0

- Bioc 2.13 devel version bump

## Changes in version 1.2.0

- Bioc 2.12 stable version bump

## Changes in version 1.1.2

- Vignette update for knitr 1.0 compatibility,
   thanks Dan! <2013-01-15 Tue>

## Changes in version 1.1.1

- fixing vignette <2012-10-02 Tue>

## Changes in version 1.1.0

- version bump for new devel <2012-10-01 Mon>

# hpar 0.99

## Changes in version 0.99.1

- Added collate field <2012-09-14 Fri>
- Updated to HPA version 10 <2012-09-15 Sat>
- Updated installation part in section to use
   biocLite <2012-09-15 Sat>

## Changes in version 0.99.0

- Added vignette <2012-09-06 Thu>

## Changes in version 0.1.0

- Initial commit <2012-09-06 Thu>
