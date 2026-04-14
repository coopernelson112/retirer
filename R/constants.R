# EU member countries used across the package.
eu_countries <- c(
  "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic",
  "Denmark", "Estonia", "Finland", "France", "Germany", "Greece",
  "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg",
  "Malta", "Netherlands", "Poland", "Portugal", "Romania",
  "Slovak Republic", "Slovenia", "Spain", "Sweden"
)

# Aggregate observations that should not be drawn as countries.
aggregate_regions <- c(
  "European Union (27 countries)",
  "OECD - Average"
)

# Fixed colors for OECD/EU membership groups used across maps and line plots.
retirement_group_colors <- c(
  "OECD + EU" = "#1b9e77",
  "OECD only" = "#d95f02",
  "EU only" = "#7570b3",
  "Neither OECD nor EU" = "#e7298a",
  "No data" = "grey80"
)
