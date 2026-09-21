#' Plot Percentage Remaining of the Indicator Over Time
#'
#' This function generates a trend line plot for a given indicator over time. If applicable, the data is rescaled to a percentage scale where 100 represents the "pristine" state and 0 represents complete depletion. For details on the calculation see the function `rescale_to_percent()`
#'
#' @param indicatorName A character string representing the full name of the indicator to be plotted. Use `print_indicatorNames()` to view a list of available indicators.
#'
#' @return A ggplot object displaying the trend line with the x-axis representing "Year" and the y-axis representing either the raw or rescaled values.
#' @examples
#' # Example: Plot the trend line for the Percentage of Natural Habitat Extent
#' plot_scaled_to_remaining("aboveground_biomass")

plot_scaled_to_remaining <- function(indicatorName, source = "package") {

  # If only one source is given, use it for all indicators
  if (length(source) == 1) {
    source <- rep(source, length(indicatorName))
  }

  # All requested series, including those that may not be rescalable
  all_series <- paste0(
    indicatorName,
    " (",
    source,
    ")"
  )

  legend_levels <-  sort(unique(all_series))
  available <- rep(FALSE, length(indicatorName))

  pct_list <- list()

  for (i in seq_along(indicatorName)) {

    # Load indicator data and corresponding metadata
    ts <- indi_data(
      indicatorName[i],
      source = source[i]
    )

    # Attempt to rescale the data to a percentage
    pct <- try(
      rescale_to_percent(
        v = ts$value,
        y = ts$year,
        hl = getOption("high_low"),
        pv = getOption("pristineValue"),
        agv = getOption("allgoneValue")
      )
    )

    # If rescaling is successful and there are valid values
    if (class(pct) != "try-error" & sum(!is.na(pct$percent)) > 0) {

      pct$indicator <- indicatorName[i]
      pct$source <- source[i]
      pct$series <- all_series[i]

      available[i] <- TRUE

      pct_list[[length(pct_list) + 1]] <- pct
    }
  }

  # Combine indicators
  pct <- do.call(rbind, pct_list)

  # Keep all requested series in the legend
  pct$series <- factor(
    pct$series,
    levels = legend_levels
  )

  # Add "not available" to indicators that could not be rescaled
  legend_labels <- ifelse(
    legend_levels %in% all_series[available],
    legend_levels,
    paste0(legend_levels, " – not available")
  )

  biggest <- max(pct$percent, na.rm = TRUE)
  ymax <- max(c(biggest, 100))

  # Plot the rescaled data
  p_percent <- ggplot2::ggplot(
    pct,
    ggplot2::aes(
      x = year,
      y = percent,
      colour = series,
      group = series
    )
  ) +
    ggplot2::geom_point(
      size = 3,
      alpha = 0.8
    ) +
    ggplot2::geom_line(
      ggplot2::aes(y = percent.fit),
      linewidth = 1,
      alpha = 0.65
    ) +
    ggplot2::ylim(c(0, ymax)) +
    ggplot2::scale_colour_discrete(
      limits = legend_levels,
      labels = legend_labels,
      drop = FALSE
    ) +
    ggplot2::labs(
      subtitle = "Scale: 0 = nothing left, 100 = pristine state",
      y = "Rescaled value (pre-driver state = 100)",
      x = "Year",
      colour = "Indicator"
    )

  return(p_percent)
}
