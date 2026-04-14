test_that("plot_retirement_trends is retirement-only", {
  p <- plot_retirement_trends()

  expect_s3_class(p, "ggplot")

  expect_error(
    plot_retirement_trends(measure = "TFR"),
    "`measure` must be \"retirement_age\""
  )
})
