# Count the number of events in a sequence

This function will count the occurrence of sequential events that meets
some conditions.

## Usage

``` r
trle_cond(x, a_op = "gte", a, b_op = "gte", b, isolated = FALSE, pos = FALSE)
```

## Arguments

- x:

  numeric vector.

- a_op, b_op:

  character. Operator, `gte` = greater than or equal, `lte` = less than
  or equal, `gt` = greater than, `lt` = less than, `e` = equal.

- a:

  integer. Length of period threshold.

- b:

  integer. Value threshold.

- isolated:

  logical. Consider only isolated events, i.e. surrounded by zeros. On
  this case, `a` and `a_op` are not considered.

- pos:

  logical. Return start and end position of each event, instead of
  counts.

## Value

a integer count value, or a data.frame if `pos` is `TRUE`.

## Details

Example: In a vector, how many sequences have at least 3 consecutive
observations (`a_op = "gte", a = 3`) with values equal or greater than 5
(`b_op = "gte", b = 5`)?

## Examples

``` r
# How many sequences have at least 3 consecutive observations with value equal or greater than 5?
trle_cond(x = c(8,15,20,0,0,0,0,5,9,12), a_op = "gte", a = 3, b_op = "gte", b = 5)
#> [1] 2
```
