#' Plot a sex-gap snapshot for a single year
#'
#' Plot a directed sex gap from [retirement] for one year, either across
#' OECD/EU membership groups or across selected countries.
#'
#' @param measure Character scalar naming the measure. Must be one of the values
#'   returned by [sex_comparable_measures()].
#' @param year Optional numeric scalar giving the year to plot. If `NULL`, the
#'   latest year with non-missing sex-gap data for the requested selection is
#'   used.
#' @param level Character scalar indicating the level to plot. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to plot when
#'   `level = "group"`. If `NULL`, all four membership groups are plotted.
#' @param countries Optional character vector of country names to plot when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level selections are
#'   limited to 6 countries.
#' @param gap Character scalar indicating the direction of the gap. Must be one
#'   of `"women_minus_men"` or `"men_minus_women"`.
#' @param sort Character scalar controlling the display order. Must be one of
#'   `"descending"`, `"ascending"`, or `"none"`.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @examples
#' plot_sex_gap_snapshot()
#'
#' plot_sex_gap_snapshot(measure = "LE65", year = 2020)
#'
#' plot_sex_gap_snapshot(
#'   measure = "retirement_age",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_sex_gap_snapshot <- function(
  measure = "retirement_age",
  year = NULL,
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men",
  sort = c("descending", "ascending", "none")
) {
  level <- match.arg(level)
  sort <- match.arg(sort)

  plot_df <- sex_gap_data(
    measure = measure,
    year = year,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
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

  x_scale <- compute_pretty_y_scale(c(plot_df$value, 0))

  p <- ggplot2::ggplot(
    plot_df,
    ggplot2::aes(
      x = .data$value,
      y = .data$series_label,
      colour = .data$series_label
    )
  ) +
    ggplot2::geom_vline(xintercept = 0, linewidth = 0.4, linetype = "dashed") +
    ggplot2::geom_point(size = 2.5) +
    ggplot2::scale_x_continuous(
      breaks = x_scale$breaks,
      limits = x_scale$limits,
      labels = format_y_axis_labels
    ) +
    ggplot2::labs(
      x = measure_gap_label(measure, gap = gap),
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
