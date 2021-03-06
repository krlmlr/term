context("npars")

test_that("npars.term", {
  expect_identical(
    npars(as.term(c(
      "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))),
    3L
  )
  
  expect_identical(
    npars(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))),
    2L
  )
})

test_that("npars.term scalar", {
  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_identical(npars(as.term(c("a[2]")), scalar = TRUE), 0L)
    expect_identical(npars(as.term(c("a[1]")), scalar = TRUE), 0L)
    expect_identical(npars(as.term(c("a[1]")), scalar = FALSE), 1L)
    expect_identical(npars(as.term(c("a[1]", "b", "c")), scalar = TRUE), 2L)
  })
})

test_that("npars.term invalid elements", {
  expect_identical(npars(as.term(c("a[2]", "b c"))), 2L)
})

test_that("npars.term missing values", {
  expect_identical(npars(as.term(c("a[2]", NA))), NA_integer_)
})

