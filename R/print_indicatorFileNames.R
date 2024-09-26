#' Display Available Indicator File Names
#'
#' This function prints the file names of all available indicator data sets in the IA package.
#'
#' @return A sorted vector of unique file names for the available indicator data sets.
#' @examples
#' # Example: Print the file names of available indicators
#' print_indicatorFileNames()
#'
#' @references IPBES (2019). *Global Assessment Chapter 2.2 – Supplementary Material: Indicators of Status & Trends in Nature*.
#'
print_indicatorFileNames <- function() {
  return(sort(list.files(getOption("indicatorDataPath"))))
}
