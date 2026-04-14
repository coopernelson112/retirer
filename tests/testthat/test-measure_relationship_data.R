test_that("measure_relationship_data returns expected columns", {
  out <- measure_relationship_data()

  expect_s3_class(out, "data.frame")
  expect_true(all(c(
    "year", "series_label", "x_value", "y_value",
    "x_measure", "y_measure", "x_sex", "y_sex", "level"
  ) %in% names(out)))
})

test_that("measure_relationship_data supports explicit year and countries", {
  out <- measure_relationship_data(
    x_measure = "LE65",
    y_measure = "retirement_age",
    year = 2020,
    level = "country",
    countries = c("China", "Japan")
  )

  expect_true(all(out$year == 2020))
  expect_true(all(as.character(out$series_label) %in% c(
    "China (People's Republic of)", "Japan"
  )))
})

test_that("measure_relationship_data supports different sex selections", {
  out <- measure_relationship_data(
    x_measure = "LE65",
    y_measure = "retirement_age",
    year = 2020,
    x_sex = "women",
    y_sex = "men"
  )

  expect_true(all(out$x_sex == "women"))
  expect_true(all(out$y_sex == "men"))
})
