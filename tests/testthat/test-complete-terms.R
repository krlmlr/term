context("complete-terms")

test_that("complete_terms", {
  expect_identical(complete_terms(term()), term())
  expect_identical(complete_terms("b"), as.term("b"))
  expect_identical(complete_terms(as.term("b")), as.term("b"))
  expect_identical(complete_terms(as.term("b[1]")), as.term("b"))
  expect_identical(complete_terms(as.term(c("b", "b[3]"))), 
                                  as.term(c("b[1]", "b[3]", "b[2]")))
  expect_identical(complete_terms(as.term("b[3]")), as.term(c("b[3]", "b[1]", "b[2]")))
  expect_identical(complete_terms(as.term(c("z[2,2]", "z[2,1]"))), 
                   as.term(c("z[2,2]", "z[2,1]", "z[1,1]", "z[1,2]")))
})