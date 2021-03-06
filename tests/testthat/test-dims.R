context("dims")

test_that("dims.term", {
  expect_identical(dims(term(0L)), 0L)
  expect_identical(dims(as.term("beta0")), 1L)
  expect_identical(dims(as.term(c("beta[1,1]", "beta[2,1]"))), 2L)
})
