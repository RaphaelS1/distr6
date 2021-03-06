% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ParameterSet.R
\name{getParameterSupport}
\alias{getParameterSupport}
\title{Parameter Support Accessor}
\usage{
getParameterSupport(object, id, error = "warn")
}
\arguments{
\item{object}{Distribution or ParameterSet.}

\item{id}{character, id of the parameter to return.}

\item{error}{character, value to pass to \code{stopwarn}.}
}
\value{
An R6 object of class inheriting from \link[set6:Set]{set6::Set}
}
\description{
Returns the support of the given parameter.
}
