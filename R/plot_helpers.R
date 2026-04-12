# Valid group labels used throughout the package.
retirement_group_levels <- c(
  "OECD + EU",
  "OECD only",
  "EU only",
  "Neither OECD nor EU"
)

# Demographic measures expressed in years and suitable for paired comparison
# with retirement age.
demographic_year_measures <- c(
  "MedianAgePop",
  "LEx",
  "LE15",
  "LE65",
  "LE80",
  "MAC"
)

measure_label_map <- c(
  retirement_age_both = "Average retirement age",
  retirement_age_women = "Average retirement age (women)",
  retirement_age_men = "Average retirement age (men)",
  TPopulation1Jan = "Total population, 1 January (thousands)",
  TPopulation1July = "Total population, 1 July (thousands)",
  TPopulationMale1July = "Male population, 1 July (thousands)",
  TPopulationFemale1July = "Female population, 1 July (thousands)",
  PopDensity = "Population density (persons per sq. km)",
  PopSexRatio = "Population sex ratio (males per 100 females)",
  MedianAgePop = "Median age",
  NatChange = "Natural change (thousands)",
  NatChangeRT = "Rate of natural change (per 1,000 population)",
  PopChange = "Population change (thousands)",
  PopGrowthRate = "Population growth rate (%)",
  DoublingTime = "Population doubling time (years)",
  Births = "Births (thousands)",
  Births1519 = "Births to women aged 15 to 19 (thousands)",
  CBR = "Crude birth rate (per 1,000 population)",
  TFR = "Total fertility rate (live births per woman)",
  NRR = "Net reproduction rate (surviving daughters per woman)",
  MAC = "Mean age childbearing (years)",
  SRB = "Sex ratio at birth (males per 100 female births)",
  Deaths = "Total deaths (thousands)",
  DeathsMale = "Male deaths (thousands)",
  DeathsFemale = "Female deaths (thousands)",
  CDR = "Crude death rate (per 1,000 population)",
  LEx = "Life expectancy at birth",
  LExMale = "Life expectancy at birth (men)",
  LExFemale = "Life expectancy at birth (women)",
  LEx_both = "Life expectancy at birth",
  LEx_women = "Life expectancy at birth (women)",
  LEx_men = "Life expectancy at birth (men)",
  LE15 = "Life expectancy at age 15",
  LE15Male = "Life expectancy at age 15 (men)",
  LE15Female = "Life expectancy at age 15 (women)",
  LE15_both = "Life expectancy at age 15",
  LE15_women = "Life expectancy at age 15 (women)",
  LE15_men = "Life expectancy at age 15 (men)",
  LE65 = "Life expectancy at age 65",
  LE65Male = "Life expectancy at age 65 (men)",
  LE65Female = "Life expectancy at age 65 (women)",
  LE65_both = "Life expectancy at age 65",
  LE65_women = "Life expectancy at age 65 (women)",
  LE65_men = "Life expectancy at age 65 (men)",
  LE80 = "Life expectancy at age 80",
  LE80Male = "Life expectancy at age 80 (men)",
  LE80Female = "Life expectancy at age 80 (women)",
  LE80_both = "Life expectancy at age 80",
  LE80_women = "Life expectancy at age 80 (women)",
  LE80_men = "Life expectancy at age 80 (men)",
  InfantDeaths = "Infant deaths under age 1 (thousands)",
  IMR = "Infant mortality rate (per 1,000 live births)",
  LBsurvivingAge1 = "Live births surviving to age 1 (thousands)",
  Under5Deaths = "Deaths under age 5 (thousands)",
  Q5 = "Under-five mortality rate (per 1,000 live births)",
  Q0040 = "Mortality before age 40",
  Q0040Male = "Male mortality before age 40",
  Q0040Female = "Female mortality before age 40",
  Q0060 = "Mortality before age 60",
  Q0060Male = "Male mortality before age 60",
  Q0060Female = "Female mortality before age 60",
  Q1550 = "Mortality between ages 15 and 50",
  Q1550Male = "Male mortality between ages 15 and 50",
  Q1550Female = "Female mortality between ages 15 and 50",
  Q1560 = "Mortality between ages 15 and 60",
  Q1560Male = "Male mortality between ages 15 and 60",
  Q1560Female = "Female mortality between ages 15 and 60",
  NetMigrations = "Net number of migrants (thousands)",
  CNMR = "Net migration rate (per 1,000 population)"
)

country_aliases <- c(
  "China" = "China (People's Republic of)",
  "PRC" = "China (People's Republic of)",
  "South Korea" = "Korea",
  "Republic of Korea" = "Korea",
  "Czechia" = "Czech Republic",
  "Slovakia" = "Slovak Republic",
  "Turkey" = "T\u00fcrkiye",
  "Turkiye" = "T\u00fcrkiye",
  "UK" = "United Kingdom",
  "Britain" = "United Kingdom",
  "Great Britain" = "United Kingdom",
  "US" = "United States",
  "USA" = "United States",
  "United States of America" = "United States",
  "America" = "United States",
  "Russian Federation" = "Russia"
)

# Variables that are not useful as plotting measures.
non_measure_columns <- c(
  "country", "year", "oecd_country", "Location", "Time",
  "SortOrder", "LocID", "Notes", "ISO3_code", "ISO2_code",
  "SDMX_code", "LocTypeID", "LocTypeName", "ParentID",
  "VarID", "Variant"
)

# Return numeric variables that can be used as plotting measures.
available_plot_measures <- function(data) {
  candidate_cols <- setdiff(names(data), non_measure_columns)
  candidate_cols[vapply(data[candidate_cols], is.numeric, logical(1))]
}

# Return numeric demographic measures, excluding the raw retirement columns.
available_demographic_measures <- function(data) {
  setdiff(
    available_plot_measures(data),
    c("ave_age_women", "ave_age_men")
  )
}

# Validate requested measure for general trend functions.
validate_measure <- function(data, measure) {
  valid_measures <- c("retirement_age", available_demographic_measures(data))

  if (!is.character(measure) || length(measure) != 1 || is.na(measure)) {
    stop("`measure` must be a single character string.")
  }

  if (!measure %in% valid_measures) {
    stop(
      paste0(
        "Invalid `measure`: '", measure, "'. ",
        "Use `retirement_age` or one of: ",
        paste(setdiff(valid_measures, "retirement_age"), collapse = ", "),
        "."
      )
    )
  }

  invisible(measure)
}

# Validate requested measure for retirement-only trend plots.
validate_retirement_measure <- function(measure) {
  if (!is.character(measure) || length(measure) != 1 || is.na(measure)) {
    stop("`measure` must be a single character string.")
  }

  if (measure != "retirement_age") {
    stop("`measure` must be \"retirement_age\" in `plot_retirement_trends()`.")
  }

  invisible(measure)
}

# Validate requested demographic measure for retirement-vs-demography plots.
validate_demographic_year_measure <- function(data, measure) {
  valid_measures <- intersect(
    demographic_year_measures, available_demographic_measures(data)
  )

  if (!is.character(measure) || length(measure) != 1 || is.na(measure)) {
    stop("`demographic_measure` must be a single character string.")
  }

  if (!measure %in% valid_measures) {
    stop(
      paste0(
        "`demographic_measure` must be one of: ",
        paste(valid_measures, collapse = ", "),
        "."
      )
    )
  }

  invisible(measure)
}

# Validate requested sex.
validate_sex <- function(sex) {
  valid_sex <- c("both", "women", "men")

  if (!is.character(sex) || length(sex) != 1 || is.na(sex)) {
    stop("`sex` must be a single character string.")
  }

  if (!sex %in% valid_sex) {
    stop("`sex` must be one of: both, women, men.")
  }

  invisible(sex)
}

# Human-readable y-axis label.
measure_label <- function(measure, sex = "both") {
  if (length(measure) != 1 || is.na(measure)) {
    stop("`measure` must be a length-1 character value.")
  }

  if (length(sex) != 1 || is.na(sex)) {
    stop("`sex` must be a length-1 character value.")
  }

  if (measure == "retirement_age") {
    key <- switch(sex,
      both = "retirement_age_both",
      women = "retirement_age_women",
      men = "retirement_age_men"
    )
    return(measure_label_map[[key]])
  }

  if (measure %in% c("LEx", "LE15", "LE65", "LE80")) {
    key <- switch(sex,
      both = paste0(measure, "_both"),
      women = paste0(measure, "_women"),
      men = paste0(measure, "_men")
    )
    return(measure_label_map[[key]])
  }

  base_label <- if (measure %in% names(measure_label_map)) {
    measure_label_map[[measure]]
  } else {
    measure
  }

  if (measure %in% sex_measure_registry()$measure && sex != "both") {
    return(paste0(base_label, " (", sex, ")"))
  }

  base_label
}

# Format y-axis labels for readability and avoid scientific notation.
format_y_axis_labels <- function(x) {
  x <- as.numeric(x)

  if (length(x) == 0) {
    return(character(0))
  }

  finite_x <- x[is.finite(x)]
  if (length(finite_x) == 0) {
    return(as.character(x))
  }

  max_abs <- max(abs(finite_x), na.rm = TRUE)

  digits <- if (max_abs >= 1000) {
    0
  } else if (max_abs >= 100) {
    0
  } else if (max_abs >= 10) {
    1
  } else if (max_abs >= 1) {
    1
  } else {
    2
  }

  out <- formatC(
    x,
    format = "f",
    digits = digits,
    big.mark = ","
  )

  if (digits > 0) {
    out <- sub("\\.?0+$", "", out)
  }

  out
}

# Validate requested groups.
validate_groups <- function(groups) {
  if (is.null(groups)) {
    return(invisible(retirement_group_levels))
  }

  if (!is.character(groups) || length(groups) == 0 || anyNA(groups)) {
    stop("`groups` must be a non-empty character vector or NULL.")
  }

  invalid_groups <- setdiff(groups, retirement_group_levels)

  if (length(invalid_groups) > 0) {
    stop(
      paste0(
        "Invalid `groups`: ",
        paste(invalid_groups, collapse = ", "),
        ". Use one or more of: ",
        paste(retirement_group_levels, collapse = ", "),
        "."
      )
    )
  }

  invisible(groups)
}

# Normalize strings for flexible matching.
normalize_string <- function(x) {
  x <- trimws(x)
  x <- tolower(x)

  converted <- iconv(x, from = "", to = "ASCII//TRANSLIT")
  converted[is.na(converted)] <- x[is.na(converted)]

  converted <- gsub("[^a-z0-9 ]", " ", converted)
  converted <- gsub("\\s+", " ", converted)
  trimws(converted)
}

# Resolve user-supplied country names to dataset country names.
resolve_countries <- function(countries, available_countries) {
  if (is.null(countries) || length(countries) == 0) {
    stop(
      "For `level = \"country\"`, provide at least one country in `countries`."
    )
  }

  if (!is.character(countries) || anyNA(countries)) {
    stop("`countries` must be a non-empty character vector.")
  }

  if (length(countries) > 6) {
    stop(paste(
      "Provide 6 or fewer countries",
      "for a readable country-level time series plot."
    ))
  }

  normalized_available <- normalize_string(available_countries)
  aggregate_normalized <- normalize_string(aggregate_regions)

  resolved <- vapply(
    countries,
    FUN.VALUE = character(1),
    FUN = function(x) {
      if (normalize_string(x) %in% aggregate_normalized) {
        stop(
          paste0(
            "'", x, "' is an aggregate series, not a country. ",
            "Use `level = \"group\"` instead."
          )
        )
      }

      if (x %in% available_countries) {
        return(x)
      }

      ci_match <-
        available_countries[tolower(available_countries) == tolower(x)]
      if (length(ci_match) == 1) {
        return(ci_match)
      }

      if (x %in% names(country_aliases)) {
        alias_match <- unname(country_aliases[[x]])
        if (alias_match %in% available_countries) {
          return(alias_match)
        }
      }

      normalized_alias_names <- normalize_string(names(country_aliases))
      alias_idx <- which(normalized_alias_names == normalize_string(x))
      if (length(alias_idx) == 1) {
        alias_match <- unname(country_aliases[[alias_idx]])
        if (alias_match %in% available_countries) {
          return(alias_match)
        }
      }

      normalized_x <- normalize_string(x)
      norm_exact <- available_countries[normalized_available == normalized_x]
      if (length(norm_exact) == 1) {
        return(norm_exact)
      }

      partial <- available_countries[
        grepl(normalized_x, normalized_available, fixed = TRUE)
      ]

      if (length(partial) == 1) {
        return(partial)
      }

      if (length(partial) > 1) {
        stop(
          paste0(
            "Country input '", x, "' matches multiple countries: ",
            paste(partial, collapse = ", "),
            ". Please be more specific."
          )
        )
      }

      stop(
        paste0(
          "Could not match country '", x, "'. ",
          "Try a dataset country name or a common alias such as ",
          "China, South Korea, Czechia, Slovakia, Turkey, UK, or USA."
        )
      )
    }
  )

  invisible(unname(resolved))
}

# Compute a readable y-axis scale with one break below and above the data range.
compute_pretty_y_scale <- function(x, n = 5) {
  x <- x[is.finite(x)]

  if (length(x) == 0) {
    stop("Cannot compute y-axis scale from empty data.")
  }

  rng <- range(x, na.rm = TRUE)

  if (rng[1] == rng[2]) {
    center <- rng[1]

    if (center == 0) {
      step <- 1
    } else {
      step <- 10^floor(log10(abs(center))) / 2
    }

    lower <- center - step
    upper <- center + step
    breaks <- c(lower, center, upper)

    return(list(
      breaks = breaks,
      limits = c(lower, upper)
    ))
  }

  raw_breaks <- pretty(rng, n = n)

  if (length(raw_breaks) < 2) {
    step <- diff(rng) / 2
    raw_breaks <- c(rng[1] - step, rng[1], rng[2], rng[2] + step)
  }

  lower_candidates <- raw_breaks[raw_breaks < rng[1]]
  upper_candidates <- raw_breaks[raw_breaks > rng[2]]

  step <- diff(raw_breaks)[1]

  if (length(lower_candidates) == 0) {
    raw_breaks <- c(min(raw_breaks) - step, raw_breaks)
  }

  if (length(upper_candidates) == 0) {
    raw_breaks <- c(raw_breaks, max(raw_breaks) + step)
  }

  breaks <- raw_breaks
  limits <- c(min(breaks), max(breaks))

  list(
    breaks = breaks,
    limits = limits
  )
}

# Build the plotted value column.
compute_measure_value <- function(data, measure, sex) {
  if (measure == "retirement_age") {
    if (sex == "women") {
      return(data$ave_age_women)
    }

    if (sex == "men") {
      return(data$ave_age_men)
    }

    return((data$ave_age_women + data$ave_age_men) / 2)
  }

  registry_measures <- sex_comparable_measures_internal(data)

  if (measure %in% registry_measures) {
    cols <- sex_measure_columns(measure)

    if (sex == "women") {
      return(data[[cols$women_col]])
    }

    if (sex == "men") {
      return(data[[cols$men_col]])
    }

    return(data[[measure]])
  }

  data[[measure]]
}

# Prepare plotting data for a single time-series measure.
prep_retirement_trend_data <- function(
  data,
  measure = "retirement_age",
  sex = "both",
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  level <- match.arg(level)

  validate_measure(data, measure)
  validate_sex(sex)

  country_df <- data |>
    dplyr::filter(!.data$country %in% aggregate_regions) |>
    dplyr::mutate(
      eu_country = .data$country %in% eu_countries,
      oecd_member = .data$oecd_country == "yes",
      membership_group = dplyr::case_when(
        .data$oecd_member & .data$eu_country ~ "OECD + EU",
        .data$oecd_member & !.data$eu_country ~ "OECD only",
        !.data$oecd_member & .data$eu_country ~ "EU only",
        TRUE ~ "Neither OECD nor EU"
      )
    )

  country_df$value <- compute_measure_value(
    country_df,
    measure = measure, sex = sex
  )

  country_df <- country_df |>
    dplyr::filter(!is.na(.data$value))

  if (level == "group") {
    if (!is.null(countries)) {
      stop("`countries` must be NULL when `level = \"group\"`.")
    }

    validate_groups(groups)

    selected_groups <- if (is.null(groups)) retirement_group_levels else groups

    out <- country_df |>
      dplyr::group_by(.data$membership_group, .data$year) |>
      dplyr::summarise(
        value = mean(.data$value, na.rm = TRUE),
        .groups = "drop"
      ) |>
      dplyr::rename(series_label = membership_group) |>
      dplyr::filter(.data$series_label %in% selected_groups) |>
      dplyr::mutate(
        series_label = factor(.data$series_label, levels = selected_groups)
      ) |>
      dplyr::arrange(.data$series_label, .data$year)
  } else {
    if (!is.null(groups)) {
      stop("`groups` must be NULL when `level = \"country\"`.")
    }

    available_countries <- sort(unique(country_df$country))
    resolved_countries <- resolve_countries(countries, available_countries)

    out <- country_df |>
      dplyr::filter(.data$country %in% resolved_countries) |>
      dplyr::transmute(
        year,
        series_label = .data$country,
        value,
        measure = measure
      ) |>
      dplyr::mutate(
        series_label = factor(.data$series_label, levels = resolved_countries)
      ) |>
      dplyr::arrange(.data$series_label, .data$year)
  }

  out |>
    dplyr::mutate(
      measure = measure,
      sex = sex
    )
}

# Registry of public measures with women/men counterparts.
sex_measure_registry <- function() {
  data.frame(
    measure = c(
      "retirement_age",
      "TPopulation1July",
      "Deaths",
      "LEx",
      "LE15",
      "LE65",
      "LE80",
      "Q0040",
      "Q0060",
      "Q1550",
      "Q1560"
    ),
    women_col = c(
      "ave_age_women",
      "TPopulationFemale1July",
      "DeathsFemale",
      "LExFemale",
      "LE15Female",
      "LE65Female",
      "LE80Female",
      "Q0040Female",
      "Q0060Female",
      "Q1550Female",
      "Q1560Female"
    ),
    men_col = c(
      "ave_age_men",
      "TPopulationMale1July",
      "DeathsMale",
      "LExMale",
      "LE15Male",
      "LE65Male",
      "LE80Male",
      "Q0040Male",
      "Q0060Male",
      "Q1550Male",
      "Q1560Male"
    ),
    stringsAsFactors = FALSE
  )
}

sex_measure_columns <- function(measure) {
  registry <- sex_measure_registry()
  row <- registry[registry$measure == measure, , drop = FALSE]

  if (!nrow(row)) {
    stop(
      paste0(
        "No sex-specific column mapping is defined for `measure = \"",
        measure, "\"`."
      )
    )
  }

  as.list(row[1, c("women_col", "men_col")])
}

sex_comparable_measures_internal <- function(data) {
  registry <- sex_measure_registry()

  registry$measure[
    registry$women_col %in% names(data) &
      registry$men_col %in% names(data)
  ]
}

validate_sex_comparable_measure <- function(data, measure) {
  valid_measures <- sex_comparable_measures_internal(data)

  if (!is.character(measure) || length(measure) != 1 || is.na(measure)) {
    stop("`measure` must be a single character string.")
  }

  if (!measure %in% valid_measures) {
    stop(
      paste0(
        "`measure` must be one of: ",
        paste(valid_measures, collapse = ", "),
        "."
      )
    )
  }

  invisible(measure)
}

validate_gap_direction <- function(gap) {
  valid_gap <- c("women_minus_men", "men_minus_women")

  if (!is.character(gap) || length(gap) != 1 || is.na(gap)) {
    stop("`gap` must be a single character string.")
  }

  if (!gap %in% valid_gap) {
    stop("`gap` must be one of: women_minus_men, men_minus_women.")
  }

  invisible(gap)
}

measure_gap_label <- function(measure, gap = "women_minus_men") {
  validate_gap_direction(gap)

  direction_label <- switch(gap,
    women_minus_men = "women - men",
    men_minus_women = "men - women"
  )

  paste0(measure_label(measure, sex = "both"), " gap (", direction_label, ")")
}

prep_sex_comparison_data <- function(
  data,
  measure,
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  level <- match.arg(level)

  validate_sex_comparable_measure(data, measure)

  women_df <- prep_retirement_trend_data(
    data = data,
    measure = measure,
    sex = "women",
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::mutate(sex = "women")

  men_df <- prep_retirement_trend_data(
    data = data,
    measure = measure,
    sex = "men",
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::mutate(sex = "men")

  dplyr::bind_rows(women_df, men_df) |>
    dplyr::mutate(
      sex = factor(.data$sex, levels = c("women", "men"))
    )
}

prep_sex_gap_data <- function(
  data,
  measure,
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men"
) {
  level <- match.arg(level)

  validate_gap_direction(gap)

  comparison_df <- prep_sex_comparison_data(
    data = data,
    measure = measure,
    level = level,
    groups = groups,
    countries = countries
  )

  wide_df <- comparison_df |>
    dplyr::select(year, series_label, sex, value) |>
    tidyr::pivot_wider(
      names_from = sex,
      values_from = value
    )

  if (gap == "women_minus_men") {
    gap_values <- wide_df$women - wide_df$men
  } else {
    gap_values <- wide_df$men - wide_df$women
  }

  out <- wide_df |>
    dplyr::mutate(
      value = gap_values,
      measure = measure,
      gap = gap
    ) |>
    dplyr::select(year, series_label, value, measure, gap) |>
    dplyr::arrange(series_label, year)

  if (is.factor(comparison_df$series_label)) {
    out <- out |>
      dplyr::mutate(
        series_label = factor(
          series_label,
          levels = levels(comparison_df$series_label)
        )
      )
  }

  out
}

latest_year_for_measure <- function(
  data,
  measure,
  sex = "both",
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  level <- match.arg(level)

  trend_df <- prep_retirement_trend_data(
    data = data,
    measure = measure,
    sex = sex,
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::filter(!is.na(.data$value))

  if (!nrow(trend_df)) {
    stop(
      "No non-missing data are available for the requested selection."
    )
  }

  max(trend_df$year)
}

validate_year_present <- function(data, year) {
  if (!is.numeric(year) || length(year) != 1 || is.na(year)) {
    stop("`year` must be a single numeric value.")
  }

  valid_years <- sort(unique(data$year))

  if (!year %in% valid_years) {
    stop(
      paste0(
        "`year` must be one of: ",
        paste(valid_years, collapse = ", "),
        "."
      )
    )
  }

  invisible(year)
}

prep_measure_snapshot_data <- function(
  data,
  measure = "retirement_age",
  year = NULL,
  sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  sex <- match.arg(sex)
  level <- match.arg(level)

  validate_measure(data, measure)
  validate_sex(sex)

  if (is.null(year)) {
    year <- latest_year_for_measure(
      data = data,
      measure = measure,
      sex = sex,
      level = level,
      groups = groups,
      countries = countries
    )
  }

  validate_year_present(data, year)
  target_year <- year

  out <- prep_retirement_trend_data(
    data = data,
    measure = measure,
    sex = sex,
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::filter(.data$year == target_year) |>
    dplyr::mutate(level = level)

  if (!nrow(out)) {
    stop(
      "No data are available for the requested year and selection."
    )
  }

  out
}

prep_sex_gap_snapshot_data <- function(
  data,
  measure = "retirement_age",
  year = NULL,
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men"
) {
  level <- match.arg(level)

  validate_sex_comparable_measure(data, measure)
  validate_gap_direction(gap)

  if (is.null(year)) {
    gap_df <- prep_sex_gap_data(
      data = data,
      measure = measure,
      level = level,
      groups = groups,
      countries = countries,
      gap = gap
    ) |>
      dplyr::filter(!is.na(.data$value))

    if (!nrow(gap_df)) {
      stop(
        "No non-missing sex-gap data are available for the requested selection."
      )
    }

    year <- max(gap_df$year)
  }

  validate_year_present(data, year)
  target_year <- year

  out <- prep_sex_gap_data(
    data = data,
    measure = measure,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  ) |>
    dplyr::filter(.data$year == target_year) |>
    dplyr::mutate(level = level)

  if (!nrow(out)) {
    stop(
      "No sex-gap data are available for the requested year and selection."
    )
  }

  out
}

prep_measure_relationship_data <- function(
  data,
  x_measure = "LE65",
  y_measure = "retirement_age",
  year = NULL,
  x_sex = c("both", "women", "men"),
  y_sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  x_sex <- match.arg(x_sex)
  y_sex <- match.arg(y_sex)
  level <- match.arg(level)

  validate_measure(data, x_measure)
  validate_measure(data, y_measure)
  validate_sex(x_sex)
  validate_sex(y_sex)

  x_df <- prep_retirement_trend_data(
    data = data,
    measure = x_measure,
    sex = x_sex,
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::select(year, series_label, x_value = value)

  y_df <- prep_retirement_trend_data(
    data = data,
    measure = y_measure,
    sex = y_sex,
    level = level,
    groups = groups,
    countries = countries
  ) |>
    dplyr::select(year, series_label, y_value = value)

  joined <- dplyr::inner_join(
    x_df,
    y_df,
    by = c("year", "series_label")
  ) |>
    dplyr::arrange(series_label, year)

  if (!nrow(joined)) {
    stop(
      "No overlapping data are available for the requested selection."
    )
  }

  if (is.null(year)) {
    target_year <- max(joined$year)
  } else {
    validate_year_present(data, year)
    target_year <- year
  }

  out <- joined |>
    dplyr::filter(.data$year == target_year) |>
    dplyr::mutate(
      x_measure = x_measure,
      y_measure = y_measure,
      x_sex = x_sex,
      y_sex = y_sex,
      level = level
    ) |>
    dplyr::arrange(.data$series_label)

  if (!nrow(out)) {
    stop(
      "No overlapping data are available for the requested year and selection."
    )
  }

  out
}

prep_gap_relationship_data <- function(
  data,
  x_measure = "LE65",
  y_measure = "retirement_age",
  year = NULL,
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men"
) {
  level <- match.arg(level)

  validate_sex_comparable_measure(data, x_measure)
  validate_sex_comparable_measure(data, y_measure)
  validate_gap_direction(gap)

  x_df <- prep_sex_gap_data(
    data = data,
    measure = x_measure,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  ) |>
    dplyr::select(year, series_label, x_value = value)

  y_df <- prep_sex_gap_data(
    data = data,
    measure = y_measure,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  ) |>
    dplyr::select(year, series_label, y_value = value)

  joined <- dplyr::inner_join(
    x_df,
    y_df,
    by = c("year", "series_label")
  ) |>
    dplyr::arrange(series_label, year)

  if (!nrow(joined)) {
    stop(
      "No overlapping gap data are available for the requested selection."
    )
  }

  if (is.null(year)) {
    target_year <- max(joined$year)
  } else {
    validate_year_present(data, year)
    target_year <- year
  }

  out <- joined |>
    dplyr::filter(.data$year == target_year) |>
    dplyr::mutate(
      x_measure = x_measure,
      y_measure = y_measure,
      gap = gap,
      level = level
    ) |>
    dplyr::arrange(.data$series_label)

  if (!nrow(out)) {
    stop(
      "No overlapping gap data available for the requested year and selection."
    )
  }

  out
}
