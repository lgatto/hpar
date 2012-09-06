\name{getHpa}
\alias{getHpa}
\title{HPA gene query}
\usage{
  getHpa(id, what = NULL)
}
\arguments{
  \item{id}{A Ensembl gene identifier.}

  \item{what}{The data set to query. One of "NormalTissue",
  "Rna", "SubcellularLoc" (or any unambiguous prefix) or
  \code{NULL} (default). In the latter case, the default
  option is used. See \code{\link{setHparOptions}} and
  \code{\link{getHparOptions}} for more details.}
}
\value{
  A \code{dataframe} with the information corresponding to
  the respective \code{id} genes.
}
\description{
  Queries one if the HPA data sets with the \code{id}
  Ensembl gene identifier. The data set to be used is
  defined by the \code{what} argument.
}
\examples{
id <- "ENSG00000000003"
## Define 'what' data manually
getHpa(id, what = "Subcell")
head(getHpa(id, what = "NormalTissue"), )
head(getHpa(id, what = "Rna"))
## Default 'what' data
head(getHpa(id)) ## default 'what' is "NormalTissue"
## Sets default to "SubcellularLoc"
setHparOptions(what = "SubcellularLoc")
getHpa(id)      ## now uses "SubcellularLoc"
setHparOptions() ## reset to "NormalTissue"
head(getHpa(id))
}
\author{
  Laurent Gatto
}

