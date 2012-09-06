getAsDataframe <- function(url, filename) {
  tf <- tempfile()
  on.exit(unlink(tf))
  download.file(url, tf)
  unzip(tf)
  x <- read.csv(filename)
  on.exit(unlink(filename), add = TRUE)
  return(x)
}


## Populate PKGDIR/data
hpaSubcellLoc <- getAsDataframe(url = "http://www.proteinatlas.org/download/subcellular_location.csv.zip",
                      filename = "subcellular_location.csv")
save(hpaSubcellLoc, file = "../../data/hpaSubcellLoc.rda")

hpaNormalTissue <- getAsDataframe(url = "http://www.proteinatlas.org/download/normal_tissue.csv.zip",   
                     filename = "normal_tissue.csv") 
save(hpaNormalTissue, file = "../../data/hpaNormalTissue.rda")

hpaRna <- getAsDataframe(url = "http://www.proteinatlas.org/download/rna.csv.zip",
                      filename = "rna.csv")
save(hpaRna, file = "../../data/hpaRna.rda")

## Populate PKGDIR/inst/extdata
getHpaRelease <- function() {
  relAll <- readLines("http://www.proteinatlas.org/about/releases", warn = FALSE)
  relLast <- grep("Protein Atlas version", rel, value = TRUE, useBytes=TRUE)[1]
  relLast <- gsub("</.+$", "", gsub("^.+<h3>", "", relLast))
  relLast <- strsplit(relLast, " - ")[[1]]
  hpaRelease <- strsplit(relLast, " - ")
  names(hpaRelease) <- c("version", "date")
  return(hpaRelease)
}
hpaRelease <- getHpaRelease()
save(hpaRelease, file = "../extdata/hpaRelease.rda")
