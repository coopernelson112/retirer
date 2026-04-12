#' Return accepted country aliases for plotting
#'
#' Return the supported country-name aliases accepted by country-level plotting
#' functions. The names are user-facing aliases and the values are the canonical
#' country names used in [retirement].
#'
#' @returns
#' A named character vector mapping accepted aliases to canonical country names.
#'
#' @examples
#' retirement_country_aliases()
#'
#' @export
retirement_country_aliases <- function() {
  country_aliases
}
