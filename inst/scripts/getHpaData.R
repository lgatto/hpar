##    For details about these files, see
## http://www.proteinatlas.org/about/download

getAsDataframe <- function(url, filename, ...) {
    if (missing(filename))
        filename <- sub("\\.zip", "", basename(url))
    tf <- tempfile()
    on.exit(unlink(tf))
    download.file(url, tf)
    unzip(tf)
    x <- read.csv(filename, ...)
    on.exit(unlink(filename), add = TRUE)
    return(x)
}

saveObjAsRda <- function(obj) {
    var <- MSnbase:::getVariableName(match.call(), "obj")
    f <- file.path("../../data", paste(var, "rda", sep = "."))
    save(list = var, file = f,
         compress = "xz",
         compression_level = 9)
}


## * Populate PKGDIR/data

## Sub-cellular data: Subcellular localization of proteins based on
## immunofluorescently stained cells.
hpaSubcellularLoc <- getAsDataframe("https://www.proteinatlas.org/download/subcellular_location.tsv.zip", sep = "\t")
saveObjAsRda(hpaSubcellularLoc)

## Normal tissue: Normal tissue data Expression profiles for proteins
## in human tissues based on immunohistochemisty using tissue micro
## arrays.
hpaNormalTissue <- getAsDataframe("https://www.proteinatlas.org/download/normal_tissue.tsv.zip", sep = "\t")
saveObjAsRda(hpaNormalTissue)

## Cancer tumor data: Staining profiles for proteins in human tumor
## tissue based on immunohistochemisty using tissue micro arrays.
hpaCancer <- getAsDataframe("https://www.proteinatlas.org/download/pathology.tsv.zip", sep = "\t")
names(hpaCancer) <- sub("\\.\\.", "", names(hpaCancer))
saveObjAsRda(hpaCancer)

## RNA gene data: RNA levels in 45 cell lines and 32 tissues based on
## RNA-seq.
rnaGeneTissue <- getAsDataframe("https://www.proteinatlas.org/download/rna_tissue.tsv.zip", sep = "\t")
saveObjAsRda(rnaGeneTissue)

rnaGeneCellLine <- getAsDataframe("https://www.proteinatlas.org/download/rna_celline.tsv.zip", sep = "\t")
saveObjAsRda(rnaGeneCellLine)

## ## RNA isoform data: RNA levels in 45 cell lines and 32 tissues based
## ## on RNA-seq.
## rnaIsoformTissue <- getAsDataframe("https://www.proteinatlas.org/download/transcript_rna_tissue.tsv.zip")
## saveObjAsRda(rnaIsoformTissue)
## rnaIsoformCellLine <- getAsDataframe("https://www.proteinatlas.org/download/transcript_rna_celline.tsv.zip")
## saveObjAsRda(rnaIsoformCellLine)


## Removed
## hpaRna <- getAsDataframe("http://www.proteinatlas.org/download/rna.csv.zip",
##                          "rna.csv")


## * Populate PKGDIR/inst/extdata

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

hpaRelease <- getHpaRelease()
save(hpaRelease, file = "../extdata/hpaRelease.rda")
