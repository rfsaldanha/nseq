test_that("trle works", {
  res <- trle(c(8,15,20,0,0,0,0,5,9,12))

  expect_equal(nrow(res), 7)
})
