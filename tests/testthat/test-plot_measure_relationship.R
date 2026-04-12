test_that("plot_measure_relationship returns ggplot objects", {
  expect_s3_class(
    plot_measure_relationship(),
    "ggplot"
  )

  expect_s3_class(
    plot_measure_relationship(
      x_measure = "LE65",
      y_measure = "retirement_age",
      level = "country",
      countries = c("China", "Japan", "Germany"),
      show_labels = TRUE,
      add_smooth = FALSE
    ),
    "ggplot"
  )
})

test_that("plot_measure_relationship validates show_labels", {
  expect_error(
    plot_measure_relationship(show_labels = "yes"),
    "`show_labels` must be TRUE or FALSE."
  )
})

test_that("plot_measure_relationship validates add_smooth", {
  expect_error(
    plot_measure_relationship(add_smooth = "yes"),
    "`add_smooth` must be TRUE or FALSE."
  )
})
