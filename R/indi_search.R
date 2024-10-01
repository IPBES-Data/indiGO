#' List Filenames Containing a Specific Search Word
#'
#' This function searches for and returns indicator names in the data directory set by the option `indicatorDataPath` that contain a specific search word.
#'
#' @param searchWord A character string representing the pattern to search for in file names.
#' @return A character vector of file names containing the search pattern. If no files are found a message appears in the console.
#' @examples
#' # List all files in the directory containing 'biodiversity' in the name
#' searchResults <- indi_search("biodiversity")
#' print(searchResults)
#'
indi_search <- function(searchWord) {

  # List all files in the directory that match the search word
  fileList <- list.files(path = getOption("indicatorDataPath"), pattern = searchWord, ignore.case = TRUE)

  # Check if any files match the search word
  if (length(fileList) == 0) {
    message("No files found containing the word: ", searchWord)
  } else {
    return(fileList)
  }
}
