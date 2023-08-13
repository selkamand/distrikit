
<!-- README.md is generated from README.Rmd. Please edit that file -->

# distrikit

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/distrikit)](https://CRAN.R-project.org/package=distrikit)
<!-- badges: end -->

distrikit is a personal package which provides a standardised interface
for basic statistic transformations & analyses

## Installation

You can install the development version of distrikit like so:

``` r
# install.packages('remotes')
remotes::install_github('selkamand/distrikit')
```

## Quick Start

``` r
library(distrikit)

# Create Data
data <- c(10, 12, 9, 11, 15, 8, 14, 10, 7)

# Compute Z scores
compute_zscore_robust(data)
#> [1]  0.0000000  0.6744908 -0.3372454  0.3372454  1.6862269 -0.6744908  1.3489815
#> [8]  0.0000000 -1.0117361
```
