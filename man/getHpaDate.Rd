\name{getHpaDate}
\alias{getHpaDate}
\alias{getHpaVersion}
\alias{getHpaEnsembl}
\alias{getHpaReleaseNotes}


\title{
  Obtain HPA release information
}

\description{
  Obtain release information about the HPA data, including version,
  release data and Ensembl version the data is based on. Detailed
  release information is accessed on-line using
  \code{\link{browseURL}}. 
}

\usage{
getHpaDate()
getHpaVersion()
getHpaEnsembl()
getHpaReleaseNotes(...)
}

\arguments{
  \item{...}{Arguments passed to \code{brosweURL}.}
}

\value{
  A \code{character} except for \code{getHpaReleaseNotes} that returns a
  \code{numeric} and opens the release page in a browser.
}

\references{
  The Human Protein Atlas page is \url{http://www.proteinatlas.org/}.
}

\author{
  Laurent Gatto <lg390@cam.ac.uk>
}

\examples{
getHpaVersion()
getHpaDate()
getHpaEnsembl()
\dontrun{
getHpaReleaseNotes
}
}
