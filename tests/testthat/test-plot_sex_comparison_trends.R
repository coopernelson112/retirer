test_that("plot_sex_comparison_trends returns ggplot objects", {
  expect_s3_class(
    plot_sex_comparison_trends(measure = "retirement_age"),
    "ggplot"
  )

  expect_s3_class(
    plot_sex_comparison_trends(
      measure = "LE65",
      level = "country",
      countries = c("China", "Japan")
    ),
    "ggplot"
  )

  expect_s3_class(
    plot_sex_comparison_trends(measure = "Deaths"),
    "ggplot"
  )
})

test_that("plot_sex_comparison_trends rejects unsupported measures", {
  expect_error(
    plot_sex_comparison_trends(measure = "TFR"),
    "`measure` must be one of:"
  )
})

test_that("plot_sex_comparison_trends validates show_points", {
  expect_error(
    plot_sex_comparison_trends(
      measure = "retirement_age",
      show_points = "yes"
    ),
    "`show_points` must be TRUE or FALSE."
  )
})
