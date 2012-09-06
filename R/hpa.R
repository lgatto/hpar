
getHpaVersion <- function()
  get("hpaVersion", envir = .hparEnv)
getHpaDate <- function()
  get("hpaDate", envir = .hparEnv)
getHpaEnsembl <- function()
  get("hpaEnsembl", envir = .hparEnv)
getHpaReleaseNotes <- function(...)
  browseURL("http://www.proteinatlas.org/about/releases", ...)


##' Queries one if the HPA data sets with the \code{id} Ensembl
##' gene identifier. The data set to be used is defined by the
##' \code{what} argument. 
##'
##' @title HPA gene query
##' @param id A Ensembl gene identifier.
##' @param what The data set to query. One of "NormalTissue",
##' "Rna", "SubcellularLoc" (or any unambiguous prefix) or
##' \code{NULL} (default). In the latter case, the default
##' option is used. See \code{\link{setHparOptions}} and
##' \code{\link{getHparOptions}} for more details.
##' @return A \code{dataframe} with the information corresponding
##' to the respective \code{id} genes.
##' @author Laurent Gatto
##' @examples
##' id <- "ENSG00000000003"
##' ## Define 'what' data manually
##' getHpa(id, what = "Subcell")
##' head(getHpa(id, what = "NormalTissue"), )
##' head(getHpa(id, what = "Rna"))
##' ## Default 'what' data
##' head(getHpa(id)) ## default 'what' is "NormalTissue"
##' ## Sets default to "SubcellularLoc"
##' setHparOptions(what = "SubcellularLoc")
##' getHpa(id)      ## now uses "SubcellularLoc"
##' setHparOptions() ## reset to "NormalTissue"
##' head(getHpa(id)) 
getHpa <- function(id, what = NULL) {
  if (is.null(what)) {
    opts <- getOption("hpar")    
    what <- opts$what
  }
  what <- match.arg(what, c("NormalTissue", "Rna", "SubcellularLoc"))
  .data <- paste0("hpa", what)         
  data(list = .data, envir = environment())
  idx <- with(get(.data), which(Gene == id))
  return(get(.data)[idx, ])
}
