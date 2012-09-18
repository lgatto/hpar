\name{setHparOptions}
\alias{setHparOptions}
\title{Sets the 'hpar' options}
\usage{
  setHparOptions(hpadata = c("NormalTissue", "Rna", "SubcellularLoc"))
}
\arguments{
  \item{hpadata}{A \code{character} defining the default
  data to be queries. Choices are "NormalTissue", "Rna" or
  "SubcellularLoc", or any unambiguous prefix.}
}
\value{
  Returns the set value of the \code{hpar} option. Used for
  its side effect.
}
\description{
  Function used to set the \code{hpadata} \code{hpar}
  option.
}
\examples{
oldOpt <- getHparOptions()
oldOpt$hpadata
setHparOptions("Rna")
getHparOptions()
setHparOptions(oldOpt$hpadata)
}
\author{
  Laurent Gatto
}

