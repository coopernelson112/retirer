#' Return sex-gap data for a single year or the latest available year
#'
#' Return tidy sex-gap data for a sex-comparable measure from [retirement],
#' either for OECD/EU membership groups or for selected countries.
#'
#' @param measure Character scalar naming the measure. Must be one of the values
#'   returned by [sex_comparable_measures()].
#' @param year Optional numeric scalar giving the year to return. If `NULL`, the
#'   latest year with non-missing sex-gap data for the requested selection is
#'   used.
#' @param level Character scalar indicating the level to return. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to return when
#'   `level = "group"`. If `NULL`, all four membership groups are returned.
#' @param countries Optional character vector of country names to return when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level selections are
#'   limited to 6 countries.
#' @param gap Character scalar indicating the direction of the gap. Must be one
#'   of `"women_minus_men"` or `"men_minus_women"`.
#'
#' @returns
#' A data frame with one row per group or country for the selected year.
#'
#' @examples
#' sex_gap_data()
#'
#' sex_gap_data(measure = "LE65", year = 2020)
#'
#' sex_gap_data(
#'   measure = "retirement_age",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
sex_gap_data <- function(
  measure = "retirement_age",
  year = NULL,
  level = c("group", "country"),
  groups = NULL,
  countries = NULL,
  gap = "women_minus_men"
) {
  level <- match.arg(level)

  prep_sex_gap_snapshot_data(
    data = retirement,
    measure = measure,
    year = year,
    level = level,
    groups = groups,
    countries = countries,
    gap = gap
  )
}
