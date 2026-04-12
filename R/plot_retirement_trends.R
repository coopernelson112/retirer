#' Plot retirement-age trends over time
#'
#' Plot the derived retirement-age measure from [retirement] either for OECD/EU
#' membership groups or for selected countries.
#'
#' For the full variable dictionary of the underlying dataset, including
#' demographic variable definitions, see [retirement].
#'
#' @param measure Character scalar naming the measure to plot on the y-axis.
#'   Must be `"retirement_age"`.
#' @param sex Character scalar indicating the sex-specific version to use.
#'   Must be one of `"both"`, `"women"`, or `"men"`. `"both"` plots the
#'   row-wise average of `ave_age_women` and `ave_age_men`.
#' @param level Character scalar indicating the level to plot. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to plot when
#'   `level = "group"`. If `NULL`, all four membership groups are plotted:
#'   `"OECD + EU"`, `"OECD only"`, `"EU only"`, and `"Neither OECD nor EU"`.
#' @param countries Optional character vector of country names to plot when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible, for example `"China"` for
#'   `"China (People's Republic of)"`. For readability, country-level plots
#'   are limited to 6 countries.
#' @param show_points Logical scalar indicating whether to draw points on top of
#'   the line.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' When `level = "group"`, the function computes an unweighted mean of the
#' derived retirement-age measure across all countries in each OECD/EU
#' membership group for each year. Aggregate entries such as
#' `"European Union (27 countries)"` and `"OECD - Average"` are excluded before
#' computing group means.
#'
#' When `level = "country"`, the function plots the derived retirement-age
#' measure directly for the requested countries without aggregation.
#'
#' The y-axis is computed from the plotted data and always includes at least one
#' break below the minimum value and one break above the maximum value.
#'
#' Use [plot_demography_trends()] for demographic variables and
#' [plot_retirement_vs_demography()] for paired retirement-demography plots.
#'
#' @examples
#' plot_retirement_trends()
#'
#' plot_retirement_trends(
#'   sex = "women"
#' )
#'
#' plot_retirement_trends(
#'   sex = "men"
#' )
#'
#' plot_retirement_trends(
#'   level = "group",
#'   groups = "OECD + EU"
#' )
#'
#' plot_retirement_trends(
#'   level = "group",
#'   groups = c("OECD + EU", "OECD only")
#' )
#'
#' plot_retirement_trends(
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_retirement_trends <- function(
  measure = "retirement_age",
  sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  show_points = TRUE
) {
  sex <- match.arg(sex)
  level <- match.arg(level)

  validate_retirement_measure(measure)

  if (!is.logical(show_points) || length(show_points) != 1 ||
    is.na(show_points)) {
    stop("`show_points` must be TRUE or FALSE.")
  }

  plot_df <- prep_retirement_trend_data(
    data = retirement,
    measure = measure,
    sex = sex,
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
      colour = .data$series_label,
      group = .data$series_label
    )
  ) +
    ggplot2::geom_line(linewidth = 0.8) +
    ggplot2::scale_y_continuous(
      breaks = y_scale$breaks,
      limits = y_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::labs(
      x = "Year",
      y = measure_label(measure, sex = sex),
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
