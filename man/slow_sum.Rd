% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/slow_sum.R
\name{slow_sum}
\alias{slow_sum}
\title{Slowly Calculate Sum of Elements}
\usage{
slow_sum(
  x,
  delay = getOption("progressr.demo.delay", 1),
  stdout = FALSE,
  message = TRUE,
  sticky = TRUE
)
}
\arguments{
\item{x}{Numeric vector to sum}

\item{delay}{Delay in seconds after each addition.}

\item{stdout}{If TRUE, then a text is outputted to the standard output
per element.}

\item{message}{If TRUE, then a message is outputted per element.}

\item{sticky}{If TRUE, then a "sticky" message is outputted every
ten element.}
}
\value{
The sum of all elements in \code{x}.
}
\description{
Slowly Calculate Sum of Elements
}
\section{Progress updates}{

This function signals \link{progression} conditions as it progresses.
}

\keyword{internal}
