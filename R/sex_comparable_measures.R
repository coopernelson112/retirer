#' Return measures that support women/men comparison
#'
#' Return the public measures from [retirement] for which the package
#' implements explicit women-versus-men comparison and directed sex-gap
#' calculations.
#'
#' @returns
#' A character vector of measure names.
#'
#' @examples
#' sex_comparable_measures()
#'
#' @export
sex_comparable_measures <- function() {
  sex_comparable_measures_internal(retirement)
}
