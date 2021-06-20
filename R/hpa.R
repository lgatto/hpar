## Extracts the extracts the version, date and ensembl version from the Human
## Protein Atlas webpage.
getHpaRelease <- function() {
    rel <- readLines("http://www.proteinatlas.org/about/releases", warn = FALSE)
    suppressWarnings(reldate <- grep("Release date:", rel, value = TRUE)[1])
    suppressWarnings(relver <- grep("Protein Atlas version", rel, value = TRUE)[1])
    reldate <- sub("</b.+$", "", sub("^.+<b>", "", reldate))
    relver <- sub("<.+$", "", sub("^.+version ", "", relver))
    hpa <- c("version" = relver, "date" = reldate)
    ens <- grep("Ensembl version", rel, value = TRUE, useBytes=TRUE)[1]
    ens <- sub("</b>", "", sub("^.+<b>", "", ens))
    ens <- sub("\t", "", ens)
    ans <- c(hpa, ensembl = ens)
    return(ans)
}

## Return TRUE if the version extraced from the Human Protein Atlas webpage is
## different for the one in hpar. FALSE otherwise.
newHpaVersion <- function() {
    hpa_version <- hpar:::getHpaRelease()['version']
    hpar_version <- getHpaVersion()
    !identical(hpa_version, hpar_version)
}

allHparData <- function(){
  x <- grep(".rda", list.files(system.file("data", package = "hpar")), value = TRUE)
  x <- gsub(".rda","",x)
  # reorder the list of datasets givent the initial order
  nam <- c("hpaNormalTissue", "rnaGeneCellLine", "rnaGeneTissue",
           "hpaSubcellularLoc", "hpaSubcellularLoc14", "hpaCancer")
  x <- c(nam[nam %in% x],x[!x %in% nam])
  return(x)
}


getHpaVersion <- function()
  get("hpaVersion", envir = .hparEnv)
getHpaDate <- function()
  get("hpaDate", envir = .hparEnv)
getHpaEnsembl <- function()
  get("hpaEnsembl", envir = .hparEnv)


##' Queries one if the HPA data sets with the \code{id} Ensembl
##' gene identifier. The data set to be used is defined by the
##' \code{hpadata} argument.
##'
##' @title HPA gene query
##' @param id A Ensembl gene identifier.
##' @param hpadata A \code{character} with the data set to query. One
##'     of available \code{hpar} datasets, available by calling
##'     \code{\link{allHparData}} (or any unambiguous prefix), or
##'     \code{NULL} (default). In the latter case, the default option
##'     is used. See \code{\link{setHparOptions}} and
##'     \code{\link{getHparOptions}} for more details.
##' @param type A \code{character} defining what type data to return.
##'     One of \code{data} (default, for the data as
##'     \code{data.frame}) or \code{details} (to open the id's HPA
##'     webpage).
##' @return A \code{data.frame} with the information corresponding to
##'     the respective \code{id} genes. If \code{type} is
##'     \code{details}, then the \code{dataframe} is returned
##'     invisibly and a web page is opened with
##'     \code{\link{browseURL}}.
##' @author Laurent Gatto
##' @examples
##' id <- "ENSG00000000003"
##' ## Define 'hpadata' data manually
##' getHpa(id, hpadata = "hpaSubcellularLoc")
##' head(getHpa(id, hpadata = "hpaNormalTissue"), )
##' head(getHpa(id, hpadata = "rnaGeneTissue"))
##' head(getHpa(id, hpadata = "rnaGeneCellLine"))
##' head(getHpa(id, hpadata = "hpaCancer"))
##' ## Sets default to "SubcellularLoc"
##' setHparOptions(hpadata = "hpaSubcellularLoc")
##' getHpa(id)       ## now uses "hpaSubcellularLoc"
##' setHparOptions() ## reset to "hpaNormalTissue"
##' head(getHpa(id))
##' ## multiple ids
##' getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
##'        hpadata = "hpaSubcellularLoc")
##' \dontrun{
##' ## opens a browser with http://www.proteinatlas.org/ENSG00000163435
##' getHpa("ENSG00000163435", type = "details")
##' }
getHpa <- function(id,
                   hpadata = NULL,
                   type = c("data", "details")) {
  type <- match.arg(type)
  if (is.null(hpadata)) {
    opts <- getOption("hpar")
    hpadata <- opts$hpadata
  }
  hpadata <- match.arg(hpadata,
                       allHparData())
  data(list = hpadata, envir = environment())
  idx <- with(get(hpadata), which(Gene %in% id))
  ans <- get(hpadata)[idx, ]
  if (type == "details" && interactive()) {
    urls <- paste0("http://www.proteinatlas.org/", id)
    browseURL(urls[1])
    if (length(urls) > 1) {
      ## to avoid a browser error complaining about
      ## running but not responding
      Sys.sleep(0.5)
      tmp <- sapply(urls[-1], browseURL)
    }
  }
  if (type == "data") {
    return(ans)
  } else {
    invisible(ans)
  }
}
