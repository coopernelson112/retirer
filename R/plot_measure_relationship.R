#' Plot the cross-sectional relationship between two measures
#'
#' Plot one measure against another for a single year, either across OECD/EU
#' membership groups or across selected countries.
#'
#' @param x_measure Character scalar naming the measure to place on the x-axis.
#' @param y_measure Character scalar naming the measure to place on the y-axis.
#' @param year Optional numeric scalar giving the year to plot. If `NULL`, the
#'   latest year with overlapping non-missing data for both measures and the
#'   requested selection is used.
#' @param x_sex Character scalar indicating the sex-specific version of
#'   `x_measure` to use. Must be one of `"both"`, `"women"`, or `"men"`.
#' @param y_sex Character scalar indicating the sex-specific version of
#'   `y_measure` to use. Must be one of `"both"`, `"women"`, or `"men"`.
#' @param level Character scalar indicating the level to plot. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to plot when
#'   `level = "group"`. If `NULL`, all four membership groups are plotted.
#' @param countries Optional character vector of country names to plot when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level selections are
#'   limited to 6 countries.
#' @param show_labels Logical scalar indicating whether to label the points with
#'   `series_label`.
#' @param add_smooth Logical scalar indicating whether to add a least-squares
#'   regression line.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @examples
#' plot_measure_relationship()
#'
#' plot_measure_relationship(
#'   x_measure = "LE65",
#'   y_measure = "retirement_age",
#'   year = 2020
#' )
#'
#' plot_measure_relationship(
#'   x_measure = "LE65",
#'   y_measure = "retirement_age",
#'   x_sex = "women",
#'   y_sex = "men",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany"),
#'   show_labels = TRUE,
#'   add_smooth = FALSE
#' )
#'
#' @export
plot_measure_relationship <- function(
  x_measure = "LE65",
  y_measure = "retirement_age",
  year = NULL,
  x_sex = c("both", "women", "men"),
  y_sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  show_labels = FALSE,
  add_smooth = TRUE
) {
  x_sex <- match.arg(x_sex)
  y_sex <- match.arg(y_sex)
  level <- match.arg(level)

  if (
    !is.logical(show_labels) || length(show_labels) != 1 || is.na(show_labels)
  ) {
    stop("`show_labels` must be TRUE or FALSE.")
  }

  if (!is.logical(add_smooth) || length(add_smooth) != 1 || is.na(add_smooth)) {
    stop("`add_smooth` must be TRUE or FALSE.")
  }

  plot_df <- measure_relationship_data(
    x_measure = x_measure,
    y_measure = y_measure,
    year = year,
    x_sex = x_sex,
    y_sex = y_sex,
    level = level,
    groups = groups,
    countries = countries
  )

  x_scale <- compute_pretty_y_scale(plot_df$x_value)
  y_scale <- compute_pretty_y_scale(plot_df$y_value)

  p <- ggplot2::ggplot(
    plot_df,
    ggplot2::aes(
      x = .data$x_value,
      y = .data$y_value,
      colour = .data$series_label
    )
  ) +
    ggplot2::geom_point(size = 2.5) +
    ggplot2::scale_x_continuous(
      breaks = x_scale$breaks,
      limits = x_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::scale_y_continuous(
      breaks = y_scale$breaks,
      limits = y_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::labs(
      x = measure_label(x_measure, sex = x_sex),
      y = measure_label(y_measure, sex = y_sex),
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

  if (add_smooth && nrow(plot_df) > 1) {
    p <- p + ggplot2::geom_smooth(
      ggplot2::aes(x = .data$x_value, y = .data$y_value),
      method = "lm",
      formula = y ~ x,
      se = FALSE,
      inherit.aes = FALSE,
      linewidth = 0.7,
      colour = "black"
    )
  }

  if (show_labels) {
    p <- p + ggplot2::geom_text(
      ggplot2::aes(label = .data$series_label),
      vjust = -0.7,
      check_overlap = TRUE,
      show.legend = FALSE
    )
  }

  p
}
