#' Plot women and men together over time for a sex-comparable measure
#'
#' Plot a measure from [retirement] for women and men side by side over time,
#' either for OECD/EU membership groups or for selected countries.
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
#' @param show_points Logical scalar indicating whether to draw points on top of
#'   the lines.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' This function is the women-versus-men counterpart to
#' [plot_retirement_trends()] and [plot_demography_trends()]. It always plots
#' both sexes and facets by group or country so that the women and men series
#' can be compared directly within each panel.
#'
#' @examples
#' plot_sex_comparison_trends(measure = "retirement_age")
#'
#' plot_sex_comparison_trends(measure = "LE65")
#'
#' plot_sex_comparison_trends(
#'   measure = "LEx",
#'   level = "group",
#'   groups = c("OECD + EU", "OECD only")
#' )
#'
#' plot_sex_comparison_trends(
#'   measure = "retirement_age",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_sex_comparison_trends <- function(
  measure = "retirement_age",
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  show_points = TRUE
) {
  level <- match.arg(level)

  validate_sex_comparable_measure(retirement, measure)

  if (
    !is.logical(show_points) || length(show_points) != 1 || is.na(show_points)
  ) {
    stop("`show_points` must be TRUE or FALSE.")
  }

  plot_df <- prep_sex_comparison_data(
    data = retirement,
    measure = measure,
    level = level,
    groups = groups,
    countries = countries
  )

  y_scale <- compute_pretty_y_scale(plot_df$value)

  p <- ggplot2::ggplot(
    plot_df,
    ggplot2::aes(
      x = .data$year,
      y = .data$value,
      colour = .data$sex,
      linetype = .data$sex,
      group = interaction(.data$series_label, .data$sex)
    )
  ) +
    ggplot2::geom_line(linewidth = 0.8) +
    ggplot2::facet_wrap(~series_label, scales = "free_y") +
    ggplot2::scale_y_continuous(
      breaks = y_scale$breaks,
      limits = y_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::scale_colour_manual(
      values = c("women" = "#b2182b", "men" = "#2166ac"),
      drop = FALSE,
      limits = c("women", "men"),
      name = NULL
    ) +
    ggplot2::scale_linetype_manual(
      values = c("women" = "solid", "men" = "dashed"),
      drop = FALSE,
      limits = c("women", "men"),
      name = NULL
    ) +
    ggplot2::labs(
      x = "Year",
      y = measure_label(measure, sex = "both")
    ) +
    ggplot2::theme(
      legend.position = "bottom",
      panel.grid.minor = ggplot2::element_blank()
    )

  if (show_points) {
    p <- p + ggplot2::geom_point(size = 1.5)
  }

  p
}
