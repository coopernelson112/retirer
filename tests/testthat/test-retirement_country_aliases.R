test_that("retirement_country_aliases exposes supported aliases", {
  aliases <- retirement_country_aliases()

  expect_type(aliases, "character")
  expect_identical(unname(aliases[["China"]]), "China (People's Republic of)")
  expect_identical(unname(aliases[["South Korea"]]), "Korea")
  expect_identical(unname(aliases[["Turkey"]]), "T\u00fcrkiye")
  expect_identical(unname(aliases[["USA"]]), "United States")
})
