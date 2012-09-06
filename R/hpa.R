hpaVersion <- function() get()

getHpaVersion <- function() get("hpaVersion", envir = .hparEnv)
getHpaDate <- function() get("hpaDate", envir = .hparEnv)
getHpaReleaseNotes <- function() browseURL("http://www.proteinatlas.org/about/releases")
