test_that("plot_retirement_vs_demography_gap returns ggplot objects", {
  expect_s3_class(
    plot_retirement_vs_demography_gap(demographic_measure = "LE65"),
    "ggplot"
  )

  expect_s3_class(
    plot_retirement_vs_demography_gap(
      demographic_measure = "LEx",
      level = "country",
      countries = c("China", "Japan")
    ),
    "ggplot"
  )
})

test_that("plot_retirement_vs_demography_gap rejects retirement_age", {
  expect_error(
    plot_retirement_vs_demography_gap(
      demographic_measure = "retirement_age"
    ),
    "must be a sex-comparable demographic measure"
  )
})

test_that("plot_retirement_vs_demography_gap rejects unsupported measures", {
  expect_error(
    plot_retirement_vs_demography_gap(demographic_measure = "TFR"),
    "`measure` must be one of:"
  )
})
