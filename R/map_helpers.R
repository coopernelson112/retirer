# Harmonize dataset country names to map polygon region names.
country_name_map <- c(
  "China (People's Republic of)" = "China",
  "Korea" = "South Korea",
  "Slovak Republic" = "Slovakia",
  "T\u00fcrkiye" = "Turkey",
  "United Kingdom" = "UK",
  "United States" = "USA"
)

# Prepare country-level map data for plotting.
prep_retirement_map_data <- function(
  data,
  groups = NULL,
  include_nonrepresented = TRUE
) {
  if (!"oecd_country" %in% names(data)) {
    stop(
      "Missing required column: `data` must contain an `oecd_country` column."
    )
  }

  validate_groups(groups)
  selected_groups <- if (is.null(groups)) retirement_group_levels else groups

  country_df <- data |>
    dplyr::distinct(.data$country, .keep_all = TRUE) |>
    dplyr::filter(!.data$country %in% aggregate_regions) |>
    dplyr::mutate(
      eu_country = .data$country %in% eu_countries,
      oecd_member = .data$oecd_country == "yes",
      map_region = dplyr::recode(
        .data$country,
        !!!country_name_map,
        .default = .data$country
      ),
      map_group = dplyr::case_when(
        .data$oecd_member & .data$eu_country ~ "OECD + EU",
        .data$oecd_member & !.data$eu_country ~ "OECD only",
        !.data$oecd_member & .data$eu_country ~ "EU only",
        TRUE ~ "Neither OECD nor EU"
      )
    ) |>
    dplyr::filter(.data$map_group %in% selected_groups)

  grouped_df <- country_df |>
    dplyr::select(map_region, map_group)

  world <- ggplot2::map_data("world") |>
    dplyr::rename(map_region = region)

  out <- world |>
    dplyr::left_join(grouped_df, by = "map_region") |>
    dplyr::mutate(
      map_group = dplyr::if_else(
        is.na(.data$map_group),
        "No data",
        .data$map_group
      )
    )

  if (!include_nonrepresented) {
    out <- out |>
      dplyr::filter(.data$map_group != "No data")
  }

  all_levels <- c(selected_groups, "No data")

  if (!include_nonrepresented) {
    all_levels <- selected_groups
  }

  out |>
    dplyr::mutate(
      map_group = factor(.data$map_group, levels = all_levels)
    )
}
