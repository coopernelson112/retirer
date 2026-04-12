test_that("measure_snapshot_data returns a data frame with expected columns", {
  out <- measure_snapshot_data()

  expect_s3_class(out, "data.frame")
  expect_true(all(c(
    "year", "series_label", "value", "measure", "sex", "level"
  ) %in% names(out)))
})

test_that("measure_snapshot_data supports explicit year and sex", {
  out <- measure_snapshot_data(
    measure = "retirement_age",
    year = 2020,
    sex = "women"
  )

  expect_true(all(out$year == 2020))
  expect_true(all(out$sex == "women"))
})

test_that("measure_snapshot_data supports country-level selections", {
  out <- measure_snapshot_data(
    measure = "LE65",
    year = 2020,
    level = "country",
    countries = c("China", "Japan")
  )

  expect_true(all(as.character(out$series_label) %in% c(
    "China (People's Republic of)", "Japan"
  )))
})
