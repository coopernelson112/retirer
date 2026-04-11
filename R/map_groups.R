#' Map country groups in the retirement dataset
#'
#' Draw a world map showing countries in the retirement dataset, optionally
#' filtered by OECD and EU membership.
#'
#' @param year Optional integer year to map. If `NULL`, all observations in
#'   [retirement] are used. If supplied, `year` must be present in the dataset.
#' @param oecd Optional logical scalar indicating OECD membership to select.
#'   `TRUE` selects OECD countries, `FALSE` selects non-OECD countries, and
#'   `NULL` applies no OECD filter.
#' @param eu Optional logical scalar indicating EU membership to select.
#'   `TRUE` selects EU countries, `FALSE` selects non-EU countries, and
#'   `NULL` applies no EU filter.
#' @param include_nonrepresented Logical scalar indicating whether countries
#' not represented in the selected data should be shown in a muted background
#' fill.
#'
#' @return
#' A `ggplot2` object.
#'
#' @details
#' Countries are classified into four groups:
#'
#' - `"OECD + EU"`
#' - `"OECD only"`
#' - `"EU only"`
#' - `"Neither OECD nor EU"`
#'
#' Setting `oecd` and `eu` to `NULL` shows all four groups. Supplying `TRUE` or
#' `FALSE` for either argument filters the displayed countries accordingly.
#'
#' Country names are harmonized internally to the naming convention used by the
#' world map polygons. Aggregate observations such as OECD averages and EU
#' aggregates are excluded from the map.
#'
#' @examples
#' map_groups()
#' map_groups(year = 1970)
#' map_groups(year = 1970, oecd = TRUE)
#' map_groups(year = 1970, eu = TRUE)
#' map_groups(year = 1970, oecd = TRUE, eu = FALSE)
#' map_groups(include_nonrepresented = FALSE)
#'
#' @export
map_groups <- function(
  year = NULL,
  oecd = NULL,
  eu = NULL,
  include_nonrepresented = TRUE
) {
  data <- retirement

  if (!is.null(oecd) && (!is.logical(oecd) || length(oecd) != 1 ||
    is.na(oecd))) {
    stop("Invalid `oecd`: must be TRUE, FALSE, or NULL.")
  }

  if (!is.null(eu) && (!is.logical(eu) || length(eu) != 1 || is.na(eu))) {
    stop("Invalid `eu`: must be TRUE, FALSE, or NULL.")
  }

  if (!is.null(year)) {
    if (!is.numeric(year) || length(year) != 1 || is.na(year) || year !=
      as.integer(year)) {
      stop("Invalid `year`: `year` must be a single integer value or `NULL`.")
    }

    year <- as.integer(year)
    available_years <- sort(unique(data$year))

    if (!year %in% available_years) {
      stop(
        paste0(
          "Invalid `year`: ", year, ". ",
          "`year` must be one of the years available in `retirement` ",
          "from ", min(available_years), " to ", max(available_years), "."
        )
      )
    }

    data <- data |>
      dplyr::filter(.data$year == .env$year)
  }

  map_df <- prep_retirement_map_data(
    data = data,
    oecd = oecd,
    eu = eu,
    include_nonrepresented = include_nonrepresented
  )

  fill_values <- c(
    "OECD + EU" = "#1B9E77",
    "OECD only" = "#D95F02",
    "EU only" = "#7570B3",
    "Neither OECD nor EU" = "#E6AB02",
    "No data" = "grey75"
  )

  if (!include_nonrepresented) {
    fill_values <- fill_values[names(fill_values) != "No data"]
  }

  ggplot2::ggplot(
    map_df,
    ggplot2::aes(
      x = .data$long,
      y = .data$lat,
      group = .data$group,
      fill = .data$map_group
    )
  ) +
    ggplot2::geom_polygon(
      colour = "white",
      linewidth = 0.15
    ) +
    ggplot2::coord_quickmap() +
    ggplot2::scale_fill_manual(
      values = fill_values,
      drop = FALSE
    ) +
    ggplot2::labs(fill = NULL) +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "bottom"
    )
}
