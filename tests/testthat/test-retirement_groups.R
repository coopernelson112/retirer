test_that("retirement_groups returns the canonical group labels", {
  expect_equal(
    retirement_groups(),
    c("OECD + EU", "OECD only", "EU only", "Neither OECD nor EU")
  )
})
