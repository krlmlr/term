#' Term Index
#'
#' Gets the index for each term of an object.
#'
#' For example the index of `beta[2,1]` is `c(2L, 1L)`
#' while the index for `sigma` is `1L`.
#' It is useful for extracting the values of individual terms.
#'
#' @inheritParams params
#' @return A named list of integer vectors of the index for each term.
#' @family {dimensions}
#' @export
#'
#' @examples
#' tindex(as.term(c("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]")))
tindex <- function(x) {
  x <- as.term(x)
  names <- x
  x <- sub(p0("^", .par_name_pattern), "", x)
  x <- sub("^$", "1", x)
  x <- gsub("\\[|\\]", "", x)
  x <- strsplit(x, ",")
  x <- lapply(x, as.integer)
  x[is.na(x)] <- 1L
  x[is.na(names)] <- NA_integer_
  names(x) <- names
  x
}
