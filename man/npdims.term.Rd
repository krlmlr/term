% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/npdims.R
\name{npdims.term}
\alias{npdims.term}
\title{Number of Dimensions of each Parameter}
\usage{
\method{npdims}{term}(x, terms = FALSE, ...)
}
\arguments{
\item{x}{An object.}

\item{terms}{A flag specifying whether to get the number of dimensions for each term element.}

\item{...}{Other arguments passed to methods.}
}
\value{
An integer scalar of the number of parameters.
}
\description{
Gets the number of parameters of an object as returned by \code{\link[universals:pars]{pars()}}.
}
\examples{
npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
}
\seealso{
\code{\link[universals:pars]{pars()}}

Other {MCMC dimensions}: 
\code{\link[universals]{nchains}()},
\code{\link[universals]{niters}()},
\code{\link[universals]{nsams}()},
\code{\link[universals]{nsims}()},
\code{\link[universals]{nterms}()}

Other {parameters}: 
\code{\link[universals]{pars}()},
\code{\link[universals]{set_pars}()}
}
