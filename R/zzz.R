.onLoad <- function(libname, pkgname) {
    setHparOptions(hpadata = "NormalTissue")
}

.onAttach <- function(libname, pkgname) {  
  msg <- paste0("hpar version ", packageVersion("hpar"), "\n",
                "For information about the package and data, please read ?'hpar'.\n")
    packageStartupMessage(msg)
}
