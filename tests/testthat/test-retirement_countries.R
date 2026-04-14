test_that("retirement_countries returns canonical country names only", {
  countries <- retirement_countries()

  expect_type(countries, "character")
  expect_true(length(countries) > 0)
  expect_true("China (People's Republic of)" %in% countries)
  expect_true("Korea" %in% countries)
  expect_true("T\u00fcrkiye" %in% countries)

  expect_false("OECD - Average" %in% countries)
  expect_false("European Union (27 countries)" %in% countries)
})
