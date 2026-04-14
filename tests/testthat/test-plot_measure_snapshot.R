test_that("plot_measure_snapshot returns ggplot objects", {
  expect_s3_class(
    plot_measure_snapshot(),
    "ggplot"
  )

  expect_s3_class(
    plot_measure_snapshot(
      measure = "LE65",
      year = 2020
    ),
    "ggplot"
  )

  expect_s3_class(
    plot_measure_snapshot(
      measure = "retirement_age",
      sex = "women",
      level = "country",
      countries = c("China", "Japan")
    ),
    "ggplot"
  )
})

test_that("plot_measure_snapshot validates sort", {
  expect_error(
    plot_measure_snapshot(sort = "ranked"),
    "'arg' should be one of"
  )
})
