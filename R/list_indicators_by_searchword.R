#' List Filenames Containing a Specific Search Word
#'
#' This function searches for and returns filenames in the data directory set by the option `indicatorDataPath` that contain a specific search word.
#'
#' @param searchWord A character string representing the word to search for in filenames.
#' @return A character vector of filenames containing the search word, or a message if no files are found.
#' @examples
#' # List all files in the directory containing 'biodiversity' in the name
#' searchResults <- list_indicators_by_searchword("biodiversity")
#' print(searchResults)
#'
list_indicators_by_searchword <- function(searchWord) {

  # List all files in the directory that match the search word
  fileList <- list.files(path = getOption("indicatorDataPath"), pattern = searchWord, ignore.case = TRUE)

  # Check if any files match the search word
  if (length(fileList) == 0) {
    message("No files found containing the word: ", searchWord)
  } else {
    return(fileList)
  }
}
