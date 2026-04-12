
<!-- README.md is generated from README.Rmd. Please edit that file -->

# retirer

<!-- badges: start -->

<!-- badges: end -->

The goal of `retirer` is to make it easy to explore retirement-age and
demographic patterns in a single, reproducible workflow.

`retirer` provides tools for working with a cleaned package data set
built from two public sources:

- OECD effective labour market exit age data by country, sex, and year
- United Nations World Population Prospects demographic indicators

The package is designed for users who want to move quickly from a
research question to a defensible visualization or a tidy analytical
data set.

It is especially useful for questions such as:

- How do retirement-age trends differ across OECD and EU membership
  groups?
- How do countries compare in a single year?
- How do women and men differ on retirement age, life expectancy, and
  mortality-related measures?
- How are retirement patterns related to demographic indicators such as
  life expectancy, fertility, migration, mortality, and population size?

## Installation

You can install the development version of `retirer` from GitHub with:

``` r
# install.packages("pak")
pak::pak("coopernelson112/retirer")
```

## Data sources

The package data included in `retirer` are a cleaned and joined version
of:

- an OECD data source on effective labour market exit age by country,
  sex, and year
- the United Nations World Population Prospects 2024 demographic
  indicators file

The raw source files used during development live in `data-raw/`
locally, and the package includes a reproducible cleaning script,
`data-raw/build_retirement.R`, that constructs the final package data
set.

The package vignette shows how to work with the cleaned package data,
while the `data-raw/` script documents how the package data were built.

## What the package includes

`retirer` currently supports five main kinds of analysis:

- **Trend plots** for retirement and demographic measures over time
- **Map-based group comparisons** for OECD and EU membership structure
- **Snapshot plots** for one-year cross-sectional comparisons
- **Sex-comparison plots** for women-versus-men and sex-gap analysis
- **Relationship plots** for studying how two measures move together

It also includes helper functions that return the underlying tidy data
used in the plots.

## Quick start

Load the package:

``` r
library(retirer)
```

Inspect the built-in data:

``` r
retirement
sex_comparable_measures()
retirement_countries()
```

Plot retirement-age trends across OECD and EU membership groups:

``` r
plot_retirement_trends()
```

Map OECD and EU membership groups:

``` r
map_groups(year = 2020)
```

Compare countries in a single year:

``` r
plot_measure_snapshot(
  measure = "LE65",
  year = 2020,
  level = "country",
  countries = c("China", "Japan", "Germany", "Turkey")
)
```

Study women-men differences:

``` r
plot_sex_gap_trends(
  measure = "retirement_age",
  level = "country",
  countries = c("China", "Japan", "Germany")
)
```

Study the relationship between retirement age and life expectancy:

``` r
plot_measure_relationship(
  x_measure = "LE65",
  y_measure = "retirement_age",
  year = 2020,
  level = "country",
  countries = c("China", "Japan", "Germany"),
  show_labels = TRUE,
  add_smooth = FALSE
)
```

## Main function families

### Discovery and helper functions

Use these to inspect the structure of the data and the available
measures.

- `retirement_countries()`
- `retirement_country_aliases()`
- `retirement_groups()`
- `retirement_variables()`
- `retirement_year_measures()`
- `sex_comparable_measures()`

### Trend plots

Use these when your main question is about change over time.

- `plot_retirement_trends()`
- `plot_demography_trends()`
- `plot_retirement_vs_demography()`

### Map-based comparisons

Use these when your main question is geographic rather than temporal.

- `map_groups()`

### Snapshot plots

Use these when your main question is about comparison within a single
year.

- `measure_snapshot_data()`
- `plot_measure_snapshot()`
- `sex_gap_data()`
- `plot_sex_gap_snapshot()`

### Sex comparison

Use these when your main question is about women versus men or a
directed sex gap.

- `plot_sex_comparison_trends()`
- `plot_sex_gap_trends()`
- `plot_retirement_vs_demography_gap()`

### Relationships

Use these when your main question is about whether two measures are
associated.

- `measure_relationship_data()`
- `plot_measure_relationship()`
- `plot_gap_relationship()`

## Country names and aliases

Country names in the underlying data follow the source conventions, so
some names differ from everyday usage. For example, the data use labels
such as `"China (People's Republic of)"`, `"Korea"`, and `"Türkiye"`.

Most country-level functions accept common aliases such as `"Turkey"`,
`"South Korea"`, `"US"`, and `"UK"` and resolve them internally to the
package’s display labels.

## Learn more

The best next step is the getting-started vignette, which walks through
a full graduate-level exploratory workflow with trends, maps, snapshots,
sex comparisons, relationship plots, and data extraction.

After installation, open it with:

``` r
vignette("getting-started", package = "retirer")
```
