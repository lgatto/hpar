.onLoad <- function(libname, pkgname) {
    setHparOptions(hpadata = "NormalTissue")
}

.onAttach <- function(libname, pkgname) {  
  msg <- paste0("This is hpar ", utils::packageVersion("hpar"),
                ". For more information, \n",
                "please type '?hpar' or 'vignette('hpar')'.\n")
    packageStartupMessage(msg)
}
