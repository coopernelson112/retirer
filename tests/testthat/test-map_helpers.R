test_that("prep_retirement_map_data subsets groups cleanly", {
  data_year <-
    retirement[retirement$year == max(retirement$year, na.rm = TRUE), ]

  map_df <- retirer:::prep_retirement_map_data(
    data = data_year,
    groups = c("OECD + EU", "OECD only"),
    include_nonrepresented = TRUE
  )

  expect_true("map_group" %in% names(map_df))
  expect_equal(
    levels(map_df$map_group), c("OECD + EU", "OECD only", "No data")
  )
})
