\name{getHpa}
\alias{getHpa}
\title{HPA gene query}
\usage{
  getHpa(id, hpadata = NULL, type = c("data", "details"))
}
\arguments{
  \item{id}{A Ensembl gene identifier.}

  \item{hpadata}{The data set to query. One of
  "NormalTissue", "Rna", "SubcellularLoc" (or any
  unambiguous prefix) or \code{NULL} (default). In the
  latter case, the default option is used. See
  \code{\link{setHparOptions}} and
  \code{\link{getHparOptions}} for more details.}

  \item{type}{A \code{character} defining what type data to
  return. One of \code{data} (default, for the data as
  \code{dataframe}) or \code{details} (to open the id's HPA
  webpage).}
}
\value{
  A \code{dataframe} with the information corresponding to
  the respective \code{id} genes. If \code{type} is
  \code{details}, then the \code{dataframe} is returned
  invisibly and a web page is opened with
  \code{\link{browseURL}}.
}
\description{
  Queries one if the HPA data sets with the \code{id}
  Ensembl gene identifier. The data set to be used is
  defined by the \code{hpadata} argument.
}
\examples{
id <- "ENSG00000000003"
## Define 'hpadata' data manually
getHpa(id, hpadata = "Subcell")
head(getHpa(id, hpadata = "NormalTissue"), )
head(getHpa(id, hpadata = "Rna"))
## Default 'hpadata' data
head(getHpa(id)) ## default 'hpadata' is "NormalTissue"
## Sets default to "SubcellularLoc"
setHparOptions(hpadata = "SubcellularLoc")
getHpa(id)      ## now uses "SubcellularLoc"
setHparOptions() ## reset to "NormalTissue"
head(getHpa(id))
## multiple ids
getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
       hpadata = "SubcellularLoc")
\dontrun{
## opens a browser with http://www.proteinatlas.org/ENSG00000163435
getHpa("ENSG00000163435",
       type = "details")
}
}
\author{
  Laurent Gatto
}

