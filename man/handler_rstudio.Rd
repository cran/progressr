% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/handler_rstudio.R
\name{handler_rstudio}
\alias{handler_rstudio}
\title{Progression Handler: Progress Reported in the RStudio Console}
\usage{
handler_rstudio(
  intrusiveness = getOption("progressr.intrusiveness.gui", 1),
  target = "gui",
  title = function() format(Sys.time(), "Console \%X"),
  ...
)
}
\arguments{
\item{intrusiveness}{(numeric) A non-negative scalar on how intrusive
(disruptive) the reporter to the user.}

\item{target}{(character vector) Specifies where progression updates are
rendered.}

\item{title}{(character or a function) The "name" of the progressor, which
is displayed in front of the progress bar.  If a function, then the name
is created dynamically by calling the function when the progressor is
created.}

\item{\ldots}{Additional arguments passed to \code{\link[=make_progression_handler]{make_progression_handler()}}.}
}
\description{
Progression Handler: Progress Reported in the RStudio Console
}
\section{Requirements}{

This progression handler works only in the RStudio Console.
}

\section{Use this progression handler by default}{

To use this handler by default whenever using the RStudio Console, add
the following to your \file{~/.Rprofile} startup file:

\if{html}{\out{<div class="sourceCode r">}}\preformatted{if (requireNamespace("progressr", quietly = TRUE)) \{
  if (Sys.getenv("RSTUDIO") == "1" && !nzchar(Sys.getenv("RSTUDIO_TERM"))) \{
    options(progressr.handlers = progressr::handler_rstudio)
  \}
\}
}\if{html}{\out{</div>}}
}

\examples{
if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {

  handlers("rstudio")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
}
