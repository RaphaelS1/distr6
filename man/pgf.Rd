% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DistributionDecorator_CoreStatistics.R
\name{pgf}
\alias{pgf}
\title{Probability Generating Function}
\usage{
pgf(object, z, ...)
}
\arguments{
\item{object}{Distribution.}

\item{z}{integer to evaluate characteristic function at.}

\item{...}{Passed to \verb{$genExp}.}
}
\value{
Probability generating function evaluated at z as a numeric if distribution is discrete,
otherwise NaN.
}
\description{
Probability generating function of a distribution
}
