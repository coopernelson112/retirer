#' Plot retirement age alongside a demographic measure measured in years
#'
#' Plot retirement age and a demographic measure measured in years in aligned
#' panels over time, either for OECD/EU membership groups or for selected
#' countries.
#'
#' For the full variable dictionary of the underlying dataset, including
#' demographic variable definitions, see [retirement].
#'
#' @param demographic_measure Character scalar naming the demographic measure.
#'   Must be one of `"MedianAgePop"`, `"LEx"`, `"LE15"`, `"LE65"`, `"LE80"`,
#'   or `"MAC"`.
#' @param sex Character scalar indicating the sex-specific version to use when
#'   relevant. Must be one of `"both"`, `"women"`, or `"men"`. For retirement
#'   age, `"both"` plots the row-wise average of `ave_age_women` and
#'   `ave_age_men` because no official combined retirement-age series is
#'   provided. For sex-comparable demographic measures, `"women"` and `"men"`
#'   use the corresponding sex-specific columns and `"both"` uses the official
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
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' This function is intended for retirement-age comparisons with demographic
#' measures expressed in years. Broader demographic variables such as fertility,
#' migration, population counts, and rates should be handled by a separate
#' demographic-trends function.
#'
#' This function builds two aligned panels with a shared x-axis:
#'
#' - a retirement-age panel
#' - a demographic panel
#'
#' Each panel uses its own y-axis scale, with breaks chosen from the plotted
#' data so that there is at least one break below the minimum value and one
#' break above the maximum value.
#'
#' When `level = "group"`, the function computes unweighted means across
#' countries within each OECD/EU membership group for each year. When
#' `level = "country"`, it plots the selected countries directly.
#'
#' @examples
#' plot_retirement_vs_demography()
#'
#' plot_retirement_vs_demography(
#'   sex = "women",
#'   demographic_measure = "LE65"
#' )
#'
#' plot_retirement_vs_demography(
#'   sex = "men",
#'   demographic_measure = "LEx"
#' )
#'
#' plot_retirement_vs_demography(
#'   demographic_measure = "MedianAgePop"
#' )
#'
#' plot_retirement_vs_demography(
#'   demographic_measure = "MAC"
#' )
#'
#' plot_retirement_vs_demography(
#'   level = "group",
#'   groups = c("OECD + EU", "EU only")
#' )
#'
#' plot_retirement_vs_demography(
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
plot_retirement_vs_demography <- function(
  demographic_measure = "LE65",
  sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  sex <- match.arg(sex)
  level <- match.arg(level)

  validate_demographic_year_measure(retirement, demographic_measure)

  retirement_panel_label <- measure_label("retirement_age", sex = sex)
  demographic_panel_label <- measure_label(demographic_measure, sex = sex)

  retirement_df <- prep_retirement_trend_data(
    data = retirement,
    measure = "retirement_age",
    sex = sex,
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::mutate(panel = retirement_panel_label)

  demographic_df <- prep_retirement_trend_data(
    data = retirement,
    measure = demographic_measure,
    sex = sex,
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::mutate(panel = demographic_panel_label)

  plot_df <- dplyr::bind_rows(retirement_df, demographic_df)

  retirement_scale <- compute_pretty_y_scale(retirement_df$value)
  demographic_scale <- compute_pretty_y_scale(demographic_df$value)

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
