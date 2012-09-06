\name{setHparOptions}
\alias{setHparOptions}
\title{Sets the 'hpar' options}
\usage{
  setHparOptions(what = c("NormalTissue", "Rna", "SubcellularLoc"))
}
\arguments{
  \item{what}{A \code{character} defining the default data
  to be queries or \code{NULL}. If \code{NULL} (default),
  the data will be chosen based on 'what' argument in the
  \code{\link{getHpa}} function.}
}
\value{
  Returns the set value of the \code{hpar} option. Used for
  its side effect.
}
\description{
  Function used to set the \code{what} \code{hpar} option.
}
\examples{
oldOpt <- getHparOptions()
oldOpt
setHparOptions("hpaRna")
getHparOptions()
setHparOptions(oldOpt)
}
\author{
  Laurent Gatto
}

