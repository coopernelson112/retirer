#' Return canonical country names available for plotting
#'
#' Return the canonical country names available for country-level plotting from
#' the built-in [retirement] dataset.
#'
#' Aggregate series such as `"European Union (27 countries)"` and
#' `"OECD - Average"` are excluded.
#'
#' @returns
#' A character vector of country names.
#'
#' @examples
#' retirement_countries()
#'
#' @export
retirement_countries <- function() {
  sort(unique(retirement$country[!retirement$country %in% aggregate_regions]))
}
