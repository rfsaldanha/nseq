
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nseq

<!-- badges: start -->

[![R-CMD-check](https://github.com/rfsaldanha/nseq/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rfsaldanha/nseq/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/nseq)](https://CRAN.R-project.org/package=nseq)
<!-- badges: end -->

Compute the number of sequences of values in a vector that meets
conditions of length and magnitude.

## Installation

You can install the stable release from CRAN.

``` r
install.packages("nseq")
library(nseq)
```

Or install the development version of from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("rfsaldanha/nseq")
library(nseq)
```

## Example

On this vector, how many sequences of values present at least 3
consecutive observations with values equal or greater than 5?

``` r
library(nseq)

vec <- c(8,15,20,8,1,7,8,0,-2,5,9,12,0,-1,4,2,3,1)

trle_cond(vec, a_op = "gte", a = 3, b_op = "gte", b = 5)
#> [1] 2
```

And how many sequences of values have exactly 3 consecutive observations
with values equal or greater than 5?

``` r
trle_cond(vec, a_op = "e", a = 3, b_op = "gte", b = 5)
#> [1] 1
```
