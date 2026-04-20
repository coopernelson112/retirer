test_that("correct variables chosen", {
  mt <- choose_var()
  mt_test <- dplyr::select(retirement, country, year, PopDensity, PopSexRatio,
                           MedianAgePop, PopGrowthRate)

  expect_equal(mt, mt_test)

  ns <- colnames(retirement)

  for (i in seq(length(ns))){

    tru_dat <- dplyr::select(retirement, ns[i])
    used_dat <- choose_var(ns[i])

    result <- expect_equal(tru_dat, used_dat)

  }

})




