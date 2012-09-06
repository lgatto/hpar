.onLoad <- function(libname, pkgname) {
    setHparOptions(what = "NormalTissue")
}

.onAttach <- function(libname, pkgname) {
  msg <- "For information about the package and data, please read ?'hpar'."
    packageStartupMessage(msg)
}
