% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/valid-term.R
\name{valid_term}
\alias{valid_term}
\title{Valid Terms}
\usage{
valid_term(x)
}
\arguments{
\item{x}{The object.}
}
\value{
A logical vector indicating whether each term is valid.
}
\description{
Test whether each element in a term vector is valid.
}
\details{
Repairing a term vector replaces invalid terms with a missing value.
}
\examples{
# valid term elements
valid_term(as.term(c("a", "a [3]", " b [ 1  ] ", "c[1,300,10]")))
# invalid term elements
valid_term(as.term(c("a b", "a[1]b", "a[0]", "b[1,]", "c[]", "d[1][2]")))
}
\seealso{
\code{\link[=term-vector]{term-vector()}} and \code{\link[=repair_terms]{repair_terms()}}
}
