test_that("map_groups returns a ggplot object", {
  p <- map_groups(groups = c("OECD + EU", "OECD only"))

  expect_s3_class(p, "ggplot")
})

test_that("map_groups validates year", {
  expect_error(
    map_groups(year = "2020"),
    regexp = "`year` must be a single numeric value or NULL."
  )
})

test_that("map_groups validates include_nonrepresented", {
  expect_error(
    map_groups(include_nonrepresented = "yes"),
    regexp = "`include_nonrepresented` must be TRUE or FALSE."
  )
})
