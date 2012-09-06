
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
##' \code{hpadata} argument. 
##'
##' @title HPA gene query
##' @param id A Ensembl gene identifier.
##' @param hpadata The data set to query. One of "NormalTissue",
##' "Rna", "SubcellularLoc" (or any unambiguous prefix) or \code{NULL}
##' (default). In the latter case, the default option is used. See
##' \code{\link{setHparOptions}} and \code{\link{getHparOptions}} for
##' more details.
##' @param what A \code{character} defining what type data to return.
##' One of \code{data} (default, for the data as \code{dataframe}) or
##' \code{details} (to open the id's HPA webpage).
##' @return A \code{dataframe} with the information corresponding
##' to the respective \code{id} genes. If \code{what} is \code{details},
##' then the \code{dataframe} is returned invisibly and a web page is
##' opened with \code{\link{browseURL}}.
##' @author Laurent Gatto
##' @examples
##' id <- "ENSG00000000003"
##' ## Define 'hpadata' data manually
##' getHpa(id, hpadata = "Subcell")
##' head(getHpa(id, hpadata = "NormalTissue"), )
##' head(getHpa(id, hpadata = "Rna"))
##' ## Default 'hpadata' data
##' head(getHpa(id)) ## default 'hpadata' is "NormalTissue"
##' ## Sets default to "SubcellularLoc"
##' setHparOptions(hpadata = "SubcellularLoc")
##' getHpa(id)      ## now uses "SubcellularLoc"
##' setHparOptions() ## reset to "NormalTissue"
##' head(getHpa(id))
##' ## multiple ids
##' getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
##'        hpadata = "SubcellularLoc")
##' \dontrun{
##' ## opens a browser with http://www.proteinatlas.org/ENSG00000163435
##' getHpa("ENSG00000163435",
##'        what = "details") 
##' }
getHpa <- function(id,
                   hpadata = NULL,
                   what = c("data", "details")) {
  what <- match.arg(what)
  if (is.null(hpadata)) {
    opts <- getOption("hpar")    
    hpadata <- opts$hpadata
  }
  hpadata <- match.arg(hpadata, c("NormalTissue", "Rna", "SubcellularLoc"))
  .data <- paste0("hpa", hpadata)         
  data(list = .data, envir = environment())
  idx <- with(get(.data), which(Gene == id))
  ans <- get(.data)[idx, ]
  if (what %in% "details") {
    urls <- paste0("http://www.proteinatlas.org/", id)    
    browseURL(urls[1])  
    if (length(urls) > 1) {
      ## to avoid a browser error complaining about 
      ## running but not responding
      Sys.sleep(0.2) 
      tmp <- sapply(urls[-1], browseURL)
    }
  }
  if (what %in% "data") {
    return(ans)
  } else {
    invisible(ans)
  }
}
