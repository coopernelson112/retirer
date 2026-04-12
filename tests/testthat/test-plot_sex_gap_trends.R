test_that("plot_sex_gap_trends returns ggplot objects", {
  expect_s3_class(
    plot_sex_gap_trends(measure = "retirement_age"),
    "ggplot"
  )

  expect_s3_class(
    plot_sex_gap_trends(
      measure = "LE65",
      level = "country",
      countries = c("China", "Japan")
    ),
    "ggplot"
  )

  expect_s3_class(
    plot_sex_gap_trends(measure = "Q1560"),
    "ggplot"
  )
})

test_that("plot_sex_gap_trends validates gap", {
  expect_error(
    plot_sex_gap_trends(
      measure = "retirement_age",
      gap = "difference"
    ),
    "`gap` must be one of: women_minus_men, men_minus_women."
  )
})

test_that("plot_sex_gap_trends rejects unsupported measures", {
  expect_error(
    plot_sex_gap_trends(measure = "TFR"),
    "`measure` must be one of:"
  )
})
