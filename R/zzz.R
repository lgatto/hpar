.onAttach <- function(libname, pkgname) {
    setHparOptions(hpadata = "hpaNormalTissue")
    msg <- paste0("This is hpar version ", utils::packageVersion("hpar"),
                  ",\nbased on the Human Protein Atlas\n",
                  "  Version: ", getHpaVersion(), "\n",
                  "  Release data: ", getHpaDate(), "\n",
                  "  Ensembl build: ", getHpaEnsembl(), "\n",
                  "See '?hpar' or 'vignette('hpar')' for details.\n")
    packageStartupMessage(msg)
}


.onLoad <- function(libname, pkgname) {
   fl <- system.file("extdata", "metadata.csv", package = pkgname)
   titles <- read.csv(fl, stringsAsFactors = FALSE)$Title
   ExperimentHub::createHubAccessors(pkgname, titles)
}
