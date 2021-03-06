#' Complete Terms
#'
#' Completes an object's terms.
#'
#' @inheritParams params
#' @export
complete_terms <- function(x, ...) {   
  UseMethod("complete_terms")
}

#' @describeIn complete_terms Complete Terms for a term Vector
#' 
#' @details The term vector is repaired before being completed.
#' Missing values are ignored.
#'
#' @seealso [term-vector()], [repair_terms()] and [is_incomplete_terms()].
#' @export
#'
#' @examples
#' complete_terms(as.term(c("b[3]", "b[1]", "b[2]")))
#' complete_terms(as.term(c("z[2,2]", "z[1,1]")))
complete_terms.term <- function(x, ...) {
  if (!length(x)) {
    return(x)
  }
  x <- repair_terms(x)
  as.term(c(x, setdiff(term(pdims(x)), x)))
}
