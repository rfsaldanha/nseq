
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nseq

<!-- badges: start -->

[![R-CMD-check](https://github.com/rfsaldanha/nseq/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rfsaldanha/nseq/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Compute counts and statistics of occurrence of events in sequences that
meets a criterion.

## Installation

You can install the development version of nseq from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("rfsaldanha/nseq")
```

## Example

On this vector, how many sequences have at least 3 consecutive
observations with value equal or greater than 5?

``` r
library(nseq)

vec <- c(8,15,20,8,1,7,8,0,-2,5,9,12,0,-1,4,2,3,1)

trle_cond(vec, a_op = "gte", a = 3, b_op = "gte", b = 5)
#> [1] 2
```

And how many sequences have exactly 3 consecutive observations with
value equal or greater than 5?

``` r
trle_cond(vec, a_op = "e", a = 3, b_op = "gte", b = 5)
#> [1] 1
```
