test_that("correct variables are chosen", {
  mtc <- choose_var()
  mtc_test <- dplyr::select(
    retirement, country, year, PopDensity, PopSexRatio,
    MedianAgePop, PopGrowthRate
  )

  expect_equal(mtc, mtc_test)

  nc <- colnames(retirement)

  for (i in seq_along(nc)) {
    tru_datc <- dplyr::select(retirement, nc[i])
    used_datc <- choose_var(nc[i])

    result <- expect_equal(tru_datc, used_datc)
  }
})

test_that("correct variables are removed", {
  mtr <- choose_var(include = FALSE)
  mtr_test <- dplyr::select(
    retirement, -country, -year, -PopDensity,
    -PopSexRatio, -MedianAgePop, -PopGrowthRate
  )

  expect_equal(mtr, mtr_test)

  nr <- colnames(retirement)

  for (i in seq_along(nr)) {
    tru_datr <- dplyr::select(retirement, -nr[i])
    used_datr <- choose_var(nr[i], include = FALSE)

    result <- expect_equal(tru_datr, used_datr)
  }
})
