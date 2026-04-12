test_that(
  "plot_demography_trends returns ggplot objects for demographic variables",
  {
    expect_s3_class(
      plot_demography_trends(measure = "TFR"),
      "ggplot"
    )

    expect_s3_class(
      plot_demography_trends(
        measure = "CNMR",
        level = "country",
        countries = c("China", "Japan")
      ),
      "ggplot"
    )
  }
)

test_that("plot_demography_trends rejects retirement_age", {
  expect_error(
    plot_demography_trends(measure = "retirement_age"),
    regexp = "plot_retirement_trends"
  )
})

test_that("plot_demography_trends validates show_points", {
  expect_error(
    plot_demography_trends(measure = "TFR", show_points = "yes"),
    regexp = "`show_points` must be TRUE or FALSE."
  )
})

test_that("plot_demography_trends rejects invalid demographic measures", {
  expect_error(
    plot_demography_trends(measure = "not_a_measure"),
    regexp = "Invalid `measure`"
  )
})
