\name{getHpaDate}
\alias{getHpaDate}
\alias{getHpaVersion}
\alias{getHpaEnsembl}

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
}

\value{
  A \code{character}.
}

\references{
  HPA release history: \url{http://www.proteinatlas.org/about/releases}
}

\author{
  Laurent Gatto <lg390@cam.ac.uk>
}

\examples{
getHpaVersion()
getHpaDate()
getHpaEnsembl()
}
