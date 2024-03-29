% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/handlers.R
\name{handlers}
\alias{handlers}
\title{Control How Progress is Reported}
\usage{
handlers(
  ...,
  append = FALSE,
  on_missing = c("error", "warning", "ignore"),
  default = handler_txtprogressbar,
  global = NULL
)
}
\arguments{
\item{\dots}{One or more progression handlers.  Alternatively, this
functions accepts also a single vector of progression handlers as input.
If this vector is empty, then an empty set of progression handlers will
be set.}

\item{append}{(logical) If FALSE, the specified progression handlers
replace the current ones, otherwise appended to them.}

\item{on_missing}{(character) If \code{"error"}, an error is thrown if one of
the progression handlers does not exists.  If \code{"warning"}, a warning
is produces and the missing handlers is ignored.  If \code{"ignore"}, the
missing handlers is ignored.}

\item{default}{The default progression calling handler to use if none
are set.}

\item{global}{If TRUE, then the global progression handler is enabled.
If FALSE, it is disabled.  If NA, then TRUE is returned if it is enabled,
otherwise FALSE.  Argument \code{global} must not used with other arguments.}
}
\value{
(invisibly) the previous list of progression handlers set.
If no arguments are specified, then the current set of progression
handlers is returned.
If \code{global} is specified, then TRUE is returned if the global progression
handlers is enabled, otherwise false.
}
\description{
Control How Progress is Reported
}
\details{
This function provides a convenient alternative for getting and setting
option \option{progressr.handlers}.
}
\section{For package developers}{

\strong{IMPORTANT: Setting progression handlers is a privilege that should be
left to the end user. It should not be used by R packages, which only task
is to \emph{signal} progress updates, not to decide if, when, and how progress
should be reported.}

If you have to set or modify the progression handlers inside a function,
please make sure to undo the settings afterward.  If not, you will break
whatever progression settings the user already has for other purposes
used elsewhere.  To undo you settings, you can do:

\if{html}{\out{<div class="sourceCode r">}}\preformatted{old_handlers <- handlers(c("beepr", "progress"))
on.exit(handlers(old_handlers), add = TRUE)
}\if{html}{\out{</div>}}
}

\section{Configuring progression handling during R startup}{

A convenient place to configure the default progression handler and to
enable global progression reporting by default is in the \file{~/.Rprofile}
startup file.  For example, the following will (i) cause your interactive
R session to use global progression handler by default, and (ii) report
progress via the \pkg{progress} package when in the terminal and via the
RStudio Jobs progress bar when in the RStudio Console.
\link{handler_txtprogressbar},
other whenever using the RStudio Console, add
the following to your \file{~/.Rprofile} startup file:

\if{html}{\out{<div class="sourceCode r">}}\preformatted{if (interactive() && requireNamespace("progressr", quietly = TRUE)) \{
  ## Enable global progression updates
  if (getRversion() >= 4) progressr::handlers(global = TRUE)

  ## In RStudio Console, or not?
  if (Sys.getenv("RSTUDIO") == "1" && !nzchar(Sys.getenv("RSTUDIO_TERM"))) \{
    options(progressr.handlers = progressr::handler_rstudio)
  \} else \{
    options(progressr.handlers = progressr::handler_progress)
  \}
\}
}\if{html}{\out{</div>}}
}

\examples{
handlers("txtprogressbar")
if (requireNamespace("beepr", quietly = TRUE))
  handlers("beepr", append = TRUE)

with_progress({ y <- slow_sum(1:5) })
print(y)


if (getRversion() >= "4.0.0") {
  \dontshow{if (!is.element("pkgdown", loadedNamespaces()))}
  handlers(global = TRUE)
  y <- slow_sum(1:4)
  z <- slow_sum(6:9)
  \dontshow{if (!is.element("pkgdown", loadedNamespaces()))}
  handlers(global = FALSE)
}

}
