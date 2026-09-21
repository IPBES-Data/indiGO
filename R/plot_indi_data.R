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
plot_indi_data <- function(indicatorName, source = "package") {
  # Load indicator data using the indiGO package's internal function

  # If only one source is given, use it for all indicators
  if (length(source) == 1) {
    source <- rep(source, length(indicatorName))
  }

  # Load all requested indicator/source combinations
  ts_list <- lapply(seq_along(indicatorName), function(i) {

    dat <- indi_data(
      indicatorName[i],
      source = source[i]
    )

    dat$indicator <- indicatorName[i]
    dat$source <- source[i]

    dat$series <- paste0(
      indicatorName[i],
      " (",
      source[i],
      ")"
    )

    dat
  })

  # Combine into one data frame
  ts <- do.call(rbind, ts_list)


  p_absolute <- ggplot2::ggplot(
    ts,
    ggplot2::aes(
      x = year,
      y = value,
      colour = series,
      group = series
    )
  ) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::geom_point(size = 3, alpha = 0.8) +
    ggplot2::labs(
      x = "Year",
      y = "Raw value",
      subtitle = "Expressed on the scale of raw values",
      colour = "Indicator"
    )

  return(p_absolute)
}
