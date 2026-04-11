# EU member countries used for map filtering.
eu_countries <- c(
  "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic",
  "Denmark", "Estonia", "Finland", "France", "Germany", "Greece",
  "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg",
  "Malta", "Netherlands", "Poland", "Portugal", "Romania",
  "Slovak Republic", "Slovenia", "Spain", "Sweden"
)

# Aggregate observations that should not be drawn as countries.
aggregate_regions <- c(
  "European Union (27 countries)",
  "OECD - Average"
)

# Harmonize dataset country names to map polygon region names.
country_name_map <- c(
  "China (People's Republic of)" = "China",
  "Korea" = "South Korea",
  "Slovak Republic" = "Slovakia",
  "Türkiye" = "Turkey",
  "United Kingdom" = "UK",
  "United States" = "USA"
)

# Prepare country-level map data for plotting.
prep_retirement_map_data <- function(
  data,
  oecd = NULL,
  eu = NULL,
  include_nonrepresented = TRUE
) {
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
      )
    )

  if (!"oecd_country" %in% names(country_df)) {
    stop("Missing required column: `data` must contain an `oecd_country` column.")
  }

  country_df <- country_df |>
    dplyr::mutate(
      map_group = dplyr::case_when(
        .data$oecd_member & .data$eu_country ~ "OECD + EU",
        .data$oecd_member & !.data$eu_country ~ "OECD only",
        !.data$oecd_member & .data$eu_country ~ "EU only",
        TRUE ~ "Neither OECD nor EU"
      )
    )

  filtered_df <- country_df

  if (!is.null(oecd)) {
    filtered_df <- filtered_df |>
      dplyr::filter(.data$oecd_member == oecd)
  }

  if (!is.null(eu)) {
    filtered_df <- filtered_df |>
      dplyr::filter(.data$eu_country == eu)
  }

  grouped_df <- filtered_df |>
    dplyr::select(.data$map_region, .data$map_group)

  world <- ggplot2::map_data("world") |>
    dplyr::rename(map_region = .data$region)

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

  all_levels <- c(
    "OECD + EU",
    "OECD only",
    "EU only",
    "Neither OECD nor EU",
    "No data"
  )

  if (!include_nonrepresented) {
    all_levels <- setdiff(all_levels, "No data")
  }

  out |>
    dplyr::mutate(
      map_group = factor(.data$map_group, levels = all_levels)
    )
}
