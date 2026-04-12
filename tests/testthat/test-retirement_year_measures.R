test_that(
  "retirement_year_measures exposes the intended age-like demographic varbs",
  {
    expect_equal(
      retirement_year_measures(),
      c("MedianAgePop", "LEx", "LE15", "LE65", "LE80", "MAC")
    )
  }
)
