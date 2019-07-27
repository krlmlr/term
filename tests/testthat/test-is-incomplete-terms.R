context("is-incomplete-terms")

test_that("is.incomplete_terms",{
  expect_false(is.incomplete_terms(term()))
  expect_false(is.incomplete_terms(as.term("b")))
  expect_false(is.incomplete_terms(as.term("b[1]")))
  expect_true(is.incomplete_terms(as.term("b[2]")))
  expect_false(is.incomplete_terms(as.term(c("b[2]", "b"))))
})