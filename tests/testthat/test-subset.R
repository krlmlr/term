context("subset")

test_that("subset.term", {
  term <- as.term(c("alpha[1]", "alpha[2]", "sigma"))
  expect_identical(subset(term, character(0)), term(0L))
  expect_error(subset(term, "beta"),
    "^`pars` must match 'alpha' or 'sigma', not 'beta'[.]$",
    class = "chk_error"
  )
  term <- as.term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(subset(term), term)
  expect_identical(subset(term, "sigma"), as.term("sigma"))
  expect_identical(
    subset(term, c("beta", "sigma")),
    as.term(c(
      "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))
  )
  expect_identical(
    subset(term, c("sigma", "beta")),
    as.term(c(
      "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))
  )
  expect_error(subset(term, "tt"),
    "^`pars` must match 'alpha', 'beta' or 'sigma', not 'tt'[.]$",
    class = "chk_error"
  )
})

test_that("subset.term deprecated", {
  term <- as.term(c("alpha[1]", "alpha[2]", "sigma"))
  
  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(subset(term, select = NULL), class = "defunctError")
  })
 
    suppressWarnings(expect_error(subset(term, select = "alpha", pars = "alpha"), class = "defunctError"))
    
  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_identical(subset(term, select = character(0)), term(0L))
  })
})


test_that("subset.term missing values", {
  expect_error(subset(NA_term_), "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_error(subset(c(NA_term_, "a")),
    "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
})
