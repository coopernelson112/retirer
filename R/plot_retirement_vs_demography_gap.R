#' Plot retirement-age sex gaps alongside demographic sex gaps
#'
#' Plot the retirement-age sex gap and a demographic sex gap in aligned panels
#' over time, either for OECD/EU membership groups or for selected countries.
#'
#' For the full variable dictionary of the underlying dataset, including
#' demographic variable definitions, see [retirement].
#'
#' @param demographic_measure Character scalar naming the demographic measure.
#'   Must be one of the sex-comparable demographic measures returned by
#'   [sex_comparable_measures()], excluding `"retirement_age"`.
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
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' This function is the sex-gap counterpart to
#' [plot_retirement_vs_demography()].
#' It computes the requested directed gap for:
#'
#' - retirement age
#' - one demographic measure with implemented women/men support
#'
#' Each panel uses its own y-axis scale, with a horizontal reference line at 0.
#'
#' @examples
#' plot_retirement_vs_demography_gap()
#'
#' plot_retirement_vs_demography_gap(
#'   demographic_measure = "LEx"
#' )
#'
#' plot_retirement_vs_demography_gap(
#'   demographic_measure = "LE65",
#'   gap = "men_minus_women"
#' )
#'
#' plot_retirement_vs_demography_gap(
#'   level = "group",
#'   groups = c("OECD + EU", "EU only")
#' )
#'
#' plot_retirement_vs_demography_gap(
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_retirement_vs_demography_gap <- function(
  demographic_measure = "LE65",
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men"
) {
  level <- match.arg(level)

  validate_sex_comparable_measure(retirement, demographic_measure)
  validate_gap_direction(gap)

  if (demographic_measure == "retirement_age") {
    stop(
      "`demographic_measure` must be a sex-comparable demographic measure."
    )
  }

  retirement_panel_label <- measure_gap_label("retirement_age", gap = gap)
  demographic_panel_label <- measure_gap_label(demographic_measure, gap = gap)

  retirement_df <- prep_sex_gap_data(
    data = retirement,
    measure = "retirement_age",
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  ) |>
    dplyr::mutate(panel = retirement_panel_label)

  demographic_df <- prep_sex_gap_data(
    data = retirement,
    measure = demographic_measure,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  ) |>
    dplyr::mutate(panel = demographic_panel_label)

  plot_df <- dplyr::bind_rows(retirement_df, demographic_df)

  retirement_scale <- compute_pretty_y_scale(c(retirement_df$value, 0))
  demographic_scale <- compute_pretty_y_scale(c(demographic_df$value, 0))

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
    ggplot2::geom_point(size = 1.5) +
    ggplot2::facet_wrap(~panel, ncol = 1, scales = "free_y") +
    ggh4x::facetted_pos_scales(
      y = list(
        panel == retirement_panel_label ~ ggplot2::scale_y_continuous(
          breaks = retirement_scale$breaks,
          limits = retirement_scale$limits,
          labels = format_y_axis_labels
        ),
        panel == demographic_panel_label ~ ggplot2::scale_y_continuous(
          breaks = demographic_scale$breaks,
          limits = demographic_scale$limits,
          labels = format_y_axis_labels
        )
      )
    ) +
    ggplot2::labs(
      x = "Year",
      y = NULL,
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
      limits = levels(retirement_df$series_label)
    )
  }

  p
}
