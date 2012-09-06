.onLoad <- function(libname, pkgname) {
    setHparOptions() ## initialises options$hpar with NULL
}

.onAttach <- function(libname, pkgname) {
  msg <- "For information about the 'hpar' package and data, please read ?'hpar'."
    packageStartupMessage(msg)
}
