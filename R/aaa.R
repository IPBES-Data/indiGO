
.onLoad <- function(libname, pkgname) {

  # Set standard options where to find the data and the accompanying yaml files
  options(indicatorDataPath = system.file("data", package = "indiGO"))
  options(indicatorConfigPath = system.file("config", package = "indiGO"))

}
