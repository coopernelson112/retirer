test_that("plot_sex_gap_snapshot returns ggplot objects", {
  expect_s3_class(
    plot_sex_gap_snapshot(),
    "ggplot"
  )

  expect_s3_class(
    plot_sex_gap_snapshot(
      measure = "LE65",
      year = 2020
    ),
    "ggplot"
  )

  expect_s3_class(
    plot_sex_gap_snapshot(
      measure = "retirement_age",
      level = "country",
      countries = c("China", "Japan")
    ),
    "ggplot"
  )
})

test_that("plot_sex_gap_snapshot rejects unsupported measures", {
  expect_error(
    plot_sex_gap_snapshot(measure = "TFR"),
    "`measure` must be one of:"
  )
})
