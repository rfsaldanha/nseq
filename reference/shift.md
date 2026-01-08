# Shifts vector values to right or left

Shifts vector values to right or left

## Usage

``` r
shift(x, n, invert = FALSE, default = NA)
```

## Arguments

- x:

  Vector for which to shift values

- n:

  Number of places to be shifted. Positive numbers will shift to the
  right by default. Negative numbers will shift to the left by default.
  The direction can be inverted by the invert parameter.

- invert:

  Whether or not the default shift directions should be inverted.

- default:

  The value that should be inserted by default.

## Value

a vector.

## Examples

``` r
# Lag
shift(c(2,3,5,6,7), n = 1, default = 0)
#> [1] 0 2 3 5 6
# Lead
shift(c(2,3,5,6,7), n = -1, default = 0)
#> [1] 3 5 6 7 0
```
