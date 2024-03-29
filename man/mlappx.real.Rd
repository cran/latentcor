% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multilinear.R
\name{mlappx.real}
\alias{mlappx.real}
\alias{mlappx}
\alias{mlappxf}
\title{Multilinear interpolation on a grid}
\usage{
mlappx.real(val, grid, ...)
}
\arguments{
\item{val}{Array or function. Function values on a grid, or the function
itself. If it is the values, the \code{dim}-attribute must be appropriately
set.}

\item{grid}{A list.  Each element is a vector of ordered grid-points for a
dimension.  These need not be Chebyshev-knots, nor evenly spaced.}

\item{...}{Further arguments to the function, if \code{is.function(val)}.}
}
\value{
A \code{function(x)} defined on the hypercube, approximating the
given function.  The function yields values for arguments outside the
hypercube as well, as a linear extension.
}
\description{
Multilinear interpolation on an arbitrary Cartesian product.
}
\details{
A call \code{fun <- mlappx(val,grid)} creates a multilinear interpolant on
the grid.  The value on the grid points will be exact, the value between the
grid points is a convex combination of the values in the corners of the
hypercube surrounding it.

If \code{val} is a function it will be evaluated on the grid.
}
\keyword{internal}
