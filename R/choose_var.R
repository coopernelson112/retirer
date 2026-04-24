#' Choose variables from retirement data to use for analysis
#'
#' If no variables are chosen, a default set of general population
#' statistics is kept.
#'
#' @param ... Variable names to keep in the final dataset.
#' @param data A data frame to select variables from. Defaults to `retirement`.
#'
#' @return A data frame containing only the selected variables.
#' @export
choose_var <- function(..., data = retirement) {

  chose <- c(...)

  if (length(chose) == 0) {
    chose <- c(
      "country", "year", "PopDensity", "PopSexRatio",
      "MedianAgePop", "PopGrowthRate"
    )
  }

  fin_data <- data |>
    dplyr::select(dplyr::all_of(chose))

  return(fin_data)
}
