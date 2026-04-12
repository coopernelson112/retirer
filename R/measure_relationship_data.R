#' Return paired measure data for a single year or the latest overlapping year
#'
#' Return tidy cross-sectional data pairing two measures from [retirement],
#' either for OECD/EU membership groups or for selected countries.
#'
#' @param x_measure Character scalar naming the measure to place on the x-axis.
#' @param y_measure Character scalar naming the measure to place on the y-axis.
#' @param year Optional numeric scalar giving the year to return. If `NULL`, the
#'   latest year with overlapping non-missing data for both measures and the
#'   requested selection is used.
#' @param x_sex Character scalar indicating the sex-specific version of
#'   `x_measure` to use. Must be one of `"both"`, `"women"`, or `"men"`.
#' @param y_sex Character scalar indicating the sex-specific version of
#'   `y_measure` to use. Must be one of `"both"`, `"women"`, or `"men"`.
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
#' A data frame with one row per group or country for the selected year. The
#' returned columns are:
#' \describe{
#'   \item{year}{The selected year.}
#'   \item{series_label}{The group or country label.}
#'   \item{x_value}{The value of `x_measure`.}
#'   \item{y_value}{The value of `y_measure`.}
#'   \item{x_measure}{The requested x-axis measure.}
#'   \item{y_measure}{The requested y-axis measure.}
#'   \item{x_sex}{The requested sex selection for `x_measure`.}
#'   \item{y_sex}{The requested sex selection for `y_measure`.}
#'   \item{level}{The requested level.}
#' }
#'
#' @examples
#' measure_relationship_data()
#'
#' measure_relationship_data(
#'   x_measure = "LE65",
#'   y_measure = "retirement_age",
#'   year = 2020
#' )
#'
#' measure_relationship_data(
#'   x_measure = "LE65",
#'   y_measure = "retirement_age",
#'   x_sex = "women",
#'   y_sex = "men",
#'   level = "country",
#'   countries = c("China", "Japan", "Germany")
#' )
#'
#' @export
measure_relationship_data <- function(
  x_measure = "LE65",
  y_measure = "retirement_age",
  year = NULL,
  x_sex = c("both", "women", "men"),
  y_sex = c("both", "women", "men"),
  level = c("group", "country"),
  groups = NULL,
  countries = NULL
) {
  x_sex <- match.arg(x_sex)
  y_sex <- match.arg(y_sex)
  level <- match.arg(level)

  prep_measure_relationship_data(
    data = retirement,
    x_measure = x_measure,
    y_measure = y_measure,
    year = year,
    x_sex = x_sex,
    y_sex = y_sex,
    level = level,
    groups = groups,
    countries = countries
  )
}
