[![Build Status](https://travis-ci.org/lgatto/hpar.svg?branch=master)](https://travis-ci.org/lgatto/hpar)
[![codecov](https://codecov.io/gh/lgatto/hpar/branch/master/graph/badge.svg)](https://codecov.io/gh/lgatto/hpar)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ManonMartin/hpar/test-HPA-version?color=%23FFBB00&label=HPA-version&style=flat-square)](https://github.com/ManonMartin/hpar/actions?query=workflow%3Atest-HPA-version)

# Human Protein Atlas in R

`hpar` is a simple interface to the
[Human Protein Atlas](http://www.proteinatlas.org/).

The official Bioconductor landing page for the
[release](http://bioconductor.org/packages/release/bioc/html/hpar.html)
and devel
[versions](http://bioconductor.org/packages/devel/bioc/html/hpar.html).

## Installation

```r
## load or install BiocManager
if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("hpar", version = "devel")
```

## Documentation

In R:

```
vignette("hpar")
?hpar
```

Online:

http://lgatto.github.io/hpar

## Questions

Open a [github issue](https://github.com/lgatto/hpar/issues) or ask on
the [Bioconductor support forum](https://support.bioconductor.org/).
