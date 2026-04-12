test_that("plot_gap_relationship returns ggplot objects", {
  expect_s3_class(
    plot_gap_relationship(),
    "ggplot"
  )

  expect_s3_class(
    plot_gap_relationship(
      x_measure = "Q1550",
      y_measure = "retirement_age",
      level = "country",
      countries = c("China", "Japan", "Germany"),
      gap = "men_minus_women",
      show_labels = TRUE,
      add_smooth = FALSE
    ),
    "ggplot"
  )
})

test_that("plot_gap_relationship validates gap", {
  expect_error(
    plot_gap_relationship(gap = "difference"),
    "`gap` must be one of: women_minus_men, men_minus_women."
  )
})

test_that("plot_gap_relationship rejects unsupported measures", {
  expect_error(
    plot_gap_relationship(x_measure = "TFR"),
    "`measure` must be one of:"
  )
})
