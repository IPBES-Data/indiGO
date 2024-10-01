#' Get raw Indicator Data from file
#'
#' This function loads indicator data either from the package’s included data or from a local directory as specified by the `options(indicatorDataPath = /inst/data)` setting (default location). The data provides global averages over time for the specified indicator.
#'
#' @param indicatorName A character string representing the name of the indicator to be loaded. To view available indicators, use the `indi_search()` function.
#' @return A data frame containing the year and the corresponding global indicator values.
#' @examples
#' # Load data for a specific indicator
#' dat <- load_indicatorData("Aboveground_biomass_PgC.csv")
#' head(dat)
#' plot(dat)
#'
#' @references
#' Data sourced from IPBES (2019). *Global Assessment Chapter 2.2 – Supplementary Material: Indicators of Status & Trends in Nature*.
#'
indi_data <- function(indicatorName="percentage_of_live_coral_cover") {
  data_path <- file.path(getOption("indicatorDataPath"), paste(indicatorName, ".txt", sep=""))

  # Check if the data file exists
  if (!file.exists(data_path)) {
    stop("Text data file does not exist: ", indicatorName)
  }

  # Read the data from the text file
  dat <- read.table(data_path, header = TRUE)

  config_path <- file.path(getOption("indicatorConfigPath"), paste(indicatorName, ".yaml", sep=""))

  # Check if the YAML configuration file exists
  if (!file.exists(config_path)) {
    message("YAML config file does not exist: ", indicatorName)
  } else {
    # Set YAML configuration options if the file exists
    options(yaml::yaml.load_file(config_path))
  }

  return(dat)
}

