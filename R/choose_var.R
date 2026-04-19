choose_var <- function(v1 = "ave_age_men", v2 = "ave_age_women",
                       v3 = "nrr", v4 = "infantdeaths", v5 = "imr") {

  preds <- vapply(c(v1, v2, v3, v4, v5), as.character, c(""))

  user_data <- retirement |>

    dplyr::select(year, country, preds[1], preds[2], preds[3], preds[4], preds[5])

  user_data
}
