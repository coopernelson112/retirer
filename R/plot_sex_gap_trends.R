#' Plot sex gaps over time for a sex-comparable measure
#'
#' Plot the women-minus-men or men-minus-women gap over time for a measure from
#' [retirement], either for OECD/EU membership groups or for selected countries.
#'
#' For the full variable dictionary of the underlying dataset, including
#' demographic variable definitions, see [retirement].
#'
#' @param measure Character scalar naming the measure to plot. Must be one of
#'   the values returned by [sex_comparable_measures()].
#' @param level Character scalar indicating the level to plot. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to plot when
#'   `level = "group"`. If `NULL`, all four membership groups are plotted.
#' @param countries Optional character vector of country names to plot when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level plots are limited
#'   to 6 countries.
#' @param gap Character scalar indicating the direction of the gap. Must be one
#'   of `"women_minus_men"` or `"men_minus_women"`.
#' @param show_points Logical scalar indicating whether to draw points on top of
#'   the line.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' This function computes a directed sex gap from women and men values:
#'
#' - `"women_minus_men"` computes women - men
#' - `"men_minus_women"` computes men - women
#'
#' A horizontal reference line at 0 is included so that the direction and size
#' of the gap are easy to interpret.
#'
#' @examples
#' plot_sex_gap_trends(measure = "retirement_age")
#'
#' plot_sex_gap_trends(
#'   measure = "LE65",
#'   gap = "women_minus_men"
#' )
#'
#' plot_sex_gap_trends(
#'   measure = "LEx",
#'   level = "group",
#'   groups = c("OECD + EU", "EU only")
#' )
#'
#' plot_sex_gap_trends(
#'   measure = "retirement_age",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_sex_gap_trends <- function(
  measure = "retirement_age",
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men",
  show_points = TRUE
) {
  level <- match.arg(level)

  validate_sex_comparable_measure(retirement, measure)
  validate_gap_direction(gap)

  if (
    !is.logical(show_points) || length(show_points) != 1 || is.na(show_points)
  ) {
    stop("`show_points` must be TRUE or FALSE.")
  }

  plot_df <- prep_sex_gap_data(
    data = retirement,
    measure = measure,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  )

  y_scale <- compute_pretty_y_scale(c(plot_df$value, 0))

  p <- ggplot2::ggplot(
    plot_df,
    ggplot2::aes(
      x = .data$year,
      y = .data$value,
      colour = .data$series_label,
      group = .data$series_label
    )
  ) +
    ggplot2::geom_hline(yintercept = 0, linewidth = 0.4, linetype = "dashed") +
    ggplot2::geom_line(linewidth = 0.8) +
    ggplot2::scale_y_continuous(
      breaks = y_scale$breaks,
      limits = y_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::labs(
      x = "Year",
      y = measure_gap_label(measure, gap = gap),
      colour = NULL
    ) +
    ggplot2::theme(
      legend.position = "bottom",
      panel.grid.minor = ggplot2::element_blank()
    )

  if (level == "group") {
    p <- p + ggplot2::scale_colour_manual(
      values = retirement_group_colors,
      drop = FALSE,
      limits = levels(plot_df$series_label)
    )
  }

  if (show_points) {
    p <- p + ggplot2::geom_point(size = 1.5)
  }

  p
}
