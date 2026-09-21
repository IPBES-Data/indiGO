#' Plot Relative Change of Indicator Over Time Since 1970
#'
#' This function generates a plot showing the relative change of a given indicator using 1970 onward. The years are displayed on the x-axis, and the rescaled indicator values (relative to the first available year after 1970) are shown on the y-axis. For details on the rescaling procedure, refer to `rescale_to_1970()`.
#'
#' @param indicatorName A character string representing the full name of the indicator to be plotted. Use `print_indicatorNames()` to view a list of available indicators.
#' @return A ggplot object showing the relative change of the indicator over time. The x-axis represents the year, and the y-axis represents the rescaled values, with the first available year since 1970 set to 100.
#' @examples
#' # Example: Plot the relative change since 1970 for the Aboveground biomass indicator
#' plot_scaled_to_1970("aboveground_biomass")
#'
plot_scaled_to_1970 <- function(indicatorName, source = "package") {

  # If only one source is given, use it for all indicators
  if (length(source) == 1) {
    source <- rep(source, length(indicatorName))
  }

  s70_list <- list()

  for (i in seq_along(indicatorName)) {

    # Load indicator data
    ts <- indi_data(
      indicatorName[i],
      source = source[i]
    )

    # Rescale values relative to 1970
    s70 <- try(
      rescale_to_1970(
        v = ts$value,
        y = ts$year
      )
    )

    # Check if rescaling was successful and if there are enough values to plot
    if (class(s70) != "try-error" & sum(!is.na(s70)) > 1) {

      s70$indicator <- indicatorName[i]
      s70$source <- source[i]

      s70$series <- paste0(
        indicatorName[i],
        " (",
        source[i],
        ")"
      )

      s70_list[[length(s70_list) + 1]] <- s70
    }
  }

  # Combine indicators
  s70 <- do.call(rbind, s70_list)

  # Create the plot
  p_scaled <- ggplot2::ggplot(
    s70,
    ggplot2::aes(
      x = year,
      y = scaled70,
      colour = series,
      group = series
    )
  ) +
    ggplot2::geom_point(
      size = 3,
      alpha = 0.8
    ) +
    ggplot2::labs(
      subtitle = "Change since 1970 or, if later, the first available year",
      y = "Rescaled value (first available year since 1970 = 100)",
      x = "Year",
      colour = "Indicator",
      fill = "Indicator"
    )

  # Add confidence intervals if available
  if (sum(!is.na(s70$scaled.upper)) > 1) {

    p_scaled <- p_scaled +
      ggplot2::geom_ribbon(
        ggplot2::aes(
          ymin = scaled.lower,
          ymax = scaled.upper,
          fill = series,
          group = series
        ),
        alpha = 0.15,
        colour = NA
      ) +
      ggplot2::geom_point(
        size = 3,
        alpha = 0.8
      )
  }

  # Add main trend lines
  p_scaled <- p_scaled +
    ggplot2::geom_line(
      ggplot2::aes(
        y = scaled.fit
      ),
      linewidth = 1,
      alpha = 0.65
    )

  return(p_scaled)
}
