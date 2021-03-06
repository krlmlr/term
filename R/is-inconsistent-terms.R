#' Is Inconsistent Terms
#'
#' Tests whether a term vector has inconsistent elements.
#'
#' @inheritParams params
#' @return A logical scalar indicating whether the object's terms are inconsistent.
#' @seealso [term-vector()] and [consistent_term()]
#' @export
#'
#' @examples
#' is_inconsistent_terms(as.term("b[2]"))
#' is_inconsistent_terms(as.term(c("b[2]", "b[1]")))
#' is_inconsistent_terms(as.term(c("b[2]", "b[1,1]")))
is_inconsistent_terms <- function(x, ...) {
  if (!length(x)) {
    return(FALSE)
  }
  any(!consistent_term(x))
}
