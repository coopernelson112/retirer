retirement_file <- file.path(
  "data-raw", "effective_labour_market_exit_age.xlsx"
)
un_file <- file.path("data-raw", "WPP2024_Demographic_Indicators_Medium.csv")

sheet_name <- readxl::excel_sheets(retirement_file)[1]

retirement_df <- readxl::read_excel(retirement_file, sheet = sheet_name) |>
  dplyr::rename_with(~ stringr::str_trim(.x)) |>
  dplyr::transmute(
    country = stringr::str_squish(base::as.character(Country)),
    gender = stringr::str_squish(base::as.character(Gender)),
    year = base::as.integer(Year),
    average_age = base::as.numeric(`Average Age`)
  )

country_map <- c(
  "China (People's Republic of)" = "China",
  "Czech Republic" = "Czechia",
  "European Union (27 countries)" = "European Union (EU: 27)",
  "Korea" = "Republic of Korea",
  "OECD - Average" =
    "Organisation for Economic Co-operation and Development (OECD)",
  "Russia" = "Russian Federation",
  "Slovak Republic" = "Slovakia",
  "United States" = "United States of America"
)

retirement_lookup <- retirement_df |>
  dplyr::transmute(
    country,
    year,
    Location = dplyr::recode(country, !!!country_map, .default = country),
    Time = year
  ) |>
  dplyr::filter(
    !base::is.na(country),
    country != "",
    !base::is.na(year),
    !base::is.na(Location),
    Location != "",
    !base::is.na(Time)
  ) |>
  dplyr::distinct()

un_df <- readr::read_csv(un_file, show_col_types = FALSE) |>
  dplyr::mutate(
    Location = stringr::str_squish(base::as.character(.data$Location)),
    Time = base::as.integer(.data$Time)
  )

cols_to_drop <- c(
  "SortOrder", "LocID", "Notes", "ISO3_code", "ISO2_code",
  "SDMX_code", "LocTypeID", "LocTypeName", "ParentID",
  "VarID", "Variant", "Location", "Time"
)

un_clean <- un_df |>
  dplyr::inner_join(retirement_lookup, by = c("Location", "Time")) |>
  dplyr::select(
    country,
    year,
    -dplyr::any_of(cols_to_drop),
    dplyr::everything()
  ) |>
  dplyr::arrange(country, year)

oecd_data <- retirement_df |>
  tidyr::pivot_wider(
    names_from = gender,
    values_from = average_age,
    names_prefix = "ave_age_"
  )

oecd_countries <- c(
  "Australia", "Austria", "Belgium", "Canada", "Chile",
  "Colombia", "Costa Rica", "Czech Republic", "Denmark", "Estonia",
  "Finland", "France", "Germany", "Greece", "Hungary",
  "Iceland", "Ireland", "Israel", "Italy", "Japan",
  "Korea", "Latvia", "Lithuania", "Luxembourg", "Mexico",
  "Netherlands", "New Zealand", "Norway", "Poland", "Portugal",
  "Slovak Republic", "Slovenia", "Spain", "Sweden", "Switzerland",
  "Türkiye", "United Kingdom", "United States"
)

oecd_data <- oecd_data |>
  dplyr::mutate(
    oecd_country = dplyr::if_else(country %in% oecd_countries, "yes", "no"),
    oecd_country = base::factor(oecd_country)
  )

full_data <- dplyr::inner_join(
  oecd_data, un_clean,
  by = c("country", "year")
) |>
  dplyr::arrange(country, year)

retirement <- full_data

usethis::use_data(retirement, overwrite = TRUE, compress = "xz")
