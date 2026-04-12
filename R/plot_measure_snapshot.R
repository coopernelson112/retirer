#' Plot a cross-sectional snapshot for a single year
#'
#' Plot a measure from [retirement] for one year, either across OECD/EU
#' membership groups or across selected countries.
#'
#' @param measure Character scalar naming the measure.
#' @param year Optional numeric scalar giving the year to plot. If `NULL`, the
#'   latest year with non-missing data for the requested selection is used.
#' @param sex Character scalar indicating the sex-specific series to plot. Must
#'   be one of `"both"`, `"women"`, or `"men"`.
#' @param level Character scalar indicating the level to plot. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to plot when
#'   `level = "group"`. If `NULL`, all four membership groups are plotted.
#' @param countries Optional character vector of country names to plot when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level selections are
#'   limited to 6 countries.
#' @param sort Character scalar controlling the display order. Must be one of
#'   `"descending"`, `"ascending"`, or `"none"`.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @examples
#' plot_measure_snapshot()
#'
#' plot_measure_snapshot(measure = "LE65", year = 2020)
#'
#' plot_measure_snapshot(
#'   measure = "retirement_age",
#'   sex = "women",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_measure_snapshot <- function(
  measure = "retirement_age",
  year = NULL,
  sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  sort = c("descending", "ascending", "none")
) {
  sex <- match.arg(sex)
  level <- match.arg(level)
  sort <- match.arg(sort)

  plot_df <- measure_snapshot_data(
    measure = measure,
    year = year,
    sex = sex,
    level = level,
    groups = groups,
    countries = countries
  )

  if (sort == "descending") {
    ordered_labels <- plot_df |>
      dplyr::arrange(dplyr::desc(.data$value)) |>
      dplyr::pull(.data$series_label) |>
      as.character()
  } else if (sort == "ascending") {
    ordered_labels <- plot_df |>
      dplyr::arrange(.data$value) |>
      dplyr::pull(.data$series_label) |>
      as.character()
  } else {
    ordered_labels <- as.character(plot_df$series_label)
  }

  plot_df <- plot_df |>
    dplyr::mutate(
      series_label = factor(
        as.character(.data$series_label),
        levels = rev(unique(ordered_labels))
      )
    )

  x_scale <- compute_pretty_y_scale(plot_df$value)

  p <- ggplot2::ggplot(
    plot_df,
    ggplot2::aes(
      x = .data$value,
      y = .data$series_label,
      colour = .data$series_label
    )
  ) +
    ggplot2::geom_point(size = 2.5) +
    ggplot2::scale_x_continuous(
      breaks = x_scale$breaks,
      limits = x_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::labs(
      x = measure_label(measure, sex = sex),
      y = NULL,
      colour = NULL
    ) +
    ggplot2::theme(
      legend.position = "none",
      panel.grid.minor = ggplot2::element_blank()
    )

  if (level == "group") {
    p <- p + ggplot2::scale_colour_manual(
      values = retirement_group_colors,
      drop = FALSE,
      limits = levels(plot_df$series_label)
    )
  }

  p
}
