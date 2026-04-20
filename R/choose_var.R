#' Choose any variables from retirement data to use for analysis
#'
#' If no variables are chosen, some general population statistics are kept
#'
#' @param ... Any variable chosen to keep in the final dataset
#' @export
choose_var <- function(..., data = retirement) {

  chose <- c(...)

    if (length(chose) == 0) {
      chose <- c("country", "year", "PopDensity", "PopSexRatio",
                  "MedianAgePop", "PopGrowthRate")
    }

  fin_data <- retirement |>

    dplyr::select(dplyr::all_of(chose))

  return(fin_data)
}
