% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as-character.R, R/as-term.R
\name{as.character.term}
\alias{as.character.term}
\alias{as.term}
\alias{as.term.character}
\alias{as.term.numeric}
\title{Coerce to a Term Vector}
\usage{
\method{as.character}{term}(x, ...)

as.term(x, ...)

\method{as.term}{character}(x, repair = FALSE, ...)

\method{as.term}{numeric}(x, name = "par", ...)
}
\arguments{
\item{x}{The object.}

\item{...}{Unused.}

\item{repair}{A flag specifying whether to repair terms.}

\item{name}{A string specifying the name of the parameter.}
}
\description{
Coerces an R object to a \code{\link[=term-vector]{term-vector()}}.
}
\section{Methods (by class)}{
\itemize{
\item \code{term}: Coerce term vector to character vector

\item \code{character}: Coerce character vector to term vector

\item \code{numeric}: Coerce default object to term vector
}}

\examples{
as.term(matrix(1:4, 2))
as.term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]"))
}
\seealso{
\code{\link[=term-vector]{term-vector()}} and \code{\link[=repair_terms]{repair_terms()}}
}
