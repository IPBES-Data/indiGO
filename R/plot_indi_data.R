#' Plot raw Values of Indicator values from file
#'
#' This function generates a plot showing the absolute values of a given indicator over time, with years on the x-axis and raw indicator values on the y-axis.
#'
#' @param indicatorName A character string representing the full name of the indicator to be plotted. To view a list of available indicators, use the `indi_search()` function.
#'
#' @return A ggplot figure with "Year" on the x-axis and "Raw value" on the y-axis, representing the absolute values of the selected indicator.
#' @examples
#' # Example: Plot the absolute values of the Aboveground biomass indicator
#' plot_indi_data("aboveground_biomass")
#'
plot_indi_data <- function(indicatorName) {
  # Load indicator data using the indiGO package's internal function
  ts <- indi_data(indicatorName)

  # Create the plot with ggplot2
  p_absolute <- ggplot2::ggplot(ts, ggplot2::aes(x = year, y = value)) +
    ggplot2::geom_point(colour = "red", size = 3) +
    ggplot2::labs(
      title = getOption("Name_for_plot"),
      x = "Year",
      y = "Raw value",
      subtitle = "Expressed on the scale of raw values"
    )

  return(p_absolute)
}
