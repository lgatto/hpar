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

require(dplyr)
getAsDataframe_fromQuery <- function(url, ...){
    tf <- tempfile()
    on.exit(unlink(tf))
    download.file(url, tf)
    x <- read.table(tf, sep = '\t', header = TRUE, ...)
    on.exit(unlink(tf), add = TRUE)
    # format 1st column names
    x <- x %>% dplyr::rename(Gene.name = Gene, Gene = Ensembl)
    x <- x %>% dplyr::relocate(Gene, Gene.name)
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

## RNA gene data:

# RNA consensus tissue gene data
rnaConsensusTissue <- getAsDataframe("https://www.proteinatlas.org/download/rna_tissue_consensus.tsv.zip", sep = "\t")
saveObjAsRda(rnaConsensusTissue)

# RNA HPA tissue gene data
rnaHpaTissue <- getAsDataframe("https://www.proteinatlas.org/download/rna_tissue_hpa.tsv.zip", sep = "\t")
saveObjAsRda(rnaHpaTissue)

# RNA GTEx tissue gene data
rnaGtexTissue <- getAsDataframe("https://www.proteinatlas.org/download/rna_tissue_gtex.tsv.zip", sep = "\t")
saveObjAsRda(rnaGtexTissue)

# RNA FANTOM tissue gene data
rnaFantomTissue <- getAsDataframe("https://www.proteinatlas.org/download/rna_tissue_fantom.tsv.zip", sep = "\t")
saveObjAsRda(rnaFantomTissue)

# rnaGeneCellLine
rnaGeneCellLine <- getAsDataframe("https://www.proteinatlas.org/download/rna_celline.tsv.zip", sep = "\t")
saveObjAsRda(rnaGeneCellLine)


## Secretome data: The human 'secretome' can be defined as all genes encoding at
## least one secreted protein
url <- "https://www.proteinatlas.org/search/sa_location%3ASecreted+-+unknown+location%2CSecreted+in+brain%2CSecreted+in+female+reproductive+system%2CSecreted+in+male+reproductive+system%2CSecreted+in+other+tissues%2CSecreted+to+blood%2CSecreted+to+digestive+system%2CSecreted+to+extracellular+matrix%2CIntracellular+and+membrane%2CImmunoglobulin+genes?format=tsv"
hpaSecretome <- getAsDataframe_fromQuery(url)
saveObjAsRda(hpaSecretome)


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
hpaRelease <- hpar:::getHpaRelease()
save(hpaRelease, file = "../extdata/hpaRelease.rda")
