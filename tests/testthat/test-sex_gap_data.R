test_that("sex_gap_data returns a data frame with expected columns", {
  out <- sex_gap_data()

  expect_s3_class(out, "data.frame")
  expect_true(all(c(
    "year", "series_label", "value", "measure", "gap", "level"
  ) %in% names(out)))
})

test_that("sex_gap_data supports explicit year and country selections", {
  out <- sex_gap_data(
    measure = "LE65",
    year = 2020,
    level = "country",
    countries = c("China", "Japan")
  )

  expect_true(all(out$year == 2020))
  expect_true(all(as.character(out$series_label) %in% c(
    "China (People's Republic of)", "Japan"
  )))
})

test_that("sex_gap_data rejects unsupported measures", {
  expect_error(
    sex_gap_data(measure = "TFR"),
    "`measure` must be one of:"
  )
})
