#' Load Comprehensive Summary of Indicator Metadata
#'
#' This function loads a detailed overview of the metadata for indicators available in the package. The summary includes key information such as the indicator name, data sources, time span covered, EBV class, and other relevant attributes.
#'
#' @return A data frame containing comprehensive metadata for the available indicators of the package.
#' @examples
#' # Load the comprehensive metadata for the indicators
#' Tab1.dat <- indi_summary()
#' head(Tab1.dat)
#'
#' @references IPBES (2019). *Global Assessment Chapter 2.2 – Supplementary Material: Indicators of Status & Trends in Nature*.
#'
indi_summary <- function() {
  # Define the file path for the metadata summary
  data_path <- system.file("Metadata", "SOD_Table1.csv", package = "indiGO")

  # Read the metadata summary file (tab-separated)
  dat <- read.csv(data_path, sep = "\t")

  return(dat)
}
