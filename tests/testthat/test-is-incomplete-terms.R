context("is-incomplete-terms")

test_that("is_incomplete_terms", {
  expect_false(is_incomplete_terms(term(0L)))
  expect_false(is_incomplete_terms(as.term("b")))
  expect_identical(is_incomplete_terms(as.term(c("b", NA))), NA)
  expect_false(is_incomplete_terms(as.term(c("b", "b[2]"))))
  expect_error(
    is_incomplete_terms(as.term(c("b", "b[2]", "b[4,] "))),
    "^`x` must have terms with consistent parameter dimensions[.]$", class = "chk_error"
  )
  expect_false(is_incomplete_terms(as.term("b[1]")))
  expect_true(is_incomplete_terms(as.term("b[2]")))
  expect_false(is_incomplete_terms(as.term(c("b[2]", "b"))))
  expect_false(is_incomplete_terms(as.term(c("a[1,1]", "a[1,2]", "a[2,1]", "a[2,2]"))))
  expect_true(is_incomplete_terms(as.term(c("a[1,1]", "a[1,2]", "a[2,1]"))))
})
