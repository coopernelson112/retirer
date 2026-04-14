#' Return snapshot data for a single year or the latest available year
#'
#' Return tidy cross-sectional data for a measure from [retirement], either for
#' OECD/EU membership groups or for selected countries.
#'
#' @param measure Character scalar naming the measure.
#' @param year Optional numeric scalar giving the year to return. If `NULL`, the
#'   latest year with non-missing data for the requested selection is used.
#' @param sex Character scalar indicating the sex-specific series to return.
#'   Must be one of `"both"`, `"women"`, or `"men"`.
#' @param level Character scalar indicating the level to return. Must be one of
#'   `"group"` or `"country"`.
#' @param groups Optional character vector of group labels to return when
#'   `level = "group"`. If `NULL`, all four membership groups are returned.
#' @param countries Optional character vector of country names to return when
#'   `level = "country"`. Country names are matched flexibly against common
#'   aliases where possible. For readability, country-level selections are
#'   limited to 6 countries.
#'
#' @returns
#' A data frame with one row per group or country for the selected year.
#'
#' @examples
#' measure_snapshot_data()
#'
#' measure_snapshot_data(measure = "LE65", year = 2020)
#'
#' measure_snapshot_data(
#'   measure = "retirement_age",
#'   sex = "women",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
measure_snapshot_data <- function(
  measure = "retirement_age",
  year = NULL,
  sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  sex <- match.arg(sex)
  level <- match.arg(level)

  prep_measure_snapshot_data(
    data = retirement,
    measure = measure,
    year = year,
    sex = sex,
    level = level,
    groups = groups,
    countries = countries
  )
}
