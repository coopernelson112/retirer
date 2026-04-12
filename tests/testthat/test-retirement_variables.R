test_that(
  "retirement_variables exposes demographic varbs but not raw retirement cols",
  {
    vars <- retirement_variables()

    expect_type(vars, "character")
    expect_true("TFR" %in% vars)
    expect_true("CNMR" %in% vars)
    expect_true("LE65" %in% vars)

    expect_false("ave_age_women" %in% vars)
    expect_false("ave_age_men" %in% vars)
  }
)
