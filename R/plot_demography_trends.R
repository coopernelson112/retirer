#' Plot demographic trends over time
#'
#' Plot a demographic measure from [retirement] either for OECD/EU membership
#' groups or for selected countries.
#'
#' For the full variable dictionary of the underlying dataset, including
#' demographic variable definitions, see [retirement].
#'
#' @param measure Character scalar naming the demographic measure to plot.
#'   Use a numeric demographic column name from [retirement], for example
#'   `"MedianAgePop"`, `"TFR"`, `"PopGrowthRate"`, `"CNMR"`, `"LEx"`, or
#'   `"NetMigrations"`.
#' @param sex Character scalar indicating the sex-specific version to use when
#'   relevant. Must be one of `"both"`, `"women"`, or `"men"`. For
#'   sex-comparable demographic measures, `"women"` and `"men"` use the
#'   corresponding sex-specific columns and `"both"` uses the official
#'   combined-series column in the dataset. For measures without sex-specific
#'   versions, `sex` is accepted but does not affect the plotted values.
#' @param level Character scalar indicating the level to plot. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to plot when
#'   `level = "group"`. If `NULL`, all four membership groups are plotted.
#' @param countries Optional character vector of country names to plot when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level plots are limited
#'   to 6 countries.
#' @param show_points Logical scalar indicating whether to draw points on top of
#'   the line.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' This function is intended for demographic measures broadly, including
#' variables not measured in years, such as fertility, migration, growth,
#' mortality rates, and population counts.
#'
#' When `level = "group"`, the function computes an unweighted mean of the
#' selected measure across all countries in each OECD/EU membership group for
#' each year. Aggregate entries such as `"European Union (27 countries)"` and
#' `"OECD - Average"` are excluded before computing group means.
#'
#' When `level = "country"`, the function plots the selected measure directly
#' for the requested countries without aggregation.
#'
#' The y-axis is computed from the plotted data and always includes at least one
#' break below the minimum value and one break above the maximum value.
#'
#' @examples
#' plot_demography_trends(measure = "MedianAgePop")
#'
#' plot_demography_trends(measure = "TFR")
#'
#' plot_demography_trends(measure = "PopGrowthRate")
#'
#' plot_demography_trends(measure = "CNMR")
#'
#' plot_demography_trends(measure = "LEx", sex = "women")
#'
#' plot_demography_trends(
#'   level = "group",
#'   groups = c("OECD + EU", "OECD only"),
#'   measure = "TFR"
#' )
#'
#' plot_demography_trends(
#'   level = "country",
#'   countries = c("China", "Japan", "Germany"),
#'   measure = "PopGrowthRate"
#' )
#'
#' @export
plot_demography_trends <- function(
  measure,
  sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  show_points = TRUE
) {
  sex <- match.arg(sex)
  level <- match.arg(level)

  if (
    missing(measure) || !is.character(measure) || length(measure) != 1 ||
      is.na(measure)
  ) {
    stop(
      "`measure` must be a single character string naming a demogr. variable."
    )
  }

  if (measure == "retirement_age") {
    stop(
      "Use `plot_retirement_trends()` for `measure = \"retirement_age\"`."
    )
  }

  validate_measure(retirement, measure)

  if (
    !is.logical(show_points) || length(show_points) != 1 || is.na(show_points)
  ) {
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
