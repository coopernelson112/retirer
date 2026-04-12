test_that("validate_retirement_measure accepts only retirement_age", {
  expect_invisible(retirer:::validate_retirement_measure("retirement_age"))

  expect_error(
    retirer:::validate_retirement_measure("TFR"),
    "`measure` must be \"retirement_age\""
  )
})

test_that("available_plot_measures returns numeric candidate measures", {
  out <- retirer:::available_plot_measures(retirement)

  expect_type(out, "character")
  expect_true("TFR" %in% out)
  expect_true("LE65" %in% out)
  expect_false("country" %in% out)
  expect_false("year" %in% out)
})

test_that("validate_measure accepts plotting measures", {
  expect_invisible(retirer:::validate_measure(retirement, "retirement_age"))
  expect_invisible(retirer:::validate_measure(retirement, "TFR"))

  expect_error(
    retirer:::validate_measure(retirement, "not_a_measure"),
    "Invalid `measure`"
  )
})

test_that(
  "validate_demographic_year_measure accepts only year-based demogr. measures",
  {
    expect_invisible(
      retirer:::validate_demographic_year_measure(retirement, "LE65")
    )

    expect_error(
      retirer:::validate_demographic_year_measure(retirement, "TFR"),
      "`demographic_measure` must be one of:"
    )
  }
)

test_that("measure_label returns human-readable labels", {
  expect_identical(
    retirer:::measure_label("retirement_age", sex = "both"),
    "Average retirement age"
  )
  expect_identical(
    retirer:::measure_label("retirement_age", sex = "women"),
    "Average retirement age (women)"
  )
  expect_identical(
    retirer:::measure_label("LE65", sex = "men"),
    "Life expectancy at age 65 (men)"
  )
  expect_identical(
    retirer:::measure_label("CNMR"),
    "Net migration rate (per 1,000 population)"
  )
  expect_identical(
    retirer:::measure_label("TPopulation1July"),
    "Total population, 1 July (thousands)"
  )
})

test_that(
  "format_y_axis_labels avoids scientific notation and uses separators",
  {
    labels <- retirer:::format_y_axis_labels(c(0, 100000, 250000))

    expect_equal(labels, c("0", "100,000", "250,000"))
  }
)

test_that(
  "compute_measure_value uses derived retirement avgs & ofcl. combined series",
  {
    x <- retirement[1:5, ]

    expect_equal(
      retirer:::compute_measure_value(x, "retirement_age", "women"),
      x$ave_age_women
    )
    expect_equal(
      retirer:::compute_measure_value(x, "retirement_age", "men"),
      x$ave_age_men
    )
    expect_equal(
      retirer:::compute_measure_value(x, "retirement_age", "both"),
      (x$ave_age_women + x$ave_age_men) / 2
    )

    expect_equal(
      retirer:::compute_measure_value(x, "LE65", "women"),
      x$LE65Female
    )
    expect_equal(
      retirer:::compute_measure_value(x, "LE65", "men"),
      x$LE65Male
    )
    expect_equal(
      retirer:::compute_measure_value(x, "LE65", "both"),
      x$LE65
    )

    expect_equal(
      retirer:::compute_measure_value(x, "Deaths", "both"),
      x$Deaths
    )
    expect_equal(
      retirer:::compute_measure_value(x, "TPopulation1July", "both"),
      x$TPopulation1July
    )
  }
)

test_that("resolve_countries accepts aliases and returns canonical names", {
  available <- retirement_countries()

  resolved <- retirer:::resolve_countries(
    c("China", "South Korea", "Turkey", "USA"),
    available
  )

  expect_equal(
    resolved,
    c(
      "China (People's Republic of)",
      "Korea",
      "T\u00fcrkiye",
      "United States"
    )
  )
})

test_that("resolve_countries rejects aggregate series", {
  available <- retirement_countries()

  expect_error(
    retirer:::resolve_countries("OECD - Average", available),
    "aggregate series, not a country"
  )
})

test_that("resolve_countries enforces country count cap", {
  available <- retirement_countries()

  expect_error(
    retirer:::resolve_countries(available[1:7], available),
    "Provide 6 or fewer countries"
  )
})

test_that(
  "prep_retirement_trend_data produces grouped data with requested group order",
  {
    plot_df <- retirer:::prep_retirement_trend_data(
      data = retirement,
      measure = "retirement_age",
      sex = "both",
      level = "group",
      groups = c("OECD only", "EU only")
    )

    expect_true(
      all(
        c(
          "year", "series_label", "value", "measure", "sex"
        ) %in% names(plot_df)
      )
    )
    expect_equal(
      levels(plot_df$series_label), c("OECD only", "EU only")
    )
    expect_true(
      all(unique(as.character(plot_df$series_label)) %in% c(
        "OECD only", "EU only"
      ))
    )
  }
)

test_that(
  "prep_retirement_trend_data resolves country aliases for country-level data",
  {
    plot_df <- retirer:::prep_retirement_trend_data(
      data = retirement,
      measure = "retirement_age",
      sex = "both",
      level = "country",
      countries = c("China", "Japan", "Turkey")
    )

    expect_equal(
      levels(plot_df$series_label),
      c("China (People's Republic of)", "Japan", "T\u00fcrkiye")
    )
  }
)

test_that("sex_comparable_measures_internal returns supported measures", {
  out <- retirer:::sex_comparable_measures_internal(retirement)

  expect_type(out, "character")
  expect_true("retirement_age" %in% out)
  expect_true("LE65" %in% out)
  expect_false("TFR" %in% out)
})

test_that("validate_sex_comparable_measure accepts supported measures", {
  expect_invisible(
    retirer:::validate_sex_comparable_measure(retirement, "retirement_age")
  )
  expect_invisible(
    retirer:::validate_sex_comparable_measure(retirement, "LE65")
  )

  expect_error(
    retirer:::validate_sex_comparable_measure(retirement, "TFR"),
    "`measure` must be one of:"
  )
})

test_that("validate_gap_direction accepts only implemented directions", {
  expect_invisible(retirer:::validate_gap_direction("women_minus_men"))
  expect_invisible(retirer:::validate_gap_direction("men_minus_women"))

  expect_error(
    retirer:::validate_gap_direction("difference"),
    "`gap` must be one of: women_minus_men, men_minus_women."
  )
})

test_that("measure_gap_label returns human-readable gap labels", {
  expect_identical(
    retirer:::measure_gap_label("retirement_age", "women_minus_men"),
    "Average retirement age gap (women - men)"
  )

  expect_identical(
    retirer:::measure_gap_label("LE65", "men_minus_women"),
    "Life expectancy at age 65 gap (men - women)"
  )
})

test_that("prep_sex_comparison_data returns women and men rows", {
  out <- retirer:::prep_sex_comparison_data(
    data = retirement,
    measure = "retirement_age",
    level = "group",
    groups = c("OECD only", "EU only")
  )

  expect_true(all(c("year", "series_label", "value", "sex") %in% names(out)))
  expect_equal(levels(out$sex), c("women", "men"))
  expect_true(all(unique(as.character(out$series_label)) %in% c(
    "OECD only", "EU only"
  )))
})

test_that("prep_sex_gap_data computes requested gap direction", {
  comparison_df <- retirer:::prep_sex_comparison_data(
    data = retirement,
    measure = "retirement_age",
    level = "country",
    countries = c("Japan")
  )

  gap_df <- retirer:::prep_sex_gap_data(
    data = retirement,
    measure = "retirement_age",
    level = "country",
    countries = c("Japan"),
    gap = "women_minus_men"
  )

  women_df <- comparison_df |>
    dplyr::filter(.data$sex == "women") |>
    dplyr::arrange(.data$year)

  men_df <- comparison_df |>
    dplyr::filter(.data$sex == "men") |>
    dplyr::arrange(.data$year)

  expected_gap <- women_df$value - men_df$value

  expect_equal(gap_df$value, expected_gap)
})

test_that("sex_measure_registry contains expected columns", {
  out <- retirer:::sex_measure_registry()

  expect_s3_class(out, "data.frame")
  expect_true(all(c("measure", "women_col", "men_col") %in% names(out)))
})

test_that(
  "sex_comparable_measures_internal returns registry-backed measures",
  {
    out <- retirer:::sex_comparable_measures_internal(retirement)

    expect_true("retirement_age" %in% out)
    expect_true("LE65" %in% out)
    expect_true("Deaths" %in% out)
    expect_false("TFR" %in% out)
  }
)

test_that("sex_measure_columns returns mapped women and men columns", {
  cols <- retirer:::sex_measure_columns("LE65")

  expect_identical(cols$women_col, "LE65Female")
  expect_identical(cols$men_col, "LE65Male")
})

test_that("validate_sex_comparable_measure accepts supported measures", {
  expect_invisible(
    retirer:::validate_sex_comparable_measure(retirement, "retirement_age")
  )
  expect_invisible(
    retirer:::validate_sex_comparable_measure(retirement, "Deaths")
  )

  expect_error(
    retirer:::validate_sex_comparable_measure(retirement, "TFR"),
    "`measure` must be one of:"
  )
})

test_that("validate_gap_direction accepts only implemented directions", {
  expect_invisible(retirer:::validate_gap_direction("women_minus_men"))
  expect_invisible(retirer:::validate_gap_direction("men_minus_women"))

  expect_error(
    retirer:::validate_gap_direction("difference"),
    "`gap` must be one of: women_minus_men, men_minus_women."
  )
})

test_that("measure_gap_label returns human-readable gap labels", {
  expect_identical(
    retirer:::measure_gap_label("retirement_age", "women_minus_men"),
    "Average retirement age gap (women - men)"
  )

  expect_identical(
    retirer:::measure_gap_label("LE65", "men_minus_women"),
    "Life expectancy at age 65 gap (men - women)"
  )
})

test_that("latest_year_for_measure returns a numeric year", {
  out <- retirer:::latest_year_for_measure(
    data = retirement,
    measure = "retirement_age",
    sex = "both",
    level = "group"
  )

  expect_true(is.numeric(out))
  expect_length(out, 1)
})

test_that("prep_sex_comparison_data returns women and men rows", {
  out <- retirer:::prep_sex_comparison_data(
    data = retirement,
    measure = "retirement_age",
    level = "group",
    groups = c("OECD only", "EU only")
  )

  expect_true(all(c("year", "series_label", "value", "sex") %in% names(out)))
  expect_equal(levels(out$sex), c("women", "men"))
})

test_that("prep_sex_gap_data computes requested gap direction", {
  comparison_df <- retirer:::prep_sex_comparison_data(
    data = retirement,
    measure = "retirement_age",
    level = "country",
    countries = c("Japan")
  )

  gap_df <- retirer:::prep_sex_gap_data(
    data = retirement,
    measure = "retirement_age",
    level = "country",
    countries = c("Japan"),
    gap = "women_minus_men"
  )

  women_df <- comparison_df |>
    dplyr::filter(.data$sex == "women") |>
    dplyr::arrange(.data$year)

  men_df <- comparison_df |>
    dplyr::filter(.data$sex == "men") |>
    dplyr::arrange(.data$year)

  expect_equal(gap_df$value, women_df$value - men_df$value)
})

test_that("prep_measure_snapshot_data returns one year of data", {
  out <- retirer:::prep_measure_snapshot_data(
    data = retirement,
    measure = "retirement_age",
    year = 2020,
    level = "group"
  )

  expect_true(all(out$year == 2020))
})

test_that("prep_sex_gap_snapshot_data returns one year of data", {
  out <- retirer:::prep_sex_gap_snapshot_data(
    data = retirement,
    measure = "retirement_age",
    year = 2020,
    level = "group"
  )

  expect_true(all(out$year == 2020))
})

test_that(
  "prep_measure_relationship_data returns one year of overlapping data",
  {
    out <- retirer:::prep_measure_relationship_data(
      data = retirement,
      x_measure = "LE65",
      y_measure = "retirement_age",
      year = 2020,
      level = "country",
      countries = c("China", "Japan")
    )

    expect_true(all(out$year == 2020))
    expect_true(all(c(
      "x_value", "y_value", "x_measure", "y_measure", "x_sex", "y_sex", "level"
    ) %in% names(out)))
  }
)

test_that(
  "prep_gap_relationship_data returns one year of overlapping gap data",
  {
    out <- retirer:::prep_gap_relationship_data(
      data = retirement,
      x_measure = "LE65",
      y_measure = "retirement_age",
      year = 2020,
      level = "country",
      countries = c("China", "Japan"),
      gap = "women_minus_men"
    )

    expect_true(all(out$year == 2020))
    expect_true(all(c(
      "x_value", "y_value", "x_measure", "y_measure", "gap", "level"
    ) %in% names(out)))
    expect_true(all(out$gap == "women_minus_men"))
  }
)
