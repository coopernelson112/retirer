#' Map OECD and EU retirement groups
#'
#' Plot a world map showing countries grouped by OECD and EU membership for a
#' selected year.
#'
#' @param year Optional numeric year to plot. If `NULL`, the most recent year in
#'   [retirement] is used.
#' @param groups Optional character vector of group labels to display. Valid
#'   values are `"OECD + EU"`, `"OECD only"`, `"EU only"`, and
#'   `"Neither OECD nor EU"`. If `NULL`, all four groups are shown.
#' @param include_nonrepresented Logical scalar indicating whether countries or
#'   regions not represented in the dataset should be shown as `"No data"`.
#'
#' @returns
#' A `ggplot2` object.
#'
#' @details
#' The map classifies countries into four groups based on OECD and EU
#' membership:
#'
#' - `"OECD + EU"`
#' - `"OECD only"`
#' - `"EU only"`
#' - `"Neither OECD nor EU"`
#'
#' Aggregate entries such as `"European Union (27 countries)"` and
#' `"OECD - Average"` are excluded before mapping.
#'
#' @examples
#' map_groups()
#'
#' map_groups(year = 1970)
#'
#' map_groups(groups = "OECD + EU")
#'
#' map_groups(groups = c("OECD + EU", "OECD only"))
#'
#' map_groups(include_nonrepresented = FALSE)
#'
#' @export
map_groups <- function(
  year = NULL,
  groups = NULL,
  include_nonrepresented = TRUE
) {
  if (is.null(year)) {
    year <- max(retirement$year, na.rm = TRUE)
  }

  if (!is.numeric(year) || length(year) != 1 || is.na(year)) {
    stop("`year` must be a single numeric value or NULL.")
  }

  if (!is.logical(include_nonrepresented) ||
    length(include_nonrepresented) != 1 ||
    is.na(include_nonrepresented)) {
    stop("`include_nonrepresented` must be TRUE or FALSE.")
  }

  validate_groups(groups)

  data_year <- retirement |>
    dplyr::filter(.data$year == year)

  if (nrow(data_year) == 0) {
    stop("No data available for the requested year.")
  }

  map_df <- prep_retirement_map_data(
    data = data_year,
    groups = groups,
    include_nonrepresented = include_nonrepresented
  )

  fill_limits <- levels(map_df$map_group)

  ggplot2::ggplot(
    map_df,
    ggplot2::aes(
      x = .data$long,
      y = .data$lat,
      group = .data$group,
      fill = .data$map_group
    )
  ) +
    ggplot2::geom_polygon(color = "white", linewidth = 0.2) +
    ggplot2::coord_quickmap() +
    ggplot2::scale_fill_manual(
      values = retirement_group_colors,
      drop = FALSE,
      limits = fill_limits,
      name = NULL
    ) +
    ggplot2::theme(
      axis.title = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      legend.position = "bottom"
    )
}
