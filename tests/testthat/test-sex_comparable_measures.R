test_that("sex_comparable_measures returns implemented measures", {
  out <- sex_comparable_measures()

  expect_type(out, "character")
  expect_true("retirement_age" %in% out)
  expect_true("LE65" %in% out)
  expect_true("Deaths" %in% out)
  expect_true("Q1560" %in% out)
  expect_false("TFR" %in% out)
})
