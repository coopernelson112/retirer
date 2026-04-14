#' Return demographic measures expressed in years
#'
#' Return the demographic measures from [retirement] that are expressed in years
#' and are suitable for use in [plot_retirement_vs_demography()].
#'
#' @returns
#' A character vector of demographic variable names measured in years.
#'
#' @examples
#' retirement_year_measures()
#'
#' @export
retirement_year_measures <- function() {
  intersect(
    demographic_year_measures, available_demographic_measures(retirement)
  )
}
