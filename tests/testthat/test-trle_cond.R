test_that("trle_cond works with at least 3 consecutive periods with value equal or greater to 5", {
  res <- trle_cond(x = c(8,15,20,0,0,0,0,5,9,12),
                   a_op = "gte", a = 3,
                   b_op = "gte", b = 5)

  expect_equal(res, 2)
})

test_that("trle_cond works with example at least 6 consecutive periods with value equal or greater to 5", {
  res <- trle_cond(x = c(5,8,9,10,8,6,0,0,0,12),
                   a_op = "gte", a = 6,
                   b_op = "gte", b = 5)

  expect_equal(res, 1)
})

test_that("trle_cond works with at least 3 consecutive periods with value equal or greater to 5", {
  res <- trle_cond(x = c(8,15,20,0,0,0,0,5,9,12),
                   a_op = "gte", a = 3,
                   b_op = "gte", b = 5)

  expect_equal(res, 2)
})

test_that("trle_cond works with no isolate periods with value equal or greater to 5", {
  res <- trle_cond(x = c(0,16,0,0,8,3,0,10,0,2,0),
                   a_op = "e", a = 1,
                   b_op = "gte", b = 5,
                   isolated = FALSE)

  expect_equal(res, 3)
})

test_that("trle_cond works with isolate periods with value equal or greater to 5", {
  res <- trle_cond(x = c(0,16,0,0,8,3,0,10,0,2,0),
                   a_op = "e", a = 1,
                   b_op = "gte", b = 5,
                   isolated = TRUE)

  expect_equal(res, 2)
})

test_that("trle_cond does not works with isolate and a different of 1 and a operator different of e", {
  expect_error(trle_cond(x = c(0,16,0,0,8,3,0,10,0,2,0), a_op = "e", a = 2, b_op = "gte", b = 5, isolated = TRUE))
  expect_error(trle_cond(x = c(0,16,0,0,8,3,0,10,0,2,0), a_op = "gt", a = 1, b_op = "gte", b = 5, isolated = TRUE))
  expect_error(trle_cond(x = c(0,16,0,0,8,3,0,10,0,2,0), a_op = "lte", a = 2, b_op = "gte", b = 5, isolated = TRUE))
})

test_that("trle_cond works with at least three consecutive periods with no counts", {
  res <- trle_cond(x = c(2,0,0,0,3,5,0,0,0,0,2),
                   a_op = "gte", a = 3,
                   b_op = "e", b = 0)

  expect_equal(res, 2)
})

test_that("trle_cond works with at least six consecutive periods with no counts", {
  res <- trle_cond(x = c(3,0,0,0,0,0,0,3,5,0,0,0,2),
                   a_op = "gte", a = 6,
                   b_op = "e", b = 0)

  expect_equal(res, 1)
})

test_that("trle_cond works with NA", {
  res <- trle_cond(x = c(8,15,20,0,0,0,0,5,NA,12),
                   a_op = "gte", a = 3,
                   b_op = "gte", b = 5)

  expect_equal(res, 1)
})
