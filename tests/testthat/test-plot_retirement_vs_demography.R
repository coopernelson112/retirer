test_that(
  "plot_retirement_vs_demography accepts year-based demographic measures only",
  {
    expect_s3_class(
      plot_retirement_vs_demography(demographic_measure = "LE65"),
      "ggplot"
    )

    expect_s3_class(
      plot_retirement_vs_demography(demographic_measure = "MAC"),
      "ggplot"
    )

    expect_error(
      plot_retirement_vs_demography(demographic_measure = "TFR"),
      "`demographic_measure` must be one of:"
    )
  }
)
