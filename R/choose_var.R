#' Choose or remove variables from retirement data to use for analysis
#'
#' If no variables are chosen, a default set of general population
#' statistics is kept. If include = FALSE, those statistics are removed.
#'
#' @examples
#' choose_var()
#' @examples
#' choose_var(include = FALSE)
#' @examples
#' choose_var("year", "SortOrder", "ave_age_men")
#' @examples
#' choose_var("year", "SortOrder", "ave_age_men", include = FALSE)
#'
#' @param ... Variable names to keep in the final dataset.
#' @param data A data frame to select variables from. Defaults to `retirement`.
#' @param include A logical value determining whether the variables chosen
#' should be included or excluded.
#'
#' @return A data frame containing only the desired variables.
#' @export
choose_var <- function(..., data = retirement, include = TRUE) {
  chose <- c(...)

  if (length(chose) == 0) {
    chose <- c(
      "country", "year", "PopDensity", "PopSexRatio",
      "MedianAgePop", "PopGrowthRate"
    )
  }

  if (include) {
    new_dat <- data |>
      dplyr::select(dplyr::all_of(chose))

    tibble::view(new_dat)
  } else {
    new_dat <- data |>
      dplyr::select(-dplyr::all_of(chose))

    tibble::view(new_dat)
  }
}
