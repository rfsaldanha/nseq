# Statistics of events in a sequence

This function will compute statistics of sequential events that meets
some conditions.

## Usage

``` r
trle_cond_stat(x, b, b_op, stat)
```

## Arguments

- x:

  numeric vector.

- b:

  integer. Value threshold.

- b_op:

  character. Operator, `gte` = greater than or equal, `lte` = less than
  or equal, `gt` = greater than, `lt` = less than, `e` = equal.

- stat:

  character. A statistic to be calculated. One of: max, min, mean,
  median, sd, var.

## Value

a numeric value

## Details

Example: in a vector, what is the maximum size of sequences with values
equal or greater than 5?

## Examples

``` r
# What is the maximum size of sequences with values equal or greater than 5?
trle_cond_stat(c(4,6,6,4,7,8,9), b = 5, b_op = "gte", stat = "max")
#> [1] 3
```
