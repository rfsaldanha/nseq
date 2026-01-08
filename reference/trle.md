# Run Length Encoding and return result as a data frame

Given a tibble object and a variable `y`, this function will count the
number of occurrence of each element in `y` in the sequence that they
appear, and return this count as a tibble object.

## Usage

``` r
trle(x)
```

## Arguments

- x:

  a vector.

## Value

a `data.frame` object.

## See also

[`rle()`](https://rdrr.io/r/base/rle.html)

## Examples

``` r
trle(c(8,15,20,0,0,0,0,5,9,12))
#>   value length
#> 1     8      1
#> 2    15      1
#> 3    20      1
#> 4     0      4
#> 5     5      1
#> 6     9      1
#> 7    12      1
```
