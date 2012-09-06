.onLoad <- function(libname, pkgname) {
    setHparOptions(hpadata = "NormalTissue")
}

.onAttach <- function(libname, pkgname) {
  msg <- "For information about the package and data, please read ?'hpar'."
    packageStartupMessage(msg)
}
