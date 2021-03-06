#' Subset Term Vector
#'
#' Subsets a term vector.
#'
#' @inheritParams params
#' @return The modified term vector.
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma"
#' ))
#' subset(term, "beta")
#' subset(term, c("alpha", "sigma"))
subset.term <- function(x, pars = NULL, select = NULL, ...) {
  chk_not_any_na(x)
  chk_unused(...)
  
  if(!missing(select)) {
    deprecate_soft("0.1.0.9003", "subset(select =)",
                   "subset(pars =)")
  }
  if(!is.null(select)) {
    chk_s3_class(select, "character")
    chk_subset(select, pars(x))
    if(!is.null(pars))
      deprecate_stop("0.1.0.9003", "subset(select =)",
                   "subset(pars =)")
    pars <- select
  }
  if (is.null(pars)) {
    return(x)
  }
  chk_s3_class(pars, "character")
  chk_subset(pars, pars(x))

  if (!length(pars)) {
    return(term(0L))
  }

  x[pars_terms(x) %in% pars]
}
