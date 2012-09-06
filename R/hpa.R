
getHpaVersion <- function()
  get("hpaVersion", envir = .hparEnv)
getHpaDate <- function()
  get("hpaDate", envir = .hparEnv)
getHpaEnsembl <- function()
  get("hpaEnsembl", envir = .hparEnv)
getHpaReleaseNotes <- function(...)
  browseURL("http://www.proteinatlas.org/about/releases", ...)


##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param id 
##' @param what 
##' @return 
##' @author Laurent Gatto
getHpa <- function(id,
                   what = c("NormalTissue", "RNA", "SubcellularLoc")) {
  opts <- getOption("hpar")
  if (!is.null(opts$what)) {
    what <- opts$what
  } else {
    what <- match.arg(what)
  }
  .data <- paste0("hpa", what)         
  data(list = .data, envir = environment())
  idx <- with(get(.data), which(Gene == id))
  return(get(.data)[idx, ])
}
