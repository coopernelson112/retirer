library(tidyverse)
library(readxl)

un_data <- read_csv("~/Downloads/WPP2024_Demographic_Indicators_Medium_cleaned-1.csv")
oecd_data <- read_excel("~/Downloads/effective_labour_market_exit_age_cleaned(1).xlsx")

head(oecd_data)
head(un_data)

colnames(un_data) <- tolower(colnames(un_data))

oecd_data <- oecd_data %>% pivot_wider(names_from = gender,
                          values_from = average_age,
                          names_prefix = "ave_age_")

oecd_countries <- c("Australia",
                    "Austria",
                    "Belgium",
                    "Canada",
                    "Chile",
                    "Colombia",
                    "Costa Rica",
                    "Czech Republic",
                    "Denmark",
                    "Estonia",
                    "Finland",
                    "France",
                    "Germany",
                    "Greece",
                    "Hungary",
                    "Iceland",
                    "Ireland",
                    "Israel",
                    "Italy",
                    "Japan",
                    "Korea",
                    "Latvia",
                    "Lithuania",
                    "Luxembourg",
                    "Mexico",
                    "Netherlands",
                    "New Zealand",
                    "Norway",
                    "Poland",
                    "Portugal",
                    "Slovak Republic",
                    "Slovenia",
                    "Spain",
                    "Sweden",
                    "Switzerland",
                    "Türkiye",
                    "United Kingdom",
                    "United States"
)

oecd_data <- oecd_data %>%
            mutate(oecd_country = country %in% oecd_countries)

oecd_data$oecd_country <- ifelse(oecd_data$oecd_country, "yes", "no")
oecd_data$oecd_country <- as.factor(oecd_data$oecd_country)

full_data <- inner_join(oecd_data, un_data, by = c("country", "year"))


