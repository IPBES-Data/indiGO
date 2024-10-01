#' Plot Indicators in Generalized Outputs
#'
#' This function generates a three-panel plot for a given indicator, displaying:
#' 1. Absolute values with original units as provided in the raw data (left panel).
#' 2. Remaining percentage in comparison to pristine world (middle panel).
#' 3. The relative change of the indicator since 1970 (right panel).
#'
#' The function calls three specific plotting functions: `plot_indi_data()`, `plot_scaled_to_remaining()`, and `plot_scaled_to_1970()`, and combines their outputs into a single figure.
#'
#' @param indicatorName A character string representing the full name of the indicator to be plotted. Use `indi_search()` to view a list of available indicators.
#'
#' @return A combined ggplot object displaying the three plots in one figure.
#'
#' @examples
#' # Example: Plot status and trend for the Percentage of Natural Habitat Extent
#' plot_indiGO("aboveground_biomass")
#'
plot_indiGO <- function(indicatorName) {

  # Combine the three specific plots into a single 3-panel plot
  gridExtra::grid.arrange(
    plot_indi_data(indicatorName),    # Absolute values plot (left panel)
    plot_scaled_to_remaining(indicatorName),   # Remaining percentage in comparison to pristine world (middle panel)
    plot_scaled_to_1970(indicatorName),  # Relative change since 1970 (right panel)
    ncol = 3,                             # Arrange in 3 columns
    heights = c(1),                       # Control height ratio (single row)
    widths = c(2, 2, 2)
      )
}
