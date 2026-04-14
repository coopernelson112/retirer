#' Return available demographic variables for plotting
#'
#' Return the numeric demographic variables from [retirement] that can be used
#' in demographic plotting functions.
#'
#' Raw retirement-age columns are excluded because retirement plotting is
#' handled through the derived `"retirement_age"` measure.
#'
#' @returns
#' A character vector of demographic variable names.
#'
#' @examples
#' retirement_variables()
#'
#' @export
retirement_variables <- function() {
  available_demographic_measures(retirement)
}
