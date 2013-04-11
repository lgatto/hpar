getAsDataframe <- function(url, filename, ...) {
  tf <- tempfile()
  on.exit(unlink(tf))
  download.file(url, tf)
  unzip(tf)
  x <- read.csv(filename, ...)
  on.exit(unlink(filename), add = TRUE)
  return(x)
}


## Populate PKGDIR/data
hpaSubcellularLoc <- getAsDataframe(url = "http://www.proteinatlas.org/download/subcellular_location.csv.zip",
                                filename = "subcellular_location.csv")
save(hpaSubcellularLoc,
     file = "../../data/hpaSubcellularLoc.rda",
     compress = "bzip2",
     compression_level = 9)

hpaNormalTissue <- getAsDataframe(url = "http://www.proteinatlas.org/download/normal_tissue.csv.zip",   
                                  filename = "normal_tissue.csv") 
save(hpaNormalTissue,
     file = "../../data/hpaNormalTissue.rda",
     compress = "xz",
     compression_level = 9)

hpaRna <- getAsDataframe(url = "http://www.proteinatlas.org/download/rna.csv.zip",
                         filename = "rna.csv")
save(hpaRna,
     file = "../../data/hpaRna.rda",
     compress = "xz",
     compression_level = 9)

## Populate PKGDIR/inst/extdata
getHpaRelease <- function() {
  rel <- readLines("http://www.proteinatlas.org/about/releases", warn = FALSE)
  hpa <- grep("Protein Atlas version", rel, value = TRUE, useBytes=TRUE)[1]
  hpa <- gsub("</.+$", "", gsub("^.+<h3>", "", hpa))
  hpa <- strsplit(hpa, " - ")[[1]]
  hpa <- strsplit(hpa, " - ")
  names(hpa) <- c("version", "date")
  ens <- grep("Ensembl version", rel, value = TRUE, useBytes=TRUE)[1]
  ens <- sub("\t.+$", "", sub("^\t", "", ens))
  ens <- sub("Ensembl version: ", "", ens)
  ans <- c(hpa, ensembl = ens)
  return(ans)
}

hpaRelease <- getHpaRelease()
save(hpaRelease, file = "../extdata/hpaRelease.rda")
