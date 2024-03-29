% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interpolation.R, R/ipol.R
\name{interpolation}
\alias{interpolation}
\title{Parallel version of multilinear interpolation generator for function approximation}
\usage{
interpolation(evalfun, grid_list, cores = detectCores(), int = FALSE, ...)
}
\arguments{
\item{evalfun}{The objective function to be approximated.}

\item{grid_list}{A list for grid points (each element of list is a vector represents ticklabels on a dimension). The number of list elements are the dimension of function inputs.}

\item{cores}{The numbers of cores (threads) of your machine to conduct parallel computing.}

\item{int}{Logical indicator. \code{int = TRUE} interpolant value multiplied by 10^7 then convert to interger to save memory. Original interpolant if \code{int = FALSE}.}

\item{...}{Other inputs for objective functions to be passed through.}
}
\value{
\code{interpolation} returns
\itemize{
      \item{value: }{A list of of length p corresponding to each variable. Returns NA for continuous variable; proportion of zeros for binary/truncated variables; the cumulative proportions of zeros and ones (e.g. first value is proportion of zeros, second value is proportion of zeros and ones) for ternary variable.}
      \item{interpolant: }{An interpolant function generated by \code{chebpol::chebpol} for interplation.}
}
}
\description{
Parallel version of multilinear interpolation generator for function approximation

The primary method is \code{\link{ipol}} which
dispatches to some other method.  All the generated
\link{interpolant}s accept as an argument a matrix of column
vectors. The generated functions also accept an argument
\code{threads=getOption('ipol.threads')} to utilize more than
one CPU if a matrix of column vectors is evaluated.  The option
\code{ipol.threads} is initialized from the environment variable
\code{IPOL_THREADS} upon loading of the package. It defaults to \code{1}.
}
\details{
The interpolants are ordinary R-objects and can be saved with \code{save()} and loaded
later with \code{load()} or serialized/unserialized with other tools, just like any R-object.
However, they contain calls to functions in the package, and while the author will make efforts
to ensure that generated interpolants are compatible with future versions of \pkg{ipol},
I can issue no such absolute guarantee.
}
\examples{
\dontrun{grid_list = list(seq(-0.5, 0.5, by = 0.5), seq(-0.5, 0.5, by = 0.5))
objfun = function(x, y) {x^2 + sqrt(y)}
evalfun = function(X) {objfun(X[1], X[2])}
value = interpolation(evalfun = evalfun, grid_list = grid_list)$value
interpolant = interpolation(evalfun = evalfun, grid_list = grid_list)$interpolant}
}
\seealso{
\link{ipol}, \link{interpolant}
}
