test_that("trle_cond_stat max works", {

  res <- trle_cond_stat(x = c(5,10,8,0,0,0,5,7,9,5), b = 5, b_op = "gte", stat = "max")

  expect_equal(res, 4)
})

test_that("trle_cond_stat min works", {

  res <- trle_cond_stat(x = c(5,10,8,0,0,0,5,7,9,5), b = 5, b_op = "gte", stat = "min")

  expect_equal(res, 3)
})

test_that("trle_cond_stat mean works", {

  res <- trle_cond_stat(x = c(5,10,8,0,0,0,5,7,9,5), b = 5, b_op = "gte", stat = "mean")

  expect_equal(res, 3.5)
})
