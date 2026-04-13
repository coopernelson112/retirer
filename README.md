
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
#>                           country year ave_age_men ave_age_women oecd_country
#> 1                       Argentina 1990        63.9          64.6           no
#> 2                       Argentina 2000        67.0          68.9           no
#> 3                       Argentina 2005        65.7          63.7           no
#> 4                       Argentina 2010        66.0          63.0           no
#> 5                       Argentina 2015        65.2          62.5           no
#> 6                       Argentina 2016        65.1          62.1           no
#> 7                       Argentina 2017        64.2          62.3           no
#> 8                       Argentina 2018        64.1          63.2           no
#> 9                       Argentina 2019        64.5          63.9           no
#> 10                      Argentina 2020        62.4          62.8           no
#> 11                      Australia 1970        65.7          63.7          yes
#> 12                      Australia 1980        62.7          58.7          yes
#> 13                      Australia 1990        61.1          59.3          yes
#> 14                      Australia 2000        60.6          58.7          yes
#> 15                      Australia 2005        62.1          60.3          yes
#> 16                      Australia 2010        63.0          61.7          yes
#> 17                      Australia 2015        63.8          62.1          yes
#> 18                      Australia 2016        63.6          62.5          yes
#> 19                      Australia 2017        64.1          63.1          yes
#> 20                      Australia 2018        63.7          63.2          yes
#> 21                      Australia 2019        64.1          63.5          yes
#> 22                      Australia 2020        64.1          63.3          yes
#> 23                        Austria 2000        59.2          57.9          yes
#> 24                        Austria 2005        57.7          57.2          yes
#> 25                        Austria 2010        58.8          57.3          yes
#> 26                        Austria 2015        60.5          59.3          yes
#> 27                        Austria 2016        60.6          59.6          yes
#> 28                        Austria 2017        61.6          60.1          yes
#> 29                        Austria 2018        61.8          60.0          yes
#> 30                        Austria 2019        62.6          60.4          yes
#> 31                        Austria 2020        62.0          60.7          yes
#> 32                        Belgium 1970        62.8          60.6          yes
#> 33                        Belgium 1980        60.7          58.1          yes
#> 34                        Belgium 1990        57.8          55.4          yes
#> 35                        Belgium 2000        57.9          56.7          yes
#> 36                        Belgium 2005        58.1          57.0          yes
#> 37                        Belgium 2010        59.6          58.2          yes
#> 38                        Belgium 2015        59.2          58.9          yes
#> 39                        Belgium 2016        60.2          59.1          yes
#> 40                        Belgium 2017        60.4          59.6          yes
#> 41                        Belgium 2018        60.4          59.9          yes
#> 42                        Belgium 2019        60.1          59.8          yes
#> 43                        Belgium 2020        60.9          60.1          yes
#> 44                         Brazil 1970        67.9          70.6           no
#> 45                         Brazil 1980        66.0          71.1           no
#> 46                         Brazil 1990        64.8          65.7           no
#> 47                         Brazil 2000        63.0          60.2           no
#> 48                         Brazil 2005        64.2          62.2           no
#> 49                         Brazil 2010        64.6          60.5           no
#> 50                         Brazil 2015        64.1          60.4           no
#> 51                         Brazil 2016        64.8          61.4           no
#> 52                         Brazil 2017        63.6          61.2           no
#> 53                         Brazil 2018        63.4          61.4           no
#> 54                         Brazil 2019        62.8          61.4           no
#> 55                         Brazil 2020        62.0          59.2           no
#> 56                       Bulgaria 1970        64.4          58.2           no
#> 57                       Bulgaria 1980        60.8          55.4           no
#> 58                       Bulgaria 1990        61.1          56.9           no
#> 59                       Bulgaria 2000        57.2          54.4           no
#> 60                       Bulgaria 2005        57.8          54.7           no
#> 61                       Bulgaria 2010        61.9          59.9           no
#> 62                       Bulgaria 2015        61.6          60.6           no
#> 63                       Bulgaria 2016        62.2          60.3           no
#> 64                       Bulgaria 2017        63.3          60.6           no
#> 65                       Bulgaria 2018        64.0          61.0           no
#> 66                       Bulgaria 2019        64.8          61.8           no
#> 67                       Bulgaria 2020        64.5          61.7           no
#> 68                         Canada 1970        64.2          65.3          yes
#> 69                         Canada 1980        63.6          62.9          yes
#> 70                         Canada 1990        61.9          60.8          yes
#> 71                         Canada 2000        61.3          59.9          yes
#> 72                         Canada 2005        61.9          60.6          yes
#> 73                         Canada 2010        61.8          61.2          yes
#> 74                         Canada 2015        63.4          61.8          yes
#> 75                         Canada 2016        64.0          61.7          yes
#> 76                         Canada 2017        63.9          62.1          yes
#> 77                         Canada 2018        63.6          62.5          yes
#> 78                         Canada 2019        64.7          63.0          yes
#> 79                         Canada 2020        63.9          62.6          yes
#> 80                          Chile 1970        65.7          61.5          yes
#> 81                          Chile 1980        65.2          63.2          yes
#> 82                          Chile 1990        64.2          68.6          yes
#> 83                          Chile 2000        66.0          63.3          yes
#> 84                          Chile 2005        65.0          64.2          yes
#> 85                          Chile 2010        65.6          66.1          yes
#> 86                          Chile 2015        68.0          65.2          yes
#> 87                          Chile 2016        67.2          64.3          yes
#> 88                          Chile 2017        66.6          64.0          yes
#> 89                          Chile 2018        66.7          64.5          yes
#> 90                          Chile 2019        67.8          64.7          yes
#> 91                          Chile 2020        64.6          60.9          yes
#> 92   China (People's Republic of) 1990        64.1          56.5           no
#> 93   China (People's Republic of) 2000        63.0          56.3           no
#> 94   China (People's Republic of) 2005        65.3          60.0           no
#> 95   China (People's Republic of) 2010        63.9          59.3           no
#> 96   China (People's Republic of) 2015        63.5          59.1           no
#> 97   China (People's Republic of) 2016        64.2          59.5           no
#> 98   China (People's Republic of) 2017        64.4          59.6           no
#> 99   China (People's Republic of) 2018        64.5          59.7           no
#> 100  China (People's Republic of) 2019        64.4          59.7           no
#> 101  China (People's Republic of) 2020        65.5          60.6           no
#> 102                      Colombia 2000        69.7            NA          yes
#> 103                      Colombia 2005        69.0            NA          yes
#> 104                      Colombia 2010        69.4          62.4          yes
#> 105                      Colombia 2015        68.9          64.3          yes
#> 106                      Colombia 2016        69.5          62.8          yes
#> 107                      Colombia 2017        68.6          62.2          yes
#> 108                      Colombia 2018        68.8          62.4          yes
#> 109                      Colombia 2019        68.9          62.3          yes
#> 110                      Colombia 2020        66.7          60.3          yes
#> 111                    Costa Rica 1990        63.4          56.4          yes
#> 112                    Costa Rica 2000        66.8          59.9          yes
#> 113                    Costa Rica 2005        66.4          67.5          yes
#> 114                    Costa Rica 2010        67.5          58.5          yes
#> 115                    Costa Rica 2015        64.6          62.8          yes
#> 116                    Costa Rica 2016        64.1          60.6          yes
#> 117                    Costa Rica 2017        66.9          58.5          yes
#> 118                    Costa Rica 2018        67.0          58.9          yes
#> 119                    Costa Rica 2019        66.9          62.3          yes
#> 120                    Costa Rica 2020        66.7          61.7          yes
#> 121                       Croatia 2000        58.8          55.8           no
#> 122                       Croatia 2005        59.2          55.2           no
#> 123                       Croatia 2010        59.3          57.1           no
#> 124                       Croatia 2015        61.2          60.7           no
#> 125                       Croatia 2016        60.4          60.2           no
#> 126                       Croatia 2017        61.7          59.1           no
#> 127                       Croatia 2018        60.4          60.1           no
#> 128                       Croatia 2019        60.2          57.1           no
#> 129                       Croatia 2020        61.1          58.0           no
#> 130                        Cyprus 1990        67.6          63.2           no
#> 131                        Cyprus 2000        62.2          60.4           no
#> 132                        Cyprus 2005        63.8          61.2           no
#> 133                        Cyprus 2010        64.1          58.7           no
#> 134                        Cyprus 2015        64.0          61.5           no
#> 135                        Cyprus 2016        64.4          60.1           no
#> 136                        Cyprus 2017        63.4          60.0           no
#> 137                        Cyprus 2018        62.9          61.1           no
#> 138                        Cyprus 2019        62.6          60.4           no
#> 139                        Cyprus 2020        64.6          59.4           no
#> 140                Czech Republic 1970        62.8          60.4          yes
#> 141                Czech Republic 1980        61.5          58.3          yes
#> 142                Czech Republic 1990        61.6          57.8          yes
#> 143                Czech Republic 2000        60.6          57.2          yes
#> 144                Czech Republic 2005        60.6          57.8          yes
#> 145                Czech Republic 2010        61.5          58.4          yes
#> 146                Czech Republic 2015        62.0          60.1          yes
#> 147                Czech Republic 2016        61.6          60.2          yes
#> 148                Czech Republic 2017        61.8          60.2          yes
#> 149                Czech Republic 2018        62.3          60.6          yes
#> 150                Czech Republic 2019        63.0          61.0          yes
#> 151                Czech Republic 2020        63.1          61.5          yes
#> 152                       Denmark 1970        66.6          64.6          yes
#> 153                       Denmark 1980        64.1          63.4          yes
#> 154                       Denmark 1990        64.1          61.3          yes
#> 155                       Denmark 2000        62.9          59.3          yes
#> 156                       Denmark 2005        62.5          61.4          yes
#> 157                       Denmark 2010        62.6          61.1          yes
#> 158                       Denmark 2015        62.3          60.5          yes
#> 159                       Denmark 2016        62.5          62.2          yes
#> 160                       Denmark 2017        64.0          62.2          yes
#> 161                       Denmark 2018        64.3          61.9          yes
#> 162                       Denmark 2019        64.5          63.3          yes
#> 163                       Denmark 2020        63.8          63.5          yes
#> 164                       Estonia 1970        66.2          62.2          yes
#> 165                       Estonia 1980        63.1          58.8          yes
#> 166                       Estonia 1990        64.5          59.7          yes
#> 167                       Estonia 2000        58.3          57.4          yes
#> 168                       Estonia 2005        60.8          61.5          yes
#> 169                       Estonia 2010        64.5          62.5          yes
#> 170                       Estonia 2015        61.8          62.6          yes
#> 171                       Estonia 2016        63.1          63.3          yes
#> 172                       Estonia 2017        64.1          63.7          yes
#> 173                       Estonia 2018        63.6          64.3          yes
#> 174                       Estonia 2019        63.4          65.2          yes
#> 175                       Estonia 2020        64.1          65.4          yes
#> 176 European Union (27 countries) 1970        65.5            NA           no
#> 177 European Union (27 countries) 1980        62.7            NA           no
#> 178 European Union (27 countries) 1990        61.6            NA           no
#> 179 European Union (27 countries) 2000        60.5            NA           no
#> 180 European Union (27 countries) 2005        61.0            NA           no
#> 181 European Union (27 countries) 2010        61.6            NA           no
#> 182 European Union (27 countries) 2015        62.0            NA           no
#> 183 European Union (27 countries) 2016        62.3            NA           no
#> 184 European Union (27 countries) 2017        62.6            NA           no
#> 185 European Union (27 countries) 2018        62.9            NA           no
#> 186 European Union (27 countries) 2019        63.1            NA           no
#> 187 European Union (27 countries) 2020        63.1            NA           no
#> 188                       Finland 1970        63.1          61.2          yes
#> 189                       Finland 1980        63.5          61.7          yes
#> 190                       Finland 1990        60.0          60.0          yes
#> 191                       Finland 2000        59.1          59.2          yes
#> 192                       Finland 2005        59.6          59.7          yes
#> 193                       Finland 2010        60.7          61.1          yes
#> 194                       Finland 2015        61.3          62.2          yes
#> 195                       Finland 2016        62.1          62.0          yes
#> 196                       Finland 2017        62.8          62.5          yes
#> 197                       Finland 2018        63.2          63.0          yes
#> 198                       Finland 2019        63.5          63.0          yes
#> 199                       Finland 2020        63.0          63.6          yes
#> 200                        France 1970        65.7          67.5          yes
#> 201                        France 1980        62.3          63.0          yes
#> 202                        France 1990        59.4          59.0          yes
#> 203                        France 2000        58.4          58.0          yes
#> 204                        France 2005        58.2          58.8          yes
#> 205                        France 2010        58.9          59.1          yes
#> 206                        France 2015        58.9          59.5          yes
#> 207                        France 2016        59.3          59.9          yes
#> 208                        France 2017        59.9          60.0          yes
#> 209                        France 2018        60.3          60.2          yes
#> 210                        France 2019        60.0          60.4          yes
#> 211                        France 2020        60.4          60.9          yes
#> 212                       Germany 2000        60.0          59.5          yes
#> 213                       Germany 2005        60.9          60.0          yes
#> 214                       Germany 2010        61.1          61.1          yes
#> 215                       Germany 2015        61.9          61.6          yes
#> 216                       Germany 2016        62.3          62.4          yes
#> 217                       Germany 2017        62.6          62.7          yes
#> 218                       Germany 2018        63.0          62.9          yes
#> 219                       Germany 2019        63.4          63.3          yes
#> 220                       Germany 2020        63.1          63.2          yes
#> 221                        Greece 1970        64.8          61.6          yes
#> 222                        Greece 1980        63.8          60.7          yes
#> 223                        Greece 1990        62.0          59.4          yes
#> 224                        Greece 2000        61.8          61.1          yes
#> 225                        Greece 2005        61.2          60.2          yes
#> 226                        Greece 2010        61.0          59.5          yes
#> 227                        Greece 2015        60.8          59.1          yes
#> 228                        Greece 2016        60.8          59.4          yes
#> 229                        Greece 2017        60.5          59.2          yes
#> 230                        Greece 2018        60.8          59.3          yes
#> 231                        Greece 2019        61.3          59.1          yes
#> 232                        Greece 2020        60.9          58.1          yes
#> 233                       Hungary 1970        66.4          66.0          yes
#> 234                       Hungary 1980        62.6          60.3          yes
#> 235                       Hungary 1990        60.8          57.7          yes
#> 236                       Hungary 2000        57.1          55.1          yes
#> 237                       Hungary 2005        58.0          56.6          yes
#> 238                       Hungary 2010        59.5          58.5          yes
#> 239                       Hungary 2015        62.5          59.7          yes
#> 240                       Hungary 2016        63.0          60.3          yes
#> 241                       Hungary 2017        62.6          59.8          yes
#> 242                       Hungary 2018        62.8          59.7          yes
#> 243                       Hungary 2019        62.1          59.1          yes
#> 244                       Hungary 2020        62.1          59.7          yes
#> 245                       Iceland 1970        69.4          69.5          yes
#> 246                       Iceland 1980        68.2          69.3          yes
#> 247                       Iceland 1990        69.8          69.7          yes
#> 248                       Iceland 2000        68.9          65.5          yes
#> 249                       Iceland 2005        66.5          62.5          yes
#> 250                       Iceland 2010        66.6          65.3          yes
#> 251                       Iceland 2015        68.2          67.1          yes
#> 252                       Iceland 2016        67.6          65.9          yes
#> 253                       Iceland 2017        68.4          65.2          yes
#> 254                       Iceland 2018        66.3          64.1          yes
#> 255                       Iceland 2019        66.0          64.3          yes
#> 256                       Iceland 2020        66.0          63.5          yes
#> 257                         India 1990        69.3          63.7           no
#> 258                         India 2000        68.4          68.5           no
#> 259                         India 2005        67.6          65.6           no
#> 260                         India 2010        68.7          59.1           no
#> 261                         India 2015        66.7          59.4           no
#> 262                         India 2016        66.9          59.8           no
#> 263                         India 2017        67.2          60.4           no
#> 264                         India 2018        67.0          60.2           no
#> 265                         India 2019        66.9          60.6           no
#> 266                         India 2020        67.3          67.2           no
#> 267                     Indonesia 1990        70.3          70.8           no
#> 268                     Indonesia 2000        70.5          71.0           no
#> 269                     Indonesia 2005        70.7          63.9           no
#> 270                     Indonesia 2010        68.0          71.3           no
#> 271                     Indonesia 2015        70.9          68.1           no
#> 272                     Indonesia 2016        68.6          67.3           no
#> 273                     Indonesia 2017        67.9          67.7           no
#> 274                     Indonesia 2018        67.9          67.9           no
#> 275                     Indonesia 2019        68.7          68.6           no
#> 276                     Indonesia 2020        68.7          69.2           no
#> 277                       Ireland 1970        70.4          72.3          yes
#> 278                       Ireland 1980        65.7          68.0          yes
#> 279                       Ireland 1990        62.2          62.4          yes
#> 280                       Ireland 2000        63.5          64.8          yes
#> 281                       Ireland 2005        62.4          64.3          yes
#> 282                       Ireland 2010        61.1          63.2          yes
#> 283                       Ireland 2015        64.7          62.3          yes
#> 284                       Ireland 2016        64.4          62.6          yes
#> 285                       Ireland 2017        64.1          63.2          yes
#> 286                       Ireland 2018        63.7          63.0          yes
#> 287                       Ireland 2019        64.0          63.6          yes
#> 288                       Ireland 2020        63.6          63.8          yes
#> 289                        Israel 1990        64.2          62.5          yes
#> 290                        Israel 2000        63.9          62.2          yes
#> 291                        Israel 2005        63.2          60.5          yes
#> 292                        Israel 2010        64.9          63.1          yes
#> 293                        Israel 2015        66.2          65.5          yes
#> 294                        Israel 2016        67.0          65.3          yes
#> 295                        Israel 2017        67.5          64.2          yes
#> 296                        Israel 2018        67.1          64.7          yes
#> 297                        Israel 2019        66.1          64.6          yes
#> 298                        Israel 2020        65.4          64.8          yes
#> 299                         Italy 1970        63.0          59.8          yes
#> 300                         Italy 1980        60.6          60.1          yes
#> 301                         Italy 1990        60.4          58.2          yes
#> 302                         Italy 2000        59.1          57.4          yes
#> 303                         Italy 2005        59.9          57.8          yes
#> 304                         Italy 2010        59.4          58.4          yes
#> 305                         Italy 2015        60.4          59.9          yes
#> 306                         Italy 2016        60.7          60.7          yes
#> 307                         Italy 2017        61.1          60.2          yes
#> 308                         Italy 2018        62.0          60.7          yes
#> 309                         Italy 2019        62.6          61.7          yes
#> 310                         Italy 2020        62.3          61.3          yes
#> 311                         Japan 1970        69.9          65.7          yes
#> 312                         Japan 1980        67.8          64.1          yes
#> 313                         Japan 1990        67.6          63.9          yes
#> 314                         Japan 2000        67.2          63.7          yes
#> 315                         Japan 2005        66.6          63.8          yes
#> 316                         Japan 2010        67.2          64.5          yes
#> 317                         Japan 2015        66.5          65.7          yes
#> 318                         Japan 2016        67.2          66.4          yes
#> 319                         Japan 2017        67.7          66.8          yes
#> 320                         Japan 2018        67.8          66.5          yes
#> 321                         Japan 2019        67.6          67.1          yes
#> 322                         Japan 2020        68.2          66.7          yes
#> 323                         Korea 1970        62.5          61.5          yes
#> 324                         Korea 1980        64.9          62.6          yes
#> 325                         Korea 1990        65.7          66.4          yes
#> 326                         Korea 2000        63.6          62.8          yes
#> 327                         Korea 2005        65.9          64.3          yes
#> 328                         Korea 2010        67.1          66.1          yes
#> 329                         Korea 2015        68.7          68.5          yes
#> 330                         Korea 2016        68.4          68.5          yes
#> 331                         Korea 2017        69.4          69.5          yes
#> 332                         Korea 2018        68.6          68.4          yes
#> 333                         Korea 2019        66.6          67.9          yes
#> 334                         Korea 2020        65.7          64.9          yes
#> 335                        Latvia 2000        60.1          58.2          yes
#> 336                        Latvia 2005        63.1          57.6          yes
#> 337                        Latvia 2010        63.4          62.7          yes
#> 338                        Latvia 2015        60.6          59.9          yes
#> 339                        Latvia 2016        60.8          60.1          yes
#> 340                        Latvia 2017        62.0          60.8          yes
#> 341                        Latvia 2018        64.1          63.4          yes
#> 342                        Latvia 2019        63.0          62.9          yes
#> 343                        Latvia 2020        66.3          64.5          yes
#> 344                     Lithuania 2000        60.2          57.3          yes
#> 345                     Lithuania 2005        61.9          59.6          yes
#> 346                     Lithuania 2010        61.4          59.9          yes
#> 347                     Lithuania 2015        62.2          61.6          yes
#> 348                     Lithuania 2016        61.3          60.5          yes
#> 349                     Lithuania 2017        61.7          61.6          yes
#> 350                     Lithuania 2018        62.2          62.6          yes
#> 351                     Lithuania 2019        62.6          62.7          yes
#> 352                     Lithuania 2020        63.4          63.0          yes
#> 353                    Luxembourg 1970        63.3          60.6          yes
#> 354                    Luxembourg 1980        59.6          62.2          yes
#> 355                    Luxembourg 1990        59.0          58.8          yes
#> 356                    Luxembourg 2000        58.5          59.0          yes
#> 357                    Luxembourg 2005        58.7          60.7          yes
#> 358                    Luxembourg 2010        57.4          58.2          yes
#> 359                    Luxembourg 2015        59.3          58.4          yes
#> 360                    Luxembourg 2016        60.1          59.7          yes
#> 361                    Luxembourg 2017        58.7          60.1          yes
#> 362                    Luxembourg 2018        59.5          59.8          yes
#> 363                    Luxembourg 2019        59.7          58.6          yes
#> 364                    Luxembourg 2020        59.2          60.1          yes
#> 365                         Malta 1990        60.2          60.7           no
#> 366                         Malta 2000        61.3          62.2           no
#> 367                         Malta 2005        59.0          56.6           no
#> 368                         Malta 2010        60.5          60.8           no
#> 369                         Malta 2015        60.6          62.2           no
#> 370                         Malta 2016        60.9          61.0           no
#> 371                         Malta 2017        61.6          62.6           no
#> 372                         Malta 2018        62.7          63.3           no
#> 373                         Malta 2019        61.9          64.4           no
#> 374                         Malta 2020        62.4          62.4           no
#> 375                        Mexico 1970        76.1          78.6          yes
#> 376                        Mexico 1980        74.0          74.7          yes
#> 377                        Mexico 1990        72.3          68.5          yes
#> 378                        Mexico 2000        70.4          65.7          yes
#> 379                        Mexico 2005        69.0          69.5          yes
#> 380                        Mexico 2010        66.9          65.7          yes
#> 381                        Mexico 2015        67.5          64.5          yes
#> 382                        Mexico 2016        67.4          63.7          yes
#> 383                        Mexico 2017        67.7          62.6          yes
#> 384                        Mexico 2018        67.2          63.0          yes
#> 385                        Mexico 2019        67.6          64.9          yes
#> 386                        Mexico 2020        66.2          62.5          yes
#> 387                   Netherlands 1970        65.1          65.5          yes
#> 388                   Netherlands 1980        61.8          63.2          yes
#> 389                   Netherlands 1990        58.9          58.2          yes
#> 390                   Netherlands 2000        59.5          58.2          yes
#> 391                   Netherlands 2005        60.4          60.4          yes
#> 392                   Netherlands 2010        61.9          60.1          yes
#> 393                   Netherlands 2015        62.7          60.9          yes
#> 394                   Netherlands 2016        62.5          61.5          yes
#> 395                   Netherlands 2017        62.5          62.0          yes
#> 396                   Netherlands 2018        64.0          61.8          yes
#> 397                   Netherlands 2019        64.2          62.6          yes
#> 398                   Netherlands 2020        63.9          62.8          yes
#> 399                   New Zealand 1970        67.6          67.4          yes
#> 400                   New Zealand 1980        64.6          62.4          yes
#> 401                   New Zealand 1990        61.5          60.4          yes
#> 402                   New Zealand 2000        62.9          59.1          yes
#> 403                   New Zealand 2005        64.5          62.5          yes
#> 404                   New Zealand 2010        64.2          64.6          yes
#> 405                   New Zealand 2015        65.6          65.0          yes
#> 406                   New Zealand 2016        66.5          65.2          yes
#> 407                   New Zealand 2017        68.2          65.8          yes
#> 408                   New Zealand 2018        68.3          65.3          yes
#> 409                   New Zealand 2019        67.4          65.1          yes
#> 410                   New Zealand 2020        68.2          65.8          yes
#> 411                        Norway 1970        66.6          68.1          yes
#> 412                        Norway 1980        66.6          65.8          yes
#> 413                        Norway 1990        62.4          62.1          yes
#> 414                        Norway 2000        63.5          63.7          yes
#> 415                        Norway 2005        62.7          61.4          yes
#> 416                        Norway 2010        63.0          63.1          yes
#> 417                        Norway 2015        64.0          63.6          yes
#> 418                        Norway 2016        64.8          63.4          yes
#> 419                        Norway 2017        63.9          63.1          yes
#> 420                        Norway 2018        64.7          63.3          yes
#> 421                        Norway 2019        64.9          62.7          yes
#> 422                        Norway 2020        64.9          63.1          yes
#> 423                OECD - Average 1970        66.3          64.9           no
#> 424                OECD - Average 1980        64.2          62.9           no
#> 425                OECD - Average 1990        62.7          61.1           no
#> 426                OECD - Average 2000        61.8          59.7           no
#> 427                OECD - Average 2005        62.1          60.8           no
#> 428                OECD - Average 2010        62.5          61.3           no
#> 429                OECD - Average 2015        63.2          62.0           no
#> 430                OECD - Average 2016        63.4          62.1           no
#> 431                OECD - Average 2017        63.7          62.2           no
#> 432                OECD - Average 2018        63.9          62.4           no
#> 433                OECD - Average 2019        64.0          62.7           no
#> 434                OECD - Average 2020        63.8          62.4           no
#> 435                        Poland 1970        70.2          68.8          yes
#> 436                        Poland 1980        64.7          62.2          yes
#> 437                        Poland 1990        62.9          60.4          yes
#> 438                        Poland 2000        59.6          57.5          yes
#> 439                        Poland 2005        59.7          56.8          yes
#> 440                        Poland 2010        59.6          57.8          yes
#> 441                        Poland 2015        60.6          58.4          yes
#> 442                        Poland 2016        60.8          58.7          yes
#> 443                        Poland 2017        61.0          59.0          yes
#> 444                        Poland 2018        61.4          59.7          yes
#> 445                        Poland 2019        61.9          59.6          yes
#> 446                        Poland 2020        62.2          60.1          yes
#> 447                      Portugal 1970        69.1          68.9          yes
#> 448                      Portugal 1980        65.6          65.3          yes
#> 449                      Portugal 1990        63.0          62.1          yes
#> 450                      Portugal 2000        60.7          57.9          yes
#> 451                      Portugal 2005        62.9          63.1          yes
#> 452                      Portugal 2010        63.4          62.2          yes
#> 453                      Portugal 2015        64.2          63.4          yes
#> 454                      Portugal 2016        65.7          62.7          yes
#> 455                      Portugal 2017        66.1          63.2          yes
#> 456                      Portugal 2018        65.3          63.2          yes
#> 457                      Portugal 2019        65.6          62.9          yes
#> 458                      Portugal 2020        64.9          63.3          yes
#> 459                       Romania 1970        66.0          63.4           no
#> 460                       Romania 1980        62.6          60.0           no
#> 461                       Romania 1990        60.2          57.7           no
#> 462                       Romania 2000        61.2          58.7           no
#> 463                       Romania 2005        64.6          62.4           no
#> 464                       Romania 2010        62.7          59.9           no
#> 465                       Romania 2015        63.0          61.3           no
#> 466                       Romania 2016        64.7          62.4           no
#> 467                       Romania 2017        64.8          63.5           no
#> 468                       Romania 2018        65.3          63.4           no
#> 469                       Romania 2019        66.0          63.9           no
#> 470                       Romania 2020        65.4          64.6           no
#> 471                        Russia 2000        59.7          55.7           no
#> 472                        Russia 2005        61.1          58.4           no
#> 473                        Russia 2010        62.5          59.2           no
#> 474                        Russia 2015        62.0          59.1           no
#> 475                        Russia 2016        62.3          59.4           no
#> 476                        Russia 2017        62.0          59.2           no
#> 477                        Russia 2018        62.4          59.3           no
#> 478                        Russia 2019        61.8          59.3           no
#> 479                        Russia 2020        62.0          59.8           no
#> 480                  Saudi Arabia 2000        66.3          52.2           no
#> 481                  Saudi Arabia 2005        63.9          52.3           no
#> 482                  Saudi Arabia 2010        63.1          52.8           no
#> 483                  Saudi Arabia 2015        65.7          52.0           no
#> 484                  Saudi Arabia 2016        64.6          51.8           no
#> 485                  Saudi Arabia 2017        63.7          52.0           no
#> 486                  Saudi Arabia 2018        62.9          52.7           no
#> 487                  Saudi Arabia 2019        62.8          51.1           no
#> 488                  Saudi Arabia 2020        58.9            NA           no
#> 489               Slovak Republic 1970        63.0          59.4          yes
#> 490               Slovak Republic 1980        61.8          58.8          yes
#> 491               Slovak Republic 1990        61.3          56.7          yes
#> 492               Slovak Republic 2000        58.8          55.3          yes
#> 493               Slovak Republic 2005        58.7          55.3          yes
#> 494               Slovak Republic 2010        59.5          56.4          yes
#> 495               Slovak Republic 2015        60.4          58.8          yes
#> 496               Slovak Republic 2016        60.2          59.1          yes
#> 497               Slovak Republic 2017        60.1          58.9          yes
#> 498               Slovak Republic 2018        60.6          59.6          yes
#> 499               Slovak Republic 2019        60.1          59.6          yes
#> 500               Slovak Republic 2020        60.2          59.8          yes
#> 501                      Slovenia 1970        63.2          62.5          yes
#> 502                      Slovenia 1980        61.2          59.1          yes
#> 503                      Slovenia 1990        59.7          56.7          yes
#> 504                      Slovenia 2000        58.4          54.2          yes
#> 505                      Slovenia 2005        58.9          56.3          yes
#> 506                      Slovenia 2010        59.5          56.7          yes
#> 507                      Slovenia 2015        61.2          58.8          yes
#> 508                      Slovenia 2016        60.5          59.1          yes
#> 509                      Slovenia 2017        60.8          59.1          yes
#> 510                      Slovenia 2018        61.4          58.8          yes
#> 511                      Slovenia 2019        62.9          61.4          yes
#> 512                      Slovenia 2020        61.5          60.5          yes
#> 513                  South Africa 1980        66.2          62.0           no
#> 514                  South Africa 1990        67.3          65.4           no
#> 515                  South Africa 2000        62.2          62.6           no
#> 516                  South Africa 2005        64.3          61.1           no
#> 517                  South Africa 2010        63.1          59.5           no
#> 518                  South Africa 2015        61.5          60.5           no
#> 519                  South Africa 2016        61.1          60.4           no
#> 520                  South Africa 2017        61.7          60.5           no
#> 521                  South Africa 2018        61.8          60.7           no
#> 522                  South Africa 2019        62.1          60.9           no
#> 523                  South Africa 2020        60.4          56.0           no
#> 524                         Spain 1970        67.7          66.8          yes
#> 525                         Spain 1980        63.2          65.0          yes
#> 526                         Spain 1990        62.5          64.2          yes
#> 527                         Spain 2000        60.9          60.9          yes
#> 528                         Spain 2005        60.3          62.6          yes
#> 529                         Spain 2010        61.6          62.5          yes
#> 530                         Spain 2015        61.6          62.1          yes
#> 531                         Spain 2016        61.6          61.9          yes
#> 532                         Spain 2017        61.6          60.9          yes
#> 533                         Spain 2018        61.5          60.6          yes
#> 534                         Spain 2019        61.5          61.2          yes
#> 535                         Spain 2020        61.0          60.4          yes
#> 536                        Sweden 1970        66.3          65.4          yes
#> 537                        Sweden 1980        64.2          63.4          yes
#> 538                        Sweden 1990        63.0          62.0          yes
#> 539                        Sweden 2000        62.4          61.5          yes
#> 540                        Sweden 2005        63.8          61.9          yes
#> 541                        Sweden 2010        64.5          62.7          yes
#> 542                        Sweden 2015        64.7          63.9          yes
#> 543                        Sweden 2016        64.9          64.1          yes
#> 544                        Sweden 2017        65.1          64.5          yes
#> 545                        Sweden 2018        65.6          64.6          yes
#> 546                        Sweden 2019        66.0          65.0          yes
#> 547                        Sweden 2020        65.8          64.9          yes
#> 548                   Switzerland 1970        69.3          70.5          yes
#> 549                   Switzerland 1980        67.3          64.4          yes
#> 550                   Switzerland 1990        65.3          63.8          yes
#> 551                   Switzerland 2000        63.5          61.4          yes
#> 552                   Switzerland 2005        63.2          63.6          yes
#> 553                   Switzerland 2010        63.8          62.7          yes
#> 554                   Switzerland 2015        64.3          63.3          yes
#> 555                   Switzerland 2016        64.4          63.4          yes
#> 556                   Switzerland 2017        64.1          63.5          yes
#> 557                   Switzerland 2018        64.7          63.9          yes
#> 558                   Switzerland 2019        65.4          64.0          yes
#> 559                   Switzerland 2020        65.4          64.1          yes
#> 560                       Türkiye 1970        65.8          56.1          yes
#> 561                       Türkiye 1980        65.6          64.7          yes
#> 562                       Türkiye 1990        61.3          59.6          yes
#> 563                       Türkiye 2000        58.9          58.2          yes
#> 564                       Türkiye 2005        60.5          60.0          yes
#> 565                       Türkiye 2010        58.8          60.9          yes
#> 566                       Türkiye 2015        60.9          62.3          yes
#> 567                       Türkiye 2016        61.9          62.6          yes
#> 568                       Türkiye 2017        62.1          63.2          yes
#> 569                       Türkiye 2018        61.9          62.8          yes
#> 570                       Türkiye 2019        61.5          62.6          yes
#> 571                       Türkiye 2020        60.7          59.3          yes
#> 572                United Kingdom 1970        66.3          64.5          yes
#> 573                United Kingdom 1980        65.0          61.7          yes
#> 574                United Kingdom 1990        61.8          59.8          yes
#> 575                United Kingdom 2000        61.2          60.1          yes
#> 576                United Kingdom 2005        61.8          60.7          yes
#> 577                United Kingdom 2010        62.9          61.3          yes
#> 578                United Kingdom 2015        63.0          61.8          yes
#> 579                United Kingdom 2016        63.1          62.1          yes
#> 580                United Kingdom 2017        63.2          62.2          yes
#> 581                United Kingdom 2018        63.3          62.5          yes
#> 582                United Kingdom 2019        63.4          62.8          yes
#> 583                United Kingdom 2020        63.7          63.2          yes
#> 584                 United States 1970        65.5          65.7          yes
#> 585                 United States 1980        63.8          64.1          yes
#> 586                 United States 1990        62.4          63.0          yes
#> 587                 United States 2000        62.5          62.1          yes
#> 588                 United States 2005        62.2          61.3          yes
#> 589                 United States 2010        62.9          63.4          yes
#> 590                 United States 2015        63.3          62.7          yes
#> 591                 United States 2016        64.0          63.3          yes
#> 592                 United States 2017        64.6          63.8          yes
#> 593                 United States 2018        65.0          64.3          yes
#> 594                 United States 2019        65.3          64.8          yes
#> 595                 United States 2020        64.9          64.7          yes
#>     SortOrder LocID Notes ISO3_code ISO2_code SDMX_code LocTypeID  LocTypeName
#> 1         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 2         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 3         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 4         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 5         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 6         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 7         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 8         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 9         279    32  <NA>       ARG        AR        32         4 Country/Area
#> 10        279    32  <NA>       ARG        AR        32         4 Country/Area
#> 11        301    36    33       AUS        AU        36         4 Country/Area
#> 12        301    36    33       AUS        AU        36         4 Country/Area
#> 13        301    36    33       AUS        AU        36         4 Country/Area
#> 14        301    36    33       AUS        AU        36         4 Country/Area
#> 15        301    36    33       AUS        AU        36         4 Country/Area
#> 16        301    36    33       AUS        AU        36         4 Country/Area
#> 17        301    36    33       AUS        AU        36         4 Country/Area
#> 18        301    36    33       AUS        AU        36         4 Country/Area
#> 19        301    36    33       AUS        AU        36         4 Country/Area
#> 20        301    36    33       AUS        AU        36         4 Country/Area
#> 21        301    36    33       AUS        AU        36         4 Country/Area
#> 22        301    36    33       AUS        AU        36         4 Country/Area
#> 23        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 24        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 25        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 26        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 27        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 28        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 29        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 30        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 31        229    40  <NA>       AUT        AT        40         4 Country/Area
#> 32        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 33        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 34        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 35        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 36        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 37        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 38        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 39        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 40        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 41        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 42        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 43        230    56  <NA>       BEL        BE        56         4 Country/Area
#> 44        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 45        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 46        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 47        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 48        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 49        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 50        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 51        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 52        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 53        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 54        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 55        281    76  <NA>       BRA        BR        76         4 Country/Area
#> 56        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 57        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 58        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 59        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 60        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 61        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 62        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 63        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 64        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 65        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 66        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 67        186   100  <NA>       BGR        BG       100         4 Country/Area
#> 68        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 69        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 70        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 71        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 72        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 73        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 74        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 75        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 76        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 77        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 78        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 79        295   124  <NA>       CAN        CA       124         4 Country/Area
#> 80        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 81        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 82        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 83        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 84        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 85        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 86        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 87        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 88        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 89        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 90        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 91        282   152  <NA>       CHL        CL       152         4 Country/Area
#> 92        134   156     5       CHN        CN       156         4 Country/Area
#> 93        134   156     5       CHN        CN       156         4 Country/Area
#> 94        134   156     5       CHN        CN       156         4 Country/Area
#> 95        134   156     5       CHN        CN       156         4 Country/Area
#> 96        134   156     5       CHN        CN       156         4 Country/Area
#> 97        134   156     5       CHN        CN       156         4 Country/Area
#> 98        134   156     5       CHN        CN       156         4 Country/Area
#> 99        134   156     5       CHN        CN       156         4 Country/Area
#> 100       134   156     5       CHN        CN       156         4 Country/Area
#> 101       134   156     5       CHN        CN       156         4 Country/Area
#> 102       283   170  <NA>       COL        CO       170         4 Country/Area
#> 103       283   170  <NA>       COL        CO       170         4 Country/Area
#> 104       283   170  <NA>       COL        CO       170         4 Country/Area
#> 105       283   170  <NA>       COL        CO       170         4 Country/Area
#> 106       283   170  <NA>       COL        CO       170         4 Country/Area
#> 107       283   170  <NA>       COL        CO       170         4 Country/Area
#> 108       283   170  <NA>       COL        CO       170         4 Country/Area
#> 109       283   170  <NA>       COL        CO       170         4 Country/Area
#> 110       283   170  <NA>       COL        CO       170         4 Country/Area
#> 111       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 112       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 113       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 114       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 115       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 116       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 117       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 118       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 119       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 120       271   188  <NA>       CRI        CR       188         4 Country/Area
#> 121       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 122       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 123       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 124       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 125       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 126       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 127       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 128       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 129       214   191  <NA>       HRV        HR       191         4 Country/Area
#> 130       168   196    11       CYP        CY       196         4 Country/Area
#> 131       168   196    11       CYP        CY       196         4 Country/Area
#> 132       168   196    11       CYP        CY       196         4 Country/Area
#> 133       168   196    11       CYP        CY       196         4 Country/Area
#> 134       168   196    11       CYP        CY       196         4 Country/Area
#> 135       168   196    11       CYP        CY       196         4 Country/Area
#> 136       168   196    11       CYP        CY       196         4 Country/Area
#> 137       168   196    11       CYP        CY       196         4 Country/Area
#> 138       168   196    11       CYP        CY       196         4 Country/Area
#> 139       168   196    11       CYP        CY       196         4 Country/Area
#> 140       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 141       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 142       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 143       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 144       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 145       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 146       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 147       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 148       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 149       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 150       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 151       187   203  <NA>       CZE        CZ       203         4 Country/Area
#> 152       196   208    16       DNK        DK       208         4 Country/Area
#> 153       196   208    16       DNK        DK       208         4 Country/Area
#> 154       196   208    16       DNK        DK       208         4 Country/Area
#> 155       196   208    16       DNK        DK       208         4 Country/Area
#> 156       196   208    16       DNK        DK       208         4 Country/Area
#> 157       196   208    16       DNK        DK       208         4 Country/Area
#> 158       196   208    16       DNK        DK       208         4 Country/Area
#> 159       196   208    16       DNK        DK       208         4 Country/Area
#> 160       196   208    16       DNK        DK       208         4 Country/Area
#> 161       196   208    16       DNK        DK       208         4 Country/Area
#> 162       196   208    16       DNK        DK       208         4 Country/Area
#> 163       196   208    16       DNK        DK       208         4 Country/Area
#> 164       197   233  <NA>       EST        EE       233         4 Country/Area
#> 165       197   233  <NA>       EST        EE       233         4 Country/Area
#> 166       197   233  <NA>       EST        EE       233         4 Country/Area
#> 167       197   233  <NA>       EST        EE       233         4 Country/Area
#> 168       197   233  <NA>       EST        EE       233         4 Country/Area
#> 169       197   233  <NA>       EST        EE       233         4 Country/Area
#> 170       197   233  <NA>       EST        EE       233         4 Country/Area
#> 171       197   233  <NA>       EST        EE       233         4 Country/Area
#> 172       197   233  <NA>       EST        EE       233         4 Country/Area
#> 173       197   233  <NA>       EST        EE       233         4 Country/Area
#> 174       197   233  <NA>       EST        EE       233         4 Country/Area
#> 175       197   233  <NA>       EST        EE       233         4 Country/Area
#> 176        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 177        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 178        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 179        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 180        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 181        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 182        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 183        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 184        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 185        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 186        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 187        NA  1551  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 188       199   246    18       FIN        FI       246         4 Country/Area
#> 189       199   246    18       FIN        FI       246         4 Country/Area
#> 190       199   246    18       FIN        FI       246         4 Country/Area
#> 191       199   246    18       FIN        FI       246         4 Country/Area
#> 192       199   246    18       FIN        FI       246         4 Country/Area
#> 193       199   246    18       FIN        FI       246         4 Country/Area
#> 194       199   246    18       FIN        FI       246         4 Country/Area
#> 195       199   246    18       FIN        FI       246         4 Country/Area
#> 196       199   246    18       FIN        FI       246         4 Country/Area
#> 197       199   246    18       FIN        FI       246         4 Country/Area
#> 198       199   246    18       FIN        FI       246         4 Country/Area
#> 199       199   246    18       FIN        FI       246         4 Country/Area
#> 200       231   250    26       FRA        FR       250         4 Country/Area
#> 201       231   250    26       FRA        FR       250         4 Country/Area
#> 202       231   250    26       FRA        FR       250         4 Country/Area
#> 203       231   250    26       FRA        FR       250         4 Country/Area
#> 204       231   250    26       FRA        FR       250         4 Country/Area
#> 205       231   250    26       FRA        FR       250         4 Country/Area
#> 206       231   250    26       FRA        FR       250         4 Country/Area
#> 207       231   250    26       FRA        FR       250         4 Country/Area
#> 208       231   250    26       FRA        FR       250         4 Country/Area
#> 209       231   250    26       FRA        FR       250         4 Country/Area
#> 210       231   250    26       FRA        FR       250         4 Country/Area
#> 211       231   250    26       FRA        FR       250         4 Country/Area
#> 212       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 213       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 214       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 215       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 216       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 217       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 218       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 219       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 220       232   276  <NA>       DEU        DE       276         4 Country/Area
#> 221       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 222       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 223       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 224       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 225       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 226       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 227       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 228       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 229       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 230       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 231       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 232       216   300  <NA>       GRC        GR       300         4 Country/Area
#> 233       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 234       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 235       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 236       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 237       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 238       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 239       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 240       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 241       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 242       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 243       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 244       188   348  <NA>       HUN        HU       348         4 Country/Area
#> 245       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 246       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 247       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 248       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 249       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 250       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 251       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 252       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 253       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 254       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 255       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 256       201   352  <NA>       ISL        IS       352         4 Country/Area
#> 257       146   356  <NA>       IND        IN       356         4 Country/Area
#> 258       146   356  <NA>       IND        IN       356         4 Country/Area
#> 259       146   356  <NA>       IND        IN       356         4 Country/Area
#> 260       146   356  <NA>       IND        IN       356         4 Country/Area
#> 261       146   356  <NA>       IND        IN       356         4 Country/Area
#> 262       146   356  <NA>       IND        IN       356         4 Country/Area
#> 263       146   356  <NA>       IND        IN       356         4 Country/Area
#> 264       146   356  <NA>       IND        IN       356         4 Country/Area
#> 265       146   356  <NA>       IND        IN       356         4 Country/Area
#> 266       146   356  <NA>       IND        IN       356         4 Country/Area
#> 267       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 268       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 269       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 270       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 271       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 272       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 273       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 274       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 275       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 276       155   360  <NA>       IDN        ID       360         4 Country/Area
#> 277       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 278       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 279       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 280       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 281       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 282       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 283       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 284       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 285       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 286       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 287       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 288       202   372  <NA>       IRL        IE       372         4 Country/Area
#> 289       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 290       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 291       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 292       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 293       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 294       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 295       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 296       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 297       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 298       171   376  <NA>       ISR        IL       376         4 Country/Area
#> 299       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 300       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 301       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 302       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 303       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 304       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 305       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 306       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 307       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 308       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 309       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 310       218   380  <NA>       ITA        IT       380         4 Country/Area
#> 311       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 312       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 313       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 314       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 315       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 316       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 317       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 318       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 319       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 320       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 321       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 322       139   392  <NA>       JPN        JP       392         4 Country/Area
#> 323       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 324       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 325       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 326       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 327       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 328       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 329       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 330       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 331       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 332       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 333       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 334       141   410  <NA>       KOR        KR       410         4 Country/Area
#> 335       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 336       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 337       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 338       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 339       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 340       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 341       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 342       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 343       205   428  <NA>       LVA        LV       428         4 Country/Area
#> 344       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 345       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 346       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 347       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 348       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 349       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 350       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 351       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 352       206   440  <NA>       LTU        LT       440         4 Country/Area
#> 353       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 354       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 355       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 356       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 357       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 358       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 359       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 360       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 361       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 362       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 363       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 364       234   442  <NA>       LUX        LU       442         4 Country/Area
#> 365       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 366       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 367       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 368       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 369       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 370       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 371       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 372       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 373       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 374       220   470  <NA>       MLT        MT       470         4 Country/Area
#> 375       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 376       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 377       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 378       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 379       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 380       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 381       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 382       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 383       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 384       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 385       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 386       275   484  <NA>       MEX        MX       484         4 Country/Area
#> 387       236   528    27       NLD        NL       528         4 Country/Area
#> 388       236   528    27       NLD        NL       528         4 Country/Area
#> 389       236   528    27       NLD        NL       528         4 Country/Area
#> 390       236   528    27       NLD        NL       528         4 Country/Area
#> 391       236   528    27       NLD        NL       528         4 Country/Area
#> 392       236   528    27       NLD        NL       528         4 Country/Area
#> 393       236   528    27       NLD        NL       528         4 Country/Area
#> 394       236   528    27       NLD        NL       528         4 Country/Area
#> 395       236   528    27       NLD        NL       528         4 Country/Area
#> 396       236   528    27       NLD        NL       528         4 Country/Area
#> 397       236   528    27       NLD        NL       528         4 Country/Area
#> 398       236   528    27       NLD        NL       528         4 Country/Area
#> 399       302   554    34       NZL        NZ       554         4 Country/Area
#> 400       302   554    34       NZL        NZ       554         4 Country/Area
#> 401       302   554    34       NZL        NZ       554         4 Country/Area
#> 402       302   554    34       NZL        NZ       554         4 Country/Area
#> 403       302   554    34       NZL        NZ       554         4 Country/Area
#> 404       302   554    34       NZL        NZ       554         4 Country/Area
#> 405       302   554    34       NZL        NZ       554         4 Country/Area
#> 406       302   554    34       NZL        NZ       554         4 Country/Area
#> 407       302   554    34       NZL        NZ       554         4 Country/Area
#> 408       302   554    34       NZL        NZ       554         4 Country/Area
#> 409       302   554    34       NZL        NZ       554         4 Country/Area
#> 410       302   554    34       NZL        NZ       554         4 Country/Area
#> 411       207   578    20       NOR        NO       578         4 Country/Area
#> 412       207   578    20       NOR        NO       578         4 Country/Area
#> 413       207   578    20       NOR        NO       578         4 Country/Area
#> 414       207   578    20       NOR        NO       578         4 Country/Area
#> 415       207   578    20       NOR        NO       578         4 Country/Area
#> 416       207   578    20       NOR        NO       578         4 Country/Area
#> 417       207   578    20       NOR        NO       578         4 Country/Area
#> 418       207   578    20       NOR        NO       578         4 Country/Area
#> 419       207   578    20       NOR        NO       578         4 Country/Area
#> 420       207   578    20       NOR        NO       578         4 Country/Area
#> 421       207   578    20       NOR        NO       578         4 Country/Area
#> 422       207   578    20       NOR        NO       578         4 Country/Area
#> 423        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 424        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 425        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 426        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 427        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 428        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 429        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 430        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 431        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 432        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 433        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 434        NA  1505  <NA>      <NA>      <NA>        NA        NA         <NA>
#> 435       189   616  <NA>       POL        PL       616         4 Country/Area
#> 436       189   616  <NA>       POL        PL       616         4 Country/Area
#> 437       189   616  <NA>       POL        PL       616         4 Country/Area
#> 438       189   616  <NA>       POL        PL       616         4 Country/Area
#> 439       189   616  <NA>       POL        PL       616         4 Country/Area
#> 440       189   616  <NA>       POL        PL       616         4 Country/Area
#> 441       189   616  <NA>       POL        PL       616         4 Country/Area
#> 442       189   616  <NA>       POL        PL       616         4 Country/Area
#> 443       189   616  <NA>       POL        PL       616         4 Country/Area
#> 444       189   616  <NA>       POL        PL       616         4 Country/Area
#> 445       189   616  <NA>       POL        PL       616         4 Country/Area
#> 446       189   616  <NA>       POL        PL       616         4 Country/Area
#> 447       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 448       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 449       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 450       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 451       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 452       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 453       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 454       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 455       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 456       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 457       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 458       223   620  <NA>       PRT        PT       620         4 Country/Area
#> 459       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 460       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 461       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 462       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 463       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 464       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 465       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 466       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 467       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 468       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 469       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 470       191   642  <NA>       ROU        RO       642         4 Country/Area
#> 471       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 472       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 473       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 474       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 475       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 476       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 477       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 478       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 479       192   643  <NA>       RUS        RU       643         4 Country/Area
#> 480       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 481       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 482       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 483       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 484       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 485       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 486       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 487       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 488       177   682  <NA>       SAU        SA       682         4 Country/Area
#> 489       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 490       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 491       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 492       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 493       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 494       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 495       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 496       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 497       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 498       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 499       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 500       193   703  <NA>       SVK        SK       703         4 Country/Area
#> 501       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 502       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 503       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 504       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 505       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 506       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 507       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 508       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 509       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 510       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 511       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 512       226   705  <NA>       SVN        SI       705         4 Country/Area
#> 513       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 514       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 515       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 516       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 517       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 518       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 519       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 520       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 521       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 522       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 523       107   710  <NA>       ZAF        ZA       710         4 Country/Area
#> 524       227   724    25       ESP        ES       724         4 Country/Area
#> 525       227   724    25       ESP        ES       724         4 Country/Area
#> 526       227   724    25       ESP        ES       724         4 Country/Area
#> 527       227   724    25       ESP        ES       724         4 Country/Area
#> 528       227   724    25       ESP        ES       724         4 Country/Area
#> 529       227   724    25       ESP        ES       724         4 Country/Area
#> 530       227   724    25       ESP        ES       724         4 Country/Area
#> 531       227   724    25       ESP        ES       724         4 Country/Area
#> 532       227   724    25       ESP        ES       724         4 Country/Area
#> 533       227   724    25       ESP        ES       724         4 Country/Area
#> 534       227   724    25       ESP        ES       724         4 Country/Area
#> 535       227   724    25       ESP        ES       724         4 Country/Area
#> 536       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 537       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 538       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 539       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 540       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 541       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 542       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 543       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 544       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 545       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 546       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 547       208   752  <NA>       SWE        SE       752         4 Country/Area
#> 548       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 549       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 550       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 551       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 552       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 553       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 554       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 555       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 556       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 557       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 558       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 559       237   756  <NA>       CHE        CH       756         4 Country/Area
#> 560       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 561       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 562       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 563       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 564       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 565       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 566       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 567       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 568       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 569       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 570       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 571       180   792  <NA>       TUR        TR       792         4 Country/Area
#> 572       209   826    21       GBR        GB       826         4 Country/Area
#> 573       209   826    21       GBR        GB       826         4 Country/Area
#> 574       209   826    21       GBR        GB       826         4 Country/Area
#> 575       209   826    21       GBR        GB       826         4 Country/Area
#> 576       209   826    21       GBR        GB       826         4 Country/Area
#> 577       209   826    21       GBR        GB       826         4 Country/Area
#> 578       209   826    21       GBR        GB       826         4 Country/Area
#> 579       209   826    21       GBR        GB       826         4 Country/Area
#> 580       209   826    21       GBR        GB       826         4 Country/Area
#> 581       209   826    21       GBR        GB       826         4 Country/Area
#> 582       209   826    21       GBR        GB       826         4 Country/Area
#> 583       209   826    21       GBR        GB       826         4 Country/Area
#> 584       298   840    32       USA        US       840         4 Country/Area
#> 585       298   840    32       USA        US       840         4 Country/Area
#> 586       298   840    32       USA        US       840         4 Country/Area
#> 587       298   840    32       USA        US       840         4 Country/Area
#> 588       298   840    32       USA        US       840         4 Country/Area
#> 589       298   840    32       USA        US       840         4 Country/Area
#> 590       298   840    32       USA        US       840         4 Country/Area
#> 591       298   840    32       USA        US       840         4 Country/Area
#> 592       298   840    32       USA        US       840         4 Country/Area
#> 593       298   840    32       USA        US       840         4 Country/Area
#> 594       298   840    32       USA        US       840         4 Country/Area
#> 595       298   840    32       USA        US       840         4 Country/Area
#>     ParentID                                                      Location
#> 1        931                                                     Argentina
#> 2        931                                                     Argentina
#> 3        931                                                     Argentina
#> 4        931                                                     Argentina
#> 5        931                                                     Argentina
#> 6        931                                                     Argentina
#> 7        931                                                     Argentina
#> 8        931                                                     Argentina
#> 9        931                                                     Argentina
#> 10       931                                                     Argentina
#> 11       927                                                     Australia
#> 12       927                                                     Australia
#> 13       927                                                     Australia
#> 14       927                                                     Australia
#> 15       927                                                     Australia
#> 16       927                                                     Australia
#> 17       927                                                     Australia
#> 18       927                                                     Australia
#> 19       927                                                     Australia
#> 20       927                                                     Australia
#> 21       927                                                     Australia
#> 22       927                                                     Australia
#> 23       926                                                       Austria
#> 24       926                                                       Austria
#> 25       926                                                       Austria
#> 26       926                                                       Austria
#> 27       926                                                       Austria
#> 28       926                                                       Austria
#> 29       926                                                       Austria
#> 30       926                                                       Austria
#> 31       926                                                       Austria
#> 32       926                                                       Belgium
#> 33       926                                                       Belgium
#> 34       926                                                       Belgium
#> 35       926                                                       Belgium
#> 36       926                                                       Belgium
#> 37       926                                                       Belgium
#> 38       926                                                       Belgium
#> 39       926                                                       Belgium
#> 40       926                                                       Belgium
#> 41       926                                                       Belgium
#> 42       926                                                       Belgium
#> 43       926                                                       Belgium
#> 44       931                                                        Brazil
#> 45       931                                                        Brazil
#> 46       931                                                        Brazil
#> 47       931                                                        Brazil
#> 48       931                                                        Brazil
#> 49       931                                                        Brazil
#> 50       931                                                        Brazil
#> 51       931                                                        Brazil
#> 52       931                                                        Brazil
#> 53       931                                                        Brazil
#> 54       931                                                        Brazil
#> 55       931                                                        Brazil
#> 56       923                                                      Bulgaria
#> 57       923                                                      Bulgaria
#> 58       923                                                      Bulgaria
#> 59       923                                                      Bulgaria
#> 60       923                                                      Bulgaria
#> 61       923                                                      Bulgaria
#> 62       923                                                      Bulgaria
#> 63       923                                                      Bulgaria
#> 64       923                                                      Bulgaria
#> 65       923                                                      Bulgaria
#> 66       923                                                      Bulgaria
#> 67       923                                                      Bulgaria
#> 68       918                                                        Canada
#> 69       918                                                        Canada
#> 70       918                                                        Canada
#> 71       918                                                        Canada
#> 72       918                                                        Canada
#> 73       918                                                        Canada
#> 74       918                                                        Canada
#> 75       918                                                        Canada
#> 76       918                                                        Canada
#> 77       918                                                        Canada
#> 78       918                                                        Canada
#> 79       918                                                        Canada
#> 80       931                                                         Chile
#> 81       931                                                         Chile
#> 82       931                                                         Chile
#> 83       931                                                         Chile
#> 84       931                                                         Chile
#> 85       931                                                         Chile
#> 86       931                                                         Chile
#> 87       931                                                         Chile
#> 88       931                                                         Chile
#> 89       931                                                         Chile
#> 90       931                                                         Chile
#> 91       931                                                         Chile
#> 92       906                                                         China
#> 93       906                                                         China
#> 94       906                                                         China
#> 95       906                                                         China
#> 96       906                                                         China
#> 97       906                                                         China
#> 98       906                                                         China
#> 99       906                                                         China
#> 100      906                                                         China
#> 101      906                                                         China
#> 102      931                                                      Colombia
#> 103      931                                                      Colombia
#> 104      931                                                      Colombia
#> 105      931                                                      Colombia
#> 106      931                                                      Colombia
#> 107      931                                                      Colombia
#> 108      931                                                      Colombia
#> 109      931                                                      Colombia
#> 110      931                                                      Colombia
#> 111      916                                                    Costa Rica
#> 112      916                                                    Costa Rica
#> 113      916                                                    Costa Rica
#> 114      916                                                    Costa Rica
#> 115      916                                                    Costa Rica
#> 116      916                                                    Costa Rica
#> 117      916                                                    Costa Rica
#> 118      916                                                    Costa Rica
#> 119      916                                                    Costa Rica
#> 120      916                                                    Costa Rica
#> 121      925                                                       Croatia
#> 122      925                                                       Croatia
#> 123      925                                                       Croatia
#> 124      925                                                       Croatia
#> 125      925                                                       Croatia
#> 126      925                                                       Croatia
#> 127      925                                                       Croatia
#> 128      925                                                       Croatia
#> 129      925                                                       Croatia
#> 130      922                                                        Cyprus
#> 131      922                                                        Cyprus
#> 132      922                                                        Cyprus
#> 133      922                                                        Cyprus
#> 134      922                                                        Cyprus
#> 135      922                                                        Cyprus
#> 136      922                                                        Cyprus
#> 137      922                                                        Cyprus
#> 138      922                                                        Cyprus
#> 139      922                                                        Cyprus
#> 140      923                                                       Czechia
#> 141      923                                                       Czechia
#> 142      923                                                       Czechia
#> 143      923                                                       Czechia
#> 144      923                                                       Czechia
#> 145      923                                                       Czechia
#> 146      923                                                       Czechia
#> 147      923                                                       Czechia
#> 148      923                                                       Czechia
#> 149      923                                                       Czechia
#> 150      923                                                       Czechia
#> 151      923                                                       Czechia
#> 152      924                                                       Denmark
#> 153      924                                                       Denmark
#> 154      924                                                       Denmark
#> 155      924                                                       Denmark
#> 156      924                                                       Denmark
#> 157      924                                                       Denmark
#> 158      924                                                       Denmark
#> 159      924                                                       Denmark
#> 160      924                                                       Denmark
#> 161      924                                                       Denmark
#> 162      924                                                       Denmark
#> 163      924                                                       Denmark
#> 164      924                                                       Estonia
#> 165      924                                                       Estonia
#> 166      924                                                       Estonia
#> 167      924                                                       Estonia
#> 168      924                                                       Estonia
#> 169      924                                                       Estonia
#> 170      924                                                       Estonia
#> 171      924                                                       Estonia
#> 172      924                                                       Estonia
#> 173      924                                                       Estonia
#> 174      924                                                       Estonia
#> 175      924                                                       Estonia
#> 176       NA                                       European Union (EU: 27)
#> 177       NA                                       European Union (EU: 27)
#> 178       NA                                       European Union (EU: 27)
#> 179       NA                                       European Union (EU: 27)
#> 180       NA                                       European Union (EU: 27)
#> 181       NA                                       European Union (EU: 27)
#> 182       NA                                       European Union (EU: 27)
#> 183       NA                                       European Union (EU: 27)
#> 184       NA                                       European Union (EU: 27)
#> 185       NA                                       European Union (EU: 27)
#> 186       NA                                       European Union (EU: 27)
#> 187       NA                                       European Union (EU: 27)
#> 188      924                                                       Finland
#> 189      924                                                       Finland
#> 190      924                                                       Finland
#> 191      924                                                       Finland
#> 192      924                                                       Finland
#> 193      924                                                       Finland
#> 194      924                                                       Finland
#> 195      924                                                       Finland
#> 196      924                                                       Finland
#> 197      924                                                       Finland
#> 198      924                                                       Finland
#> 199      924                                                       Finland
#> 200      926                                                        France
#> 201      926                                                        France
#> 202      926                                                        France
#> 203      926                                                        France
#> 204      926                                                        France
#> 205      926                                                        France
#> 206      926                                                        France
#> 207      926                                                        France
#> 208      926                                                        France
#> 209      926                                                        France
#> 210      926                                                        France
#> 211      926                                                        France
#> 212      926                                                       Germany
#> 213      926                                                       Germany
#> 214      926                                                       Germany
#> 215      926                                                       Germany
#> 216      926                                                       Germany
#> 217      926                                                       Germany
#> 218      926                                                       Germany
#> 219      926                                                       Germany
#> 220      926                                                       Germany
#> 221      925                                                        Greece
#> 222      925                                                        Greece
#> 223      925                                                        Greece
#> 224      925                                                        Greece
#> 225      925                                                        Greece
#> 226      925                                                        Greece
#> 227      925                                                        Greece
#> 228      925                                                        Greece
#> 229      925                                                        Greece
#> 230      925                                                        Greece
#> 231      925                                                        Greece
#> 232      925                                                        Greece
#> 233      923                                                       Hungary
#> 234      923                                                       Hungary
#> 235      923                                                       Hungary
#> 236      923                                                       Hungary
#> 237      923                                                       Hungary
#> 238      923                                                       Hungary
#> 239      923                                                       Hungary
#> 240      923                                                       Hungary
#> 241      923                                                       Hungary
#> 242      923                                                       Hungary
#> 243      923                                                       Hungary
#> 244      923                                                       Hungary
#> 245      924                                                       Iceland
#> 246      924                                                       Iceland
#> 247      924                                                       Iceland
#> 248      924                                                       Iceland
#> 249      924                                                       Iceland
#> 250      924                                                       Iceland
#> 251      924                                                       Iceland
#> 252      924                                                       Iceland
#> 253      924                                                       Iceland
#> 254      924                                                       Iceland
#> 255      924                                                       Iceland
#> 256      924                                                       Iceland
#> 257     5501                                                         India
#> 258     5501                                                         India
#> 259     5501                                                         India
#> 260     5501                                                         India
#> 261     5501                                                         India
#> 262     5501                                                         India
#> 263     5501                                                         India
#> 264     5501                                                         India
#> 265     5501                                                         India
#> 266     5501                                                         India
#> 267      920                                                     Indonesia
#> 268      920                                                     Indonesia
#> 269      920                                                     Indonesia
#> 270      920                                                     Indonesia
#> 271      920                                                     Indonesia
#> 272      920                                                     Indonesia
#> 273      920                                                     Indonesia
#> 274      920                                                     Indonesia
#> 275      920                                                     Indonesia
#> 276      920                                                     Indonesia
#> 277      924                                                       Ireland
#> 278      924                                                       Ireland
#> 279      924                                                       Ireland
#> 280      924                                                       Ireland
#> 281      924                                                       Ireland
#> 282      924                                                       Ireland
#> 283      924                                                       Ireland
#> 284      924                                                       Ireland
#> 285      924                                                       Ireland
#> 286      924                                                       Ireland
#> 287      924                                                       Ireland
#> 288      924                                                       Ireland
#> 289      922                                                        Israel
#> 290      922                                                        Israel
#> 291      922                                                        Israel
#> 292      922                                                        Israel
#> 293      922                                                        Israel
#> 294      922                                                        Israel
#> 295      922                                                        Israel
#> 296      922                                                        Israel
#> 297      922                                                        Israel
#> 298      922                                                        Israel
#> 299      925                                                         Italy
#> 300      925                                                         Italy
#> 301      925                                                         Italy
#> 302      925                                                         Italy
#> 303      925                                                         Italy
#> 304      925                                                         Italy
#> 305      925                                                         Italy
#> 306      925                                                         Italy
#> 307      925                                                         Italy
#> 308      925                                                         Italy
#> 309      925                                                         Italy
#> 310      925                                                         Italy
#> 311      906                                                         Japan
#> 312      906                                                         Japan
#> 313      906                                                         Japan
#> 314      906                                                         Japan
#> 315      906                                                         Japan
#> 316      906                                                         Japan
#> 317      906                                                         Japan
#> 318      906                                                         Japan
#> 319      906                                                         Japan
#> 320      906                                                         Japan
#> 321      906                                                         Japan
#> 322      906                                                         Japan
#> 323      906                                             Republic of Korea
#> 324      906                                             Republic of Korea
#> 325      906                                             Republic of Korea
#> 326      906                                             Republic of Korea
#> 327      906                                             Republic of Korea
#> 328      906                                             Republic of Korea
#> 329      906                                             Republic of Korea
#> 330      906                                             Republic of Korea
#> 331      906                                             Republic of Korea
#> 332      906                                             Republic of Korea
#> 333      906                                             Republic of Korea
#> 334      906                                             Republic of Korea
#> 335      924                                                        Latvia
#> 336      924                                                        Latvia
#> 337      924                                                        Latvia
#> 338      924                                                        Latvia
#> 339      924                                                        Latvia
#> 340      924                                                        Latvia
#> 341      924                                                        Latvia
#> 342      924                                                        Latvia
#> 343      924                                                        Latvia
#> 344      924                                                     Lithuania
#> 345      924                                                     Lithuania
#> 346      924                                                     Lithuania
#> 347      924                                                     Lithuania
#> 348      924                                                     Lithuania
#> 349      924                                                     Lithuania
#> 350      924                                                     Lithuania
#> 351      924                                                     Lithuania
#> 352      924                                                     Lithuania
#> 353      926                                                    Luxembourg
#> 354      926                                                    Luxembourg
#> 355      926                                                    Luxembourg
#> 356      926                                                    Luxembourg
#> 357      926                                                    Luxembourg
#> 358      926                                                    Luxembourg
#> 359      926                                                    Luxembourg
#> 360      926                                                    Luxembourg
#> 361      926                                                    Luxembourg
#> 362      926                                                    Luxembourg
#> 363      926                                                    Luxembourg
#> 364      926                                                    Luxembourg
#> 365      925                                                         Malta
#> 366      925                                                         Malta
#> 367      925                                                         Malta
#> 368      925                                                         Malta
#> 369      925                                                         Malta
#> 370      925                                                         Malta
#> 371      925                                                         Malta
#> 372      925                                                         Malta
#> 373      925                                                         Malta
#> 374      925                                                         Malta
#> 375      916                                                        Mexico
#> 376      916                                                        Mexico
#> 377      916                                                        Mexico
#> 378      916                                                        Mexico
#> 379      916                                                        Mexico
#> 380      916                                                        Mexico
#> 381      916                                                        Mexico
#> 382      916                                                        Mexico
#> 383      916                                                        Mexico
#> 384      916                                                        Mexico
#> 385      916                                                        Mexico
#> 386      916                                                        Mexico
#> 387      926                                                   Netherlands
#> 388      926                                                   Netherlands
#> 389      926                                                   Netherlands
#> 390      926                                                   Netherlands
#> 391      926                                                   Netherlands
#> 392      926                                                   Netherlands
#> 393      926                                                   Netherlands
#> 394      926                                                   Netherlands
#> 395      926                                                   Netherlands
#> 396      926                                                   Netherlands
#> 397      926                                                   Netherlands
#> 398      926                                                   Netherlands
#> 399      927                                                   New Zealand
#> 400      927                                                   New Zealand
#> 401      927                                                   New Zealand
#> 402      927                                                   New Zealand
#> 403      927                                                   New Zealand
#> 404      927                                                   New Zealand
#> 405      927                                                   New Zealand
#> 406      927                                                   New Zealand
#> 407      927                                                   New Zealand
#> 408      927                                                   New Zealand
#> 409      927                                                   New Zealand
#> 410      927                                                   New Zealand
#> 411      924                                                        Norway
#> 412      924                                                        Norway
#> 413      924                                                        Norway
#> 414      924                                                        Norway
#> 415      924                                                        Norway
#> 416      924                                                        Norway
#> 417      924                                                        Norway
#> 418      924                                                        Norway
#> 419      924                                                        Norway
#> 420      924                                                        Norway
#> 421      924                                                        Norway
#> 422      924                                                        Norway
#> 423       NA Organisation for Economic Co-operation and Development (OECD)
#> 424       NA Organisation for Economic Co-operation and Development (OECD)
#> 425       NA Organisation for Economic Co-operation and Development (OECD)
#> 426       NA Organisation for Economic Co-operation and Development (OECD)
#> 427       NA Organisation for Economic Co-operation and Development (OECD)
#> 428       NA Organisation for Economic Co-operation and Development (OECD)
#> 429       NA Organisation for Economic Co-operation and Development (OECD)
#> 430       NA Organisation for Economic Co-operation and Development (OECD)
#> 431       NA Organisation for Economic Co-operation and Development (OECD)
#> 432       NA Organisation for Economic Co-operation and Development (OECD)
#> 433       NA Organisation for Economic Co-operation and Development (OECD)
#> 434       NA Organisation for Economic Co-operation and Development (OECD)
#> 435      923                                                        Poland
#> 436      923                                                        Poland
#> 437      923                                                        Poland
#> 438      923                                                        Poland
#> 439      923                                                        Poland
#> 440      923                                                        Poland
#> 441      923                                                        Poland
#> 442      923                                                        Poland
#> 443      923                                                        Poland
#> 444      923                                                        Poland
#> 445      923                                                        Poland
#> 446      923                                                        Poland
#> 447      925                                                      Portugal
#> 448      925                                                      Portugal
#> 449      925                                                      Portugal
#> 450      925                                                      Portugal
#> 451      925                                                      Portugal
#> 452      925                                                      Portugal
#> 453      925                                                      Portugal
#> 454      925                                                      Portugal
#> 455      925                                                      Portugal
#> 456      925                                                      Portugal
#> 457      925                                                      Portugal
#> 458      925                                                      Portugal
#> 459      923                                                       Romania
#> 460      923                                                       Romania
#> 461      923                                                       Romania
#> 462      923                                                       Romania
#> 463      923                                                       Romania
#> 464      923                                                       Romania
#> 465      923                                                       Romania
#> 466      923                                                       Romania
#> 467      923                                                       Romania
#> 468      923                                                       Romania
#> 469      923                                                       Romania
#> 470      923                                                       Romania
#> 471      923                                            Russian Federation
#> 472      923                                            Russian Federation
#> 473      923                                            Russian Federation
#> 474      923                                            Russian Federation
#> 475      923                                            Russian Federation
#> 476      923                                            Russian Federation
#> 477      923                                            Russian Federation
#> 478      923                                            Russian Federation
#> 479      923                                            Russian Federation
#> 480      922                                                  Saudi Arabia
#> 481      922                                                  Saudi Arabia
#> 482      922                                                  Saudi Arabia
#> 483      922                                                  Saudi Arabia
#> 484      922                                                  Saudi Arabia
#> 485      922                                                  Saudi Arabia
#> 486      922                                                  Saudi Arabia
#> 487      922                                                  Saudi Arabia
#> 488      922                                                  Saudi Arabia
#> 489      923                                                      Slovakia
#> 490      923                                                      Slovakia
#> 491      923                                                      Slovakia
#> 492      923                                                      Slovakia
#> 493      923                                                      Slovakia
#> 494      923                                                      Slovakia
#> 495      923                                                      Slovakia
#> 496      923                                                      Slovakia
#> 497      923                                                      Slovakia
#> 498      923                                                      Slovakia
#> 499      923                                                      Slovakia
#> 500      923                                                      Slovakia
#> 501      925                                                      Slovenia
#> 502      925                                                      Slovenia
#> 503      925                                                      Slovenia
#> 504      925                                                      Slovenia
#> 505      925                                                      Slovenia
#> 506      925                                                      Slovenia
#> 507      925                                                      Slovenia
#> 508      925                                                      Slovenia
#> 509      925                                                      Slovenia
#> 510      925                                                      Slovenia
#> 511      925                                                      Slovenia
#> 512      925                                                      Slovenia
#> 513      913                                                  South Africa
#> 514      913                                                  South Africa
#> 515      913                                                  South Africa
#> 516      913                                                  South Africa
#> 517      913                                                  South Africa
#> 518      913                                                  South Africa
#> 519      913                                                  South Africa
#> 520      913                                                  South Africa
#> 521      913                                                  South Africa
#> 522      913                                                  South Africa
#> 523      913                                                  South Africa
#> 524      925                                                         Spain
#> 525      925                                                         Spain
#> 526      925                                                         Spain
#> 527      925                                                         Spain
#> 528      925                                                         Spain
#> 529      925                                                         Spain
#> 530      925                                                         Spain
#> 531      925                                                         Spain
#> 532      925                                                         Spain
#> 533      925                                                         Spain
#> 534      925                                                         Spain
#> 535      925                                                         Spain
#> 536      924                                                        Sweden
#> 537      924                                                        Sweden
#> 538      924                                                        Sweden
#> 539      924                                                        Sweden
#> 540      924                                                        Sweden
#> 541      924                                                        Sweden
#> 542      924                                                        Sweden
#> 543      924                                                        Sweden
#> 544      924                                                        Sweden
#> 545      924                                                        Sweden
#> 546      924                                                        Sweden
#> 547      924                                                        Sweden
#> 548      926                                                   Switzerland
#> 549      926                                                   Switzerland
#> 550      926                                                   Switzerland
#> 551      926                                                   Switzerland
#> 552      926                                                   Switzerland
#> 553      926                                                   Switzerland
#> 554      926                                                   Switzerland
#> 555      926                                                   Switzerland
#> 556      926                                                   Switzerland
#> 557      926                                                   Switzerland
#> 558      926                                                   Switzerland
#> 559      926                                                   Switzerland
#> 560      922                                                       Türkiye
#> 561      922                                                       Türkiye
#> 562      922                                                       Türkiye
#> 563      922                                                       Türkiye
#> 564      922                                                       Türkiye
#> 565      922                                                       Türkiye
#> 566      922                                                       Türkiye
#> 567      922                                                       Türkiye
#> 568      922                                                       Türkiye
#> 569      922                                                       Türkiye
#> 570      922                                                       Türkiye
#> 571      922                                                       Türkiye
#> 572      924                                                United Kingdom
#> 573      924                                                United Kingdom
#> 574      924                                                United Kingdom
#> 575      924                                                United Kingdom
#> 576      924                                                United Kingdom
#> 577      924                                                United Kingdom
#> 578      924                                                United Kingdom
#> 579      924                                                United Kingdom
#> 580      924                                                United Kingdom
#> 581      924                                                United Kingdom
#> 582      924                                                United Kingdom
#> 583      924                                                United Kingdom
#> 584      918                                      United States of America
#> 585      918                                      United States of America
#> 586      918                                      United States of America
#> 587      918                                      United States of America
#> 588      918                                      United States of America
#> 589      918                                      United States of America
#> 590      918                                      United States of America
#> 591      918                                      United States of America
#> 592      918                                      United States of America
#> 593      918                                      United States of America
#> 594      918                                      United States of America
#> 595      918                                      United States of America
#>     VarID Variant Time TPopulation1Jan TPopulation1July TPopulationMale1July
#> 1       2  Medium 1990       32514.716        32755.901            16124.939
#> 2       2  Medium 2000       37006.579        37213.984            18343.798
#> 3       2  Medium 2005       39013.703        39216.790            19341.994
#> 4       2  Medium 2010       41070.538        41288.694            20404.978
#> 5       2  Medium 2015       43252.203        43477.012            21537.702
#> 6       2  Medium 2016       43701.821        43900.313            21752.905
#> 7       2  Medium 2017       44098.806        44288.894            21953.153
#> 8       2  Medium 2018       44478.982        44654.882            22142.786
#> 9       2  Medium 2019       44830.781        44973.466            22307.714
#> 10      2  Medium 2020       45116.150        45191.965            22419.484
#> 11      2  Medium 1970       12398.569        12599.411             6336.953
#> 12      2  Medium 1980       14617.623        14721.347             7352.071
#> 13      2  Medium 1990       17004.135        17126.298             8542.423
#> 14      2  Medium 2000       19016.729        19132.471             9496.308
#> 15      2  Medium 2005       20162.502        20294.490            10078.354
#> 16      2  Medium 2010       21979.301        22141.580            11023.077
#> 17      2  Medium 2015       23768.258        23948.002            11892.488
#> 18      2  Medium 2016       24127.746        24329.963            12074.040
#> 19      2  Medium 2017       24532.180        24731.038            12270.986
#> 20      2  Medium 2018       24929.897        25119.706            12465.560
#> 21      2  Medium 2019       25309.514        25482.714            12645.913
#> 22      2  Medium 2020       25655.914        25743.791            12773.754
#> 23      2  Medium 2000        8003.663         8012.928             3875.271
#> 24      2  Medium 2005        8202.779         8229.204             4000.088
#> 25      2  Medium 2010        8353.363         8365.092             4073.188
#> 26      2  Medium 2015        8586.304         8644.038             4237.048
#> 27      2  Medium 2016        8701.773         8737.915             4293.097
#> 28      2  Medium 2017        8774.058         8798.778             4326.092
#> 29      2  Medium 2018        8823.497         8841.650             4348.396
#> 30      2  Medium 2019        8859.804         8880.876             4368.489
#> 31      2  Medium 2020        8901.948         8921.405             4389.080
#> 32      2  Medium 1970        9609.358         9630.504             4711.880
#> 33      2  Medium 1980        9822.438         9833.092             4803.726
#> 34      2  Medium 1990        9947.045         9960.968             4867.237
#> 35      2  Medium 2000       10239.426        10251.717             5012.194
#> 36      2  Medium 2005       10446.009        10478.886             5127.786
#> 37      2  Medium 2010       10872.318        10936.626             5367.835
#> 38      2  Medium 2015       11238.392        11275.335             5547.255
#> 39      2  Medium 2016       11312.277        11332.701             5579.932
#> 40      2  Medium 2017       11353.124        11376.580             5602.466
#> 41      2  Medium 2018       11400.037        11428.605             5630.355
#> 42      2  Medium 2019       11457.173        11490.618             5663.949
#> 43      2  Medium 2020       11524.063        11540.107             5691.736
#> 44      2  Medium 1970       94203.972        95375.651            47646.494
#> 45      2  Medium 1980      119782.997       121207.460            60450.776
#> 46      2  Medium 1990      147831.978       149143.223            74332.633
#> 47      2  Medium 2000      172855.172       174018.282            86454.826
#> 48      2  Medium 2005      183690.861       184688.101            91571.959
#> 49      2  Medium 2010      192909.069       193701.930            95844.360
#> 50      2  Medium 2015      200891.199       201675.532            99587.454
#> 51      2  Medium 2016      202459.865       203218.114           100309.738
#> 52      2  Medium 2017      203976.362       204703.445           101001.719
#> 53      2  Medium 2018      205430.528       206107.260           101654.523
#> 54      2  Medium 2019      206783.993       207455.460           102280.732
#> 55      2  Medium 2020      208126.926       208660.842           102844.473
#> 56      2  Medium 1970        8465.419         8490.824             4244.976
#> 57      2  Medium 1980        8845.117         8859.536             4414.132
#> 58      2  Medium 1990        8882.135         8822.365             4349.118
#> 59      2  Medium 2000        8035.121         8000.520             3899.425
#> 60      2  Medium 2005        7722.940         7695.050             3743.275
#> 61      2  Medium 2010        7465.187         7437.598             3617.776
#> 62      2  Medium 2015        7201.687         7177.517             3489.400
#> 63      2  Medium 2016        7153.347         7127.434             3463.406
#> 64      2  Medium 2017        7101.521         7075.636             3436.048
#> 65      2  Medium 2018        7049.750         7024.746             3408.915
#> 66      2  Medium 2019        6999.741         6975.469             3382.539
#> 67      2  Medium 2020        6951.197         6933.652             3359.488
#> 68      2  Medium 1970       21186.412        21440.022            10751.240
#> 69      2  Medium 1980       24376.237        24533.776            12217.879
#> 70      2  Medium 1990       27593.691        27789.443            13771.971
#> 71      2  Medium 2000       30736.515        30891.803            15290.052
#> 72      2  Medium 2005       32283.483        32440.173            16073.490
#> 73      2  Medium 2010       34017.435        34196.899            16943.012
#> 74      2  Medium 2015       35792.151        35962.234            17837.661
#> 75      2  Medium 2016       36132.317        36353.343            18032.655
#> 76      2  Medium 2017       36574.369        36808.496            18263.590
#> 77      2  Medium 2018       37042.624        37295.005            18514.929
#> 78      2  Medium 2019       37547.386        37782.935            18766.224
#> 79      2  Medium 2020       38018.483        38171.902            18964.448
#> 80      2  Medium 1970        9763.176         9845.344             4921.083
#> 81      2  Medium 1980       11423.444        11508.550             5736.382
#> 82      2  Medium 1990       13324.345        13437.176             6689.387
#> 83      2  Medium 2000       15412.428        15503.635             7713.694
#> 84      2  Medium 2005       16268.135        16348.778             8129.901
#> 85      2  Medium 2010       17095.677        17181.464             8543.399
#> 86      2  Medium 2015       17956.235        18047.625             8976.465
#> 87      2  Medium 2016       18139.016        18267.221             9085.689
#> 88      2  Medium 2017       18395.427        18558.868             9230.995
#> 89      2  Medium 2018       18722.308        18893.191             9397.629
#> 90      2  Medium 2019       19064.074        19197.744             9549.158
#> 91      2  Medium 2020       19331.414        19370.624             9633.238
#> 92      2  Medium 1990     1143536.292      1153582.724           587726.093
#> 93      2  Medium 2000     1264726.915      1269581.175           648473.902
#> 94      2  Medium 2005     1305884.967      1310027.136           669790.769
#> 95      2  Medium 2010     1347091.795      1351561.514           691523.568
#> 96      2  Medium 2015     1392459.496      1396134.174           714291.690
#> 97      2  Medium 2016     1399808.851      1404052.632           718222.772
#> 98      2  Medium 2017     1408296.413      1412354.727           722262.972
#> 99      2  Medium 2018     1416413.041      1419008.956           725405.723
#> 100     2  Medium 2019     1421604.871      1423520.357           727474.139
#> 101     2  Medium 2020     1425435.844      1426106.093           728451.612
#> 102     2  Medium 2000       38777.787        39089.934            19411.115
#> 103     2  Medium 2005       41844.401        42128.977            20880.218
#> 104     2  Medium 2010       44527.597        44777.319            22163.441
#> 105     2  Medium 2015       46767.121        46969.940            23221.563
#> 106     2  Medium 2016       47172.760        47437.512            23448.707
#> 107     2  Medium 2017       47702.264        48131.078            23789.069
#> 108     2  Medium 2018       48559.892        49024.466            24229.130
#> 109     2  Medium 2019       49489.039        49907.985            24664.044
#> 110     2  Medium 2020       50326.931        50629.997            25013.101
#> 111     2  Medium 1990        3081.872         3121.706             1566.169
#> 112     2  Medium 2000        3901.193         3937.739             1955.690
#> 113     2  Medium 2005        4230.387         4261.240             2113.180
#> 114     2  Medium 2010        4529.380         4555.962             2256.689
#> 115     2  Medium 2015        4792.689         4818.038             2385.764
#> 116     2  Medium 2016        4843.388         4866.998             2409.720
#> 117     2  Medium 2017        4890.607         4913.177             2432.342
#> 118     2  Medium 2018        4935.747         4957.818             2454.074
#> 119     2  Medium 2019        4979.889         4999.554             2474.298
#> 120     2  Medium 2020        5019.218         5034.320             2490.812
#> 121     2  Medium 2000        4355.775         4326.105             2079.136
#> 122     2  Medium 2005        4312.587         4313.946             2073.054
#> 123     2  Medium 2010        4307.414         4301.145             2070.682
#> 124     2  Medium 2015        4205.865         4183.728             2014.755
#> 125     2  Medium 2016        4161.592         4136.444             1992.125
#> 126     2  Medium 2017        4111.295         4079.200             1964.676
#> 127     2  Medium 2018        4047.105         4024.868             1938.516
#> 128     2  Medium 2019        4002.631         3986.334             1920.084
#> 129     2  Medium 2020        3970.038         3953.958             1904.870
#> 130     2  Medium 1990         782.950          788.350              401.276
#> 131     2  Medium 2000         939.507          947.666              481.675
#> 132     2  Medium 2005        1027.023         1036.151              525.528
#> 133     2  Medium 2010        1118.560         1127.816              571.052
#> 134     2  Medium 2015        1210.693         1219.502              616.000
#> 135     2  Medium 2016        1228.310         1237.112              624.634
#> 136     2  Medium 2017        1245.915         1254.275              633.044
#> 137     2  Medium 2018        1262.636         1270.737              641.146
#> 138     2  Medium 2019        1278.839         1286.671              649.030
#> 139     2  Medium 2020        1294.504         1302.247              656.652
#> 140     2  Medium 1970        9794.185         9801.252             4746.627
#> 141     2  Medium 1980       10266.844        10275.403             4979.022
#> 142     2  Medium 1990       10303.989        10301.988             4999.928
#> 143     2  Medium 2000       10243.940        10236.804             4983.672
#> 144     2  Medium 2005       10269.807        10280.152             5023.332
#> 145     2  Medium 2010       10441.791        10464.036             5133.779
#> 146     2  Medium 2015       10522.054        10524.416             5176.537
#> 147     2  Medium 2016       10526.779        10531.948             5182.958
#> 148     2  Medium 2017       10537.117        10541.342             5190.134
#> 149     2  Medium 2018       10545.566        10548.937             5196.326
#> 150     2  Medium 2019       10552.308        10554.875             5201.455
#> 151     2  Medium 2020       10557.442        10550.129             5200.635
#> 152     2  Medium 1970        4906.853         4928.668             2446.182
#> 153     2  Medium 1980        5122.105         5123.081             2528.584
#> 154     2  Medium 1990        5135.486         5141.025             2533.558
#> 155     2  Medium 2000        5330.035         5339.658             2639.236
#> 156     2  Medium 2005        5411.499         5419.554             2681.613
#> 157     2  Medium 2010        5534.803         5547.862             2749.916
#> 158     2  Medium 2015        5659.980         5683.701             2824.525
#> 159     2  Medium 2016        5707.422         5728.201             2849.086
#> 160     2  Medium 2017        5748.980         5765.168             2868.316
#> 161     2  Medium 2018        5781.356         5793.824             2882.749
#> 162     2  Medium 2019        5806.293         5814.618             2892.966
#> 163     2  Medium 2020        5822.944         5831.530             2900.837
#> 164     2  Medium 1970        1355.746         1361.866              623.109
#> 165     2  Medium 1980        1472.199         1476.463              683.764
#> 166     2  Medium 1990        1570.254         1570.303              734.942
#> 167     2  Medium 2000        1401.240         1396.997              651.139
#> 168     2  Medium 2005        1358.933         1354.848              629.820
#> 169     2  Medium 2010        1333.319         1331.448              620.244
#> 170     2  Medium 2015        1313.160         1314.576              615.534
#> 171     2  Medium 2016        1315.992         1315.849              617.157
#> 172     2  Medium 2017        1315.706         1317.425              619.360
#> 173     2  Medium 2018        1319.143         1321.965              623.412
#> 174     2  Medium 2019        1324.786         1326.822              627.486
#> 175     2  Medium 2020        1328.857         1329.669              630.001
#> 176     2  Medium 1970      383424.649       384384.463           186138.472
#> 177     2  Medium 1980      405559.331       406686.964           197348.621
#> 178     2  Medium 1990      419265.232       419997.473           204129.232
#> 179     2  Medium 2000      427198.511       427627.317           207882.484
#> 180     2  Medium 2005      433874.029       434557.116           211350.185
#> 181     2  Medium 2010      440148.112       440608.950           214423.482
#> 182     2  Medium 2015      443317.617       443910.907           216529.036
#> 183     2  Medium 2016      444504.198       444911.488           217201.251
#> 184     2  Medium 2017      445318.779       445696.744           217683.860
#> 185     2  Medium 2018      446074.710       446503.645           218171.961
#> 186     2  Medium 2019      446932.581       447369.192           218688.186
#> 187     2  Medium 2020      447805.804       447777.539           218944.725
#> 188     2  Medium 1970        4614.187         4606.305             2224.997
#> 189     2  Medium 1980        4771.072         4779.350             2310.792
#> 190     2  Medium 1990        4974.549         4986.575             2419.551
#> 191     2  Medium 2000        5171.324         5176.202             2526.244
#> 192     2  Medium 2005        5236.615         5246.082             2567.279
#> 193     2  Medium 2010        5351.435         5363.350             2631.846
#> 194     2  Medium 2015        5471.989         5479.718             2696.843
#> 195     2  Medium 2016        5487.446         5495.469             2707.034
#> 196     2  Medium 2017        5503.492         5508.396             2715.842
#> 197     2  Medium 2018        5513.300         5515.736             2721.322
#> 198     2  Medium 2019        5518.173         5521.759             2725.858
#> 199     2  Medium 2020        5525.345         5529.612             2731.082
#> 200     2  Medium 1970       50568.411        50813.075            24815.861
#> 201     2  Medium 1980       53786.732        53941.061            26340.449
#> 202     2  Medium 1990       56847.224        56990.238            27696.324
#> 203     2  Medium 2000       59274.168        59483.717            28856.747
#> 204     2  Medium 2005       61405.748        61625.032            29831.640
#> 205     2  Medium 2010       63262.065        63417.363            30708.895
#> 206     2  Medium 2015       64831.554        64916.336            31416.098
#> 207     2  Medium 2016       65001.118        65086.855            31501.022
#> 208     2  Medium 2017       65172.593        65284.776            31605.558
#> 209     2  Medium 2018       65396.959        65519.543            31721.037
#> 210     2  Medium 2019       65642.126        65729.459            31832.377
#> 211     2  Medium 2020       65816.792        65905.277            31923.744
#> 212     2  Medium 2000       81748.384        81797.258            39811.059
#> 213     2  Medium 2005       82077.203        82046.731            39892.040
#> 214     2  Medium 2010       80858.414        80830.924            39383.812
#> 215     2  Medium 2015       81589.465        82077.550            40401.847
#> 216     2  Medium 2016       82565.636        82760.102            40841.790
#> 217     2  Medium 2017       82954.569        83104.007            41022.496
#> 218     2  Medium 2018       83253.445        83368.506            41163.696
#> 219     2  Medium 2019       83483.566        83559.186            41261.516
#> 220     2  Medium 2020       83634.807        83628.708            41291.235
#> 221     2  Medium 1970        8738.768         8747.776             4270.757
#> 222     2  Medium 1980        9596.738         9653.414             4749.225
#> 223     2  Medium 1990       10236.879        10258.487             5041.323
#> 224     2  Medium 2000       10754.428        10782.635             5319.506
#> 225     2  Medium 2005       10962.875        10981.334             5413.663
#> 226     2  Medium 2010       11121.452        11124.670             5445.717
#> 227     2  Medium 2015       10858.048        10820.902             5227.191
#> 228     2  Medium 2016       10783.757        10775.504             5202.350
#> 229     2  Medium 2017       10767.251        10753.534             5194.437
#> 230     2  Medium 2018       10739.816        10730.844             5187.141
#> 231     2  Medium 2019       10721.871        10718.576             5189.163
#> 232     2  Medium 2020       10715.280        10699.369             5185.174
#> 233     2  Medium 1970       10299.784        10315.143             4999.520
#> 234     2  Medium 1980       10702.050        10695.366             5180.694
#> 235     2  Medium 1990       10383.388        10381.281             4984.198
#> 236     2  Medium 2000       10202.563        10190.600             4850.667
#> 237     2  Medium 2005       10075.843        10065.706             4780.576
#> 238     2  Medium 2010        9993.288         9979.128             4741.792
#> 239     2  Medium 2015        9851.853         9839.211             4690.164
#> 240     2  Medium 2016        9826.569         9810.532             4680.109
#> 241     2  Medium 2017        9794.495         9785.604             4672.201
#> 242     2  Medium 2018        9776.714         9774.394             4673.175
#> 243     2  Medium 2019        9772.073         9770.346             4678.031
#> 244     2  Medium 2020        9768.620         9749.456             4672.074
#> 245     2  Medium 1970         204.062          204.478              103.386
#> 246     2  Medium 1980         226.961          228.144              115.015
#> 247     2  Medium 1990         253.793          254.833              127.930
#> 248     2  Medium 2000         279.123          281.280              140.794
#> 249     2  Medium 2005         293.673          296.834              149.221
#> 250     2  Medium 2010         317.744          318.158              160.013
#> 251     2  Medium 2015         329.233          330.952              166.271
#> 252     2  Medium 2016         332.670          335.574              169.190
#> 253     2  Medium 2017         338.477          343.532              174.353
#> 254     2  Medium 2018         348.586          352.854              180.258
#> 255     2  Medium 2019         357.122          360.700              184.932
#> 256     2  Medium 2020         364.277          366.614              188.041
#> 257     2  Medium 1990      855462.534       864972.222           447021.579
#> 258     2  Medium 2000     1048002.570      1057922.733           547253.435
#> 259     2  Medium 2005     1145623.522      1154676.322           597426.194
#> 260     2  Medium 2010     1234510.963      1243481.564           643098.086
#> 261     2  Medium 2015     1320246.623      1328024.498           686298.736
#> 262     2  Medium 2016     1335802.372      1343944.296           694417.091
#> 263     2  Medium 2017     1352086.220      1359657.400           702419.096
#> 264     2  Medium 2018     1367228.580      1374659.064           710050.158
#> 265     2  Medium 2019     1382089.548      1389030.312           717351.064
#> 266     2  Medium 2020     1395971.076      1402617.695           724175.468
#> 267     2  Medium 1990      181869.930       183501.098            91622.838
#> 268     2  Medium 2000      214558.771       216077.790           108231.133
#> 269     2  Medium 2005      229335.279       230871.650           115781.562
#> 270     2  Medium 2010      244753.641       246305.322           123641.334
#> 271     2  Medium 2015      260363.854       261799.249           131513.675
#> 272     2  Medium 2016      263234.644       264627.418           132946.469
#> 273     2  Medium 2017      266020.192       267346.658           134322.386
#> 274     2  Medium 2018      268673.124       269951.846           135637.608
#> 275     2  Medium 2019      271230.569       272489.381           136916.976
#> 276     2  Medium 2020      273748.193       274814.866           138073.249
#> 277     2  Medium 1970        2950.319         2961.404             1487.098
#> 278     2  Medium 1980        3396.143         3415.240             1715.600
#> 279     2  Medium 1990        3507.068         3514.018             1747.125
#> 280     2  Medium 2000        3775.330         3802.585             1890.195
#> 281     2  Medium 2005        4107.023         4155.284             2073.933
#> 282     2  Medium 2010        4548.521         4559.080             2264.427
#> 283     2  Medium 2015        4677.802         4702.487             2326.423
#> 284     2  Medium 2016        4727.172         4753.503             2352.633
#> 285     2  Medium 2017        4779.834         4810.260             2381.352
#> 286     2  Medium 2018        4840.687         4872.556             2412.979
#> 287     2  Medium 2019        4904.424         4933.491             2443.395
#> 288     2  Medium 2020        4962.558         4982.606             2467.162
#> 289     2  Medium 1990        4421.750         4544.999             2261.048
#> 290     2  Medium 2000        6030.947         6111.190             3017.103
#> 291     2  Medium 2005        6671.444         6728.206             3324.080
#> 292     2  Medium 2010        7268.766         7336.735             3629.670
#> 293     2  Medium 2015        7973.820         8052.908             3990.883
#> 294     2  Medium 2016        8131.997         8210.006             4070.462
#> 295     2  Medium 2017        8288.014         8361.796             4148.076
#> 296     2  Medium 2018        8435.579         8510.067             4224.242
#> 297     2  Medium 2019        8584.554         8657.474             4300.116
#> 298     2  Medium 2020        8730.394         8800.376             4373.531
#> 299     2  Medium 1970       53231.973        53390.236            25951.992
#> 300     2  Medium 1980       56220.071        56412.084            27408.492
#> 301     2  Medium 1990       57001.455        57031.454            27694.023
#> 302     2  Medium 2000       57252.868        57272.196            27734.696
#> 303     2  Medium 2005       58395.336        58519.693            28379.141
#> 304     2  Medium 2010       60037.277        60164.213            29148.832
#> 305     2  Medium 2015       60639.026        60575.316            29403.014
#> 306     2  Medium 2016       60511.606        60478.107            29391.610
#> 307     2  Medium 2017       60444.609        60390.318            29393.679
#> 308     2  Medium 2018       60336.027        60277.498            29379.159
#> 309     2  Medium 2019       60218.970        60130.136            29326.484
#> 310     2  Medium 2020       60041.302        59912.769            29229.606
#> 311     2  Medium 1970      106091.333       106712.368            52353.779
#> 312     2  Medium 1980      117977.409       118358.756            58457.797
#> 313     2  Medium 1990      123164.512       123399.765            60899.138
#> 314     2  Medium 2000      126914.854       127027.789            62477.070
#> 315     2  Medium 2005      127878.669       127913.330            62743.998
#> 316     2  Medium 2010      128201.820       128185.275            62706.098
#> 317     2  Medium 2015      127358.353       127275.872            62204.439
#> 318     2  Medium 2016      127193.392       127159.951            62146.727
#> 319     2  Medium 2017      127126.510       127064.690            62094.983
#> 320     2  Medium 2018      127002.870       126913.432            62016.416
#> 321     2  Medium 2019      126823.995       126699.424            61908.356
#> 322     2  Medium 2020      126574.852       126304.543            61704.209
#> 323     2  Medium 1970       32192.690        32542.197            16408.688
#> 324     2  Medium 1980       37927.933        38141.106            19294.155
#> 325     2  Medium 1990       43825.750        44081.427            22397.804
#> 326     2  Medium 2000       46629.108        46766.661            23887.084
#> 327     2  Medium 2005       47781.349        47851.644            24355.325
#> 328     2  Medium 2010       48645.528        48769.332            24755.452
#> 329     2  Medium 2015       50772.791        50983.912            25576.742
#> 330     2  Medium 2016       51195.032        51297.839            25698.156
#> 331     2  Medium 2017       51400.646        51486.270            25775.545
#> 332     2  Medium 2018       51571.895        51640.894            25836.216
#> 333     2  Medium 2019       51709.893        51767.846            25882.760
#> 334     2  Medium 2020       51825.799        51858.482            25903.431
#> 335     2  Medium 2000        2382.266         2368.312             1089.862
#> 336     2  Medium 2005        2250.839         2239.784             1027.290
#> 337     2  Medium 2010        2120.878         2097.831              959.524
#> 338     2  Medium 2015        1986.446         1977.867              907.806
#> 339     2  Medium 2016        1969.288         1959.863              900.034
#> 340     2  Medium 2017        1950.438         1942.594              892.736
#> 341     2  Medium 2018        1934.750         1927.588              887.388
#> 342     2  Medium 2019        1920.426         1914.263              883.052
#> 343     2  Medium 2020        1908.100         1901.123              878.254
#> 344     2  Medium 2000        3510.878         3500.402             1637.884
#> 345     2  Medium 2005        3354.861         3322.263             1545.515
#> 346     2  Medium 2010        3142.344         3097.720             1428.943
#> 347     2  Medium 2015        2922.086         2905.764             1338.185
#> 348     2  Medium 2016        2889.442         2869.110             1321.130
#> 349     2  Medium 2017        2848.777         2829.312             1304.959
#> 350     2  Medium 2018        2809.848         2802.478             1296.652
#> 351     2  Medium 2019        2795.108         2795.058             1300.161
#> 352     2  Medium 2020        2795.008         2795.765             1309.124
#> 353     2  Medium 1970         338.810          339.332              166.403
#> 354     2  Medium 1980         363.266          363.705              177.640
#> 355     2  Medium 1990         379.179          381.700              186.878
#> 356     2  Medium 2000         433.029          436.132              214.960
#> 357     2  Medium 2005         461.425          465.364              230.238
#> 358     2  Medium 2010         502.502          507.410              252.312
#> 359     2  Medium 2015         562.896          569.536              285.560
#> 360     2  Medium 2016         576.176          583.506              292.946
#> 361     2  Medium 2017         590.836          596.496              299.687
#> 362     2  Medium 2018         602.155          608.101              305.734
#> 363     2  Medium 2019         614.047          620.163              311.930
#> 364     2  Medium 2020         626.279          630.597              317.306
#> 365     2  Medium 1990         366.208          367.908              181.066
#> 366     2  Medium 2000         398.429          399.895              198.015
#> 367     2  Medium 2005         412.063          413.320              205.172
#> 368     2  Medium 2010         421.711          422.651              210.088
#> 369     2  Medium 2015         439.618          444.980              223.435
#> 370     2  Medium 2016         450.343          455.269              229.016
#> 371     2  Medium 2017         460.195          467.902              236.110
#> 372     2  Medium 2018         475.610          484.558              246.198
#> 373     2  Medium 2019         493.505          504.015              258.784
#> 374     2  Medium 2020         514.526          518.206              268.350
#> 375     2  Medium 1970       50020.308        50814.953            25402.751
#> 376     2  Medium 1980       66479.853        67300.334            33597.506
#> 377     2  Medium 1990       82017.824        82820.170            40708.294
#> 378     2  Medium 2000       97881.058        98625.552            48159.842
#> 379     2  Medium 2005      105100.326       105811.504            51659.736
#> 380     2  Medium 2010      112814.937       113623.895            55513.195
#> 381     2  Medium 2015      120463.639       121072.306            59066.012
#> 382     2  Medium 2016      121680.973       122251.350            59593.139
#> 383     2  Medium 2017      122821.728       123400.057            60107.325
#> 384     2  Medium 2018      123978.387       124573.711            60641.037
#> 385     2  Medium 2019      125169.035       125762.982            61184.489
#> 386     2  Medium 2020      126356.930       126799.054            61635.476
#> 387     2  Medium 1970       12971.045        13052.078             6513.761
#> 388     2  Medium 1980       14102.705        14162.686             7027.425
#> 389     2  Medium 1990       14968.299        15030.878             7411.724
#> 390     2  Medium 2000       15995.104        16058.760             7928.279
#> 391     2  Medium 2005       16450.414        16465.710             8128.981
#> 392     2  Medium 2010       16729.801        16771.235             8286.276
#> 393     2  Medium 2015       17066.993        17107.433             8464.739
#> 394     2  Medium 2016       17147.873        17204.693             8519.688
#> 395     2  Medium 2017       17261.513        17315.370             8579.849
#> 396     2  Medium 2018       17369.227        17421.280             8635.896
#> 397     2  Medium 2019       17473.332        17537.507             8698.228
#> 398     2  Medium 2020       17601.682        17636.731             8751.393
#> 399     2  Medium 1970        2801.131         2822.177             1409.660
#> 400     2  Medium 1980        3141.882         3146.327             1564.801
#> 401     2  Medium 1990        3345.088         3396.979             1672.712
#> 402     2  Medium 2000        3846.018         3857.574             1893.688
#> 403     2  Medium 2005        4110.490         4135.007             2025.381
#> 404     2  Medium 2010        4327.134         4347.770             2126.008
#> 405     2  Medium 2015        4564.623         4614.029             2271.832
#> 406     2  Medium 2016        4663.435         4714.770             2328.375
#> 407     2  Medium 2017        4766.105         4812.752             2382.153
#> 408     2  Medium 2018        4859.398         4900.847             2429.767
#> 409     2  Medium 2019        4942.296         4989.402             2476.011
#> 410     2  Medium 2020        5036.509         5069.895             2516.752
#> 411     2  Medium 1970        3862.811         3875.346             1927.920
#> 412     2  Medium 1980        4078.901         4085.604             2024.736
#> 413     2  Medium 1990        4233.121         4241.440             2097.148
#> 414     2  Medium 2000        4478.393         4490.867             2224.164
#> 415     2  Medium 2005        4606.202         4623.124             2292.938
#> 416     2  Medium 2010        4858.121         4889.162             2443.701
#> 417     2  Medium 2015        5165.723         5189.771             2611.894
#> 418     2  Medium 2016        5213.819         5235.983             2637.061
#> 419     2  Medium 2017        5258.147         5276.802             2658.717
#> 420     2  Medium 2018        5295.458         5311.752             2676.696
#> 421     2  Medium 2019        5328.047         5347.730             2695.741
#> 422     2  Medium 2020        5367.414         5379.274             2712.785
#> 423     2  Medium 1970      917763.712       923097.214           451583.030
#> 424     2  Medium 1980     1017241.549      1022112.968           501319.128
#> 425     2  Medium 1990     1107128.763      1112368.606           546346.818
#> 426     2  Medium 2000     1196485.392      1200774.802           591114.001
#> 427     2  Medium 2005     1241315.080      1245792.720           613584.956
#> 428     2  Medium 2010     1287871.972      1292452.513           636972.147
#> 429     2  Medium 2015     1333048.809      1338086.518           660506.445
#> 430     2  Medium 2016     1343124.226      1347738.462           665565.721
#> 431     2  Medium 2017     1352352.699      1357115.308           670414.592
#> 432     2  Medium 2018     1361877.916      1366335.893           675171.566
#> 433     2  Medium 2019     1370793.870      1374907.870           679586.891
#> 434     2  Medium 2020     1379021.870      1380726.170           682463.726
#> 435     2  Medium 1970       32441.797        32542.634            15809.890
#> 436     2  Medium 1980       35417.711        35576.519            17333.434
#> 437     2  Medium 1990       38003.724        38055.455            18538.608
#> 438     2  Medium 2000       38262.731        38258.071            18542.430
#> 439     2  Medium 2005       38145.611        38124.379            18440.439
#> 440     2  Medium 2010       38014.161        38095.351            18358.811
#> 441     2  Medium 2015       38266.693        38266.314            18553.765
#> 442     2  Medium 2016       38265.935        38263.265            18555.364
#> 443     2  Medium 2017       38260.595        38254.958            18554.725
#> 444     2  Medium 2018       38249.322        38241.070            18551.882
#> 445     2  Medium 2019       38232.819        38225.884            18548.609
#> 446     2  Medium 2020       38218.950        38171.012            18518.782
#> 447     2  Medium 1970        8720.019         8669.524             4119.813
#> 448     2  Medium 1980        9715.305         9763.624             4702.993
#> 449     2  Medium 1990        9998.584         9989.524             4814.338
#> 450     2  Medium 2000       10244.918        10283.204             4962.632
#> 451     2  Medium 2005       10493.203        10502.994             5055.510
#> 452     2  Medium 2010       10582.566        10578.660             5060.414
#> 453     2  Medium 2015       10382.751        10370.267             4923.134
#> 454     2  Medium 2016       10357.783        10346.372             4910.140
#> 455     2  Medium 2017       10334.961        10330.844             4901.811
#> 456     2  Medium 2018       10326.727        10325.353             4896.701
#> 457     2  Medium 2019       10323.979        10343.213             4907.050
#> 458     2  Medium 2020       10362.447        10370.519             4926.734
#> 459     2  Medium 1970       19864.798        20011.625             9733.302
#> 460     2  Medium 1980       22091.147        22154.771            10741.480
#> 461     2  Medium 1990       22926.476        22939.530            11123.285
#> 462     2  Medium 2000       22106.642        22046.262            10589.882
#> 463     2  Medium 2005       21305.613        21213.388            10195.661
#> 464     2  Medium 2010       20507.498        20432.574             9847.710
#> 465     2  Medium 2015       19921.039        19871.019             9604.634
#> 466     2  Medium 2016       19821.000        19777.051             9564.120
#> 467     2  Medium 2017       19733.101        19689.402             9525.742
#> 468     2  Medium 2018       19645.702        19597.872             9485.968
#> 469     2  Medium 2019       19550.042        19501.542             9444.048
#> 470     2  Medium 2020       19453.042        19392.469             9395.410
#> 471     2  Medium 2000      146951.628       146717.782            68597.209
#> 472     2  Medium 2005      144900.103       144597.884            67068.784
#> 473     2  Medium 2010      143923.880       143934.466            66578.303
#> 474     2  Medium 2015      145082.693       145307.616            67369.147
#> 475     2  Medium 2016      145532.538       145778.677            67619.621
#> 476     2  Medium 2017      146024.816       146186.799            67845.060
#> 477     2  Medium 2018      146348.782       146430.146            67986.420
#> 478     2  Medium 2019      146511.509       146533.067            68044.184
#> 479     2  Medium 2020      146554.625       146371.298            67975.286
#> 480     2  Medium 2000       15747.265        16177.722             8842.645
#> 481     2  Medium 2005       20112.631        20559.890            12050.112
#> 482     2  Medium 2010       24685.038        25157.128            15372.356
#> 483     2  Medium 2015       29485.420        29974.938            18815.810
#> 484     2  Medium 2016       30464.456        30717.808            19296.030
#> 485     2  Medium 2017       30971.161        30782.402            19193.774
#> 486     2  Medium 2018       30593.643        30365.121            18713.633
#> 487     2  Medium 2019       30136.598        30472.811            18639.721
#> 488     2  Medium 2020       30809.025        30991.207            18870.229
#> 489     2  Medium 1970        4509.463         4525.871             2234.055
#> 490     2  Medium 1980        4957.195         4976.656             2446.729
#> 491     2  Medium 1990        5258.729         5266.078             2571.432
#> 492     2  Medium 2000        5379.589         5379.999             2613.761
#> 493     2  Medium 2005        5376.595         5376.695             2613.084
#> 494     2  Medium 2010        5389.005         5391.851             2624.115
#> 495     2  Medium 2015        5417.840         5420.278             2642.754
#> 496     2  Medium 2016        5422.716         5427.259             2647.457
#> 497     2  Medium 2017        5431.802         5435.700             2652.718
#> 498     2  Medium 2018        5439.599         5443.232             2657.468
#> 499     2  Medium 2019        5446.865         5450.626             2661.918
#> 500     2  Medium 2020        5454.386         5455.024             2664.405
#> 501     2  Medium 1970        1734.360         1739.861              824.911
#> 502     2  Medium 1980        1894.596         1903.069              911.076
#> 503     2  Medium 1990        1996.187         1998.007              968.222
#> 504     2  Medium 2000        1985.597         1986.816              970.715
#> 505     2  Medium 2005        1993.930         1996.914              977.620
#> 506     2  Medium 2010        2043.029         2044.612             1012.560
#> 507     2  Medium 2015        2059.147         2059.947             1021.364
#> 508     2  Medium 2016        2060.747         2061.373             1022.794
#> 509     2  Medium 2017        2061.999         2062.410             1024.506
#> 510     2  Medium 2018        2062.821         2069.480             1031.009
#> 511     2  Medium 2019        2076.140         2083.440             1042.741
#> 512     2  Medium 2020        2090.739         2102.420             1054.876
#> 513     2  Medium 1980       29020.589        29518.857            14980.010
#> 514     2  Medium 1990       40198.710        40746.268            20733.554
#> 515     2  Medium 2000       46964.645        47159.719            22416.070
#> 516     2  Medium 2005       49242.166        49490.032            23652.461
#> 517     2  Medium 2010       52026.347        52344.051            25184.586
#> 518     2  Medium 2015       56068.572        56723.537            27529.271
#> 519     2  Medium 2016       57378.501        57259.551            27780.550
#> 520     2  Medium 2017       57140.601        57635.162            27904.835
#> 521     2  Medium 2018       58129.723        58613.001            28401.154
#> 522     2  Medium 2019       59096.278        59587.885            28892.232
#> 523     2  Medium 2020       60079.493        60562.381            29381.179
#> 524     2  Medium 1970       33653.306        33812.723            16502.809
#> 525     2  Medium 1980       37384.880        37537.564            18419.365
#> 526     2  Medium 1990       39062.333        39084.979            19174.944
#> 527     2  Medium 2000       40910.218        41019.774            20136.658
#> 528     2  Medium 2005       43605.586        43958.885            21711.237
#> 529     2  Medium 2010       46754.555        46840.472            23183.193
#> 530     2  Medium 2015       46686.545        46683.686            22979.318
#> 531     2  Medium 2016       46680.827        46732.771            22987.364
#> 532     2  Medium 2017       46784.715        46868.596            23037.197
#> 533     2  Medium 2018       46952.476        47092.821            23136.074
#> 534     2  Medium 2019       47233.166        47435.119            23299.594
#> 535     2  Medium 2020       47637.072        47679.489            23417.243
#> 536     2  Medium 1970        8004.376         8042.780             4016.175
#> 537     2  Medium 1980        8303.034         8310.469             4117.691
#> 538     2  Medium 1990        8526.857         8558.568             4227.938
#> 539     2  Medium 2000        8861.338         8872.101             4386.542
#> 540     2  Medium 2005        9011.669         9029.770             4476.673
#> 541     2  Medium 2010        9340.855         9378.232             4669.742
#> 542     2  Medium 2015        9747.691         9799.482             4901.706
#> 543     2  Medium 2016        9851.272         9923.280             4972.254
#> 544     2  Medium 2017        9995.288        10057.862             5048.116
#> 545     2  Medium 2018       10120.435        10175.404             5112.667
#> 546     2  Medium 2019       10230.374        10279.125             5169.246
#> 547     2  Medium 2020       10327.876        10353.686             5209.470
#> 548     2  Medium 1970        6168.681         6180.922             3019.616
#> 549     2  Medium 1980        6303.950         6319.846             3074.212
#> 550     2  Medium 1990        6674.789         6713.173             3278.273
#> 551     2  Medium 2000        7164.437         7184.007             3510.215
#> 552     2  Medium 2005        7409.794         7431.823             3639.030
#> 553     2  Medium 2010        7779.430         7825.754             3853.626
#> 554     2  Medium 2015        8239.254         8283.934             4098.434
#> 555     2  Medium 2016        8328.614         8374.901             4148.242
#> 556     2  Medium 2017        8421.188         8453.628             4190.848
#> 557     2  Medium 2018        8486.068         8516.344             4222.837
#> 558     2  Medium 2019        8546.621         8577.524             4254.229
#> 559     2  Medium 2020        8608.427         8640.582             4287.099
#> 560     2  Medium 1970       36217.959        36638.465            18563.696
#> 561     2  Medium 1980       44939.536        45408.815            23041.461
#> 562     2  Medium 1990       55506.995        56015.628            28265.596
#> 563     2  Medium 2000       65013.692        65425.961            32880.646
#> 564     2  Medium 2005       68967.341        69329.557            34780.073
#> 565     2  Medium 2010       72907.264        73346.769            36810.898
#> 566     2  Medium 2015       79016.511        80014.226            40105.684
#> 567     2  Medium 2016       81011.941        81652.088            40913.630
#> 568     2  Medium 2017       82292.236        83083.662            41617.836
#> 569     2  Medium 2018       83875.088        84415.969            42272.560
#> 570     2  Medium 2019       84956.849        85357.672            42726.628
#> 571     2  Medium 2020       85758.495        86091.692            43068.231
#> 572     2  Medium 1970       55552.336        55663.801            27026.057
#> 573     2  Medium 1980       56251.565        56282.103            27391.943
#> 574     2  Medium 1990       57264.731        57367.862            27664.153
#> 575     2  Medium 2000       58946.508        59057.338            28628.840
#> 576     2  Medium 2005       60372.678        60596.108            29481.318
#> 577     2  Medium 2010       62746.896        63006.483            30780.549
#> 578     2  Medium 2015       65121.524        65382.110            32064.103
#> 579     2  Medium 2016       65642.696        65893.358            32345.736
#> 580     2  Medium 2017       66144.020        66354.471            32591.476
#> 581     2  Medium 2018       66564.922        66752.475            32800.273
#> 582     2  Medium 2019       66940.028        67110.958            32992.981
#> 583     2  Medium 2020       67281.888        67351.862            33128.760
#> 584     2  Medium 1970      206457.170       207796.339           101039.894
#> 585     2  Medium 1980      228690.259       229858.655           111868.341
#> 586     2  Medium 1990      251834.166       253373.387           124454.591
#> 587     2  Medium 2000      280093.565       281484.131           139793.344
#> 588     2  Medium 2005      294240.403       295716.664           147251.218
#> 589     2  Medium 2010      309527.200       311062.790           155157.146
#> 590     2  Medium 2015      324628.169       326126.497           163455.402
#> 591     2  Medium 2016      327624.824       329179.426           165136.242
#> 592     2  Medium 2017      330734.029       332204.660           166798.058
#> 593     2  Medium 2018      333675.290       335056.498           168358.724
#> 594     2  Medium 2019      336437.705       337790.067           169847.310
#> 595     2  Medium 2020      339142.428       339436.159           170710.103
#>     TPopulationFemale1July PopDensity PopSexRatio MedianAgePop NatChange
#> 1                16630.962    11.7329     96.9573      26.2919   466.655
#> 2                18870.186    13.3297     97.2105      26.8366   437.582
#> 3                19874.796    14.0471     97.3192      27.7538   428.235
#> 4                20883.716    14.7892     97.7076      28.8739   441.305
#> 5                21939.310    15.5731     98.1695      29.8606   444.146
#> 6                22147.409    15.7247     98.2187      30.0510   391.767
#> 7                22335.741    15.8639     98.2871      30.2576   375.253
#> 8                22512.096    15.9950     98.3595      30.4912   346.055
#> 9                22665.752    16.1091     98.4204      30.7625   279.970
#> 10               22772.480    16.1873     98.4499      31.0798   151.342
#> 11                6262.458     1.6401    101.1896      26.5483   145.385
#> 12                7369.276     1.9163     99.7665      28.3739   118.257
#> 13                8583.875     2.2293     99.5171      31.0733   144.232
#> 14                9636.164     2.4905     98.5486      34.3690   120.305
#> 15               10216.136     2.6417     98.6513      35.4882   132.600
#> 16               11118.504     2.8822     99.1417      36.0434   157.806
#> 17               12055.514     3.1173     98.6477      36.2542   147.140
#> 18               12255.924     3.1670     98.5160      36.2469   149.784
#> 19               12460.053     3.2192     98.4826      36.2682   142.696
#> 20               12654.146     3.2698     98.5097      36.3517   153.195
#> 21               12836.801     3.3171     98.5130      36.5428   139.261
#> 22               12970.037     3.3511     98.4866      36.8955   131.309
#> 23                4137.657    97.1040     93.6586      37.1400     0.907
#> 24                4229.116    99.7250     94.5845      38.9239     2.166
#> 25                4291.904   101.3717     94.9040      40.8399     0.891
#> 26                4406.991   104.7521     96.1438      41.9973     0.294
#> 27                4444.818   105.8897     96.5866      42.0068     6.302
#> 28                4472.685   106.6273     96.7225      42.1147     3.969
#> 29                4493.254   107.1468     96.7761      42.2738     1.009
#> 30                4512.388   107.6222     96.8110      42.4327     1.057
#> 31                4532.324   108.1133     96.8395      42.5721    -0.681
#> 32                4918.624   318.0694     95.7967      33.4980    22.905
#> 33                5029.366   324.7603     95.5135      33.1491     9.825
#> 34                5093.731   328.9837     95.5535      35.2701    19.549
#> 35                5239.522   338.5863     95.6613      37.8932    10.633
#> 36                5351.099   346.0891     95.8268      39.2150    15.182
#> 37                5568.790   361.2070     96.3914      39.8407    23.376
#> 38                5728.080   372.3936     96.8432      40.4291    10.352
#> 39                5752.768   374.2883     96.9956      40.4922    12.754
#> 40                5774.114   375.7375     97.0273      40.5860     8.936
#> 41                5798.250   377.4557     97.1044      40.6630     6.525
#> 42                5826.669   379.5039     97.2073      40.7351     8.422
#> 43                5848.370   381.1384     97.3217      40.8108   -11.684
#> 44               47729.157    11.4111     99.8268      17.2840  2362.136
#> 45               60756.685    14.5017     99.4965      19.1791  2887.850
#> 46               74810.590    17.8441     99.3611      21.3696  2653.047
#> 47               87563.455    20.8202     98.7339      24.1720  2372.011
#> 48               93116.142    22.0968     98.3417      26.0213  2083.346
#> 49               97857.570    23.1752     97.9427      28.1950  1847.261
#> 50              102088.079    24.1292     97.5505      30.4714  1742.280
#> 51              102908.376    24.3138     97.4748      30.9195  1609.483
#> 52              103701.727    24.4915     97.3964      31.3670  1610.462
#> 53              104452.738    24.6595     97.3211      31.8129  1583.797
#> 54              105174.727    24.8208     97.2484      32.2562  1472.156
#> 55              105816.370    24.9650     97.1915      32.6837  1146.264
#> 56                4245.848    78.3315     99.9795      32.2603    62.130
#> 57                4445.405    81.7331     99.2965      33.1766    30.879
#> 58                4473.246    81.3901     97.2251      35.5921    -2.718
#> 59                4101.094    73.8083     95.0826      38.6942   -42.993
#> 60                3951.774    70.9902     94.7239      40.1153   -41.340
#> 61                3819.823    68.6151     94.7106      41.1081   -33.508
#> 62                3688.117    66.2157     94.6120      42.5272   -44.114
#> 63                3664.028    65.7537     94.5246      42.7533   -42.339
#> 64                3639.588    65.2758     94.4076      43.0095   -45.666
#> 65                3615.830    64.8063     94.2775      43.3011   -46.133
#> 66                3592.930    64.3517     94.1443      43.6278   -46.389
#> 67                3574.164    63.9659     93.9937      43.8967   -65.265
#> 68               10688.782     2.3577    100.5843      24.9545   202.582
#> 69               12315.897     2.6979     99.2041      28.1267   192.317
#> 70               14017.472     3.0560     98.2486      31.8210   210.042
#> 71               15601.750     3.3971     98.0022      35.7683   108.853
#> 72               16366.683     3.5674     98.2086      37.5879   108.858
#> 73               17253.887     3.7606     98.1982      38.7396   133.568
#> 74               18124.573     3.9547     98.4170      39.6290   115.839
#> 75               18320.689     3.9977     98.4278      39.7329   112.597
#> 76               18544.907     4.0478     98.4831      39.7703    95.573
#> 77               18780.076     4.1013     98.5881      39.7690    84.536
#> 78               19016.711     4.1549     98.6828      39.7878    83.411
#> 79               19207.453     4.1977     98.7348      39.9006    50.252
#> 80                4924.261    13.0756     99.9355      19.7049   200.409
#> 81                5772.168    15.2845     99.3800      21.9731   198.273
#> 82                6747.789    17.8459     99.1345      24.8336   226.938
#> 83                7789.942    20.5904     99.0212      28.0342   175.351
#> 84                8218.876    21.7129     98.9174      29.9369   147.001
#> 85                8638.065    22.8187     98.9041      31.7192   145.523
#> 86                9071.160    23.9691     98.9561      33.3311   127.080
#> 87                9181.532    24.2607     98.9561      33.6203   120.547
#> 88                9327.872    24.6481     98.9614      33.8621   106.263
#> 89                9495.562    25.0921     98.9687      34.0789   103.959
#> 90                9648.586    25.4966     98.9695      34.3284    86.000
#> 91                9737.386    25.7262     98.9304      34.6841    52.379
#> 92              565856.632   120.1649    103.8648      23.7304 20104.056
#> 93              621107.274   132.2480    104.4061      28.9606  9771.139
#> 94              640236.366   136.4612    104.6162      31.7715  8388.038
#> 95              660037.946   140.7877    104.7703      34.1438  9123.570
#> 96              681842.484   145.4306    104.7590      35.6902  7996.300
#> 97              685829.860   146.2555    104.7232      35.9853  8640.622
#> 98              690091.755   147.1203    104.6619      36.2788  8211.240
#> 99              693603.233   147.8134    104.5851      36.6210  5390.044
#> 100             696046.218   148.2834    104.5152      37.0262  4487.062
#> 101             697654.481   148.5527    104.4144      37.4937  1432.084
#> 102              19678.819    34.7872     98.6396      23.1569   652.170
#> 103              21248.758    37.4917     98.2656      24.6160   610.618
#> 104              22613.878    39.8486     98.0081      26.4636   533.665
#> 105              23748.377    41.7998     97.7817      28.5662   446.767
#> 106              23988.805    42.2159     97.7485      28.9849   425.132
#> 107              24342.009    42.8332     97.7285      29.3715   426.546
#> 108              24795.336    43.6282     97.7165      29.7269   433.628
#> 109              25243.941    44.4145     97.7028      30.0840   441.061
#> 110              25616.897    45.0570     97.6430      30.4484   378.997
#> 111               1555.537    61.1380    100.6835      21.7107    71.728
#> 112               1982.049    77.1198     98.6702      24.2071    64.268
#> 113               2148.059    83.4555     98.3763      25.9613    57.139
#> 114               2299.273    89.2276     98.1479      27.9710    50.800
#> 115               2432.275    94.3603     98.0877      30.1550    49.080
#> 116               2457.277    95.3192     98.0647      30.6089    45.568
#> 117               2480.836    96.2236     98.0453      31.0708    43.468
#> 118               2503.744    97.0979     98.0162      31.5363    42.469
#> 119               2525.255    97.9153     97.9821      32.0138    37.682
#> 120               2543.508    98.5962     97.9282      32.5133    29.164
#> 121               2246.968    77.3956     92.5308      38.6257   -11.707
#> 122               2240.892    77.1781     92.5102      39.9620    -7.910
#> 123               2230.463    76.9491     92.8364      41.0140    -8.551
#> 124               2168.973    74.8484     92.8898      42.3067   -16.774
#> 125               2144.318    74.0025     92.9025      42.7092   -18.153
#> 126               2114.524    72.9784     92.9133      43.1693   -19.638
#> 127               2086.352    72.0064     92.9141      43.6100   -19.452
#> 128               2066.250    71.3170     92.9260      43.9517   -19.354
#> 129               2049.088    70.7378     92.9618      44.2277   -23.605
#> 130                387.074    85.3193    103.6692      28.8389     9.418
#> 131                465.991   102.5613    103.3656      30.5919     5.569
#> 132                510.623   112.1376    102.9189      31.5604     5.647
#> 133                556.764   122.0581    102.5662      32.8553     6.723
#> 134                603.502   131.9807    102.0708      34.5647     6.341
#> 135                612.478   133.8866    101.9848      34.9381     6.645
#> 136                621.232   135.7441    101.9013      35.3202     6.081
#> 137                629.592   137.5257    101.8352      35.7161     5.905
#> 138                637.642   139.2502    101.7859      36.1201     5.681
#> 139                645.595   140.9359    101.7128      36.5284     5.827
#> 140               5054.624   126.9543     93.9066      32.5430    23.491
#> 141               5296.382   133.0959     94.0080      31.9517    15.378
#> 142               5302.061   133.4403     94.3016      34.2587    -0.463
#> 143               5253.132   132.5959     94.8705      36.4312   -18.682
#> 144               5256.821   133.1574     95.5584      37.7553    -5.512
#> 145               5330.256   135.5392     96.3139      38.6849     9.559
#> 146               5347.880   136.3213     96.7961      40.3627    -0.305
#> 147               5348.990   136.4189     96.8960      40.7711     4.870
#> 148               5351.207   136.5406     96.9900      41.1808     2.703
#> 149               5352.610   136.6390     97.0802      41.5747     0.896
#> 150               5353.420   136.7159     97.1613      41.9627    -0.423
#> 151               5349.494   136.6544     97.2173      42.3243   -18.965
#> 152               2482.486   116.2586     98.5376      31.4629    22.678
#> 153               2594.497   120.8445     97.4595      33.3075     1.159
#> 154               2607.467   121.2678     97.1655      36.1215     2.403
#> 155               2700.422   125.9532     97.7342      37.3014     8.813
#> 156               2737.942   127.8378     97.9426      38.5411     9.225
#> 157               2797.946   130.8643     98.2834      39.5581     8.584
#> 158               2859.176   134.0685     98.7881      40.4980     5.152
#> 159               2879.116   135.1182     98.9570      40.5927     8.163
#> 160               2896.852   135.9902     99.0149      40.7241     7.830
#> 161               2911.076   136.6661     99.0269      40.8608     6.014
#> 162               2921.652   137.1566     99.0182      40.9930     7.167
#> 163               2930.693   137.5556     98.9813      41.1489     6.314
#> 164                738.756    31.3317     84.3457      32.6771     6.086
#> 165                792.699    33.9682     86.2577      32.6966     3.910
#> 166                835.361    36.1272     87.9790      33.3448     2.759
#> 167                745.858    32.1400     87.3007      37.0510    -5.401
#> 168                725.028    31.1703     86.8684      38.3171    -2.957
#> 169                711.205    30.6320     87.2102      39.2629     0.039
#> 170                699.042    30.2438     88.0541      40.5660    -1.434
#> 171                698.692    30.2731     88.3303      40.6914    -1.365
#> 172                698.064    30.3093     88.7255      40.8797    -1.761
#> 173                698.552    30.4138     89.2435      41.0458    -1.448
#> 174                699.336    30.5255     89.7260      41.2130    -1.316
#> 175                699.668    30.5910     90.0428      41.3831    -2.067
#> 176             198245.990    95.9535     93.8927      31.2623  2293.701
#> 177             209338.342   101.5208     94.2726      31.9582  1474.378
#> 178             215868.242   104.8435     94.5620      34.2562   788.438
#> 179             219744.833   106.7481     94.6018      37.2227   183.881
#> 180             223206.931   108.4780     94.6880      38.7776   145.327
#> 181             226185.469   109.9887     94.7998      40.3379   264.889
#> 182             227381.872   110.8130     95.2270      41.8616  -323.971
#> 183             227710.237   111.0627     95.3849      42.0849  -211.266
#> 184             228012.884   111.2588     95.4700      42.3170  -389.274
#> 185             228331.684   111.4602     95.5505      42.5492  -497.358
#> 186             228681.007   111.6763     95.6302      42.7843  -542.215
#> 187             228832.814   111.7782     95.6789      43.0145 -1123.163
#> 188               2381.308    15.2335     93.4359      28.6268    20.818
#> 189               2468.558    15.8058     93.6090      31.7785    18.773
#> 190               2567.024    16.4911     94.2551      35.4566    15.138
#> 191               2649.957    17.1183     95.3315      38.3597     7.264
#> 192               2678.803    17.3494     95.8368      39.9080     9.684
#> 193               2731.504    17.7372     96.3516      41.0495     9.748
#> 194               2782.875    18.1220     96.9085      41.4564     2.800
#> 195               2788.435    18.1741     97.0808      41.4973    -1.276
#> 196               2792.554    18.2169     97.2530      41.5920    -3.544
#> 197               2794.415    18.2411     97.3843      41.7649    -6.951
#> 198               2795.901    18.2611     97.4948      41.9740    -8.495
#> 199               2798.530    18.2870     97.5899      42.1784    -8.979
#> 200              25997.214    92.1562     95.4558      31.4323   306.390
#> 201              27600.611    97.8292     95.4343      31.3330   253.940
#> 202              29293.914   103.3593     94.5463      33.7311   242.721
#> 203              30626.970   107.8815     94.2201      36.6514   247.459
#> 204              31793.393   111.7651     93.8297      37.9093   247.152
#> 205              32708.467   115.0157     93.8867      39.0135   257.965
#> 206              33500.238   117.7343     93.7787      40.2858   169.917
#> 207              33585.834   118.0436     93.7926      40.5204   155.927
#> 208              33679.218   118.4025     93.8429      40.7100   121.383
#> 209              33798.505   118.8283     93.8534      40.8846   112.241
#> 210              33897.082   119.2090     93.9089      41.0797   102.692
#> 211              33981.533   119.5279     93.9444      41.2516    31.378
#> 212              41986.200   234.6720     94.8194      39.0155   -76.847
#> 213              42154.691   235.3877     94.6325      40.9500  -142.290
#> 214              41447.113   231.8996     95.0218      43.2649  -185.092
#> 215              41675.704   235.4761     96.9434      44.8125  -199.118
#> 216              41918.312   237.4343     97.4319      44.8162  -128.551
#> 217              42081.511   238.4210     97.4834      44.8888  -154.108
#> 218              42204.810   239.1798     97.5332      44.9278  -173.787
#> 219              42297.670   239.7268     97.5503      44.9036  -167.843
#> 220              42337.474   239.9263     97.5288      44.8758  -215.655
#> 221               4477.019    66.8688     95.3929      32.2922    72.191
#> 222               4904.189    73.7916     96.8402      32.8203    65.888
#> 223               5217.164    78.4168     96.6296      35.0067    16.924
#> 224               5463.130    82.4234     97.3710      36.9803     1.748
#> 225               5567.671    83.9423     97.2339      38.3418     3.625
#> 226               5678.953    85.0380     95.8930      40.3339     4.438
#> 227               5593.712    82.7160     93.4476      42.6824   -30.846
#> 228               5573.154    82.3689     93.3466      43.0771   -26.976
#> 229               5559.096    82.2010     93.4403      43.3930   -37.925
#> 230               5543.703    82.0275     93.5682      43.7097   -35.879
#> 231               5529.413    81.9338     93.8466      44.0046   -43.361
#> 232               5514.194    81.7870     94.0332      44.3180   -38.167
#> 233               5315.624   113.9417     94.0533      33.1406    30.811
#> 234               5514.672   118.1417     93.9438      33.2444     4.426
#> 235               5397.083   114.6723     92.3498      35.3295   -21.206
#> 236               5339.932   112.5660     90.8376      37.4618   -37.343
#> 237               5285.130   111.1864     90.4533      37.8935   -37.193
#> 238               5237.336   110.2301     90.5383      38.8572   -38.907
#> 239               5149.047   108.6845     91.0880      40.7308   -39.137
#> 240               5130.423   108.3677     91.2227      41.0609   -32.143
#> 241               5113.404   108.0924     91.3716      41.4226   -37.983
#> 242               5101.218   107.9686     91.6090      41.7710   -38.831
#> 243               5092.316   107.9239     91.8645      42.1176   -37.797
#> 244               5077.383   107.6931     92.0174      42.4545   -47.467
#> 245                101.092     2.0398    102.2697      23.4446     2.595
#> 246                113.129     2.2759    101.6667      25.8549     2.993
#> 247                126.903     2.5422    100.8097      28.9632     3.050
#> 248                140.486     2.8060    100.2200      31.8735     2.444
#> 249                147.613     2.9611    101.0890      33.1906     2.395
#> 250                158.145     3.1739    101.1812      33.8775     2.889
#> 251                164.680     3.3015    100.9658      34.9404     1.933
#> 252                166.384     3.3476    101.6862      35.1793     1.683
#> 253                169.178     3.4270    103.0592      35.3061     1.761
#> 254                172.595     3.5200    104.4399      35.3662     1.903
#> 255                175.768     3.5983    105.2134      35.4542     2.123
#> 256                178.573     3.6573    105.3015      35.5955     2.171
#> 257             417950.642   290.9240    106.9556      19.6865 18893.873
#> 258             510669.298   355.8208    107.1640      21.1915 19984.281
#> 259             557250.128   388.3628    107.2097      22.2442 19035.043
#> 260             600383.478   418.2314    107.1146      23.6407 17992.107
#> 261             641725.761   446.6665    106.9458      25.2708 16210.828
#> 262             649527.205   452.0210    106.9112      25.6132 16202.614
#> 263             657238.304   457.3059    106.8743      25.9609 15393.993
#> 264             664608.906   462.3516    106.8373      26.3131 15450.757
#> 265             671679.248   467.1852    106.7996      26.6678 14860.501
#> 266             678442.228   471.7552    106.7409      27.0239 13367.053
#> 267              91878.260    96.0271     99.7220      20.6453  3250.792
#> 268             107846.658   113.0746    100.3565      23.6063  3080.737
#> 269             115090.088   120.8163    100.6008      25.1515  3149.523
#> 270             122663.988   128.8928    100.7968      26.5879  3161.127
#> 271             130285.574   137.0009    100.9426      27.8590  2899.273
#> 272             131680.949   138.4809    100.9611      28.1035  2814.544
#> 273             133024.272   139.9039    100.9758      28.3590  2682.400
#> 274             134314.239   141.2672    100.9853      28.6242  2587.354
#> 275             135572.404   142.5951    100.9918      28.8911  2548.044
#> 276             136741.616   143.8120    100.9738      29.1324  2152.096
#> 277               1474.306    43.3163    100.8676      26.2174    31.052
#> 278               1699.640    49.9545    100.9390      25.4870    41.065
#> 279               1766.893    51.3993     98.8812      28.2351    22.105
#> 280               1912.390    55.6202     98.8394      31.4984    23.197
#> 281               2081.351    60.7791     99.6436      32.4295    32.537
#> 282               2294.653    66.6854     98.6828      33.2991    48.093
#> 283               2376.064    68.7830     97.9108      35.3694    35.988
#> 284               2400.870    69.5292     97.9909      35.7417    33.698
#> 285               2428.908    70.3594     98.0421      36.1300    31.971
#> 286               2459.576    71.2706     98.1055      36.5002    30.344
#> 287               2490.096    72.1619     98.1245      36.8833    28.482
#> 288               2515.444    72.8803     98.0806      37.2890    24.350
#> 289               2283.951   209.9986     98.9972      24.8058    67.769
#> 290               3094.088   282.3634     97.5119      26.7513    97.070
#> 291               3404.126   310.8722     97.6486      27.7307   102.560
#> 292               3707.066   338.9888     97.9122      28.3762   123.037
#> 293               4062.026   372.0791     98.2486      28.7612   128.453
#> 294               4139.543   379.3377     98.3312      28.8155   131.705
#> 295               4213.721   386.3511     98.4421      28.8574   133.050
#> 296               4285.825   393.2018     98.5631      28.8898   133.361
#> 297               4357.358   400.0127     98.6863      28.9353   129.703
#> 298               4426.845   406.6153     98.7957      28.9944   123.391
#> 299              27438.244   180.3877     94.5833      31.8941   378.738
#> 300              29003.592   190.5975     94.5003      33.0289    88.385
#> 301              29337.430   192.6901     94.3983      36.1020    24.677
#> 302              29537.500   193.5035     93.8966      39.2493   -17.406
#> 303              30140.553   197.7184     94.1560      40.8431    -9.981
#> 304              31015.381   203.2746     93.9819      42.5129   -20.518
#> 305              31172.302   204.6636     94.3242      44.4021  -166.810
#> 306              31086.497   204.3352     94.5478      44.7931  -151.570
#> 307              30996.639   204.0386     94.8286      45.1765  -203.724
#> 308              30898.339   203.6574     95.0833      45.5711  -200.742
#> 309              30803.652   203.1595     95.2046      45.9983  -224.302
#> 310              30683.163   202.4251     95.2627      46.4029  -342.345
#> 311              54358.588   283.1889     96.3119      28.2528  1208.340
#> 312              59900.959   314.0956     97.5908      31.6952   854.996
#> 313              62500.626   327.4732     97.4376      36.8720   345.918
#> 314              64550.719   337.1011     96.7876      40.7522   202.404
#> 315              65169.332   339.4511     96.2784      42.5541   -43.705
#> 316              65479.176   340.1728     95.7649      44.2400  -164.959
#> 317              65071.434   337.7595     95.5941      45.8447  -333.854
#> 318              65013.224   337.4518     95.5909      46.1951  -381.613
#> 319              64969.707   337.1990     95.5753      46.5354  -446.203
#> 320              64897.017   336.7976     95.5613      46.8893  -499.475
#> 321              64791.067   336.2297     95.5508      47.2624  -567.336
#> 322              64600.334   335.1818     95.5169      47.6739  -582.617
#> 323              16133.509   328.8984    101.7056      17.6945   727.029
#> 324              18846.952   385.4856    102.3728      20.9232   574.691
#> 325              21683.623   445.5235    103.2936      25.8059   432.058
#> 326              22879.577   472.6627    104.4035      30.6526   360.073
#> 327              23496.319   483.6284    103.6559      33.5514   188.412
#> 328              24013.880   492.9033    103.0881      36.5898   195.556
#> 329              25407.170   515.2857    100.6674      39.8667   145.823
#> 330              25599.683   518.4585    100.3847      40.4777   114.034
#> 331              25710.726   520.3629    100.2521      41.0508    67.220
#> 332              25804.678   521.9257    100.1222      41.6201    19.782
#> 333              25885.087   523.2088     99.9910      42.1839   -12.717
#> 334              25955.050   524.1248     99.8011      42.7594   -47.267
#> 335               1278.450    38.0592     85.2487      37.0408   -12.222
#> 336               1212.494    35.9938     84.7254      38.4202   -10.981
#> 337               1138.307    33.7126     84.2940      40.0634    -9.959
#> 338               1070.061    31.7847     84.8368      41.8190    -6.324
#> 339               1059.829    31.4954     84.9227      42.0437    -6.528
#> 340               1049.858    31.2179     85.0341      42.2514    -7.816
#> 341               1040.200    30.9767     85.3093      42.4477    -9.354
#> 342               1031.211    30.7626     85.6325      42.6387    -8.902
#> 343               1022.870    30.5514     85.8618      42.8206   -10.821
#> 344               1862.517    55.8982     87.9393      34.9898    -4.879
#> 345               1776.748    53.0535     86.9856      37.4989   -13.834
#> 346               1668.777    49.4677     85.6281      39.7431   -10.364
#> 347               1567.580    46.4024     85.3663      41.8968   -10.083
#> 348               1547.980    45.8171     85.3454      42.2558   -10.058
#> 349               1524.353    45.1815     85.6074      42.6762   -10.899
#> 350               1505.826    44.7530     86.1090      42.9969   -11.280
#> 351               1494.897    44.6345     86.9733      43.1401   -10.772
#> 352               1486.640    44.6458     88.0593      43.1545   -18.362
#> 353                172.929   131.0162     96.2262      34.3477     0.189
#> 354                186.065   140.4268     95.4718      33.9281     0.036
#> 355                194.822   147.3745     95.9219      35.3380     1.053
#> 356                221.173   168.3909     97.1911      36.1901     1.693
#> 357                235.125   179.6770     97.9213      37.2204     1.560
#> 358                255.097   195.9112     98.9083      37.9836     1.900
#> 359                283.976   219.8981    100.5574      38.2648     1.900
#> 360                290.560   225.2919    100.8212      38.3392     1.896
#> 361                296.808   230.3071    100.9698      38.4175     1.676
#> 362                302.368   234.7880    101.1132      38.4578     1.744
#> 363                308.232   239.4452    101.1997      38.4842     1.730
#> 364                313.291   243.4737    101.2816      38.5573     1.674
#> 365                186.841  1167.9619     96.9091      31.9839     2.831
#> 366                201.880  1269.5079     98.0855      35.5006     1.345
#> 367                208.148  1312.1254     98.5705      37.0892     0.880
#> 368                212.563  1341.7476     98.8354      38.5699     1.135
#> 369                221.546  1412.6365    100.8529      39.5287     1.136
#> 370                226.253  1445.2984    101.2212      39.5504     1.227
#> 371                231.792  1485.4048    101.8627      39.4704     1.049
#> 372                238.359  1538.2778    103.2889      39.1954     0.924
#> 373                245.232  1600.0492    105.5260      38.8933     0.719
#> 374                249.856  1645.1000    107.4021      38.8756     0.468
#> 375              25412.201    25.9359     99.9628      14.9813  1753.381
#> 376              33702.829    34.3501     99.6875      15.6959  1893.129
#> 377              42111.876    42.2714     96.6670      18.6650  1926.453
#> 378              50465.710    50.3385     95.4308      21.7710  1845.414
#> 379              54151.768    54.0062     95.3981      23.3608  1732.639
#> 380              58110.700    57.9936     95.5301      24.8100  1658.759
#> 381              62006.295    61.7953     95.2581      26.2581  1508.371
#> 382              62658.211    62.3971     95.1083      26.5813  1445.225
#> 383              63292.732    62.9834     94.9672      26.9181  1384.161
#> 384              63932.674    63.5824     94.8514      27.2656  1366.007
#> 385              64578.493    64.1894     94.7444      27.6162  1357.524
#> 386              65163.579    64.7182     94.5858      27.9364  1031.702
#> 387               6538.316   387.6356     99.6244      27.5354   129.633
#> 388               7135.261   420.6197     98.4887      30.3265    65.948
#> 389               7619.154   446.4043     97.2775      33.2950    71.589
#> 390               8130.480   476.9315     97.5130      36.2304    68.008
#> 391               8336.729   489.0176     97.5080      37.9014    53.093
#> 392               8484.959   498.0914     97.6584      39.6725    49.154
#> 393               8642.694   508.0762     97.9410      41.2118    25.283
#> 394               8685.005   510.9647     98.0965      41.3430    24.909
#> 395               8735.521   514.2517     98.2179      41.4135    21.376
#> 396               8785.383   517.3972     98.2985      41.4649    16.902
#> 397               8839.278   520.8490     98.4043      41.4892    19.353
#> 398               8885.338   523.7959     98.4925      41.5272     2.504
#> 399               1412.517    10.6536     99.7978      24.6144    37.592
#> 400               1581.526    11.8773     98.9425      26.8507    24.319
#> 401               1724.266    12.8235     97.0101      30.0562    33.349
#> 402               1963.886    14.5622     96.4256      33.3358    29.711
#> 403               2109.626    15.6095     96.0067      34.5333    29.823
#> 404               2221.762    16.4127     95.6902      35.8842    34.542
#> 405               2342.197    17.4178     96.9958      36.3873    27.953
#> 406               2386.395    17.7981     97.5687      36.2520    27.146
#> 407               2430.599    18.1680     98.0068      36.1813    24.941
#> 408               2471.080    18.5005     98.3281      36.1994    23.762
#> 409               2513.392    18.8348     98.5127      36.2869    24.445
#> 410               2553.143    19.1387     98.5747      36.4597    24.648
#> 411               1947.425    12.7384     98.9984      31.8413    26.107
#> 412               2060.867    13.4295     98.2468      32.3654     9.636
#> 413               2144.291    13.9417     97.8015      34.3758    14.823
#> 414               2266.704    14.7616     98.1233      35.8042    15.139
#> 415               2330.186    15.1963     98.4015      36.8923    15.258
#> 416               2445.461    16.0708     99.9280      37.6782    19.213
#> 417               2577.878    17.0589    101.3195      38.1764    17.854
#> 418               2598.922    17.2108    101.4675      38.2814    17.905
#> 419               2618.086    17.3450    101.5520      38.4093    15.657
#> 420               2635.056    17.4599    101.5803      38.5905    14.116
#> 421               2651.990    17.5782    101.6498      38.7973    13.669
#> 422               2666.488    17.6818    101.7362      39.0434    12.438
#> 423             471514.184    25.9068     95.7729      26.9160 10176.343
#> 424             520793.840    28.6857     96.2606      28.3689  8844.701
#> 425             566021.789    31.2187     96.5240      30.7892  8074.321
#> 426             609660.801    33.6998     96.9578      33.6435  6568.869
#> 427             632207.764    34.9632     97.0543      35.0613  5956.297
#> 428             655480.365    36.2728     97.1764      36.3975  5777.787
#> 429             677580.072    37.5535     97.4802      37.5569  4573.804
#> 430             682172.742    37.8244     97.5656      37.7497  4452.445
#> 431             686700.716    38.0875     97.6284      37.9440  3885.701
#> 432             691164.327    38.3463     97.6861      38.1452  3527.580
#> 433             695320.979    38.5869     97.7371      38.3746  3195.011
#> 434             698262.444    38.7502     97.7374      38.6301  1164.610
#> 435              16732.743   106.2811     94.4848      27.2768   268.533
#> 436              18243.085   116.1895     95.0137      28.5292   360.034
#> 437              19516.846   124.2854     94.9877      31.4366   153.803
#> 438              19715.641   124.9472     94.0493      34.2540     6.601
#> 439              19683.940   124.5105     93.6827      35.5863    -0.548
#> 440              19736.540   124.4157     93.0194      36.9443    42.769
#> 441              19712.550   124.9741     94.1216      38.3169    -4.646
#> 442              19707.901   124.9641     94.1519      38.6749     0.322
#> 443              19700.233   124.9370     94.1853      39.0338    10.278
#> 444              19689.189   124.8916     94.2237      39.3888   -16.289
#> 445              19677.275   124.8420     94.2641      39.7421   -21.564
#> 446              19652.231   124.6628     94.2325      40.1014   -99.800
#> 447               4549.710    94.2493     90.5511      28.5737    90.863
#> 448               5060.631   106.1437     92.9329      29.5292    66.754
#> 449               5175.185   108.5995     93.0274      33.1754    16.735
#> 450               5320.572   111.7922     93.2725      36.6795    15.980
#> 451               5447.484   114.1816     92.8045      38.4162     4.028
#> 452               5518.246   115.0042     91.7033      40.4819    -2.180
#> 453               5447.132   112.7387     90.3803      42.8224   -21.759
#> 454               5436.232   112.4789     90.3225      43.2839   -22.041
#> 455               5429.033   112.3101     90.2888      43.7347   -22.220
#> 456               5428.652   112.2504     90.2010      44.1708   -25.240
#> 457               5436.163   112.4446     90.2668      44.6038   -24.563
#> 458               5443.784   112.7414     90.5020      45.0259   -37.931
#> 459              10278.323    86.9783     94.6974      30.4196   221.732
#> 460              11413.290    96.2933     94.1138      30.5549   143.914
#> 461              11816.245    99.7041     94.1355      32.1255    64.260
#> 462              11456.380    95.8216     92.4365      33.6232   -28.300
#> 463              11017.726    92.2017     92.5387      35.8085   -53.266
#> 464              10584.864    88.8079     93.0358      38.3372   -27.479
#> 465              10266.385    86.3672     93.5542      40.2684   -64.291
#> 466              10212.931    85.9588     93.6472      40.6186   -54.820
#> 467              10163.659    85.5778     93.7236      40.9588   -54.322
#> 468              10111.904    85.1800     93.8099      41.2918   -62.641
#> 469              10057.494    84.7613     93.9006      41.6278   -69.085
#> 470               9997.060    84.2872     93.9817      41.9587  -107.953
#> 471              78120.573     8.9595     87.8094      35.7314 -1018.088
#> 472              77529.100     8.8300     86.5079      36.4109  -867.980
#> 473              77356.162     8.7895     86.0672      36.9645  -286.378
#> 474              77938.469     8.8734     86.4389      37.6849    65.081
#> 475              78159.057     8.9022     86.5154      37.7969    44.629
#> 476              78341.739     8.9271     86.6014      37.9539   -72.646
#> 477              78443.725     8.9419     86.6690      38.1693  -177.242
#> 478              78488.883     8.9482     86.6928      38.4415  -293.385
#> 479              78396.013     8.9383     86.7076      38.6920  -700.746
#> 480               7335.077     7.5256    120.5529      19.7312   392.404
#> 481               8509.778     9.5641    141.6031      20.7516   375.946
#> 482               9784.772    11.7027    157.1049      23.5456   439.222
#> 483              11159.128    13.9438    168.6136      26.9668   513.742
#> 484              11421.779    14.2894    168.9407      27.6337   533.703
#> 485              11588.628    14.3195    165.6259      28.1095   543.293
#> 486              11651.488    14.1253    160.6115      28.3197   531.705
#> 487              11833.090    14.1754    157.5220      28.4038   480.843
#> 488              12120.978    14.4166    155.6824      28.4895   439.090
#> 489               2291.816    92.3026     97.4797      27.2523    37.738
#> 490               2529.927   101.4960     96.7114      27.8904    44.438
#> 491               2694.646   107.3986     95.4274      30.3401    24.091
#> 492               2766.238   109.7220     94.4879      32.9577     1.657
#> 493               2763.612   109.6546     94.5532      34.4932     0.760
#> 494               2767.736   109.9637     94.8109      36.1399     7.504
#> 495               2777.523   110.5435     95.1479      38.1946     2.321
#> 496               2779.802   110.6858     95.2390      38.6035     5.598
#> 497               2782.983   110.8580     95.3192      39.0053     4.515
#> 498               2785.764   111.0116     95.3946      39.4016     3.829
#> 499               2788.708   111.1624     95.4534      39.8046     4.385
#> 500               2790.618   111.2521     95.4773      40.1960    -3.072
#> 501                914.950    86.3969     90.1591      29.7867    10.743
#> 502                991.994    94.5014     91.8429      30.3767    13.809
#> 503               1029.785    99.2158     94.0218      33.1937     3.023
#> 504               1016.101    98.6600     95.5333      36.9614    -0.672
#> 505               1019.294    99.1615     95.9115      38.9960    -0.351
#> 506               1032.052   101.5300     98.1112      40.5153     3.573
#> 507               1038.582   102.2915     98.3422      41.9367     0.890
#> 508               1038.579   102.3623     98.4801      42.2564     0.054
#> 509               1037.903   102.4138     98.7092      42.5684    -0.537
#> 510               1038.471   102.7649     99.2815      42.8075    -1.323
#> 511               1040.698   103.4581    100.1963      42.9734    -1.751
#> 512               1047.544   104.4006    100.6999      43.0160    -5.154
#> 513              14538.848    24.1797    103.0344      18.3678   738.408
#> 514              20012.714    33.3763    103.6019      20.2565   835.396
#> 515              24743.649    38.6298     90.5932      20.8054   526.944
#> 516              25837.572    40.5386     91.5429      22.1445   464.440
#> 517              27159.465    42.8764     92.7286      23.6406   566.843
#> 518              29194.266    46.4637     94.2968      25.3646   668.785
#> 519              29479.001    46.9028     94.2384      25.6936   641.337
#> 520              29730.327    47.2105     93.8598      26.0589   645.972
#> 521              30211.846    48.0114     94.0067      26.4661   648.294
#> 522              30695.654    48.8100     94.1248      26.8728   652.095
#> 523              31181.201    49.6082     94.2272      27.2653   595.871
#> 524              17309.914    67.3086     95.3373      29.1436   379.408
#> 525              19118.199    74.7233     96.3447      29.7512   285.198
#> 526              19910.036    77.8037     96.3079      32.5070    75.968
#> 527              20883.116    81.6551     96.4255      36.3359    42.852
#> 528              22247.647    87.5058     97.5889      37.7586    76.788
#> 529              23657.279    93.2420     97.9960      39.1824   102.417
#> 530              23704.368    92.9299     96.9413      41.6186    -3.743
#> 531              23745.407    93.0276     96.8076      42.0474    -2.588
#> 532              23831.398    93.2979     96.6674      42.4389   -33.375
#> 533              23956.747    93.7443     96.5744      42.7985   -56.776
#> 534              24135.524    94.4257     96.5365      43.1384   -60.870
#> 535              24262.247    94.9121     96.5172      43.4974  -152.023
#> 536               4026.605    19.7446     99.7410      34.3920    29.579
#> 537               4192.778    20.4018     98.2091      35.1043     4.822
#> 538               4330.629    21.0109     97.6287      37.3535    27.747
#> 539               4485.559    21.7806     97.7925      38.3551    -3.377
#> 540               4553.098    22.1676     98.3215      39.2234     9.176
#> 541               4708.490    23.0231     99.1771      39.7440    23.580
#> 542               4897.775    24.0573    100.0803      39.9444    23.041
#> 543               4951.026    24.3612    100.4288      39.8682    24.786
#> 544               5009.746    24.6916    100.7659      39.7160    22.471
#> 545               5062.738    24.9801    100.9862      39.5938    22.427
#> 546               5109.878    25.2348    101.1618      39.5295    24.887
#> 547               5144.217    25.4178    101.2685      39.5596    14.318
#> 548               3161.306   154.5540     95.5180      30.8968    42.802
#> 549               3245.634   158.0278     94.7184      33.7708    13.954
#> 550               3434.900   167.8629     95.4402      35.8769    18.348
#> 551               3673.791   179.6361     95.5475      37.6574    14.674
#> 552               3792.793   185.8327     95.9459      39.2509    10.858
#> 553               3972.128   195.6830     97.0167      40.5163    16.247
#> 554               4185.500   207.1398     97.9198      41.2593    17.485
#> 555               4226.660   209.4144     98.1447      41.3169    21.563
#> 556               4262.779   211.3830     98.3126      41.3842    19.228
#> 557               4293.507   212.9512     98.3540      41.4802    19.292
#> 558               4323.295   214.4810     98.4025      41.5819    17.293
#> 559               4353.482   216.0577     98.4752      41.6691     8.787
#> 560              18074.768    47.6069    102.7050      17.5449   991.932
#> 561              22367.355    59.0028    103.0138      18.7647  1090.515
#> 562              27750.031    72.7850    101.8579      20.7817  1044.460
#> 563              32545.316    85.0125    101.0303      24.0171  1020.540
#> 564              34549.484    90.0847    100.6674      25.9641   898.623
#> 565              36535.871    95.3046    100.7528      28.0767   823.476
#> 566              39908.542   103.9680    100.4940      29.6212   932.282
#> 567              40738.458   106.0962    100.4300      29.8753   928.239
#> 568              41465.826   107.9564    100.3666      30.1523   923.004
#> 569              42143.408   109.6875    100.3065      30.4502   894.192
#> 570              42631.044   110.9112    100.2242      30.8251   817.331
#> 571              43023.460   111.8649    100.1041      31.2447   628.467
#> 572              28637.744   229.3136     94.3722      33.2185   238.182
#> 573              28890.161   231.8607     94.8141      33.3360    86.261
#> 574              29703.709   236.3336     93.1337      34.9488   149.139
#> 575              30428.498   243.2936     94.0856      36.6263    67.744
#> 576              31114.790   249.6328     94.7502      37.5115   138.581
#> 577              32225.934   259.5626     95.5148      38.1912   244.368
#> 578              33318.008   269.3493     96.2366      38.7839   173.339
#> 579              33547.622   271.4554     96.4174      38.8156   176.662
#> 580              33762.995   273.3550     96.5302      38.8661   148.593
#> 581              33952.202   274.9946     96.6072      38.9549   115.367
#> 582              34117.977   276.4715     96.7026      39.0909   109.130
#> 583              34223.101   277.4639     96.8023      39.2204    -4.268
#> 584             106756.446    22.7160     94.6452      26.7358  1933.448
#> 585             117990.314    25.1278     94.8115      29.1243  1740.868
#> 586             128918.796    27.6984     96.5372      31.9028  1993.721
#> 587             141690.786    30.7714     98.6609      34.2909  1532.735
#> 588             148465.446    32.3273     99.1821      35.1750  1583.309
#> 589             155905.644    34.0049     99.5199      35.9201  1476.729
#> 590             162671.094    35.6516    100.4821      36.3866  1274.523
#> 591             164043.184    35.9854    100.6663      36.5088  1220.077
#> 592             165406.601    36.3161    100.8412      36.6497  1076.533
#> 593             166697.774    36.6278    100.9964      36.8178   997.449
#> 594             167942.756    36.9267    101.1340      37.0024   930.222
#> 595             168726.055    37.1066    101.1759      37.2259   257.700
#>     NatChangeRT PopChange PopGrowthRate DoublingTime    Births Births1519
#> 1        14.246   482.370         1.473      47.0568   723.193     98.370
#> 2        11.758   414.810         1.115      62.1657   719.276    106.574
#> 3        10.920   406.173         1.036      66.9061   717.902    104.846
#> 4        10.689   436.311         1.057      65.5768   756.144    114.039
#> 5        10.216   449.618         1.034      67.0355   768.023    109.297
#> 6         8.924   396.985         0.904      76.6756   737.028    100.296
#> 7         8.473   380.176         0.858      80.7864   715.490     93.700
#> 8         7.749   351.799         0.788      87.9628   684.660     84.901
#> 9         6.226   285.369         0.635     109.1570   625.199     70.835
#> 10        3.349   151.629         0.336           NA   533.228     53.357
#> 11       11.539   401.684         3.188      21.7424   257.096     27.359
#> 12        8.033   207.448         1.409      49.1943   225.831     17.804
#> 13        8.421   244.326         1.427      48.5737   263.218     15.285
#> 14        6.288   231.484         1.210      57.2849   249.532     11.463
#> 15        6.534   263.976         1.301      53.2780   265.050     11.133
#> 16        7.127   324.559         1.466      47.2815   301.517     12.098
#> 17        6.144   359.488         1.501      46.1790   305.482      8.596
#> 18        6.156   404.434         1.662      41.7056   309.657      7.825
#> 19        5.770   397.717         1.608      43.1062   308.126      7.348
#> 20        6.099   379.617         1.511      45.8734   313.988      7.017
#> 21        5.465   346.400         1.359      51.0042   305.307      6.327
#> 22        5.100   175.754         0.683     101.4857   295.156      5.589
#> 23        0.114    18.530         0.231           NA    78.059      3.286
#> 24        0.263    52.851         0.642     107.9669    77.610      3.040
#> 25        0.106    23.457         0.280           NA    78.318      2.498
#> 26        0.034   115.469         1.336      51.8823    83.579      1.732
#> 27        0.721    72.285         0.827      83.8147    87.159      1.633
#> 28        0.451    49.439         0.562     123.3358    87.349      1.477
#> 29        0.115    36.307         0.411           NA    85.407      1.212
#> 30        0.119    42.144         0.475           NA    84.741      1.115
#> 31       -0.076    38.914         0.436           NA    83.467      1.036
#> 32        2.379    42.293         0.439           NA   141.574     10.908
#> 33        0.999    21.309         0.217           NA   123.463      7.901
#> 34        1.963    27.846         0.280           NA   123.812      3.859
#> 35        1.037    24.582         0.240           NA   115.875      3.487
#> 36        1.448    65.753         0.627     110.5498   118.499      3.175
#> 37        2.138   128.615         1.176      58.9411   128.632      3.118
#> 38        0.918    73.885         0.655     105.8240   121.172      2.043
#> 39        1.126    40.847         0.360           NA   120.896      1.916
#> 40        0.786    46.913         0.412           NA   118.711      1.810
#> 41        0.570    57.136         0.500           NA   117.308      1.691
#> 42        0.733    66.890         0.582     119.0975   117.399      1.600
#> 43       -1.013    32.088         0.278           NA   115.567      1.512
#> 44       24.766  2343.358         2.457      28.2111  3360.206    387.596
#> 45       23.825  2848.927         2.351      29.4831  3929.237    548.741
#> 46       17.788  2622.490         1.758      39.4282  3693.601    660.115
#> 47       13.631  2326.219         1.337      51.8435  3459.239    761.323
#> 48       11.280  1994.481         1.080      64.1803  3172.258    662.256
#> 49        9.537  1585.721         0.819      84.6334  2970.979    545.442
#> 50        8.639  1568.666         0.778      89.0935  2961.442    514.826
#> 51        7.920  1516.497         0.746      92.9152  2874.734    482.735
#> 52        7.867  1454.166         0.710      97.6264  2891.049    462.241
#> 53        7.685  1353.465         0.657     105.5019  2889.976    435.963
#> 54        7.096  1342.933         0.647     107.1325  2810.666    401.196
#> 55        5.493  1067.833         0.512     135.3803  2711.546    367.335
#> 56        7.318    50.811         0.598     115.9109   139.135     23.833
#> 57        3.486    28.839         0.326           NA   128.347     24.457
#> 58       -0.309  -119.540        -1.355           NA   106.675     22.114
#> 59       -5.374   -69.203        -0.865           NA    72.135     12.397
#> 60       -5.372   -55.781        -0.725           NA    71.885      9.838
#> 61       -4.505   -55.177        -0.742           NA    76.057      8.374
#> 62       -6.146   -48.340        -0.673           NA    65.896      5.954
#> 63       -5.940   -51.826        -0.727           NA    65.025      5.766
#> 64       -6.453   -51.771        -0.732           NA    63.939      5.791
#> 65       -6.567   -50.009        -0.712           NA    62.236      5.946
#> 66       -6.650   -48.544        -0.696           NA    61.503      5.990
#> 67       -9.413   -35.090        -0.506           NA    58.839      5.694
#> 68        9.449   507.220         2.366      29.2962   356.057     41.090
#> 69        7.839   315.078         1.284      53.9834   362.849     31.669
#> 70        7.558   391.503         1.409      49.1943   402.979     23.860
#> 71        3.524   310.576         1.005      68.9699   329.737     17.404
#> 72        3.356   313.380         0.966      71.7544   342.817     13.954
#> 73        3.906   358.927         1.050      66.0140   377.848     14.875
#> 74        3.221   340.166         0.946      73.2714   384.571      9.815
#> 75        3.097   442.052         1.216      57.0022   383.577      8.728
#> 76        2.596   468.255         1.272      54.4927   377.884      7.986
#> 77        2.266   504.762         1.353      51.2304   374.264      7.099
#> 78        2.208   471.097         1.247      55.5852   372.337      6.551
#> 79        1.317   306.838         0.804      86.2123   362.246      5.920
#> 80       20.355   164.336         1.669      41.5307   283.255     48.550
#> 81       17.229   170.212         1.479      46.8659   267.387     44.714
#> 82       16.889   225.662         1.679      41.2833   297.445     43.331
#> 83       11.311   182.414         1.177      58.8910   253.044     39.415
#> 84        8.992   161.285         0.987      70.2277   232.635     35.141
#> 85        8.470   171.574         0.999      69.3841   244.494     36.993
#> 86        7.041   182.781         1.013      68.4252   237.273     25.613
#> 87        6.599   256.411         1.404      49.3695   231.728     21.462
#> 88        5.726   326.881         1.761      39.3610   218.305     17.197
#> 89        5.502   341.766         1.809      38.3166   221.012     14.868
#> 90        4.480   267.340         1.393      49.7593   210.016     11.825
#> 91        2.704    78.420         0.405           NA   195.578      8.879
#> 92       17.428 20092.864         1.742      39.7903 28079.115   1394.315
#> 93        7.696  9708.521         0.765      90.6075 17551.191    330.994
#> 94        6.403  8284.337         0.632     109.6752 16602.725    395.255
#> 95        6.750  8939.438         0.661     104.8634 17912.367    573.565
#> 96        5.728  7349.355         0.526     131.7770 17518.179    423.387
#> 97        6.155  8487.562         0.605     114.5698 18329.285    410.545
#> 98        5.814  8116.628         0.575     120.5473 18260.492    384.698
#> 99        3.798  5191.830         0.366           NA 15357.072    322.778
#> 100       3.152  3830.973         0.269           NA 14615.866    305.409
#> 101       1.004  1340.498         0.094           NA 11843.469    246.880
#> 102      16.684   624.294         1.597      43.4031   870.048    180.761
#> 103      14.494   569.152         1.351      51.3062   824.839    174.122
#> 104      11.918   499.444         1.115      62.1657   758.100    171.653
#> 105       9.512   405.639         0.864      80.2254   693.457    144.880
#> 106       8.961   529.504         1.116      62.1100   677.004    137.839
#> 107       8.862   857.628         1.782      38.8971   682.368    135.644
#> 108       8.845   929.147         1.895      36.5777   695.926    134.352
#> 109       8.838   837.892         1.679      41.2833   709.573    132.672
#> 110       7.485   606.133         1.197      57.9070   714.207    129.200
#> 111      22.977    79.668         2.552      27.1609    83.202     12.803
#> 112      16.321    73.092         1.856      37.3463    79.689     15.859
#> 113      13.409    61.706         1.448      47.8693    73.520     13.703
#> 114      11.151    53.164         1.167      59.3956    70.192     12.680
#> 115      10.186    50.699         1.052      65.8885    70.846     11.045
#> 116       9.362    47.219         0.970      71.4585    69.035     10.347
#> 117       8.848    45.140         0.919      75.4241    67.859      9.796
#> 118       8.566    44.142         0.890      77.8817    67.536      9.231
#> 119       7.537    39.329         0.787      88.0746    63.301      7.773
#> 120       5.793    30.204         0.600     115.5245    57.220      6.043
#> 121      -2.706   -59.341        -1.372           NA    40.917      2.198
#> 122      -1.833     2.718         0.063           NA    42.452      1.953
#> 123      -1.988   -12.537        -0.291           NA    43.443      1.530
#> 124      -4.009   -44.273        -1.058           NA    36.996      1.132
#> 125      -4.389   -50.297        -1.216           NA    36.663      1.100
#> 126      -4.814   -64.190        -1.574           NA    35.415      0.998
#> 127      -4.833   -44.474        -1.105           NA    35.134      0.896
#> 128      -4.855   -32.593        -0.818           NA    33.999      0.832
#> 129      -5.970   -32.160        -0.813           NA    33.454      0.718
#> 130      11.945    10.801         1.370      50.5947    15.077      0.924
#> 131       5.877    16.319         1.722      40.2524    11.839      0.356
#> 132       5.449    18.257         1.762      39.3387    12.126      0.274
#> 133       5.961    18.513         1.642      42.2136    13.358      0.244
#> 134       5.199    17.617         1.445      47.9687    13.710      0.190
#> 135       5.370    17.605         1.423      48.7103    14.234      0.211
#> 136       4.849    16.721         1.333      51.9990    13.995      0.219
#> 137       4.647    16.203         1.275      54.3645    14.015      0.233
#> 138       4.414    15.665         1.217      56.9554    14.172      0.224
#> 139       4.474    15.487         1.189      58.2967    14.510      0.231
#> 140       2.397    14.133         0.144           NA   147.784     20.156
#> 141       1.496    17.118         0.167           NA   151.605     16.620
#> 142      -0.045    -4.001        -0.039           NA   128.923     16.907
#> 143      -1.825   -14.272        -0.139           NA    90.473      4.587
#> 144      -0.536    20.691         0.201           NA   102.469      3.534
#> 145       0.913    44.489         0.425           NA   116.320      3.549
#> 146      -0.029     4.725         0.045           NA   110.923      2.670
#> 147       0.463    10.338         0.098           NA   112.635      2.649
#> 148       0.256     8.449         0.080           NA   114.314      2.635
#> 149       0.085     6.742         0.064           NA   113.821      2.450
#> 150      -0.040     5.134         0.049           NA   112.029      2.274
#> 151      -1.798   -14.625        -0.139           NA   110.250      2.130
#> 152       4.602    43.631         0.885      78.3217    70.888      5.863
#> 153       0.226     1.952         0.038           NA    57.062      3.018
#> 154       0.467    11.078         0.215           NA    63.245      1.656
#> 155       1.650    19.247         0.360           NA    66.726      1.101
#> 156       1.702    16.111         0.297           NA    64.094      0.819
#> 157       1.547    26.119         0.471           NA    62.763      0.853
#> 158       0.907    47.442         0.835      83.0116    57.806      0.601
#> 159       1.425    41.558         0.726      95.4748    60.927      0.585
#> 160       1.358    32.376         0.562     123.3358    61.052      0.484
#> 161       1.038    24.937         0.430           NA    61.189      0.410
#> 162       1.232    16.651         0.286           NA    61.068      0.345
#> 163       1.082    17.172         0.294           NA    60.993      0.276
#> 164       4.469    12.239         0.899      77.1020    21.282      1.528
#> 165       2.648     8.528         0.578     119.9217    22.026      2.248
#> 166       1.757     0.099         0.006           NA    22.221      2.898
#> 167      -3.866    -8.486        -0.607           NA    13.011      1.289
#> 168      -2.182    -8.171        -0.603           NA    14.372      1.110
#> 169       0.029    -3.741        -0.281           NA    15.822      0.731
#> 170      -1.091     2.832         0.215           NA    13.819      0.371
#> 171      -1.038    -0.286        -0.022           NA    14.027      0.317
#> 172      -1.337     3.437         0.261           NA    13.804      0.285
#> 173      -1.095     5.643         0.427           NA    14.309      0.276
#> 174      -0.992     4.071         0.307           NA    14.079      0.254
#> 175      -1.554     1.625         0.122           NA    13.235      0.225
#> 176       5.967  1919.627         0.499           NA  6292.743    550.405
#> 177       3.625  2255.265         0.555     124.8914  5707.452    485.021
#> 178       1.878  1464.482         0.349           NA  5122.955    326.838
#> 179       0.430   857.612         0.201           NA  4451.422    201.774
#> 180       0.335  1366.174         0.314           NA  4438.423    175.857
#> 181       0.601   921.677         0.209           NA  4594.647    153.189
#> 182      -0.730  1186.581         0.267           NA  4293.920    114.574
#> 183      -0.475   814.581         0.183           NA  4340.904    113.809
#> 184      -0.874   755.931         0.170           NA  4286.861    107.573
#> 185      -1.114   857.871         0.192           NA  4205.778     99.855
#> 186      -1.212   873.223         0.195           NA  4128.312     93.861
#> 187      -2.508   -56.531        -0.013           NA  4042.442     86.845
#> 188       4.520   -15.764        -0.342           NA    64.856      6.734
#> 189       3.927    16.555         0.346           NA    63.090      3.472
#> 190       3.036    24.052         0.482           NA    65.208      1.817
#> 191       1.403     9.755         0.188           NA    56.622      1.611
#> 192       1.846    18.934         0.361           NA    57.577      1.570
#> 193       1.817    23.831         0.444           NA    60.608      1.372
#> 194       0.511    15.457         0.282           NA    55.202      0.949
#> 195      -0.232    16.046         0.292           NA    52.612      0.817
#> 196      -0.643     9.808         0.178           NA    50.135      0.715
#> 197      -1.260     4.873         0.088           NA    47.488      0.630
#> 198      -1.538     7.172         0.130           NA    45.598      0.583
#> 199      -1.624     8.534         0.154           NA    46.440      0.550
#> 200       6.029   489.328         0.963      71.9779   848.797     76.495
#> 201       4.708   308.658         0.572     121.1796   801.935     51.961
#> 202       4.259   286.029         0.502     138.0771   770.879     27.098
#> 203       4.161   419.097         0.705      98.3187   781.114     22.564
#> 204       4.010   438.568         0.712      97.3521   778.088     21.356
#> 205       4.067   310.595         0.490           NA   804.924     19.987
#> 206       2.617   169.564         0.261           NA   760.246     15.918
#> 207       2.396   171.475         0.263           NA   744.662     14.867
#> 208       1.860   224.366         0.344           NA   724.569     14.179
#> 209       1.713   245.167         0.374           NA   717.219     12.632
#> 210       1.562   174.666         0.266           NA   711.582     12.074
#> 211       0.476   176.971         0.269           NA   695.934     11.000
#> 212      -0.940    97.749         0.120           NA   765.246     30.006
#> 213      -1.734   -60.945        -0.074           NA   692.239     24.901
#> 214      -2.290   -54.980        -0.068           NA   676.779     19.614
#> 215      -2.425   976.171         1.189      58.2967   732.501     16.040
#> 216      -1.553   388.933         0.470           NA   788.207     18.365
#> 217      -1.854   298.876         0.360           NA   784.399     16.376
#> 218      -2.085   230.121         0.276           NA   787.696     14.851
#> 219      -2.009   151.241         0.181           NA   778.799     13.634
#> 220      -2.579   -12.197        -0.015           NA   775.194     12.359
#> 221       8.252    18.016         0.206           NA   146.092     11.987
#> 222       6.825   113.352         1.174      59.0415   151.877     19.136
#> 223       1.650    43.216         0.421           NA   108.433      7.776
#> 224       0.162    56.414         0.523     132.5329   106.714      3.617
#> 225       0.330    36.917         0.336           NA   108.760      3.147
#> 226       0.399     6.436         0.058           NA   114.952      3.090
#> 227      -2.850   -74.291        -0.687           NA    92.051      2.218
#> 228      -2.503   -16.506        -0.153           NA    93.010      2.367
#> 229      -3.527   -27.435        -0.255           NA    88.544      2.281
#> 230      -3.344   -17.945        -0.167           NA    86.431      2.244
#> 231      -4.046    -6.591        -0.061           NA    83.587      2.198
#> 232      -3.567   -31.822        -0.297           NA    84.746      2.184
#> 233       2.987    30.718         0.298           NA   151.076     21.704
#> 234       0.414   -13.367        -0.125           NA   149.274     21.382
#> 235      -2.042    -4.214        -0.041           NA   124.904     14.405
#> 236      -3.664   -23.927        -0.235           NA    97.513      7.814
#> 237      -3.695   -20.274        -0.201           NA    97.761      6.223
#> 238      -3.899   -28.319        -0.284           NA    90.709      5.335
#> 239      -3.978   -25.284        -0.257           NA    91.977      5.890
#> 240      -3.276   -32.074        -0.327           NA    94.367      6.011
#> 241      -3.882   -17.781        -0.182           NA    93.191      5.543
#> 242      -3.973    -4.641        -0.047           NA    91.697      5.252
#> 243      -3.868    -3.453        -0.035           NA    91.271      5.051
#> 244      -4.868   -38.327        -0.393           NA    93.065      5.037
#> 245      12.695     0.833         0.407           NA     4.062      0.703
#> 246      13.118     2.367         1.038      66.7772     4.536      0.603
#> 247      11.968     2.081         0.817      84.8405     4.771      0.342
#> 248       8.689     4.314         1.534      45.1856     4.279      0.243
#> 249       8.069     6.323         2.130      32.5421     4.248      0.140
#> 250       9.082     0.828         0.260           NA     4.924      0.148
#> 251       5.841     3.437         1.039      66.7129     4.129      0.081
#> 252       5.018     5.807         1.731      40.0432     4.013      0.072
#> 253       5.126    10.109         2.943      23.5524     4.004      0.064
#> 254       5.394     8.536         2.419      28.6543     4.169      0.058
#> 255       5.885     7.155         1.984      34.9369     4.403      0.053
#> 256       5.923     4.674         1.275      54.3645     4.486      0.048
#> 257      21.843 19019.375         2.199      31.5210 28171.519   5842.354
#> 258      18.890 19840.326         1.875      36.9678 29111.712   5976.175
#> 259      16.485 18105.600         1.568      44.2058 28063.000   3670.155
#> 260      14.469 17941.202         1.443      48.0351 26900.711   2455.102
#> 261      12.207 15555.749         1.171      59.1928 25147.251   1104.747
#> 262      12.056 16283.848         1.212      57.1904 25207.147    889.944
#> 263      11.322 15142.360         1.114      62.2215 24466.744    937.068
#> 264      11.240 14860.968         1.081      64.1209 24620.205    941.198
#> 265      10.698 13881.528         0.999      69.3841 24124.983    923.694
#> 266       9.530 13293.239         0.948      73.1168 23485.339    899.984
#> 267      17.716  3262.335         1.778      38.9847  4735.739    731.122
#> 268      14.257  3038.038         1.406      49.2992  4686.376    583.595
#> 269      13.642  3072.742         1.331      52.0772  4852.370    505.768
#> 270      12.834  3103.362         1.260      55.0117  5015.256    484.347
#> 271      11.074  2870.790         1.097      63.1857  4861.441    412.927
#> 272      10.636  2785.548         1.053      65.8259  4799.811    384.347
#> 273      10.034  2652.932         0.992      69.8737  4689.219    354.704
#> 274       9.584  2557.445         0.947      73.1940  4628.645    330.053
#> 275       9.351  2517.624         0.924      75.0159  4607.562    310.881
#> 276       7.831  2133.345         0.776      89.3231  4582.350    294.399
#> 277      10.486    22.169         0.749      92.5430    64.468      2.035
#> 278      12.024    38.193         1.118      61.9989    74.072      3.490
#> 279       6.291    13.900         0.396           NA    53.096      2.609
#> 280       6.100    54.510         1.434      48.3366    54.379      3.207
#> 281       7.831    96.522         2.323      29.8384    60.653      2.420
#> 282      10.549    21.118         0.463           NA    75.667      2.079
#> 283       7.653    49.370         1.050      66.0140    65.608      1.159
#> 284       7.090    52.662         1.108      62.5584    63.823      1.077
#> 285       6.646    60.853         1.265      54.7942    61.783      1.008
#> 286       6.227    63.737         1.308      52.9929    60.961      0.943
#> 287       5.773    58.134         1.178      58.8410    59.149      0.855
#> 288       4.887    40.097         0.805      86.1052    56.491      0.800
#> 289      14.911   246.498         5.425      12.7769    92.622      3.893
#> 290      15.884   160.487         2.626      26.3956   131.441      4.447
#> 291      15.243   113.524         1.687      41.0876   139.012      4.050
#> 292      16.770   135.938         1.853      37.4068   159.952      3.708
#> 293      15.951   158.177         1.964      35.2926   171.255      2.957
#> 294      16.042   156.017         1.900      36.4814   174.190      2.904
#> 295      15.911   147.565         1.765      39.2718   176.495      2.834
#> 296      15.671   148.975         1.751      39.5858   177.004      2.677
#> 297      14.981   145.840         1.685      41.1363   174.772      2.498
#> 298      14.021   139.964         1.590      43.5942   171.034      2.348
#> 299       7.094   316.525         0.593     116.8882   900.250     50.162
#> 300       1.567   384.027         0.681     101.7837   639.671     43.679
#> 301       0.433    59.997         0.105           NA   569.623     19.011
#> 302      -0.304    38.657         0.067           NA   540.787     10.674
#> 303      -0.170   248.714         0.425           NA   553.647      9.427
#> 304      -0.341   253.872         0.422           NA   562.390      9.811
#> 305      -2.754  -127.420        -0.210           NA   479.589      7.076
#> 306      -2.506   -66.997        -0.111           NA   467.188      6.584
#> 307      -3.374  -108.582        -0.180           NA   452.694      6.049
#> 308      -3.330  -117.057        -0.194           NA   434.892      5.625
#> 309      -3.731  -177.668        -0.295           NA   419.609      5.100
#> 310      -5.715  -257.066        -0.429           NA   408.035      4.565
#> 311      11.324  1242.070         1.164      59.5487  1952.254     22.070
#> 312       7.224   762.694         0.644     107.6315  1596.738     13.959
#> 313       2.803   470.505         0.381           NA  1176.898     17.673
#> 314       1.594   225.870         0.178           NA  1197.065     19.812
#> 315      -0.342    69.323         0.054           NA  1078.811     16.823
#> 316      -1.287   -33.090        -0.026           NA  1070.600     13.382
#> 317      -2.624  -164.961        -0.130           NA   994.851     11.819
#> 318      -3.001   -66.882        -0.053           NA   967.960     11.006
#> 319      -3.511  -123.640        -0.097           NA   937.434      9.992
#> 320      -3.935  -178.875        -0.141           NA   910.945      8.990
#> 321      -4.478  -249.143        -0.197           NA   864.781      8.032
#> 322      -4.613  -540.618        -0.428           NA   840.688      7.157
#> 323      22.341   699.014         2.148      32.2694   987.604     19.511
#> 324      15.068   426.347         1.118      61.9989   853.589     27.874
#> 325       9.801   511.354         1.160      59.7541   684.376      9.477
#> 326       7.700   275.106         0.588     117.8822   599.446      4.868
#> 327       3.937   140.590         0.294           NA   432.815      3.230
#> 328       4.010   247.609         0.508     136.4463   449.665      2.819
#> 329       2.860   422.241         0.828      83.7134   424.787      2.513
#> 330       2.223   205.614         0.401           NA   397.938      2.203
#> 331       1.306   171.249         0.333           NA   356.023      1.614
#> 332       0.383   137.998         0.267           NA   322.572      1.609
#> 333      -0.246   115.906         0.224           NA   295.280      1.198
#> 334      -0.912    65.365         0.126           NA   270.034      0.969
#> 335      -5.160   -27.907        -1.178           NA    20.319      1.768
#> 336      -4.903   -22.111        -0.987           NA    22.042      1.743
#> 337      -4.747   -46.094        -2.197           NA    20.254      1.157
#> 338      -3.197   -17.158        -0.868           NA    22.211      0.748
#> 339      -3.331   -18.850        -0.962           NA    22.133      0.653
#> 340      -4.024   -15.688        -0.808           NA    21.019      0.598
#> 341      -4.853   -14.324        -0.743           NA    19.471      0.525
#> 342      -4.651   -12.326        -0.644           NA    18.887      0.524
#> 343      -5.692   -13.953        -0.734           NA    17.629      0.462
#> 344      -1.394   -20.952        -0.599           NA    34.162      3.054
#> 345      -4.164   -65.196        -1.962           NA    29.937      2.560
#> 346      -3.345   -89.249        -2.881           NA    31.778      1.607
#> 347      -3.470   -32.644        -1.123           NA    31.732      1.183
#> 348      -3.506   -40.665        -1.417           NA    31.113      1.066
#> 349      -3.852   -38.929        -1.376           NA    29.217      0.919
#> 350      -4.025   -14.740        -0.526           NA    28.319      0.805
#> 351      -3.854    -0.100        -0.004           NA    27.513      0.687
#> 352      -6.567     1.513         0.054           NA    25.191      0.534
#> 353       0.558     1.044         0.308           NA     4.380      0.326
#> 354       0.100     0.879         0.242           NA     4.190      0.236
#> 355       2.758     5.042         1.321      52.4714     4.899      0.152
#> 356       3.883     6.207         1.423      48.7103     5.564      0.140
#> 357       3.352     7.877         1.693      40.9419     5.291      0.144
#> 358       3.745     9.816         1.935      35.8216     5.757      0.108
#> 359       3.336    13.280         2.332      29.7233     5.992      0.085
#> 360       3.249    14.660         2.513      27.5825     5.967      0.078
#> 361       2.808    11.319         1.898      36.5199     6.058      0.073
#> 362       2.867    11.892         1.956      35.4370     6.153      0.070
#> 363       2.791    12.232         1.972      35.1495     6.138      0.068
#> 364       2.654     8.636         1.370      50.5947     6.389      0.062
#> 365       7.695     3.400         0.924      75.0159     5.605      0.084
#> 366       3.362     2.932         0.733      94.5631     4.490      0.248
#> 367       2.129     2.513         0.608     114.0045     3.936      0.296
#> 368       2.686     1.879         0.445           NA     4.047      0.250
#> 369       2.554    10.725         2.410      28.7613     4.231      0.148
#> 370       2.696     9.852         2.164      32.0308     4.361      0.150
#> 371       2.240    15.415         3.295      21.0363     4.205      0.139
#> 372       1.906    17.895         3.693      18.7692     4.286      0.134
#> 373       1.427    21.021         4.171      16.6182     4.241      0.124
#> 374       0.901     7.361         1.421      48.7788     4.393      0.116
#> 375      34.505  1589.290         3.128      22.1594  2262.194    345.463
#> 376      28.130  1640.963         2.438      28.4310  2357.249    424.083
#> 377      23.261  1604.692         1.938      35.7661  2436.563    415.069
#> 378      18.711  1488.988         1.510      45.9038  2385.977    376.041
#> 379      16.375  1422.356         1.344      51.5735  2318.498    385.890
#> 380      14.598  1617.916         1.424      48.6761  2310.124    424.284
#> 381      12.459  1217.334         1.005      68.9699  2206.765    379.883
#> 382      11.822  1140.755         0.933      74.2923  2162.620    363.080
#> 383      11.217  1156.659         0.937      73.9752  2124.252    355.498
#> 384      10.966  1190.648         0.956      72.5049  2122.316    351.401
#> 385      10.794  1187.895         0.945      73.3489  2122.565    352.012
#> 386       8.136   884.249         0.697      99.4472  2100.438    347.600
#> 387       9.932   162.066         1.242      55.8090   239.164     12.112
#> 388       4.657   119.963         0.847      81.8356   180.232      5.579
#> 389       4.763   125.158         0.833      83.2109   200.500      4.660
#> 390       4.235   127.311         0.793      87.4082   208.618      3.394
#> 391       3.225    30.592         0.186           NA   189.568      2.803
#> 392       2.931    82.868         0.494           NA   185.182      2.611
#> 393       1.478    80.880         0.473           NA   172.414      1.587
#> 394       1.448   113.640         0.661     104.8634   173.884      1.499
#> 395       1.234   107.714         0.622     111.4385   171.568      1.421
#> 396       0.971   104.105         0.598     115.9109   170.390      1.344
#> 397       1.103   128.350         0.732      94.6922   171.329      1.291
#> 398       0.142    70.098         0.397           NA   171.111      1.203
#> 399      13.320    42.093         1.492      46.4576    62.139      8.110
#> 400       7.729     8.890         0.283           NA    50.770      5.972
#> 401       9.818   103.781         3.055      22.6889    59.775      5.100
#> 402       7.701    23.112         0.599     115.7174    56.573      3.817
#> 403       7.212    49.033         1.186      58.4441    57.243      4.072
#> 404       7.945    41.273         0.949      73.0397    63.378      4.534
#> 405       6.058    98.812         2.142      32.3598    59.854      2.851
#> 406       5.758   102.670         2.178      31.8249    58.552      2.500
#> 407       5.183    93.293         1.939      35.7477    58.574      2.309
#> 408       4.849    82.898         1.692      40.9661    57.387      2.079
#> 409       4.900    94.213         1.888      36.7133    58.824      2.011
#> 410       4.862    66.772         1.317      52.6308    57.391      1.827
#> 411       6.737    25.069         0.647     107.1325    64.789      6.416
#> 412       2.359    13.405         0.328           NA    50.991      3.774
#> 413       3.495    16.637         0.392           NA    60.908      2.733
#> 414       3.371    24.948         0.556     124.6668    59.170      1.521
#> 415       3.300    33.844         0.732      94.6922    56.454      1.114
#> 416       3.930    62.082         1.270      54.5785    60.651      1.312
#> 417       3.440    48.096         0.927      74.7732    58.610      0.721
#> 418       3.420    44.328         0.847      81.8356    58.544      0.614
#> 419       2.967    37.311         0.707      98.0406    56.370      0.480
#> 420       2.658    32.589         0.614     112.8904    54.921      0.403
#> 421       2.556    39.367         0.736      94.1776    54.260      0.345
#> 422       2.312    23.719         0.441           NA    53.029      0.274
#> 423      11.024 10667.005         1.156      59.9608 19151.273   2070.601
#> 424       8.654  9742.837         0.953      72.7332 17948.928   2029.305
#> 425       7.259 10479.687         0.942      73.5825 17536.382   1732.092
#> 426       5.471  8578.820         0.714      97.0794 16429.998   1519.658
#> 427       4.781  8955.280         0.719      96.4043 16064.357   1384.669
#> 428       4.470  9161.082         0.709      97.7641 16235.055   1332.389
#> 429       3.418 10075.417         0.753      92.0514 15816.503   1025.971
#> 430       3.303  9228.473         0.685     101.1894 15723.081    969.605
#> 431       2.863  9525.217         0.702      98.7389 15432.024    922.126
#> 432       2.581  8915.954         0.653     106.1481 15203.687    881.556
#> 433       2.323  8228.000         0.598     115.9109 14914.119    849.021
#> 434       0.843  3408.601         0.247           NA 14468.992    802.891
#> 435       8.252   201.673         0.620     111.7979   541.223     42.230
#> 436      10.120   317.616         0.893      77.6201   699.317     46.507
#> 437       4.042   103.462         0.272           NA   547.537     42.324
#> 438       0.172    -9.319        -0.024           NA   377.996     27.207
#> 439      -0.015   -42.464        -0.111           NA   364.523     20.348
#> 440       1.122   162.381         0.426           NA   422.071     19.146
#> 441      -0.122    -0.758        -0.002           NA   379.618     12.648
#> 442       0.008    -5.340        -0.014           NA   392.402     11.847
#> 443       0.269   -11.273        -0.029           NA   409.081     10.685
#> 444      -0.426   -16.503        -0.043           NA   392.611      9.513
#> 445      -0.564   -13.869        -0.036           NA   382.207      8.358
#> 446      -2.615   -95.876        -0.251           NA   359.575      7.024
#> 447      10.480  -100.991        -1.165           NA   183.199     11.367
#> 448       6.837    96.639         0.990      70.0149   157.952     17.307
#> 449       1.675   -18.120        -0.181           NA   116.719      9.798
#> 450       1.554    76.573         0.745      93.0399   118.781      7.515
#> 451       0.383    19.581         0.186           NA   108.826      5.440
#> 452      -0.207    -7.812        -0.074           NA   100.745      4.033
#> 453      -2.099   -24.968        -0.241           NA    84.792      2.254
#> 454      -2.130   -22.822        -0.221           NA    86.453      2.174
#> 455      -2.151    -8.234        -0.080           NA    85.621      2.122
#> 456      -2.445    -2.748        -0.027           NA    86.023      2.052
#> 457      -2.374    38.468         0.372           NA    85.246      2.032
#> 458      -3.657    16.144         0.156           NA    83.378      1.775
#> 459      11.080   293.653         1.467      47.2493   418.706     57.007
#> 460       6.496   127.248         0.574     120.7573   381.606     46.813
#> 461       2.802    26.108         0.114           NA   315.316     48.736
#> 462      -1.284  -120.761        -0.548           NA   228.113     31.042
#> 463      -2.511  -184.451        -0.870           NA   229.483     30.556
#> 464      -1.345  -149.848        -0.733           NA   225.478     23.979
#> 465      -3.236  -100.039        -0.503           NA   204.558     19.060
#> 466      -2.772   -87.899        -0.444           NA   208.708     19.360
#> 467      -2.759   -87.399        -0.444           NA   213.626     19.364
#> 468      -3.196   -95.660        -0.488           NA   206.794     18.462
#> 469      -3.543   -97.000        -0.497           NA   196.640     17.481
#> 470      -5.566  -121.146        -0.625           NA   193.180     17.024
#> 471      -6.939  -467.691        -0.319           NA  1268.072    156.905
#> 472      -6.002  -604.437        -0.418           NA  1472.805    169.930
#> 473      -1.990    21.171         0.015           NA  1815.200    128.620
#> 474       0.448   449.845         0.310           NA  1934.705     81.322
#> 475       0.306   492.278         0.338           NA  1886.740     71.444
#> 476      -0.497   323.966         0.222           NA  1695.524     60.216
#> 477      -1.211   162.727         0.111           NA  1612.827     53.991
#> 478      -2.003    43.116         0.029           NA  1496.027     49.241
#> 479      -4.788  -366.653        -0.250           NA  1458.020     48.727
#> 480      24.256   860.914         5.323      13.0217   444.729     22.842
#> 481      18.285   894.518         4.351      15.9308   433.035     22.893
#> 482      17.459   944.181         3.754      18.4642   506.348     20.001
#> 483      17.139   979.036         3.266      21.2231   581.656     15.486
#> 484      17.375   506.705         1.650      42.0089   600.614     15.072
#> 485      17.650  -377.518        -1.226           NA   610.217     14.673
#> 486      17.511  -457.045        -1.505           NA   599.367     14.216
#> 487      15.780   672.427         2.207      31.4068   550.793     12.824
#> 488      14.168   364.364         1.176      58.9411   515.334     11.569
#> 489       8.339    32.816         0.725      95.6065    80.287      8.603
#> 490       8.929    38.921         0.782      88.6377    95.369      9.610
#> 491       4.575    14.698         0.279           NA    79.350      9.175
#> 492       0.308     0.820         0.015           NA    54.799      5.238
#> 493       0.142     0.200         0.004           NA    54.374      4.165
#> 494       1.392     5.692         0.106           NA    60.529      4.086
#> 495       0.429     4.876         0.090           NA    55.555      3.415
#> 496       1.032     9.086         0.167           NA    57.430      3.590
#> 497       0.830     7.797         0.143           NA    57.903      3.604
#> 498       0.703     7.266         0.133           NA    57.597      3.518
#> 499       0.805     7.521         0.138           NA    57.083      3.428
#> 500      -0.563     1.275         0.023           NA    56.663      3.314
#> 501       6.174    11.002         0.632     109.6752    28.160      3.380
#> 502       7.256    16.946         0.890      77.8817    32.124      4.110
#> 503       1.513     3.640         0.182           NA    22.332      1.700
#> 504      -0.339     2.438         0.123           NA    18.095      0.531
#> 505      -0.176     5.967         0.299           NA    18.151      0.351
#> 506       1.747     3.166         0.155           NA    22.373      0.266
#> 507       0.432     1.600         0.078           NA    20.695      0.209
#> 508       0.027     1.252         0.061           NA    20.392      0.194
#> 509      -0.260     0.822         0.040           NA    20.288      0.185
#> 510      -0.640    13.319         0.644     107.6315    19.535      0.180
#> 511      -0.841    14.599         0.701      98.8798    19.241      0.194
#> 512      -2.452    23.361         1.111      62.3895    18.658      0.183
#> 513      25.015   996.537         3.376      20.5316  1023.204    132.351
#> 514      20.503  1095.115         2.688      25.7867  1170.837    185.168
#> 515      11.174   390.147         0.827      83.8147  1017.081    181.864
#> 516       9.385   495.733         1.002      69.1764  1124.291    137.545
#> 517      10.829   635.408         1.214      57.0961  1160.896    143.462
#> 518      11.790  1309.929         2.309      30.0194  1191.603    171.513
#> 519      11.201  -237.900        -0.415           NA  1160.623    152.601
#> 520      11.208   989.122         1.716      40.3932  1154.876    133.420
#> 521      11.061   966.555         1.649      42.0344  1163.460    122.767
#> 522      10.944   983.215         1.650      42.0089  1173.511    127.811
#> 523       9.839   965.776         1.595      43.4575  1182.285    125.169
#> 524      11.221   318.834         0.943      73.5045   661.752     18.021
#> 525       7.598   305.369         0.814      85.1532   571.317     39.108
#> 526       1.944    45.292         0.116           NA   406.392     18.885
#> 527       1.044   219.113         0.534     129.8028   399.049     11.725
#> 528       1.747   706.598         1.607      43.1330   458.937     13.050
#> 529       2.186   171.833         0.367           NA   481.432     11.874
#> 530      -0.080    -5.718        -0.012           NA   417.031      8.114
#> 531      -0.056   103.888         0.222           NA   406.867      7.805
#> 532      -0.712   167.761         0.358           NA   389.984      7.534
#> 533      -1.206   280.690         0.596     116.2999   370.110      6.922
#> 534      -1.284   403.906         0.851      81.4509   357.540      6.664
#> 535      -3.189    84.834         0.178           NA   343.355      6.075
#> 536       3.677    76.809         0.955      72.5809   109.578      9.256
#> 537       0.580    14.869         0.179           NA    96.593      4.181
#> 538       3.242    63.421         0.741      93.5421   122.849      3.764
#> 539      -0.381    21.526         0.243           NA    90.029      1.718
#> 540       1.016    36.203         0.401           NA   101.129      1.614
#> 541       2.515    74.754         0.797      86.9695   114.261      1.887
#> 542       2.352   103.581         1.057      65.5768   114.014      1.180
#> 543       2.498   144.016         1.451      47.7703   115.765      1.128
#> 544       2.234   125.147         1.244      55.7192   114.397      1.079
#> 545       2.204   109.939         1.080      64.1803   114.683      1.039
#> 546       2.421    97.502         0.949      73.0397   113.665      0.881
#> 547       1.383    51.621         0.499           NA   112.697      0.756
#> 548       6.925    24.482         0.396           NA    99.828      5.089
#> 549       2.208    31.793         0.503     137.8026    73.088      2.366
#> 550       2.733    76.768         1.144      60.5898    82.303      1.522
#> 551       2.042    39.139         0.545     127.1830    77.396      1.193
#> 552       1.461    44.058         0.593     116.8882    72.245      1.051
#> 553       2.076    92.647         1.184      58.5428    79.172      0.867
#> 554       2.110    89.360         1.079      64.2398    85.476      0.586
#> 555       2.575    92.574         1.105      62.7283    86.752      0.595
#> 556       2.274    64.880         0.767      90.3712    86.532      0.519
#> 557       2.265    60.553         0.711      97.4891    86.891      0.481
#> 558       2.016    61.806         0.721      96.1369    85.393      0.408
#> 559       1.017    64.309         0.744      93.1649    85.214      0.339
#> 560      27.074   841.011         2.296      30.1893  1486.223    226.030
#> 561      24.016   938.559         2.067      33.5340  1528.957    257.544
#> 562      18.646  1017.265         1.816      38.1689  1425.757    192.094
#> 563      15.598   824.539         1.260      55.0117  1401.449    173.751
#> 564      12.962   724.431         1.045      66.3299  1302.959    131.911
#> 565      11.227   879.010         1.198      57.8587  1261.173    101.950
#> 566      11.651  1995.430         2.494      27.7926  1389.210     83.866
#> 567      11.368  1280.295         1.568      44.2058  1400.744     80.243
#> 568      11.109  1582.852         1.905      36.3857  1392.487     73.392
#> 569      10.593  1081.761         1.281      54.1099  1362.283     64.612
#> 570       9.575   801.646         0.939      73.8176  1288.466     55.961
#> 571       7.300   666.393         0.774      89.5539  1194.951     48.346
#> 572       4.279   222.930         0.400           NA   896.322     91.820
#> 573       1.533    61.076         0.109           NA   749.962     68.647
#> 574       2.599   206.262         0.360           NA   797.555     67.414
#> 575       1.147   221.660         0.375           NA   684.572     52.634
#> 576       2.287   446.860         0.737      94.0498   729.201     49.934
#> 577       3.878   519.174         0.824      84.1198   812.048     46.311
#> 578       2.651   521.172         0.797      86.9695   779.219     27.381
#> 579       2.681   501.324         0.761      91.0837   776.038     25.699
#> 580       2.240   420.902         0.634     109.3292   757.154     23.602
#> 581       1.728   375.106         0.562     123.3358   733.085     21.759
#> 582       1.626   341.860         0.509     136.1782   714.388     19.931
#> 583      -0.064   139.947         0.208           NA   687.269     17.619
#> 584       9.304  2678.338         1.289      53.7740  3894.161    643.793
#> 585       7.574  2336.792         1.017      68.1561  3745.108    566.796
#> 586       7.869  3078.442         1.215      57.0492  4172.065    515.763
#> 587       5.445  2781.131         0.988      70.1566  3956.650    460.896
#> 588       5.354  2952.521         0.998      69.4536  4055.468    405.461
#> 589       4.747  3071.180         0.987      70.2277  3978.953    365.963
#> 590       3.908  2996.655         0.919      75.4241  3982.193    225.274
#> 591       3.706  3109.205         0.945      73.3489  3952.809    207.266
#> 592       3.241  2941.261         0.885      78.3217  3872.480    192.789
#> 593       2.977  2762.415         0.824      84.1198  3816.077    180.736
#> 594       2.754  2704.723         0.801      86.5352  3772.693    172.214
#> 595       0.760   587.461         0.173           NA  3641.990    157.671
#>        CBR    TFR    NRR    MAC   SRB    Deaths DeathsMale DeathsFemale    CDR
#> 1   22.078 3.0342 1.4199 27.650 105.4   256.538    139.323      117.215  7.832
#> 2   19.328 2.5906 1.2236 27.827 105.5   281.694    150.118      131.576  7.570
#> 3   18.306 2.4259 1.1487 27.945 105.9   289.667    153.513      136.154  7.386
#> 4   18.314 2.4109 1.1422 27.896 106.1   314.839    161.596      153.243  7.625
#> 5   17.665 2.3496 1.1187 27.985 105.7   323.877    169.545      154.332  7.449
#> 6   16.789 2.2407 1.0673 27.993 105.6   345.261    178.664      166.597  7.865
#> 7   16.155 2.1676 1.0337 28.168 105.3   340.237    171.472      168.765  7.682
#> 8   15.332 2.0666 0.9861 28.314 105.3   338.605    172.733      165.872  7.583
#> 9   13.902 1.8815 0.8985 28.543 105.2   345.229    174.649      170.580  7.676
#> 10  11.799 1.6006 0.7651 28.837 105.2   381.886    198.550      183.335  8.450
#> 11  20.405 2.8596 1.3527 27.104 105.1   111.711     62.200       49.510  8.866
#> 12  15.340 1.9007 0.9064 27.146 105.7   107.574     60.141       47.433  7.307
#> 13  15.369 1.9080 0.9132 28.324 105.7   118.986     64.256       54.730  6.948
#> 14  13.042 1.7645 0.8485 29.476 105.3   129.227     67.571       61.655  6.754
#> 15  13.060 1.8495 0.8896 30.099 105.6   132.450     68.365       64.085  6.526
#> 16  13.618 1.9483 0.9392 30.423 105.5   143.711     73.809       69.902  6.491
#> 17  12.756 1.8026 0.8688 30.797 105.7   158.342     81.115       77.227  6.612
#> 18  12.727 1.7920 0.8636 30.969 105.8   159.873     82.510       77.364  6.571
#> 19  12.459 1.7451 0.8398 31.060 106.0   165.430     85.456       79.974  6.689
#> 20  12.500 1.7428 0.8398 31.130 105.9   160.793     83.661       77.132  6.401
#> 21  11.981 1.6660 0.8026 31.221 105.8   166.046     86.252       79.794  6.516
#> 22  11.465 1.5928 0.7677 31.293 105.8   163.847     85.816       78.031  6.365
#> 23   9.742 1.3638 0.6580 28.232 105.1    77.152     35.363       41.789  9.628
#> 24   9.431 1.4060 0.6805 29.008 104.6    75.444     35.114       40.330  9.168
#> 25   9.362 1.4402 0.6944 29.794 105.6    77.427     36.753       40.674  9.256
#> 26   9.669 1.4922 0.7171 30.515 106.6    83.285     39.921       43.364  9.635
#> 27   9.975 1.5314 0.7374 30.603 106.1    80.857     39.014       41.842  9.254
#> 28   9.927 1.5209 0.7323 30.700 106.2    83.380     39.952       43.427  9.476
#> 29   9.660 1.4788 0.7153 30.831 105.4    84.398     40.920       43.477  9.545
#> 30   9.542 1.4642 0.7076 30.963 105.4    83.684     40.914       42.771  9.423
#> 31   9.356 1.4393 0.6953 31.007 105.4    84.148     43.096       41.052  9.432
#> 32  14.701 2.2536 1.0610 27.158 105.9   118.669     62.775       55.893 12.322
#> 33  12.556 1.6928 0.8048 26.668 105.8   113.638     59.426       54.212 11.557
#> 34  12.430 1.6252 0.7800 27.856 105.1   104.263     52.810       51.453 10.467
#> 35  11.303 1.6631 0.8019 28.799 104.9   105.242     52.431       52.812 10.266
#> 36  11.308 1.7542 0.8466 29.300 105.3   103.317     51.219       52.098  9.860
#> 37  11.762 1.8494 0.8952 29.743 104.8   105.256     52.063       53.193  9.624
#> 38  10.747 1.6896 0.8177 30.354 104.9   110.820     53.739       57.081  9.829
#> 39  10.668 1.6755 0.8118 30.456 104.9   108.142     53.410       54.732  9.542
#> 40  10.435 1.6410 0.7953 30.600 104.6   109.775     53.847       55.928  9.649
#> 41  10.264 1.6158 0.7838 30.724 104.5   110.783     54.038       56.746  9.694
#> 42  10.217 1.6087 0.7802 30.808 104.6   108.977     53.248       55.729  9.484
#> 43  10.014 1.5750 0.7637 30.815 104.7   127.251     62.339       64.912 11.027
#> 44  35.231 4.9345 2.0004 29.044 104.6   998.070    550.957      447.114 10.465
#> 45  32.417 4.0373 1.7310 28.383 104.4  1041.387    570.713      470.674  8.592
#> 46  24.765 2.8964 1.3052 26.973 104.7  1040.554    581.663      458.890  6.977
#> 47  19.879 2.2472 1.0503 26.102 104.5  1087.228    621.343      465.885  6.248
#> 48  17.176 1.9422 0.9184 26.110 104.5  1088.912    625.052      463.860  5.896
#> 49  15.338 1.7857 0.8500 26.480 104.5  1123.718    643.728      479.990  5.801
#> 50  14.684 1.7770 0.8488 26.889 104.5  1219.162    687.976      531.186  6.045
#> 51  14.146 1.7275 0.8253 26.986 104.5  1265.251    716.381      548.870  6.226
#> 52  14.123 1.7399 0.8316 27.156 104.5  1280.587    720.632      559.955  6.256
#> 53  14.022 1.7445 0.8341 27.360 104.5  1306.179    733.387      572.792  6.337
#> 54  13.548 1.7049 0.8153 27.499 104.5  1338.510    746.041      592.469  6.452
#> 55  12.995 1.6528 0.7905 27.584 104.5  1565.282    843.530      721.753  7.502
#> 56  16.387 2.1788 1.0164 24.649 106.8    77.005     41.045       35.959  9.069
#> 57  14.487 2.0563 0.9676 23.882 106.4    97.468     53.313       44.155 11.001
#> 58  12.091 1.7948 0.8519 23.888 105.8   109.393     60.206       49.187 12.400
#> 59   9.016 1.2905 0.6135 24.922 105.7   115.128     61.613       53.515 14.390
#> 60   9.342 1.3579 0.6475 25.928 105.9   113.225     60.733       52.491 14.714
#> 61  10.226 1.5666 0.7487 26.936 105.7   109.565     57.384       52.181 14.731
#> 62   9.181 1.5276 0.7310 27.393 106.2   110.010     57.000       53.010 15.327
#> 63   9.123 1.5414 0.7399 27.496 105.8   107.364     55.988       51.376 15.063
#> 64   9.037 1.5572 0.7476 27.580 105.7   109.605     56.685       52.920 15.490
#> 65   8.860 1.5579 0.7453 27.632 106.3   108.369     56.261       52.107 15.427
#> 66   8.817 1.5801 0.7573 27.707 106.0   107.892     55.997       51.895 15.467
#> 67   8.486 1.5567 0.7468 27.766 106.0   124.104     65.627       58.477 17.899
#> 68  16.607 2.2665 1.0672 27.200 106.0   153.475     90.074       63.400  7.158
#> 69  14.790 1.6576 0.7903 26.969 105.6   170.532     97.275       73.257  6.951
#> 70  14.501 1.6963 0.8143 27.775 105.4   192.937    104.306       88.631  6.943
#> 71  10.674 1.5105 0.7268 28.819 105.5   220.884    113.004      107.880  7.150
#> 72  10.568 1.5656 0.7537 29.568 105.3   233.959    117.868      116.090  7.212
#> 73  11.049 1.6417 0.7910 30.022 105.3   244.280    122.576      121.704  7.143
#> 74  10.694 1.6010 0.7718 30.591 105.1   268.732    135.351      133.381  7.473
#> 75  10.551 1.5896 0.7658 30.714 105.2   270.980    137.333      133.648  7.454
#> 76  10.266 1.5482 0.7450 30.853 105.5   282.311    143.673      138.637  7.670
#> 77  10.035 1.5096 0.7266 31.021 105.2   289.728    147.242      142.486  7.769
#> 78   9.855 1.4755 0.7108 31.159 105.3   288.926    147.593      141.333  7.647
#> 79   9.490 1.4133 0.6799 31.258 105.4   311.994    161.005      150.989  8.173
#> 80  28.770 3.7777 1.6607 28.066 104.2    82.846     46.209       36.637  8.415
#> 81  23.234 2.7440 1.2822 27.266 104.3    69.114     38.825       30.289  6.005
#> 82  22.136 2.5787 1.2253 27.216 105.2    70.507     39.393       31.114  5.247
#> 83  16.322 2.0456 0.9833 27.616 104.5    77.693     42.991       34.702  5.011
#> 84  14.230 1.8248 0.8767 27.925 105.0    85.634     46.675       38.960  5.238
#> 85  14.230 1.8441 0.8899 27.907 104.1    98.971     52.401       46.570  5.760
#> 86  13.147 1.7373 0.8399 28.622 104.0   110.193     57.908       52.285  6.106
#> 87  12.685 1.6855 0.8158 28.961 103.7   111.181     58.344       52.836  6.086
#> 88  11.763 1.5625 0.7560 29.197 103.9   112.042     58.475       53.567  6.037
#> 89  11.698 1.5432 0.7466 29.379 104.0   117.053     61.323       55.731  6.196
#> 90  10.940 1.4300 0.6918 29.669 104.1   124.016     64.929       59.087  6.460
#> 91  10.097 1.3070 0.6328 29.992 104.1   143.199     77.453       65.746  7.393
#> 92  24.341 2.5140 1.1027 26.075 111.8  7975.059   4335.160     3639.899  6.913
#> 93  13.824 1.6281 0.7135 26.312 117.2  7780.052   4315.541     3464.511  6.128
#> 94  12.674 1.6238 0.7191 26.742 117.8  8214.687   4593.115     3621.572  6.271
#> 95  13.253 1.6865 0.7563 27.446 117.1  8788.797   4918.450     3870.347  6.503
#> 96  12.548 1.6696 0.7609 28.081 115.0  9521.879   5393.546     4128.333  6.820
#> 97  13.055 1.7719 0.8104 28.180 114.5  9688.663   5500.205     4188.458  6.900
#> 98  12.929 1.7953 0.8265 28.286 113.3 10049.252   5779.955     4269.296  7.115
#> 99  10.822 1.5387 0.7072 28.485 113.9  9967.028   5665.064     4301.964  7.024
#> 100 10.267 1.4961 0.6880 28.563 113.9 10128.804   5731.211     4397.592  7.115
#> 101  8.305 1.2357 0.5760 28.870 111.2 10411.385   5959.604     4451.781  7.301
#> 102 22.258 2.5737 1.2106 26.465 104.7   217.878    130.840       87.038  5.574
#> 103 19.579 2.3087 1.0929 26.251 104.8   214.221    124.491       89.729  5.085
#> 104 16.930 2.0102 0.9565 26.055 104.6   224.435    127.716       96.719  5.012
#> 105 14.764 1.7707 0.8455 26.244 104.5   246.690    137.005      109.685  5.252
#> 106 14.271 1.7194 0.8214 26.266 104.5   251.872    139.908      111.964  5.310
#> 107 14.177 1.7168 0.8202 26.318 104.5   255.822    142.111      113.711  5.315
#> 108 14.195 1.7145 0.8196 26.355 104.5   262.298    145.965      116.333  5.350
#> 109 14.218 1.7103 0.8179 26.371 104.6   268.512    149.203      119.309  5.380
#> 110 14.106 1.6937 0.8102 26.386 104.6   335.210    192.750      142.460  6.621
#> 111 26.653 3.1675 1.5042 27.183 105.6    11.474      6.465        5.009  3.676
#> 112 20.237 2.4127 1.1540 26.480 105.1    15.421      8.617        6.804  3.916
#> 113 17.253 2.0382 0.9786 26.495 104.7    16.381      9.109        7.271  3.844
#> 114 15.407 1.8271 0.8778 26.434 104.8    19.392     10.808        8.584  4.256
#> 115 14.704 1.7966 0.8655 26.902 104.6    21.766     12.244        9.522  4.518
#> 116 14.184 1.7458 0.8416 26.968 104.4    23.467     12.945       10.522  4.822
#> 117 13.812 1.7140 0.8257 27.092 104.5    24.391     13.410       10.981  4.964
#> 118 13.622 1.7056 0.8222 27.218 104.4    25.067     13.966       11.101  5.056
#> 119 12.661 1.5999 0.7717 27.463 104.3    25.619     14.052       11.567  5.124
#> 120 11.366 1.4477 0.6980 27.820 104.4    28.056     15.802       12.254  5.573
#> 121  9.458 1.4227 0.6817 27.783 105.9    52.624     25.673       26.950 12.164
#> 122  9.841 1.5057 0.7226 28.307 105.9    50.362     25.929       24.433 11.674
#> 123 10.100 1.5513 0.7439 29.138 106.4    51.994     25.756       26.238 12.088
#> 124  8.843 1.4032 0.6748 29.891 106.1    53.770     26.449       27.321 12.852
#> 125  8.863 1.4274 0.6892 30.080 105.3    54.816     26.801       28.015 13.252
#> 126  8.682 1.4227 0.6850 30.245 105.9    55.053     26.733       28.320 13.496
#> 127  8.729 1.4720 0.7081 30.350 106.3    54.586     27.076       27.509 13.562
#> 128  8.529 1.4703 0.7075 30.463 106.0    53.353     26.227       27.127 13.384
#> 129  8.461 1.4843 0.7145 30.573 106.0    57.059     28.008       29.051 14.431
#> 130 19.124 2.4023 1.1425 27.176 106.9     5.659      3.112        2.547  7.179
#> 131 12.493 1.6378 0.7842 28.701 106.6     6.270      3.452        2.818  6.616
#> 132 11.702 1.4788 0.7103 29.523 106.5     6.479      3.600        2.879  6.253
#> 133 11.844 1.4337 0.6900 30.391 106.5     6.635      3.751        2.884  5.883
#> 134 11.242 1.3230 0.6372 31.155 106.5     7.369      4.078        3.292  6.043
#> 135 11.505 1.3572 0.6538 31.283 106.5     7.589      4.192        3.397  6.135
#> 136 11.158 1.3232 0.6373 31.369 106.5     7.914      4.354        3.559  6.309
#> 137 11.029 1.3189 0.6352 31.510 106.5     8.110      4.369        3.740  6.382
#> 138 11.014 1.3295 0.6403 31.640 106.5     8.491      4.559        3.932  6.600
#> 139 11.142 1.3614 0.6546 31.656 106.5     8.683      4.826        3.857  6.668
#> 140 15.078 1.9202 0.9077 24.995 105.4   124.293     65.469       58.824 12.681
#> 141 14.754 2.0761 0.9853 24.742 106.1   136.227     69.103       67.124 13.258
#> 142 12.514 1.8848 0.9023 24.814 105.4   129.386     66.519       62.867 12.559
#> 143  8.838 1.1464 0.5497 27.166 106.4   109.155     54.945       54.211 10.663
#> 144  9.968 1.2810 0.6172 28.624 105.7   107.981     54.051       53.930 10.504
#> 145 11.116 1.5087 0.7288 29.556 105.4   106.761     54.145       52.616 10.203
#> 146 10.540 1.5885 0.7681 29.952 105.4   111.228     55.943       55.285 10.569
#> 147 10.695 1.6521 0.7982 29.955 105.4   107.765     54.867       52.898 10.232
#> 148 10.844 1.7149 0.8301 29.990 105.2   111.611     56.504       55.107 10.588
#> 149 10.790 1.7442 0.8458 30.064 104.7   112.925     57.311       55.614 10.705
#> 150 10.614 1.7534 0.8486 30.138 105.0   112.452     57.356       55.096 10.654
#> 151 10.450 1.7635 0.8540 30.207 105.1   129.215     66.579       62.635 12.248
#> 152 14.383 1.9559 0.9280 26.697 106.1    48.210     26.129       22.081  9.781
#> 153 11.138 1.5402 0.7381 26.847 105.3    55.903     30.138       25.765 10.912
#> 154 12.302 1.6644 0.7976 28.419 105.7    60.842     31.101       29.740 11.835
#> 155 12.496 1.7649 0.8503 29.680 105.3    57.913     28.238       29.675 10.846
#> 156 11.826 1.7982 0.8698 30.216 104.9    54.869     26.733       28.136 10.124
#> 157 11.313 1.8582 0.8994 30.583 105.0    54.179     26.681       27.498  9.766
#> 158 10.171 1.7125 0.8267 30.940 105.6    52.654     26.284       26.370  9.264
#> 159 10.636 1.7747 0.8550 30.980 105.9    52.764     26.432       26.332  9.211
#> 160 10.590 1.7489 0.8448 31.041 105.6    53.222     26.884       26.338  9.232
#> 161 10.561 1.7265 0.8333 31.185 105.8    55.175     27.924       27.250  9.523
#> 162 10.502 1.6976 0.8191 31.282 105.8    53.901     27.460       26.441  9.270
#> 163 10.459 1.6777 0.8097 31.432 105.8    54.679     27.922       26.757  9.377
#> 164 15.627 2.1707 1.0256 26.721 105.5    15.196      7.039        8.157 11.158
#> 165 14.918 2.0247 0.9537 25.700 105.8    18.116      8.642        9.474 12.270
#> 166 14.151 2.0418 0.9675 25.555 106.0    19.462      9.402       10.059 12.394
#> 167  9.314 1.3473 0.6401 26.892 106.6    18.412      9.293        9.120 13.180
#> 168 10.608 1.5147 0.7217 28.044 106.6    17.329      8.843        8.486 12.790
#> 169 11.883 1.7158 0.8252 29.182 105.8    15.783      7.750        8.033 11.854
#> 170 10.512 1.5805 0.7573 29.889 106.5    15.253      7.213        8.040 11.603
#> 171 10.660 1.6035 0.7645 30.158 107.1    15.392      7.325        8.068 11.698
#> 172 10.478 1.5957 0.7640 30.357 107.0    15.565      7.311        8.254 11.815
#> 173 10.824 1.6702 0.8035 30.498 106.2    15.757      7.388        8.368 11.919
#> 174 10.611 1.6614 0.7991 30.605 106.1    15.395      7.228        8.167 11.603
#> 175  9.954 1.5876 0.7649 30.724 106.1    15.302      7.222        8.080 11.508
#> 176 16.371 2.3493 1.0973 27.405 105.8  3999.042   2066.259     1932.783 10.404
#> 177 14.034 1.9054 0.9022 26.688 105.9  4233.074   2189.207     2043.867 10.409
#> 178 12.198 1.6265 0.7761 27.492 105.7  4334.517   2206.717     2127.800 10.320
#> 179 10.410 1.4494 0.6954 28.892 105.8  4267.541   2148.182     2119.359  9.980
#> 180 10.214 1.4711 0.7077 29.494 105.7  4293.096   2159.500     2133.596  9.879
#> 181 10.428 1.5652 0.7546 29.997 105.5  4329.758   2169.369     2160.389  9.827
#> 182  9.673 1.5332 0.7397 30.510 105.6  4617.891   2284.908     2332.983 10.403
#> 183  9.757 1.5609 0.7538 30.584 105.4  4552.170   2268.480     2283.690 10.232
#> 184  9.618 1.5544 0.7504 30.678 105.5  4676.135   2316.658     2359.477 10.492
#> 185  9.419 1.5348 0.7409 30.780 105.5  4703.136   2337.234     2365.902 10.533
#> 186  9.228 1.5164 0.7323 30.870 105.4  4670.527   2323.985     2346.542 10.440
#> 187  9.028 1.4937 0.7214 30.964 105.5  5165.605   2599.563     2566.042 11.536
#> 188 14.080 1.8218 0.8685 27.166 104.9    44.038     23.761       20.277  9.560
#> 189 13.200 1.6301 0.7829 27.722 105.2    44.317     23.701       20.617  9.273
#> 190 13.077 1.7760 0.8553 28.842 104.6    50.070     24.998       25.072 10.041
#> 191 10.939 1.7256 0.8315 29.584 105.3    49.358     24.035       25.323  9.536
#> 192 10.975 1.8006 0.8716 29.898 104.4    47.893     24.050       23.843  9.129
#> 193 11.300 1.8629 0.9023 30.181 104.8    50.860     25.535       25.325  9.483
#> 194 10.074 1.6454 0.7980 30.583 104.8    52.402     25.972       26.430  9.563
#> 195  9.574 1.5649 0.7599 30.766 104.4    53.888     26.915       26.973  9.806
#> 196  9.102 1.4873 0.7207 30.873 104.7    53.679     26.862       26.817  9.745
#> 197  8.610 1.4072 0.6796 30.985 105.4    54.439     27.173       27.266  9.870
#> 198  8.258 1.3507 0.6529 31.073 105.1    54.093     27.103       26.990  9.796
#> 199  8.398 1.3739 0.6648 31.180 105.1    55.419     27.953       27.466 10.022
#> 200 16.704 2.4805 1.1723 27.167 105.4   542.407    278.663      263.744 10.675
#> 201 14.867 1.9509 0.9310 26.850 105.3   547.995    285.832      262.163 10.159
#> 202 13.527 1.7822 0.8548 28.306 105.3   528.158    274.186      253.973  9.268
#> 203 13.132 1.8757 0.9039 29.364 105.2   533.655    274.127      259.528  8.971
#> 204 12.626 1.9159 0.9266 29.673 104.9   530.936    273.219      257.717  8.616
#> 205 12.692 2.0173 0.9775 29.965 104.6   546.959    278.716      268.242  8.625
#> 206 11.711 1.9266 0.9330 30.407 104.8   590.329    294.517      295.812  9.094
#> 207 11.441 1.8917 0.9157 30.506 104.9   588.735    293.538      295.197  9.045
#> 208 11.099 1.8587 0.8998 30.616 104.9   603.186    298.102      305.084  9.239
#> 209 10.947 1.8366 0.8882 30.721 105.1   604.978    300.219      304.759  9.234
#> 210 10.826 1.8262 0.8851 30.787 104.7   608.890    301.149      307.741  9.264
#> 211 10.560 1.7852 0.8651 30.896 104.7   664.556    331.151      333.406 10.084
#> 212  9.355 1.3862 0.6680 28.766 105.4   842.093    391.838      450.256 10.295
#> 213  8.437 1.3445 0.6488 29.441 105.4   834.529    391.593      442.935 10.171
#> 214  8.373 1.3997 0.6767 30.282 105.1   861.871    411.254      450.616 10.663
#> 215  8.925 1.5007 0.7250 30.870 105.3   931.619    453.523      478.096 11.350
#> 216  9.524 1.5911 0.7698 30.860 105.1   916.758    452.167      464.591 11.077
#> 217  9.439 1.5696 0.7589 31.001 105.3   938.507    461.856      476.652 11.293
#> 218  9.448 1.5656 0.7565 31.125 105.4   961.483    474.262      487.221 11.533
#> 219  9.320 1.5409 0.7446 31.215 105.4   946.642    470.120      476.522 11.329
#> 220  9.269 1.5315 0.7399 31.315 105.5   990.849    496.737      494.112 11.848
#> 221 16.700 2.4352 1.1296 27.433 106.9    73.901     39.461       34.440  8.448
#> 222 15.733 2.2967 1.0787 26.146 107.4    85.989     48.555       37.435  8.908
#> 223 10.570 1.4663 0.7000 27.185 106.1    91.509     48.674       42.835  8.920
#> 224  9.897 1.3309 0.6373 29.432 106.5   104.966     55.259       49.706  9.735
#> 225  9.904 1.3575 0.6512 29.894 106.7   105.135     55.731       49.404  9.574
#> 226 10.333 1.4848 0.7143 30.392 106.3   110.514     57.675       52.839  9.934
#> 227  8.507 1.3280 0.6395 31.215 106.2   122.897     63.141       59.756 11.357
#> 228  8.632 1.3820 0.6652 31.293 106.3   119.986     60.782       59.204 11.135
#> 229  8.234 1.3500 0.6495 31.376 106.4   126.469     63.830       62.639 11.761
#> 230  8.054 1.3500 0.6500 31.473 106.3   122.310     61.789       60.521 11.398
#> 231  7.798 1.3373 0.6438 31.586 106.3   126.948     63.381       63.567 11.844
#> 232  7.921 1.3860 0.6669 31.684 106.4   122.913     61.551       61.362 11.488
#> 233 14.646 1.9797 0.9165 25.461 106.7   120.265     62.598       57.667 11.659
#> 234 13.957 1.9199 0.9093 24.680 105.0   144.848     76.501       68.348 13.543
#> 235 12.032 1.8571 0.8855 25.605 104.8   146.110     77.097       69.013 14.074
#> 236  9.569 1.3196 0.6298 27.243 106.2   134.856     70.065       64.791 13.233
#> 237  9.712 1.3123 0.6292 28.449 106.0   134.954     69.439       65.516 13.407
#> 238  9.090 1.2570 0.6053 29.297 105.5   129.616     64.902       64.714 12.989
#> 239  9.348 1.4464 0.6968 29.549 105.6   131.114     63.284       67.829 13.326
#> 240  9.619 1.5141 0.7301 29.563 105.6   126.510     62.460       64.050 12.895
#> 241  9.523 1.5241 0.7349 29.676 105.6   131.174     63.808       67.365 13.405
#> 242  9.381 1.5218 0.7336 29.731 105.6   130.528     63.813       66.715 13.354
#> 243  9.342 1.5308 0.7378 29.758 105.7   129.068     62.645       66.423 13.210
#> 244  9.546 1.5755 0.7596 29.794 105.8   140.532     68.473       72.059 14.414
#> 245 19.867 2.8155 1.3426 27.204 105.6     1.467      0.821        0.646  7.172
#> 246 19.881 2.4781 1.1934 27.120 105.6     1.543      0.879        0.664  6.763
#> 247 18.721 2.3022 1.1086 27.991 105.4     1.721      0.919        0.802  6.753
#> 248 15.214 2.0713 1.0040 28.893 104.5     1.835      0.910        0.926  6.525
#> 249 14.311 2.0456 0.9909 29.441 104.9     1.853      0.949        0.904  6.242
#> 250 15.478 2.1916 1.0582 30.013 105.0     2.035      1.074        0.961  6.396
#> 251 12.476 1.8085 0.8735 30.352 105.4     2.196      1.072        1.123  6.635
#> 252 11.960 1.7438 0.8418 30.459 105.7     2.330      1.204        1.125  6.942
#> 253 11.655 1.7107 0.8211 30.557 106.2     2.243      1.123        1.120  6.529
#> 254 11.816 1.7099 0.8221 30.603 106.7     2.266      1.147        1.119  6.422
#> 255 12.207 1.7439 0.8397 30.754 106.5     2.280      1.162        1.118  6.322
#> 256 12.237 1.7179 0.8263 30.712 106.3     2.315      1.171        1.143  6.314
#> 257 32.569 4.0446 1.6055 25.791 106.9  9277.646   4843.812     4433.834 10.726
#> 258 27.518 3.3498 1.3878 25.477 109.5  9127.431   4805.474     4321.957  8.628
#> 259 24.304 2.9584 1.2584 26.150 109.4  9027.957   4841.768     4186.189  7.819
#> 260 21.633 2.5985 1.1342 26.269 109.6  8908.604   4841.147     4067.458  7.164
#> 261 18.936 2.2887 1.0248 26.986 109.0  8936.423   4851.310     4085.113  6.729
#> 262 18.756 2.2840 1.0272 27.466 108.8  9004.533   4879.168     4125.365  6.700
#> 263 17.995 2.1934 0.9912 27.535 108.6  9072.751   4907.555     4165.196  6.673
#> 264 17.910 2.1843 0.9918 27.534 108.4  9169.448   4953.379     4216.068  6.670
#> 265 17.368 2.1203 0.9669 27.535 108.2  9264.482   5001.016     4263.466  6.670
#> 266 16.744 2.0468 0.9375 27.534 107.9 10118.286   5549.728     4568.558  7.214
#> 267 25.808 3.1137 1.3420 27.948 106.9  1484.947    792.880      692.066  8.092
#> 268 21.688 2.5033 1.1214 28.149 106.3  1605.639    846.039      759.600  7.431
#> 269 21.018 2.4524 1.1130 28.330 106.2  1702.847    894.794      808.053  7.376
#> 270 20.362 2.4616 1.1280 28.384 106.0  1854.129    971.152      882.977  7.528
#> 271 18.569 2.3465 1.0855 28.675 105.9  1962.168   1031.097      931.071  7.495
#> 272 18.138 2.3111 1.0704 28.765 105.9  1985.267   1043.583      941.684  7.502
#> 273 17.540 2.2528 1.0448 28.817 105.9  2006.819   1056.535      950.285  7.506
#> 274 17.146 2.2192 1.0299 28.869 106.0  2041.291   1077.145      964.145  7.562
#> 275 16.909 2.2050 1.0250 28.945 106.0  2059.518   1086.548      972.970  7.558
#> 276 16.674 2.1890 1.0185 29.018 106.0  2430.254   1305.407     1124.847  8.843
#> 277 21.770 3.8496 1.8086 30.364 105.9    33.416     18.351       15.065 11.284
#> 278 21.689 3.2051 1.5235 29.713 106.0    33.007     18.078       14.930  9.665
#> 279 15.110 2.1103 1.0053 29.931 106.5    30.991     16.721       14.270  8.819
#> 280 14.300 1.8927 0.9069 30.440 105.9    31.182     16.128       15.054  8.200
#> 281 14.597 1.8654 0.8974 31.160 105.4    28.116     14.411       13.705  6.766
#> 282 16.597 2.0559 0.9947 31.411 105.0    27.574     14.175       13.400  6.048
#> 283 13.952 1.8609 0.8993 31.918 105.2    29.620     15.010       14.610  6.299
#> 284 13.427 1.8163 0.8782 32.086 105.3    30.125     15.417       14.708  6.337
#> 285 12.844 1.7719 0.8559 32.142 105.4    29.812     15.235       14.577  6.198
#> 286 12.511 1.7614 0.8506 32.237 105.4    30.617     15.873       14.744  6.284
#> 287 11.989 1.7181 0.8300 32.389 105.4    30.667     16.081       14.585  6.216
#> 288 11.338 1.6533 0.7989 32.535 105.5    32.141     16.659       15.482  6.451
#> 289 20.379 2.8398 1.3602 28.893 105.3    24.853     13.196       11.657  5.468
#> 290 21.508 2.9212 1.4040 29.574 105.7    34.371     17.734       16.637  5.624
#> 291 20.661 2.7933 1.3452 29.958 105.6    36.452     18.396       18.057  5.418
#> 292 21.802 3.0285 1.4627 30.291 105.3    36.915     18.649       18.266  5.032
#> 293 21.266 3.0930 1.4920 30.508 105.8    42.802     21.727       21.074  5.315
#> 294 21.217 3.1129 1.5013 30.542 105.8    42.485     20.952       21.534  5.175
#> 295 21.107 3.1228 1.5077 30.592 105.5    43.445     22.147       21.298  5.196
#> 296 20.799 3.1032 1.5010 30.661 105.3    43.643     22.002       21.642  5.128
#> 297 20.187 3.0341 1.4675 30.736 105.3    45.069     22.566       22.503  5.206
#> 298 19.435 2.9374 1.4217 30.769 105.4    47.643     24.386       23.257  5.414
#> 299 16.862 2.3959 1.1176 28.288 105.8   521.512    276.775      244.737  9.768
#> 300 11.339 1.6466 0.7792 27.508 106.6   551.286    294.017      257.269  9.772
#> 301  9.988 1.3314 0.6364 28.912 106.2   544.946    283.030      261.916  9.555
#> 302  9.442 1.2491 0.5993 30.380 106.2   558.193    280.453      277.739  9.746
#> 303  9.461 1.3325 0.6403 30.858 106.4   563.628    278.404      285.223  9.631
#> 304  9.348 1.4430 0.6954 31.223 106.0   582.908    284.102      298.807  9.689
#> 305  7.917 1.3445 0.6485 31.625 105.9   646.399    307.319      339.080 10.671
#> 306  7.725 1.3359 0.6454 31.741 105.6   618.758    297.643      321.114 10.231
#> 307  7.496 1.3170 0.6349 31.839 105.9   656.418    313.368      343.050 10.870
#> 308  7.215 1.2856 0.6201 31.948 105.9   635.634    303.628      332.006 10.545
#> 309  6.978 1.2591 0.6078 32.042 105.9   643.911    308.129      335.782 10.709
#> 310  6.810 1.2418 0.5994 32.126 105.9   750.380    363.912      386.468 12.525
#> 311 18.295 2.0350 0.9569 27.820 107.1   743.914    401.485      342.429  6.971
#> 312 13.491 1.7392 0.8316 27.776 106.0   741.742    397.772      343.970  6.267
#> 313  9.537 1.5087 0.7260 28.957 105.5   830.980    448.000      382.981  6.734
#> 314  9.424 1.3460 0.6482 29.663 105.8   994.661    539.232      455.429  7.830
#> 315  8.434 1.2455 0.6015 29.999 105.3  1122.516    603.234      519.282  8.776
#> 316  8.352 1.3573 0.6548 30.520 105.7  1235.559    654.639      580.921  9.639
#> 317  7.816 1.4153 0.6842 31.193 105.4  1328.705    689.662      639.044 10.440
#> 318  7.612 1.4078 0.6810 31.286 105.3  1349.573    698.922      650.652 10.613
#> 319  7.378 1.3899 0.6729 31.354 105.2  1383.637    715.947      667.690 10.889
#> 320  7.178 1.3734 0.6649 31.436 105.2  1410.420    726.149      684.271 11.113
#> 321  6.825 1.3234 0.6407 31.516 105.2  1432.117    735.299      696.818 11.303
#> 322  6.656 1.3036 0.6312 31.603 105.1  1423.305    735.039      688.266 11.269
#> 323 30.348 4.4586 1.9291 29.959 106.1   260.575    148.842      111.734  8.007
#> 324 22.380 2.7338 1.2421 28.085 106.1   278.898    165.012      113.886  7.312
#> 325 15.525 1.6025 0.7211 27.199 115.7   252.318    148.091      104.227  5.724
#> 326 12.818 1.4672 0.6881 28.919 110.0   239.373    138.911      100.462  5.118
#> 327  9.045 1.1151 0.5305 29.978 107.8   244.403    139.365      105.038  5.108
#> 328  9.220 1.2264 0.5886 30.945 106.6   254.109    144.530      109.579  5.210
#> 329  8.332 1.2017 0.5815 31.839 105.3   278.964    155.076      123.888  5.472
#> 330  7.757 1.1401 0.5523 32.009 105.2   283.904    157.067      126.836  5.534
#> 331  6.915 1.0351 0.4993 32.266 106.1   288.803    158.947      129.856  5.609
#> 332  6.246 0.9512 0.4602 32.452 105.5   302.790    166.349      136.441  5.863
#> 333  5.704 0.8805 0.4259 32.702 105.6   307.997    168.557      139.440  5.950
#> 334  5.207 0.8121 0.3915 32.867 105.7   317.301    173.715      143.585  6.119
#> 335  8.580 1.2445 0.5942 26.978 105.1    32.541     16.254       16.287 13.740
#> 336  9.841 1.3894 0.6654 27.902 104.9    33.023     16.654       16.369 14.744
#> 337  9.655 1.3671 0.6566 28.807 105.1    30.213     14.629       15.584 14.402
#> 338 11.230 1.7065 0.8146 29.415 107.0    28.535     13.364       15.171 14.427
#> 339 11.293 1.7423 0.8301 29.555 107.2    28.661     13.529       15.132 14.624
#> 340 10.820 1.6984 0.8093 29.688 107.2    28.835     13.586       15.250 14.844
#> 341 10.101 1.6125 0.7699 29.879 107.1    28.825     13.550       15.275 14.954
#> 342  9.866 1.6092 0.7680 29.969 106.9    27.789     12.987       14.802 14.517
#> 343  9.273 1.5462 0.7400 30.053 106.7    28.450     13.173       15.278 14.965
#> 344  9.759 1.3831 0.6573 26.641 106.4    39.041     20.463       18.578 11.153
#> 345  9.011 1.2912 0.6209 27.475 104.7    43.771     23.395       20.376 13.175
#> 346 10.259 1.4992 0.7205 28.776 105.4    42.142     21.599       20.543 13.604
#> 347 10.921 1.7052 0.8182 29.455 105.8    41.815     20.547       21.269 14.391
#> 348 10.844 1.6923 0.8115 29.607 106.1    41.171     20.348       20.823 14.350
#> 349 10.327 1.6332 0.7860 29.812 105.7    40.116     19.280       20.836 14.179
#> 350 10.105 1.6352 0.7886 30.054 105.1    39.599     19.001       20.598 14.130
#> 351  9.843 1.6102 0.7768 30.211 105.2    38.285     18.477       19.807 13.697
#> 352  9.011 1.4871 0.7178 30.356 105.2    43.553     21.252       22.301 15.578
#> 353 12.908 1.9729 0.9117 27.106 106.1     4.191      2.296        1.895 12.350
#> 354 11.520 1.4961 0.7052 27.385 105.4     4.154      2.121        2.033 11.420
#> 355 12.834 1.6023 0.7563 28.345 105.9     3.846      1.886        1.960 10.076
#> 356 12.758 1.7610 0.8314 29.270 106.8     3.871      1.915        1.956  8.875
#> 357 11.370 1.6308 0.7712 29.825 106.2     3.731      1.790        1.941  8.018
#> 358 11.346 1.6217 0.7732 30.741 105.2     3.857      1.915        1.942  7.601
#> 359 10.521 1.4645 0.6973 31.500 105.4     4.092      1.975        2.117  7.185
#> 360 10.226 1.4149 0.6738 31.726 105.1     4.071      2.050        2.021  6.977
#> 361 10.155 1.3925 0.6644 31.880 105.0     4.382      2.146        2.237  7.347
#> 362 10.118 1.3797 0.6593 32.070 104.8     4.409      2.212        2.197  7.251
#> 363  9.898 1.3426 0.6387 32.177 104.8     4.408      2.200        2.207  7.107
#> 364 10.131 1.3612 0.6470 32.250 105.0     4.715      2.397        2.318  7.477
#> 365 15.234 2.0413 0.9760 28.855 106.3     2.774      1.414        1.359  7.539
#> 366 11.228 1.6715 0.8003 28.371 106.1     3.145      1.730        1.415  7.866
#> 367  9.523 1.3771 0.6576 28.068 106.8     3.056      1.601        1.455  7.394
#> 368  9.575 1.3750 0.6559 29.440 107.0     2.912      1.482        1.429  6.889
#> 369  9.509 1.3760 0.6554 30.252 107.2     3.095      1.645        1.450  6.955
#> 370  9.579 1.3657 0.6500 30.451 107.2     3.134      1.605        1.529  6.883
#> 371  8.986 1.2714 0.6072 30.523 106.9     3.156      1.709        1.447  6.746
#> 372  8.844 1.2273 0.5871 30.647 106.8     3.362      1.817        1.545  6.938
#> 373  8.415 1.1503 0.5467 30.667 106.8     3.522      1.886        1.637  6.988
#> 374  8.476 1.1315 0.5408 30.775 106.7     3.925      2.094        1.832  7.575
#> 375 44.518 6.5295 2.7303 29.031 103.7   508.813    274.550      234.263 10.013
#> 376 35.026 4.7390 2.1073 28.364 104.0   464.120    266.188      197.932  6.896
#> 377 29.420 3.4436 1.5929 27.687 103.8   510.110    285.366      224.744  6.159
#> 378 24.192 2.7140 1.2837 27.285 103.8   540.563    293.694      246.869  5.481
#> 379 21.912 2.4947 1.1867 26.954 103.8   585.859    315.109      270.750  5.537
#> 380 20.331 2.3402 1.1162 26.651 103.9   651.365    358.610      292.755  5.733
#> 381 18.227 2.1368 1.0227 26.608 103.9   698.394    384.924      313.470  5.768
#> 382 17.690 2.0856 0.9987 26.681 103.9   717.395    396.497      320.898  5.868
#> 383 17.214 2.0406 0.9769 26.720 103.9   740.091    410.372      329.718  5.997
#> 384 17.037 2.0300 0.9724 26.792 103.9   756.309    421.758      334.550  6.071
#> 385 16.877 2.0200 0.9683 26.791 103.9   765.041    427.917      337.125  6.083
#> 386 16.565 1.9900 0.9528 26.790 103.9  1068.736    613.784      454.951  8.429
#> 387 18.324 2.5726 1.2254 28.189 105.1   109.531     60.979       48.551  8.392
#> 388 12.726 1.5959 0.7658 27.728 105.0   114.284     63.330       50.954  8.069
#> 389 13.339 1.6140 0.7761 29.285 105.0   128.911     66.579       62.332  8.576
#> 390 12.991 1.7211 0.8305 30.285 104.8   140.610     68.634       71.977  8.756
#> 391 11.513 1.7055 0.8227 30.546 105.2   136.475     66.221       70.254  8.288
#> 392 11.042 1.7871 0.8668 30.761 104.5   136.028     65.758       70.269  8.111
#> 393 10.078 1.6567 0.8016 31.159 105.2   147.131     70.764       76.368  8.600
#> 394 10.107 1.6577 0.8004 31.267 105.4   148.975     71.912       77.063  8.659
#> 395  9.908 1.6165 0.7814 31.376 105.3   150.192     72.303       77.889  8.674
#> 396  9.781 1.5845 0.7678 31.467 104.8   153.488     74.307       79.181  8.810
#> 397  9.769 1.5718 0.7607 31.576 104.9   151.976     74.116       77.859  8.666
#> 398  9.702 1.5449 0.7474 31.659 105.0   168.607     83.961       84.646  9.560
#> 399 22.018 3.1684 1.5003 26.634 105.1    24.547     13.492       11.055  8.698
#> 400 16.136 2.0320 0.9656 26.470 105.3    26.451     14.260       12.191  8.407
#> 401 17.597 2.1670 1.0363 27.733 105.4    26.426     13.904       12.522  7.779
#> 402 14.665 1.9773 0.9500 28.969 105.2    26.862     13.868       12.995  6.964
#> 403 13.843 1.9610 0.9442 29.497 105.0    27.420     13.627       13.793  6.631
#> 404 14.577 2.1654 1.0409 29.587 105.6    28.836     14.405       14.431  6.632
#> 405 12.972 1.9819 0.9533 30.153 105.6    31.901     15.953       15.948  6.914
#> 406 12.419 1.8758 0.9038 30.284 105.5    31.406     15.942       15.464  6.661
#> 407 12.171 1.8106 0.8722 30.346 105.3    33.633     16.968       16.664  6.988
#> 408 11.710 1.7189 0.8287 30.445 105.1    33.625     17.187       16.438  6.861
#> 409 11.790 1.7174 0.8273 30.521 105.2    34.379     17.648       16.732  6.890
#> 410 11.320 1.6297 0.7861 30.565 105.2    32.743     17.026       15.717  6.458
#> 411 16.718 2.5121 1.1963 27.012 105.9    38.682     21.347       17.334  9.981
#> 412 12.481 1.7224 0.8242 26.931 106.0    41.355     22.600       18.755 10.122
#> 413 14.360 1.9317 0.9268 28.112 105.7    46.085     23.881       22.204 10.865
#> 414 13.176 1.8539 0.8928 29.313 105.5    44.031     21.684       22.348  9.805
#> 415 12.211 1.8355 0.8864 29.794 105.1    41.196     20.099       21.097  8.911
#> 416 12.405 1.9409 0.9364 30.087 105.5    41.438     20.011       21.427  8.475
#> 417 11.293 1.7284 0.8338 30.719 105.9    40.756     19.690       21.065  7.853
#> 418 11.181 1.7046 0.8205 30.831 106.3    40.639     19.609       21.030  7.761
#> 419 10.683 1.6236 0.7817 30.967 106.3    40.713     19.605       21.109  7.716
#> 420 10.340 1.5661 0.7540 31.068 106.4    40.805     19.840       20.966  7.682
#> 421 10.146 1.5333 0.7381 31.278 106.3    40.591     20.019       20.573  7.590
#> 422  9.858 1.4818 0.7139 31.407 106.3    40.591     20.007       20.584  7.546
#> 423 20.747 2.8544 1.2984 27.442 105.5  8974.930   4808.417     4166.513  9.723
#> 424 17.561 2.2422 1.0437 26.863 105.3  9104.227   4854.099     4250.128  8.907
#> 425 15.765 2.0133 0.9511 27.280 105.5  9462.061   4947.568     4514.493  8.506
#> 426 13.683 1.8613 0.8886 27.936 105.3  9861.129   5045.625     4815.504  8.212
#> 427 12.895 1.8167 0.8707 28.311 105.1 10108.060   5167.862     4940.198  8.114
#> 428 12.561 1.8245 0.8767 28.682 105.1 10457.268   5357.586     5099.682  8.091
#> 429 11.820 1.7689 0.8512 29.238 105.0 11242.699   5747.111     5495.588  8.402
#> 430 11.666 1.7535 0.8440 29.362 104.9 11270.636   5796.677     5473.959  8.363
#> 431 11.371 1.7178 0.8267 29.454 105.0 11546.323   5932.009     5614.314  8.508
#> 432 11.127 1.6863 0.8120 29.544 104.9 11676.107   6013.916     5662.191  8.546
#> 433 10.847 1.6499 0.7947 29.609 104.9 11719.108   6050.093     5669.015  8.524
#> 434 10.479 1.5991 0.7697 29.678 104.9 13304.382   6970.141     6334.241  9.636
#> 435 16.631 2.2538 1.0419 27.210 106.6   272.690    144.790      127.900  8.379
#> 436 19.657 2.2775 1.0715 26.461 105.7   339.283    182.696      156.587  9.537
#> 437 14.388 2.0649 0.9771 26.259 105.9   393.734    211.660      182.074 10.346
#> 438  9.880 1.3656 0.6533 27.364 106.1   371.395    197.493      173.902  9.708
#> 439  9.561 1.2441 0.5970 28.169 105.9   365.071    195.846      169.226  9.576
#> 440 11.079 1.4065 0.6725 28.734 107.0   379.302    199.940      179.362  9.957
#> 441  9.920 1.3234 0.6377 29.196 105.7   384.264    199.004      185.260 10.042
#> 442 10.255 1.3886 0.6696 29.303 105.6   392.080    202.605      189.476 10.247
#> 443 10.694 1.4721 0.7095 29.436 105.6   398.803    205.099      193.704 10.425
#> 444 10.267 1.4433 0.6947 29.506 105.9   408.900    210.646      198.254 10.693
#> 445  9.999 1.4359 0.6915 29.638 105.8   403.771    208.215      195.555 10.563
#> 446  9.420 1.3840 0.6665 29.745 105.9   459.375    243.896      215.479 12.035
#> 447 21.131 3.0075 1.3335 29.098 106.7    92.336     47.572       44.763 10.651
#> 448 16.178 2.2451 1.0456 27.235 106.7    91.198     48.178       43.020  9.341
#> 449 11.684 1.5554 0.7386 27.350 106.1    99.984     52.128       47.855 10.009
#> 450 11.551 1.5378 0.7320 28.566 107.1   102.801     54.001       48.800  9.997
#> 451 10.361 1.4080 0.6750 29.227 106.4   104.798     54.605       50.193  9.978
#> 452  9.523 1.3815 0.6686 29.819 104.8   102.925     53.052       49.873  9.730
#> 453  8.176 1.3016 0.6302 30.884 105.1   106.551     53.433       53.119 10.275
#> 454  8.356 1.3562 0.6563 31.078 105.2   108.494     54.756       53.738 10.486
#> 455  8.288 1.3775 0.6673 31.188 104.9   107.841     54.157       53.683 10.439
#> 456  8.331 1.4114 0.6834 31.320 104.7   111.263     55.909       55.354 10.776
#> 457  8.242 1.4215 0.6881 31.414 105.0   109.809     54.793       55.015 10.616
#> 458  8.040 1.4055 0.6800 31.562 105.2   121.309     60.169       61.140 11.697
#> 459 20.923 2.8116 1.2776 26.663 105.7   196.974    100.117       96.857  9.843
#> 460 17.225 2.4347 1.1357 25.317 105.3   237.692    121.625      116.067 10.729
#> 461 13.746 1.8372 0.8617 25.449 104.9   251.056    131.147      119.909 10.944
#> 462 10.347 1.3032 0.6138 25.701 106.3   256.413    133.910      122.504 11.631
#> 463 10.818 1.3938 0.6600 26.636 106.2   282.749    144.425      138.325 13.329
#> 464 11.035 1.5742 0.7507 26.994 105.8   252.957    132.902      120.055 12.380
#> 465 10.294 1.6210 0.7751 27.625 106.1   268.849    136.518      132.332 13.530
#> 466 10.553 1.6916 0.8120 27.739 105.6   263.528    134.940      128.589 13.325
#> 467 10.850 1.7698 0.8498 27.858 105.5   267.948    136.616      131.331 13.609
#> 468 10.552 1.7534 0.8432 27.944 105.4   269.435    137.982      131.453 13.748
#> 469 10.083 1.7107 0.8231 28.036 105.3   265.725    135.452      130.273 13.626
#> 470  9.962 1.7256 0.8301 28.120 105.4   301.133    157.798      143.336 15.528
#> 471  8.643 1.1898 0.5584 25.765 106.4  2286.160   1213.601     1072.560 15.582
#> 472 10.186 1.2989 0.6139 26.492 105.9  2340.785   1269.891     1070.894 16.188
#> 473 12.611 1.5853 0.7502 27.542 105.8  2101.578   1101.108     1000.470 14.601
#> 474 13.315 1.7901 0.8530 28.198 105.9  1869.624    952.109      917.515 12.867
#> 475 12.942 1.7734 0.8462 28.390 105.9  1842.111    929.172      912.939 12.636
#> 476 11.598 1.6265 0.7773 28.511 105.9  1768.170    884.773      883.397 12.095
#> 477 11.014 1.5813 0.7564 28.637 105.8  1790.069    902.298      887.771 12.225
#> 478 10.209 1.5040 0.7199 28.725 105.8  1789.412    919.004      870.408 12.212
#> 479  9.961 1.5050 0.7195 28.793 105.8  2158.766   1072.865     1085.900 14.749
#> 480 27.490 4.2055 1.9762 31.303 105.0    52.325     30.534       21.791  3.234
#> 481 21.062 3.1610 1.5003 29.437 105.0    57.089     35.372       21.717  2.777
#> 482 20.127 2.8100 1.3416 29.529 105.1    67.126     44.635       22.491  2.668
#> 483 19.405 2.6300 1.2604 29.747 105.2    67.914     46.002       21.912  2.266
#> 484 19.553 2.6500 1.2706 29.811 105.2    66.911     45.464       21.447  2.178
#> 485 19.824 2.6700 1.2810 29.873 105.2    66.924     45.440       21.484  2.174
#> 486 19.739 2.6700 1.2818 29.937 105.2    67.662     45.640       22.023  2.228
#> 487 18.075 2.4900 1.1961 29.999 105.1    69.950     47.083       22.867  2.295
#> 488 16.628 2.2700 1.0910 30.078 105.1    76.244     51.799       24.445  2.460
#> 489 17.740 2.4147 1.1328 26.247 105.5    42.549     23.203       19.346  9.401
#> 490 19.163 2.3226 1.1032 25.387 105.0    50.931     28.106       22.825 10.234
#> 491 15.068 2.0760 0.9926 25.136 105.2    55.259     30.534       24.724 10.493
#> 492 10.186 1.2934 0.6212 26.586 105.3    53.142     28.331       24.811  9.878
#> 493 10.113 1.2623 0.6064 27.684 105.5    53.614     28.211       25.403  9.971
#> 494 11.226 1.4303 0.6908 28.639 104.7    53.025     27.428       25.597  9.834
#> 495 10.250 1.4025 0.6752 28.843 105.4    53.234     27.222       26.012  9.821
#> 496 10.582 1.4782 0.7121 28.798 105.4    51.832     26.563       25.270  9.550
#> 497 10.652 1.5214 0.7336 28.783 105.4    53.388     27.252       26.136  9.822
#> 498 10.581 1.5453 0.7441 28.808 105.4    53.768     27.548       26.220  9.878
#> 499 10.473 1.5662 0.7548 28.833 105.3    52.698     27.185       25.513  9.668
#> 500 10.387 1.5914 0.7672 28.869 105.3    59.735     30.568       29.166 10.950
#> 501 16.185 2.1135 0.9910 26.697 105.4    17.417      9.124        8.293 10.011
#> 502 16.880 2.1045 0.9983 25.389 106.1    18.315      9.394        8.921  9.624
#> 503 11.177 1.4621 0.7000 25.911 105.8    19.309      9.740        9.569  9.664
#> 504  9.107 1.2533 0.6010 28.187 106.5    18.767      9.640        9.128  9.446
#> 505  9.089 1.2629 0.6081 29.340 105.6    18.502      9.360        9.142  9.265
#> 506 10.942 1.5795 0.7615 30.022 105.9    18.800      9.313        9.486  9.195
#> 507 10.046 1.5757 0.7605 30.206 105.8    19.805      9.688       10.117  9.614
#> 508  9.893 1.5869 0.7660 30.281 105.8    20.338      9.999       10.338  9.866
#> 509  9.837 1.6217 0.7800 30.293 106.4    20.825     10.311       10.514 10.097
#> 510  9.439 1.6058 0.7723 30.338 106.8    20.858     10.390       10.468 10.079
#> 511  9.235 1.6113 0.7755 30.418 106.7    20.992     10.320       10.672 10.076
#> 512  8.874 1.5941 0.7680 30.399 106.6    23.812     11.606       12.206 11.326
#> 513 34.663 4.7796 2.0230 29.003 104.1   284.796    157.950      126.846  9.648
#> 514 28.735 3.7243 1.6595 28.437 103.8   335.441    194.734      140.708  8.232
#> 515 21.567 2.4135 1.0223 27.852 104.1   490.137    251.948      238.189 10.393
#> 516 22.718 2.5125 1.0096 28.528 104.3   659.851    320.855      338.996 13.333
#> 517 22.178 2.4448 1.0453 28.648 104.4   594.053    299.038      295.015 11.349
#> 518 21.007 2.3594 1.0655 28.211 104.2   522.818    270.027      252.791  9.217
#> 519 20.270 2.2612 1.0269 28.365 104.2   519.286    271.789      247.497  9.069
#> 520 20.038 2.2833 1.0424 28.481 104.1   508.904    265.054      243.850  8.830
#> 521 19.850 2.2700 1.0367 28.526 104.1   515.166    268.819      246.347  8.789
#> 522 19.694 2.2637 1.0348 28.380 104.1   521.416    272.440      248.977  8.750
#> 523 19.522 2.2565 1.0405 28.405 104.1   586.414    300.443      285.971  9.683
#> 524 19.571 2.8841 1.3454 29.450 105.9   282.344    146.362      135.982  8.350
#> 525 15.220 2.2121 1.0426 28.241 107.8   286.119    151.056      135.063  7.622
#> 526 10.398 1.3576 0.6449 28.891 107.0   330.424    175.725      154.699  8.454
#> 527  9.728 1.2102 0.5793 30.724 106.6   356.197    187.245      168.952  8.684
#> 528 10.440 1.3294 0.6386 30.880 106.3   382.149    199.420      182.730  8.693
#> 529 10.278 1.3662 0.6570 31.174 106.4   379.015    196.842      182.173  8.092
#> 530  8.933 1.3295 0.6408 31.880 106.2   420.774    212.908      207.866  9.013
#> 531  8.706 1.3319 0.6430 31.974 105.8   409.455    208.888      200.568  8.762
#> 532  8.321 1.3054 0.6293 32.051 106.1   423.359    214.029      209.330  9.033
#> 533  7.859 1.2595 0.6080 32.160 105.8   426.886    216.367      210.519  9.065
#> 534  7.537 1.2300 0.5935 32.227 105.9   418.410    212.734      205.676  8.821
#> 535  7.201 1.1864 0.5721 32.329 106.1   495.378    251.168      244.209 10.390
#> 536 13.624 1.9208 0.9135 26.941 106.1    79.999     43.379       36.620  9.947
#> 537 11.623 1.6719 0.8023 27.599 105.5    91.771     49.812       41.959 11.043
#> 538 14.354 2.1213 1.0189 28.558 105.6    95.102     48.983       46.118 11.112
#> 539 10.147 1.5418 0.7419 29.869 106.1    93.406     45.645       47.761 10.528
#> 540 11.199 1.7721 0.8545 30.458 105.8    91.953     44.893       47.059 10.183
#> 541 12.184 1.9732 0.9524 30.736 105.6    90.681     43.865       46.816  9.669
#> 542 11.635 1.8469 0.8869 30.955 106.7    90.973     44.447       46.526  9.283
#> 543 11.666 1.8457 0.8910 31.023 105.6    90.979     44.330       46.649  9.168
#> 544 11.374 1.7849 0.8618 31.089 105.6    91.926     44.842       47.083  9.140
#> 545 11.271 1.7536 0.8459 31.100 105.7    92.256     45.461       46.795  9.067
#> 546 11.058 1.7088 0.8241 31.222 105.9    88.778     44.024       44.754  8.637
#> 547 10.885 1.6705 0.8064 31.338 105.8    98.379     49.423       48.957  9.502
#> 548 16.151 2.1030 0.9958 27.791 105.9    57.026     29.943       27.083  9.226
#> 549 11.565 1.5469 0.7398 27.885 105.4    59.134     30.856       28.278  9.357
#> 550 12.260 1.5775 0.7580 28.923 105.0    63.955     32.554       31.401  9.527
#> 551 10.773 1.4859 0.7212 29.850 103.8    62.722     30.475       32.247  8.731
#> 552  9.721 1.4163 0.6815 30.535 105.8    61.387     29.827       31.560  8.260
#> 553 10.117 1.5166 0.7308 31.234 105.7    62.925     30.432       32.493  8.041
#> 554 10.318 1.5366 0.7406 31.789 105.9    67.991     32.803       35.188  8.208
#> 555 10.359 1.5397 0.7444 31.827 105.2    65.189     31.361       33.829  7.784
#> 556 10.236 1.5188 0.7343 31.925 105.3    67.304     32.538       34.766  7.962
#> 557 10.203 1.5130 0.7317 32.017 105.1    67.599     32.602       34.997  7.938
#> 558  9.955 1.4778 0.7154 32.096 105.1    68.100     32.849       35.251  7.939
#> 559  9.862 1.4657 0.7091 32.146 105.1    76.427     37.753       38.674  8.845
#> 560 40.565 5.7750 2.2412 27.957 104.6   494.291    273.045      221.246 13.491
#> 561 33.671 4.4532 1.8703 27.292 104.9   438.442    249.304      189.138  9.655
#> 562 25.453 3.1075 1.3864 27.274 105.5   381.297    216.104      165.193  6.807
#> 563 21.420 2.4867 1.1524 27.173 106.2   380.909    214.073      166.837  5.822
#> 564 18.794 2.1972 1.0350 27.486 105.6   404.336    228.288      176.048  5.832
#> 565 17.195 2.0802 0.9885 27.881 105.6   437.697    247.553      190.144  5.968
#> 566 17.362 2.1571 1.0319 28.555 105.5   456.928    257.540      199.388  5.711
#> 567 17.155 2.1148 1.0125 28.626 105.5   472.505    266.972      205.533  5.787
#> 568 16.760 2.0818 0.9978 28.726 105.4   469.483    264.692      204.790  5.651
#> 569 16.138 2.0035 0.9614 28.867 105.3   468.091    263.490      204.601  5.545
#> 570 15.095 1.8863 0.9062 28.975 105.3   471.135    264.596      206.539  5.520
#> 571 13.880 1.7681 0.8504 29.050 105.2   566.484    322.414      244.070  6.580
#> 572 16.102 2.4213 1.1447 26.786 106.0   658.140    336.134      322.006 11.823
#> 573 13.325 1.8880 0.9020 26.938 105.2   663.701    333.796      329.904 11.792
#> 574 13.902 1.8289 0.8798 27.607 105.0   648.416    318.671      329.745 11.303
#> 575 11.592 1.6410 0.7909 28.526 105.2   616.828    294.915      321.912 10.445
#> 576 12.034 1.7611 0.8500 29.070 105.0   590.620    280.908      309.712  9.747
#> 577 12.888 1.9178 0.9257 29.493 105.2   567.680    273.853      293.826  9.010
#> 578 11.918 1.8011 0.8690 30.265 105.5   605.880    294.070      311.811  9.267
#> 579 11.777 1.7845 0.8608 30.402 105.4   599.376    293.954      305.422  9.096
#> 580 11.411 1.7346 0.8375 30.483 105.3   608.561    299.285      309.276  9.171
#> 581 10.982 1.6758 0.8081 30.568 105.5   617.718    304.647      313.072  9.254
#> 582 10.645 1.6319 0.7870 30.649 105.5   605.258    301.689      303.569  9.019
#> 583 10.204 1.5709 0.7579 30.739 105.5   691.537    349.407      342.130 10.268
#> 584 18.740 2.5148 1.1843 26.058 105.4  1960.713   1102.185      858.528  9.436
#> 585 16.293 1.8611 0.8864 25.988 105.3  2004.240   1083.495      920.745  8.719
#> 586 16.466 2.0719 0.9924 26.538 104.9  2178.344   1132.945     1045.399  8.597
#> 587 14.056 2.0301 0.9763 27.368 104.8  2423.915   1195.307     1228.609  8.611
#> 588 13.714 2.0402 0.9807 27.902 104.9  2472.159   1228.352     1243.807  8.360
#> 589 12.791 1.9156 0.9225 28.291 104.8  2502.224   1258.423     1243.801  8.044
#> 590 12.211 1.8322 0.8818 29.110 104.8  2707.670   1391.755     1315.915  8.303
#> 591 12.008 1.8041 0.8682 29.270 104.7  2732.732   1418.212     1314.520  8.302
#> 592 11.657 1.7532 0.8434 29.386 104.8  2795.947   1456.698     1339.249  8.416
#> 593 11.389 1.7146 0.8258 29.505 104.6  2818.628   1476.858     1341.771  8.412
#> 594 11.169 1.6839 0.8108 29.586 104.7  2842.471   1495.895     1346.576  8.415
#> 595 10.730 1.6156 0.7767 29.676 104.7  3384.290   1801.403     1582.888  9.970
#>         LEx LExMale LExFemale    LE15 LE15Male LE15Female    LE65 LE65Male
#> 1   71.6145 68.3475   74.8781 59.0179  55.8533    62.1477 15.1885  13.1850
#> 2   73.9100 70.4976   77.2885 60.7088  57.3712    63.9870 16.5296  14.3640
#> 3   75.2306 71.7671   78.6321 61.7722  58.3797    65.0788 17.1367  14.7934
#> 4   75.6800 72.5419   78.7322 62.0041  58.9145    64.9908 17.3404  15.2176
#> 5   76.5995 73.3670   79.7949 62.7390  59.5528    65.8730 17.8744  15.6655
#> 6   76.1050 73.0445   79.1308 62.2109  59.1884    65.1860 17.4514  15.3380
#> 7   76.5434 73.7908   79.2038 62.6344  59.9168    65.2488 17.6750  15.7703
#> 8   76.7698 73.9512   79.5053 62.8120  60.0201    65.5109 17.8660  15.8725
#> 9   76.8475 74.1628   79.4385 62.8726  60.2174    65.4243 17.8078  15.8786
#> 10  75.8781 72.9811   78.7826 61.8389  58.9692    64.7073 17.0377  14.9065
#> 11  70.6534 67.4266   74.1780 57.4905  54.4285    60.8202 13.9312  11.9827
#> 12  74.5655 71.0871   78.2288 60.6960  57.2957    64.2629 16.0082  13.7589
#> 13  77.0414 73.9777   80.1470 62.8980  59.8974    65.9268 17.2799  15.2202
#> 14  79.6207 76.9459   82.2717 65.2121  62.5731    67.8197 18.9093  17.0461
#> 15  81.0923 78.6712   83.4736 66.6558  64.2652    69.0005 19.9253  18.2455
#> 16  82.0132 79.8065   84.1953 67.4832  65.3353    69.5983 20.5267  19.0110
#> 17  82.6050 80.5751   84.6257 67.9800  65.9720    69.9751 21.0195  19.6941
#> 18  82.8014 80.7524   84.8473 68.1631  66.1466    70.1717 21.1506  19.7761
#> 19  82.7184 80.6854   84.7474 68.1040  66.0928    70.1076 21.1096  19.7786
#> 20  83.2582 81.2150   85.2918 68.6175  66.6062    70.6146 21.5740  20.2146
#> 21  83.2412 81.2051   85.2753 68.6150  66.6106    70.6128 21.5873  20.2820
#> 22  83.6639 81.6287   85.6903 69.0139  66.9992    71.0164 21.9314  20.5777
#> 23  78.2350 75.0930   81.0929 63.7746  60.6654    66.5900 17.9976  15.9515
#> 24  79.5202 76.6096   82.2043 65.0045  62.1031    67.6744 18.8442  16.9352
#> 25  80.4634 77.6551   83.1212 65.9060  63.1169    68.5395 19.5249  17.6856
#> 26  81.1592 78.6348   83.5855 66.5169  64.0204    68.9099 19.6852  17.9319
#> 27  81.5922 79.1425   83.9302 66.9569  64.5219    69.2766 20.0308  18.2941
#> 28  81.6387 79.2852   83.8994 66.9867  64.6478    69.2292 19.9683  18.3255
#> 29  81.6859 79.3006   83.9912 66.9984  64.6402    69.2720 20.0220  18.3409
#> 30  81.9072 79.5326   84.1948 67.2731  64.9334    69.5200 20.1850  18.5126
#> 31  81.8037 79.2214   84.3281 67.1623  64.5981    69.6646 20.1051  18.2023
#> 32  70.9368 67.8178   74.1399 57.9791  55.0691    60.9309 13.8515  12.1880
#> 33  73.2416 69.8669   76.6557 59.5159  56.2119    62.8390 14.9964  12.8906
#> 34  76.0586 72.7007   79.3317 61.9415  58.6536    65.1275 16.6259  14.3047
#> 35  77.7684 74.5666   80.8962 63.3271  60.1543    66.4180 17.7484  15.5219
#> 36  79.0532 76.1482   81.8582 64.5184  61.6432    67.2866 18.5478  16.5295
#> 37  80.0400 77.3617   82.6253 65.4642  62.8455    67.9803 19.2778  17.3964
#> 38  80.8889 78.5554   83.1461 66.2688  63.9476    68.5107 19.7339  18.0354
#> 39  81.2647 78.7825   83.6841 66.6287  64.2043    68.9822 20.0113  18.2197
#> 40  81.3624 79.0029   83.6504 66.7748  64.4540    69.0180 20.0397  18.3267
#> 41  81.4805 79.2125   83.6829 66.8942  64.6591    69.0586 20.1076  18.4290
#> 42  81.8353 79.5997   83.9996 67.2278  65.0211    69.3585 20.3444  18.7065
#> 43  80.7977 78.5373   83.0536 66.1518  63.8869    68.4115 19.2712  17.6201
#> 44  57.3380 55.0052   59.8366 52.0264  50.2711    53.8833 12.6280  11.8233
#> 45  61.8195 59.5428   64.1954 54.0809  52.2666    55.9385 13.2449  12.4025
#> 46  65.8624 63.1328   68.7055 55.8111  53.4498    58.2322 13.6272  12.6511
#> 47  69.5842 66.3467   72.9603 57.4796  54.4751    60.5778 14.6462  13.3923
#> 48  71.8319 68.4848   75.2918 58.9429  55.7476    62.2185 15.7918  14.4972
#> 49  73.7790 70.3921   77.2570 60.3992  57.1257    63.7388 17.0222  15.7074
#> 50  75.1064 71.8184   78.4725 61.4941  58.3043    64.7411 17.7284  16.4451
#> 51  75.0805 71.7159   78.5392 61.4423  58.1728    64.7852 17.7041  16.3361
#> 52  75.3835 72.0692   78.7812 61.7305  58.5120    65.0119 17.8112  16.4783
#> 53  75.6335 72.3649   78.9774 61.9517  58.7731    65.1863 17.8467  16.4594
#> 54  75.8093 72.6530   79.0226 62.1075  59.0404    65.2132 17.8303  16.4139
#> 55  74.5058 71.5375   77.5989 60.7289  57.8470    63.7199 16.7793  15.5907
#> 56  71.2505 69.1043   73.5040 58.8559  57.0295    60.7459 14.1311  13.3061
#> 57  71.0809 68.4505   73.9022 58.0827  55.6392    60.6848 13.6487  12.5870
#> 58  71.3213 68.0836   74.8088 57.8701  54.7779    61.1832 14.0610  12.7638
#> 59  71.5746 68.3042   75.0121 57.9465  54.7531    61.2875 14.1371  12.7173
#> 60  72.5591 69.0479   76.2514 58.6790  55.2598    62.2569 14.7214  13.0788
#> 61  73.8140 70.3881   77.3536 59.7967  56.4543    63.2334 15.5057  13.7519
#> 62  74.6208 71.2239   78.1258 60.3252  56.9624    63.7859 15.9146  13.9846
#> 63  74.8271 71.3111   78.4690 60.4993  57.0483    64.0612 16.1716  14.1726
#> 64  74.7977 71.3646   78.3437 60.4715  57.0946    63.9475 16.0337  14.0400
#> 65  74.9325 71.4885   78.4900 60.5893  57.1750    64.1077 16.1878  14.1271
#> 66  75.0874 71.5802   78.7270 60.6994  57.1826    64.3463 16.2571  14.1909
#> 67  73.5992 69.9927   77.4701 59.1338  55.5304    62.9984 15.1487  12.9019
#> 68  72.6092 69.3311   76.2704 59.5593  56.4542    63.0165 15.6163  13.7618
#> 69  75.0612 71.5952   78.7194 61.2453  57.8821    64.7780 16.6838  14.4883
#> 70  77.4333 74.2269   80.6210 63.2217  60.0693    66.3426 17.7486  15.5333
#> 71  79.2330 76.5814   81.7722 64.8021  62.1922    67.2911 18.6233  16.6831
#> 72  80.1310 77.7124   82.4317 65.7220  63.3440    67.9742 19.3599  17.6326
#> 73  81.3363 79.1079   83.4497 66.8754  64.6807    68.9489 20.2526  18.6632
#> 74  81.9084 79.8453   83.8951 67.4123  65.3689    69.3754 20.7260  19.2699
#> 75  82.0301 79.9489   84.0401 67.5374  65.4606    69.5407 20.9195  19.4617
#> 76  81.9195 79.7607   84.0344 67.4114  65.2753    69.4995 20.8687  19.4149
#> 77  81.9247 79.8101   84.0046 67.4380  65.3377    69.5005 20.8986  19.5024
#> 78  82.2848 80.1733   84.3642 67.7688  65.6916    69.8087 21.1191  19.7024
#> 79  81.6536 79.4062   83.9092 67.1351  64.9168    69.3569 20.8410  19.4176
#> 80  62.6344 59.7856   65.6782 53.8622  51.2159    56.6782 12.3973  11.0596
#> 81  69.4748 66.3862   72.6589 57.2719  54.3171    60.2924 13.7976  12.0865
#> 82  73.6752 70.4814   76.8371 60.2412  57.1386    63.2882 15.6245  13.7253
#> 83  77.1276 74.0206   80.1487 63.1592  60.1113    66.1065 17.9063  15.9819
#> 84  78.4589 75.5894   81.2621 64.3545  61.5375    67.0933 18.8008  17.0357
#> 85  79.0954 76.6068   81.5356 64.9443  62.4920    67.3406 19.2620  17.7717
#> 86  80.0079 77.6889   82.2975 65.7756  63.4859    68.0302 19.7761  18.3703
#> 87  80.2949 78.0085   82.5492 66.0507  63.7892    68.2752 20.0035  18.6126
#> 88  80.6096 78.4015   82.7829 66.3400  64.1619    68.4782 20.2541  18.9280
#> 89  80.5594 78.3225   82.7760 66.2428  64.0379    68.4222 20.1899  18.8466
#> 90  80.3243 78.0984   82.5489 65.9583  63.7593    68.1515 20.0137  18.7128
#> 91  79.3488 76.7604   82.0313 64.8958  62.3540    67.5252 19.0206  17.3661
#> 92  68.1547 65.8606   70.5609 57.6732  55.4526    59.9761 14.1397  12.7762
#> 93  72.2885 69.8496   74.8948 60.5423  58.1798    63.0369 15.6907  14.2487
#> 94  74.0850 71.5952   76.7688 61.4133  58.9952    63.9937 16.1476  14.6683
#> 95  75.6679 73.1912   78.3286 62.2832  59.8644    64.8617 16.6802  15.1842
#> 96  76.9755 74.3646   79.7847 63.0959  60.5280    65.8444 17.2068  15.5640
#> 97  77.2140 74.5752   80.0523 63.2587  60.6598    66.0408 17.3222  15.6406
#> 98  77.2353 74.4481   80.2701 63.2086  60.4592    66.1903 17.2904  15.4875
#> 99  77.7090 75.0345   80.5735 63.6150  60.9742    66.4320 17.5650  15.8155
#> 100 77.9396 75.3033   80.7471 63.7854  61.1797    66.5498 17.6726  15.9317
#> 101 78.0191 75.2450   80.9992 63.8096  61.0635    66.7505 17.7192  15.8870
#> 102 70.9050 66.7601   75.2894 58.0520  54.0147    62.2947 15.8222  14.3570
#> 103 73.1557 69.5728   76.8372 59.9990  56.5304    63.5369 16.3220  14.8287
#> 104 74.8757 71.6168   78.1887 61.5032  58.3515    64.6851 17.1274  15.7078
#> 105 76.0665 73.1716   78.9879 62.4697  59.6708    65.2763 17.5038  16.0717
#> 106 76.2285 73.3301   79.1545 62.5932  59.7864    65.4098 17.6084  16.1526
#> 107 76.4178 73.5234   79.3336 62.7564  59.9422    65.5756 17.7777  16.2864
#> 108 76.5791 73.6630   79.5175 62.8775  60.0425    65.7183 17.8994  16.3988
#> 109 76.7927 73.9072   79.6955 63.0605  60.2546    65.8677 17.9902  16.4905
#> 110 74.7565 71.4902   78.2297 60.9449  57.7561    64.3248 16.5143  14.6616
#> 111 76.0936 73.7380   78.4849 62.6228  60.4072    64.8523 17.1322  15.8235
#> 112 77.3175 74.7548   79.8742 63.5105  61.0427    65.9557 17.8215  16.3625
#> 113 78.8766 76.2905   81.4073 64.9479  62.4319    67.3954 19.0606  17.5379
#> 114 79.3540 76.6281   82.0389 65.3329  62.6540    67.9605 19.6263  18.0704
#> 115 80.4069 77.5165   83.2802 66.2653  63.4232    69.0800 20.4951  18.8106
#> 116 79.9879 77.2559   82.6900 65.8431  63.1559    68.4910 20.1943  18.7294
#> 117 79.9944 77.3050   82.6617 65.8170  63.1472    68.4590 20.1557  18.6375
#> 118 80.0896 77.2196   82.9613 65.8901  63.0625    68.7104 20.3453  18.7408
#> 119 80.2963 77.6034   82.9633 66.0874  63.4284    68.7130 20.3738  18.8377
#> 120 79.7252 76.7687   82.7538 65.4969  62.5770    68.4810 19.9757  18.0895
#> 121 74.0014 70.7648   77.1257 59.7446  56.5251    62.8427 14.9678  13.3402
#> 122 75.5705 71.8902   79.1481 61.1733  57.4984    64.7387 16.0557  13.8280
#> 123 76.6761 73.2302   79.9977 62.1876  58.7588    65.4847 16.6724  14.5743
#> 124 77.6329 74.3193   80.8316 63.1080  59.8106    66.2841 17.1176  14.9468
#> 125 77.6294 74.3687   80.7862 63.0919  59.8450    66.2291 17.0473  14.9171
#> 126 77.7264 74.5201   80.8284 63.1938  60.0271    66.2467 17.0758  14.9844
#> 127 77.8654 74.4226   81.2499 63.3289  59.9795    66.6015 17.2529  15.0155
#> 128 78.1970 74.9136   81.3824 63.6102  60.3311    66.7876 17.4660  15.2730
#> 129 77.4972 74.2573   80.7170 62.9178  59.6900    66.1208 16.7664  14.6151
#> 130 76.0442 73.5417   78.6744 62.0471  59.6261    64.5807 16.2983  14.8238
#> 131 77.9000 75.4405   80.4754 63.5059  61.0800    66.0409 17.0926  15.4834
#> 132 79.1975 76.7136   81.8097 64.6416  62.1842    67.2218 17.8189  16.1069
#> 133 80.6325 78.1734   83.2383 65.9653  63.5264    68.5472 18.7243  16.9529
#> 134 81.4637 79.1535   83.8551 66.7531  64.4567    69.1281 19.2186  17.5052
#> 135 81.5341 79.2131   83.9340 66.8233  64.5154    69.2076 19.2458  17.5126
#> 136 81.5431 79.3037   83.8705 66.8338  64.6068    69.1464 19.2086  17.5326
#> 137 81.5558 79.3869   83.7654 66.8498  64.6934    69.0445 19.1964  17.5766
#> 138 81.4543 79.3168   83.6326 66.7534  64.6283    68.9167 19.0852  17.4907
#> 139 81.2302 78.9156   83.6516 66.5571  64.2688    68.9478 19.2265  17.3177
#> 140 69.4882 66.0343   72.9887 56.4076  53.1151    59.7059 12.7422  10.9764
#> 141 70.3404 66.8109   73.9243 56.8438  53.4572    60.2494 12.9163  11.1521
#> 142 71.4086 67.5319   75.4024 57.4640  53.6863    61.3329 13.6501  11.6240
#> 143 74.9781 71.5522   78.3338 60.4901  57.1023    63.7971 15.5803  13.6206
#> 144 76.1561 72.9510   79.2842 61.5756  58.4012    64.6655 16.2928  14.4186
#> 145 77.5677 74.4239   80.6515 62.9056  59.7719    65.9755 17.2384  15.3293
#> 146 78.5609 75.6124   81.4594 63.8639  60.9409    66.7316 17.6793  15.7623
#> 147 78.9744 76.0212   81.8610 64.3090  61.3705    67.1767 18.0662  16.0557
#> 148 78.9260 75.9689   81.8432 64.2442  61.3260    67.1154 17.9966  16.0577
#> 149 78.9612 76.0214   81.8753 64.2681  61.3346    67.1732 18.0506  16.0915
#> 150 79.1853 76.2685   82.0701 64.4996  61.6028    67.3600 18.2532  16.2678
#> 151 78.2370 75.2278   81.3030 63.5067  60.5294    66.5351 17.2804  15.1964
#> 152 73.3640 70.8706   75.9245 59.8669  57.6225    62.1407 15.2387  13.7761
#> 153 74.1295 71.1753   77.1785 60.0272  57.1478    62.9870 15.6809  13.6316
#> 154 74.8655 72.0246   77.7327 60.7021  57.9611    63.4513 16.0262  13.9929
#> 155 76.8152 74.4400   79.1216 62.3703  60.0570    64.6048 16.8223  15.1684
#> 156 78.2259 75.9429   80.4450 63.6818  61.4611    65.8297 17.6938  16.1195
#> 157 79.2473 77.1189   81.3356 64.6043  62.4947    66.6705 18.3543  16.9204
#> 158 80.7394 78.7647   82.6799 66.1220  64.1550    68.0529 19.3500  17.9442
#> 159 80.8814 78.9381   82.7882 66.2393  64.3329    68.1041 19.4819  18.1020
#> 160 81.1116 79.0889   83.1211 66.4998  64.5243    68.4558 19.5470  18.1385
#> 161 80.9909 79.0202   82.9558 66.3665  64.4372    68.2845 19.4071  18.0171
#> 162 81.4343 79.4378   83.4238 66.7618  64.7974    68.7146 19.7014  18.2889
#> 163 81.5458 79.5828   83.5023 66.8874  64.9746    68.7873 19.7564  18.3282
#> 164 70.3994 65.5126   74.5564 57.2925  52.5836    61.1907 14.2912  12.0842
#> 165 69.4667 64.2055   74.2694 56.3766  51.1989    61.0322 14.2178  11.8072
#> 166 69.9173 64.6981   74.9073 56.3576  51.2742    61.1520 14.3756  12.0100
#> 167 71.0142 65.5998   76.3166 57.0102  51.6636    62.2063 15.3384  12.6921
#> 168 73.0276 67.5689   78.2958 58.7165  53.2275    64.0078 16.1842  13.1571
#> 169 75.8816 70.8229   80.5125 61.3731  56.3612    65.9379 17.2330  14.2317
#> 170 77.6650 73.0633   81.7859 63.0364  58.4240    67.1636 18.2653  15.2900
#> 171 77.7631 73.1837   81.8705 63.0837  58.5395    67.1431 18.4247  15.4002
#> 172 78.1814 73.6437   82.2683 63.5132  58.9901    67.5774 18.3988  15.4169
#> 173 78.3339 73.8600   82.3782 63.6179  59.1841    67.6092 18.4084  15.5429
#> 174 78.7728 74.3800   82.7162 64.0523  59.7139    67.9270 18.7033  15.6921
#> 175 78.8929 74.5334   82.8943 64.1351  59.7981    68.1065 18.9743  16.0922
#> 176 70.8513 67.7240   73.8767 58.4116  55.4755    61.1982 14.2160  12.6206
#> 177 72.8409 69.3185   76.2796 59.4559  56.0627    62.7298 15.0830  13.1665
#> 178 74.6984 71.0633   78.2734 60.8177  57.2637    64.2885 16.2659  14.2147
#> 179 77.1093 73.6869   80.4416 62.7855  59.4035    66.0655 17.5285  15.4259
#> 180 78.3141 75.0485   81.4854 63.8620  60.6296    66.9910 18.2395  16.1964
#> 181 79.5932 76.5235   82.5617 65.0516  62.0031    67.9926 19.0876  17.1362
#> 182 80.3746 77.5550   83.1161 65.7797  62.9803    68.4960 19.4644  17.6310
#> 183 80.6771 77.8541   83.4195 66.0810  63.2813    68.7947 19.7130  17.8511
#> 184 80.6863 77.9283   83.3710 66.0847  63.3477    68.7434 19.6615  17.8454
#> 185 80.7985 78.0408   83.4913 66.1901  63.4530    68.8576 19.7515  17.9284
#> 186 81.0645 78.3356   83.7257 66.4484  63.7400    69.0845 19.9326  18.1173
#> 187 80.3033 77.4777   83.1217 65.6617  62.8514    68.4610 19.2297  17.3284
#> 188 70.3247 66.1607   74.3985 56.7542  52.7195    60.6580 13.3582  11.5006
#> 189 73.6489 69.2450   77.8555 59.4633  55.1238    63.5823 15.0754  12.6042
#> 190 74.9892 70.9425   78.8817 60.6298  56.5932    64.5028 16.0844  13.7432
#> 191 77.6713 74.1553   81.0230 63.0985  59.6064    66.4189 17.7083  15.4781
#> 192 78.9711 75.5267   82.2963 64.4327  61.0047    67.7354 18.9897  16.7588
#> 193 80.0116 76.7231   83.2469 65.3069  62.0331    68.5234 19.4061  17.2941
#> 194 81.3775 78.5465   84.1482 66.6006  63.7659    69.3743 19.9836  18.0992
#> 195 81.3029 78.4385   84.1263 66.5531  63.7020    69.3603 19.9527  18.0464
#> 196 81.4967 78.7192   84.2189 66.7593  63.9859    69.4757 20.1382  18.2453
#> 197 81.6265 78.9065   84.3052 66.8835  64.1558    69.5696 20.2304  18.3694
#> 198 81.8643 79.1713   84.5118 67.1252  64.4494    69.7521 20.4024  18.5549
#> 199 81.8219 79.0230   84.6168 67.0539  64.2813    69.8183 20.4329  18.6325
#> 200 72.0915 68.3707   75.8116 58.9018  55.3237    62.4404 15.1537  13.0491
#> 201 74.2335 70.1515   78.3995 60.3914  56.4106    64.4280 16.3154  13.9504
#> 202 76.8351 72.7219   80.9625 62.6519  58.6087    66.6899 17.9626  15.5266
#> 203 79.0438 75.2333   82.7944 64.5817  60.8134    68.2789 19.1518  16.6551
#> 204 80.3367 76.7159   83.8295 65.7682  62.1758    69.2248 20.0142  17.5886
#> 205 81.4047 77.9966   84.6614 66.8165  63.4262    70.0497 20.8236  18.5375
#> 206 82.1487 78.9918   85.1673 67.5636  64.4331    70.5493 21.2423  19.1036
#> 207 82.4008 79.2947   85.3590 67.8079  64.7248    70.7372 21.4246  19.2927
#> 208 82.4385 79.4209   85.3144 67.8539  64.8537    70.7074 21.4172  19.3346
#> 209 82.5682 79.5440   85.4536 67.9906  64.9912    70.8454 21.5357  19.4389
#> 210 82.7304 79.7516   85.5709 68.1511  65.2044    70.9528 21.6290  19.5596
#> 211 82.1993 79.1786   85.1373 67.5851  64.5836    70.4991 21.0344  18.9063
#> 212 78.0563 74.8585   80.9951 63.5543  60.3915    66.4485 17.7773  15.5726
#> 213 79.2540 76.3561   81.9631 64.7038  61.8326    67.3793 18.5324  16.5327
#> 214 80.0814 77.4339   82.6174 65.4776  62.8500    67.9889 19.0678  17.2586
#> 215 80.5658 78.1259   82.9717 65.9374  63.5064    68.3317 19.3320  17.6546
#> 216 80.8371 78.3809   83.2635 66.2343  63.7999    68.6346 19.5862  17.8747
#> 217 80.9371 78.5590   83.2880 66.2999  63.9344    68.6355 19.5552  17.8783
#> 218 80.8747 78.5103   83.2277 66.2401  63.8958    68.5693 19.5217  17.8712
#> 219 81.1893 78.8270   83.5394 66.5532  64.2145    68.8757 19.7444  18.0806
#> 220 81.0036 78.5967   83.4250 66.3419  63.9433    68.7527 19.5381  17.8367
#> 221 72.7479 70.2722   75.2096 60.4009  58.0409    62.7198 15.4878  14.1646
#> 222 74.4811 71.8890   77.2552 61.1918  58.7267    63.8146 15.7696  14.4652
#> 223 77.2986 74.6718   79.9423 63.2858  60.7304    65.8436 17.1687  15.6897
#> 224 78.4420 75.5917   81.3373 64.0404  61.2325    66.8839 17.7280  16.0567
#> 225 79.6505 76.6922   82.6456 65.1005  62.1676    68.0642 18.5706  16.7626
#> 226 80.5727 77.6993   83.4291 65.9587  63.1051    68.7904 19.2436  17.4823
#> 227 80.7894 77.9289   83.6010 66.1717  63.3296    68.9603 19.3438  17.5750
#> 228 81.2692 78.5395   83.9110 66.6420  63.9330    69.2582 19.6737  17.9825
#> 229 80.9614 78.2462   83.6053 66.3378  63.6406    68.9591 19.4132  17.7383
#> 230 81.4954 78.7890   84.1142 66.8677  64.1801    69.4632 19.8044  18.1022
#> 231 81.3487 78.7439   83.8662 66.7180  64.1283    69.2164 19.6478  18.0199
#> 232 81.5361 78.7511   84.3017 66.8915  64.1452    69.6112 20.1544  18.3557
#> 233 69.2187 66.3246   72.1010 57.2750  54.6154    59.8687 13.2519  11.9457
#> 234 69.0886 65.5232   72.7557 56.0145  52.5869    59.5067 13.2241  11.5793
#> 235 69.3718 65.1437   73.7777 55.7342  51.5645    60.0579 13.9147  12.0504
#> 236 71.7581 67.4876   76.0287 57.6624  53.4094    61.9012 15.0035  12.8788
#> 237 72.8649 68.6136   77.0679 58.5087  54.3021    62.6508 15.4089  13.1783
#> 238 74.5189 70.5575   78.3171 60.0411  56.0830    63.8292 16.1858  13.8942
#> 239 75.6536 72.2282   78.8692 61.1174  57.7107    64.3067 16.5275  14.4217
#> 240 76.1569 72.5551   79.5637 61.5884  58.0097    64.9639 16.8537  14.5689
#> 241 76.0070 72.5550   79.2727 61.4178  57.9751    64.6687 16.6237  14.4324
#> 242 76.2049 72.7170   79.5274 61.5538  58.0699    64.8683 16.7455  14.5305
#> 243 76.4546 73.0512   79.6877 61.8706  58.5012    65.0604 16.8805  14.7379
#> 244 75.7302 72.3191   79.0266 61.0876  57.7080    64.3444 16.2088  14.0354
#> 245 73.7797 70.6610   77.2238 60.1481  57.2514    63.3375 15.7523  14.8438
#> 246 76.5969 73.3861   80.0593 62.5298  59.6490    65.6124 17.2852  15.5663
#> 247 77.7406 75.1755   80.3769 63.4460  61.0757    65.8633 17.9264  16.1905
#> 248 79.5485 77.7299   81.3444 64.9723  63.2985    66.6113 18.7958  17.7501
#> 249 81.1691 79.2732   83.0453 66.5242  64.6731    68.3498 19.5617  18.2442
#> 250 81.5939 79.5501   83.6813 66.9592  64.9023    69.0600 19.7568  18.2473
#> 251 82.1638 80.8671   83.4131 67.5384  66.2993    68.7268 20.2727  19.3764
#> 252 81.8286 80.0864   83.6022 67.0783  65.3920    68.7897 19.8223  18.6282
#> 253 82.2410 80.6580   83.8691 67.6737  66.0438    69.3512 20.3801  19.4751
#> 254 82.4526 80.8799   84.0533 67.7314  66.2167    69.2676 20.6175  19.7509
#> 255 82.8474 81.2963   84.4427 68.0449  66.5885    69.5347 20.8553  19.8350
#> 256 82.7113 81.2357   84.2312 68.1050  66.7805    69.4576 20.9218  19.9786
#> 257 58.6184 57.9627   59.3576 53.3161  51.9923    54.8103 12.5940  11.5895
#> 258 62.7492 61.7597   63.7937 54.9251  53.4577    56.5185 13.5628  12.7602
#> 259 64.9385 63.6083   66.3762 55.8421  54.1315    57.7200 13.8692  13.0906
#> 260 67.1616 65.6444   68.8090 56.8329  55.0443    58.7918 14.2847  13.5274
#> 261 69.3260 67.8267   70.9399 57.8820  56.2235    59.6751 14.9053  14.1731
#> 262 69.7091 68.2312   71.2975 58.0668  56.4486    59.8124 14.9947  14.2771
#> 263 70.0676 68.6103   71.6324 58.2409  56.6598    59.9442 15.0725  14.3696
#> 264 70.4152 68.9732   71.9635 58.4137  56.8622    60.0837 15.1427  14.4526
#> 265 70.7463 69.3121   72.2871 58.5844  57.0534    60.2324 15.2056  14.5253
#> 266 70.1563 68.5289   71.9380 57.8076  56.0880    59.6925 14.4804  13.5855
#> 267 63.2486 61.4496   65.0869 54.7121  53.2582    56.1614 12.7243  11.9948
#> 268 66.2919 64.6098   67.9803 55.4569  53.9865    56.9027 13.0625  12.1643
#> 269 67.5308 65.7945   69.2645 55.9093  54.3502    57.4380 13.3206  12.3218
#> 270 68.3642 66.5714   70.1517 56.1519  54.5064    57.7682 13.5330  12.4295
#> 271 69.5196 67.5840   71.4601 56.8304  55.0275    58.6161 13.8720  12.6610
#> 272 69.7333 67.7809   71.6922 56.9633  55.1385    58.7732 13.9402  12.7144
#> 273 69.9533 67.9712   71.9454 57.1051  55.2458    58.9533 14.0134  12.7644
#> 274 70.0797 68.0624   72.1131 57.1790  55.2776    59.0761 14.0632  12.7876
#> 275 70.3491 68.3247   72.3892 57.3608  55.4490    59.2684 14.1465  12.8665
#> 276 68.8173 66.6438   71.0972 55.7137  53.6390    57.8776 12.9521  11.5013
#> 277 70.8338 68.5843   73.3350 57.7034  55.5555    60.0894 13.6486  12.2637
#> 278 72.5362 69.9324   75.3916 58.7355  56.2387    61.4675 14.1519  12.5998
#> 279 74.8375 72.1086   77.7199 60.6867  58.0392    63.4735 15.2518  13.3675
#> 280 76.5350 73.9401   79.1791 62.1752  59.6488    64.7391 16.3357  14.6049
#> 281 78.9093 76.5929   81.1818 64.3606  62.0049    66.6752 18.0078  16.3288
#> 282 80.5992 78.3091   82.8367 66.0061  63.7609    68.1923 19.2981  17.7481
#> 283 81.5326 79.6119   83.4179 66.8985  65.0107    68.7464 19.8123  18.4533
#> 284 81.6836 79.7526   83.5852 67.0205  65.1111    68.8972 19.8635  18.5229
#> 285 82.1032 80.2640   83.9176 67.4354  65.5757    69.2715 20.1733  18.8507
#> 286 82.1232 80.2383   83.9867 67.4365  65.5700    69.2790 20.2370  18.8664
#> 287 82.4108 80.4108   84.4004 67.7561  65.7901    69.7074 20.5689  19.1749
#> 288 82.3897 80.5787   84.1903 67.7008  65.8976    69.4919 20.4021  19.0812
#> 289 78.0385 76.1938   79.8340 64.0408  62.2156    65.8118 17.8677  16.7526
#> 290 79.1797 76.9852   81.2502 64.8279  62.6942    66.8275 18.4759  17.2787
#> 291 80.3935 78.3512   82.2986 65.9245  63.9176    67.7880 19.2659  18.0754
#> 292 81.9742 79.9745   83.8357 67.4339  65.4526    69.2730 20.4022  19.1473
#> 293 82.2538 80.1927   84.1955 67.6443  65.6100    69.5546 20.3975  19.0397
#> 294 82.6123 80.8130   84.3111 67.9933  66.2141    69.6685 20.7403  19.6042
#> 295 82.6993 80.6642   84.6146 68.0791  66.0630    69.9718 20.7884  19.3957
#> 296 82.9184 80.9415   84.7878 68.2819  66.3130    70.1409 20.9839  19.7128
#> 297 82.9048 80.9899   84.7204 68.2579  66.3819    70.0292 20.9553  19.7627
#> 298 82.6997 80.5760   84.7418 67.9901  65.8829    70.0128 20.6501  19.2032
#> 299 71.6296 68.6949   74.5382 59.3315  56.5756    62.0205 14.7692  13.2690
#> 300 74.0518 70.6655   77.4204 60.4938  57.2165    63.7245 15.4553  13.5130
#> 301 76.9936 73.6349   80.2526 62.8331  59.5344    66.0159 17.1600  15.0551
#> 302 79.6070 76.5318   82.4947 65.1265  62.0627    67.9970 18.6961  16.5233
#> 303 81.0201 78.1626   83.6704 66.4343  63.6013    69.0535 19.5404  17.4525
#> 304 82.1319 79.5381   84.5169 67.4992  64.9223    69.8627 20.2771  18.3260
#> 305 82.5211 80.2253   84.6531 67.8475  65.5680    69.9593 20.4681  18.7530
#> 306 83.0459 80.7350   85.1804 68.3728  66.0744    70.4914 20.9081  19.1386
#> 307 82.7263 80.4487   84.8584 68.0690  65.8079    70.1810 20.6747  18.9823
#> 308 83.1844 80.9483   85.2720 68.5167  66.3011    70.5797 21.0331  19.3488
#> 309 83.3423 81.1421   85.4013 68.6316  66.4483    70.6705 21.0862  19.4155
#> 310 82.1814 79.8466   84.4581 67.4640  65.1433    69.7238 20.0260  18.2548
#> 311 72.0073 69.3184   74.6827 58.5469  56.0176    61.0316 14.0129  12.5254
#> 312 76.1408 73.3827   78.7647 62.0529  59.3817    64.5720 16.2507  14.5765
#> 313 78.9928 75.9416   81.8645 64.6074  61.6033    67.4205 18.3297  16.2466
#> 314 81.1788 77.6818   84.5192 66.6266  63.1562    69.9324 20.1392  17.4927
#> 315 82.0073 78.4957   85.4076 67.3917  63.9045    70.7609 20.7679  18.0619
#> 316 82.9160 79.5115   86.2318 68.2472  64.8579    71.5432 21.3804  18.7004
#> 317 83.8832 80.7213   86.9620 69.1734  66.0207    72.2399 21.9438  19.3866
#> 318 84.0568 80.9325   87.1056 69.3390  66.2125    72.3883 22.0701  19.5214
#> 319 84.1891 81.0612   87.2604 69.4573  66.3362    72.5190 22.1067  19.5496
#> 320 84.2890 81.2152   87.3101 69.5608  66.4903    72.5764 22.1926  19.6637
#> 321 84.4177 81.3650   87.4293 69.6920  66.6403    72.7009 22.3003  19.7812
#> 322 84.6703 81.5782   87.7266 69.9177  66.8306    72.9669 22.5463  19.9908
#> 323 62.1754 58.4686   66.1456 52.2269  48.6068    56.0549 12.8720  10.7616
#> 324 64.8484 60.5317   69.6697 52.9708  48.7165    57.6895 12.5343  10.0189
#> 325 70.9936 66.7918   75.3916 57.4993  53.3271    61.8374 14.4194  11.8234
#> 326 76.2351 72.3179   80.1373 61.9796  58.0780    65.8524 16.8030  14.1681
#> 327 78.4486 74.8434   81.9587 64.0014  60.4080    67.4911 17.9537  15.4287
#> 328 80.7172 77.0577   84.1893 66.1383  62.4902    69.5922 19.3724  16.6446
#> 329 82.5404 79.0161   85.7693 67.8947  64.3831    71.1054 20.3873  17.6356
#> 330 82.9204 79.4366   86.0908 68.2627  64.7916    71.4150 20.6093  17.8590
#> 331 83.2784 79.8529   86.3858 68.6105  65.1978    71.6997 20.8250  18.0934
#> 332 83.3400 79.9455   86.4484 68.6635  65.2814    71.7546 20.8048  18.0809
#> 333 83.6846 80.3402   86.7402 68.9980  65.6660    72.0363 21.0249  18.3148
#> 334 83.6752 80.2775   86.8000 68.9836  65.5989    72.0906 21.6281  18.9034
#> 335 70.1755 64.5328   75.6998 56.3082  50.7482    61.7050 15.1134  12.5000
#> 336 70.6324 64.9377   76.2690 56.5252  50.8395    62.1304 15.1478  12.2788
#> 337 73.0285 67.8908   77.8358 58.6982  53.5373    63.5195 15.9691  13.0505
#> 338 74.6646 69.6656   79.3169 60.1474  55.1854    64.7450 16.8703  14.0736
#> 339 74.7568 69.7828   79.3874 60.2130  55.1717    64.9162 16.8710  13.9359
#> 340 74.8005 69.7907   79.4949 60.2741  55.2859    64.9328 16.8916  13.9904
#> 341 74.9793 70.0466   79.5944 60.3651  55.4445    64.9571 16.9582  14.0495
#> 342 75.6278 70.8781   79.9889 61.0296  56.2376    65.4343 17.2843  14.2995
#> 343 75.4781 70.7061   79.9645 60.8859  56.1257    65.3501 17.0712  14.1618
#> 344 72.1387 66.7376   77.3697 58.1087  52.6893    63.3421 16.1339  13.6115
#> 345 71.2464 65.2066   77.4671 57.0527  51.1001    63.1473 16.0628  13.3254
#> 346 73.1962 67.5492   78.7579 58.7494  53.1091    64.2912 16.6222  13.7586
#> 347 74.4737 69.1476   79.6081 59.9889  54.6513    65.1269 16.9740  13.9950
#> 348 74.8195 69.4598   79.9681 60.3173  54.9328    65.4861 17.1588  14.1688
#> 349 75.7015 70.7051   80.3615 61.0856  56.1172    65.7044 17.3154  14.3831
#> 350 75.9091 70.9079   80.5935 61.3129  56.3265    65.9721 17.4548  14.4224
#> 351 76.4245 71.4950   81.0201 61.7935  56.8848    66.3579 17.7726  14.7551
#> 352 75.1050 70.0673   80.0246 60.4330  55.4188    65.3189 16.7907  13.6251
#> 353 69.2259 66.3719   72.1858 56.6546  53.7084    59.7100 13.5415  11.9287
#> 354 72.3869 69.8252   74.8134 58.7292  55.8527    61.5034 14.4220  12.4330
#> 355 74.9674 72.2546   77.4216 61.0425  58.0738    63.7783 16.3414  14.1833
#> 356 77.2635 74.4744   79.8249 63.1069  60.1029    65.9071 17.7029  15.4423
#> 357 78.8786 76.7042   80.8415 64.5104  62.0449    66.7980 18.6690  16.7858
#> 358 80.0987 77.8927   82.1291 65.7321  63.2933    68.0222 19.4117  17.3668
#> 359 81.2561 79.6010   82.7846 66.9612  65.1244    68.6850 20.0297  18.5221
#> 360 81.6199 79.7017   83.4542 67.3354  65.1916    69.4195 20.4156  18.5967
#> 361 81.0892 79.4960   82.5816 66.7641  64.9968    68.4518 19.8203  18.2228
#> 362 81.5187 79.7599   83.2158 67.3044  65.2488    69.3309 20.1928  18.5318
#> 363 81.5879 79.9131   83.1708 67.4502  65.5484    69.2823 20.5856  18.9770
#> 364 81.4108 79.7072   83.0902 67.2271  65.1498    69.3167 20.0833  18.4128
#> 365 76.1597 73.9432   78.2544 62.0712  59.8963    64.1148 15.7714  14.3720
#> 366 77.9031 75.2410   80.5870 63.5601  60.8031    66.3488 16.4930  13.9168
#> 367 79.4894 77.0699   81.7508 65.1884  62.7189    67.5010 18.1671  16.0572
#> 368 81.3977 79.0846   83.5102 67.0887  64.7305    69.2457 20.0357  18.3377
#> 369 82.5914 80.0782   84.9562 68.2887  65.8179    70.6000 21.0743  19.0887
#> 370 82.6567 80.5712   84.5658 68.4139  66.3428    70.3041 21.3002  19.6670
#> 371 83.0891 80.5129   85.5493 68.8041  66.2774    71.2029 21.6214  19.4199
#> 372 82.9083 80.4150   85.3065 68.5386  66.0861    70.8872 21.3930  19.2385
#> 373 82.8387 80.8270   84.7333 68.6744  66.4344    70.8230 21.0872  19.0118
#> 374 82.3358 80.1432   84.5341 67.8559  65.5962    70.1296 20.6466  18.8071
#> 375 58.8934 57.0121   60.8450 51.7980  50.1180    53.5203 12.6885  12.2811
#> 376 64.2819 61.1101   67.6219 54.7169  51.6980    57.8678 14.5145  13.8601
#> 377 69.0342 66.1217   72.0248 57.6431  54.9030    60.4281 15.5329  14.8352
#> 378 72.5621 70.1389   74.9719 59.8782  57.6158    62.1024 16.3411  15.7730
#> 379 73.6267 71.3502   75.8772 60.5465  58.4055    62.6415 16.6390  16.0457
#> 380 73.7181 71.1210   76.2928 60.3496  57.8531    62.8057 16.8256  16.2372
#> 381 74.4315 71.8833   76.9286 60.8329  58.3727    63.2260 17.0565  16.4029
#> 382 74.3763 71.7377   76.9623 60.7371  58.1792    63.2267 17.1140  16.4661
#> 383 74.2609 71.5003   76.9720 60.5874  57.8987    63.2115 17.1990  16.5707
#> 384 74.3009 71.4221   77.1303 60.5813  57.7723    63.3254 17.3120  16.6523
#> 385 74.5302 71.5867   77.4224 60.7731  57.8997    63.5796 17.4470  16.7663
#> 386 70.4492 66.8902   74.1087 56.6009  53.0910    60.1966 14.9966  13.7512
#> 387 73.6279 70.8321   76.5214 60.0560  57.4182    62.7646 15.1025  13.5767
#> 388 75.7719 72.4376   79.1418 61.7646  58.5109    65.0361 16.2725  13.9380
#> 389 77.0122 73.8220   80.0899 62.8308  59.7009    65.8340 16.8665  14.3836
#> 390 78.1300 75.5342   80.5641 63.7099  61.1435    66.1075 17.4354  15.3199
#> 391 79.4880 77.1999   81.5922 65.0253  62.7586    67.1025 18.3441  16.3843
#> 392 80.8293 78.7795   82.7189 66.2549  64.2240    68.1218 19.2898  17.5692
#> 393 81.4900 79.7418   83.1288 66.8516  65.1276    68.4625 19.6718  18.2398
#> 394 81.5549 79.8810   83.1247 66.9344  65.2745    68.4878 19.7708  18.3701
#> 395 81.7366 80.0704   83.3172 67.1325  65.5030    68.6718 19.8943  18.5847
#> 396 81.7813 80.1567   83.3262 67.1560  65.5635    68.6648 19.8903  18.6074
#> 397 82.0530 80.4653   83.5574 67.4420  65.8772    68.9205 20.1063  18.8415
#> 398 81.3931 79.6751   83.0785 66.7948  65.1002    68.4537 19.4756  18.1263
#> 399 71.2192 68.1552   74.4957 57.9903  55.0763    61.0891 14.2783  12.4456
#> 400 72.8619 70.0378   75.7949 59.1960  56.4417    62.0448 14.8918  12.9374
#> 401 75.4252 72.4871   78.3522 61.3856  58.5956    64.1393 16.6088  14.6276
#> 402 78.6681 76.0374   81.2033 64.4017  61.8191    66.8784 18.4112  16.4721
#> 403 80.0308 77.8395   82.1059 65.6430  63.4950    67.6672 19.3550  17.8702
#> 404 81.0517 79.0926   82.9272 66.6153  64.7022    68.4378 19.9896  18.6580
#> 405 81.5866 79.9044   83.2106 67.0821  65.4036    68.7007 20.2072  19.0466
#> 406 82.0027 80.2138   83.7426 67.4287  65.6603    69.1447 20.6129  19.4000
#> 407 81.6053 79.8879   83.2845 67.0537  65.3685    68.6961 20.2921  19.2018
#> 408 81.8838 80.1358   83.6031 67.3296  65.5716    69.0587 20.5587  19.3811
#> 409 81.8322 80.0082   83.6494 67.3682  65.5616    69.1650 20.6166  19.4453
#> 410 82.6628 80.8379   84.4641 68.1085  66.3352    69.8521 21.1983  19.9337
#> 411 74.0705 70.9988   77.3203 60.4571  57.6107    63.4429 15.3240  13.7914
#> 412 75.6726 72.3433   79.1669 61.5740  58.3622    64.9283 16.2545  14.2897
#> 413 76.5864 73.4459   79.7978 62.3913  59.3546    65.4796 16.6941  14.5950
#> 414 78.6916 75.9507   81.3749 64.1578  61.4501    66.8010 18.0328  16.0800
#> 415 80.1695 77.7196   82.5112 65.5640  63.1522    67.8611 19.0187  17.1444
#> 416 81.0392 78.8465   83.1537 66.3703  64.1994    68.4592 19.5412  17.8880
#> 417 82.2728 80.3600   84.1318 67.5470  65.6662    69.3697 20.2436  18.8063
#> 418 82.4151 80.6146   84.1587 67.6747  65.8839    69.4068 20.3918  19.0590
#> 419 82.6242 80.9164   84.2731 67.9063  66.1982    69.5548 20.4542  19.1928
#> 420 82.7599 81.0020   84.4830 68.0265  66.2766    69.7399 20.5996  19.3252
#> 421 82.9553 81.1771   84.6944 68.2236  66.4813    69.9224 20.7713  19.5095
#> 422 83.1953 81.4741   84.8845 68.4242  66.7233    70.0901 20.9217  19.6717
#> 423 68.4856 65.2992   71.6876 57.7012  54.6313    60.7421 14.3959  12.6604
#> 424 71.5629 68.0490   75.0644 59.4716  56.0453    62.8487 15.5435  13.5278
#> 425 74.3354 70.8124   77.8239 61.2210  57.7720    64.6089 16.7613  14.6907
#> 426 76.9101 73.7033   80.0549 63.1153  59.9664    66.1852 17.9320  15.9449
#> 427 78.1271 75.0775   81.1154 64.1202  61.1239    67.0415 18.6669  16.7608
#> 428 79.2720 76.3528   82.1372 65.0931  62.2146    67.9077 19.4125  17.5790
#> 429 79.9281 77.1825   82.6440 65.6487  62.9411    68.3183 19.7984  18.0659
#> 430 80.0794 77.3064   82.8289 65.7849  63.0459    68.4928 19.9829  18.2329
#> 431 80.0994 77.3415   82.8447 65.7895  63.0668    68.4920 19.9794  18.2535
#> 432 80.2164 77.4575   82.9709 65.8901  63.1664    68.6020 20.0691  18.3435
#> 433 80.4222 77.6723   83.1700 66.0838  63.3694    68.7887 20.2141  18.4891
#> 434 79.1702 76.2617   82.1585 64.7962  61.9207    67.7447 19.4173  17.6203
#> 435 69.5572 66.0738   72.9124 57.6849  54.4334    60.7406 13.8034  12.0897
#> 436 70.4785 66.3513   74.6284 57.7396  53.7951    61.6506 14.4101  12.4557
#> 437 70.6060 66.1938   75.1953 57.3109  52.9981    61.7639 14.4698  12.3910
#> 438 73.6453 69.3941   77.9008 59.4601  55.2480    63.6599 15.6555  13.3857
#> 439 75.1270 70.8483   79.3783 60.7910  56.5409    65.0010 16.6756  14.2753
#> 440 76.2823 72.0796   80.3818 61.8127  57.6265    65.8859 17.3720  14.9618
#> 441 77.5894 73.6471   81.4706 63.0381  59.1106    66.8974 18.0910  15.7158
#> 442 77.6395 73.7129   81.5201 63.0791  59.1739    66.9306 18.0879  15.7307
#> 443 77.7155 73.8481   81.5411 63.1526  59.3043    66.9519 18.1010  15.7855
#> 444 77.6232 73.7447   81.4865 63.0470  59.1803    66.8927 18.0326  15.6971
#> 445 77.9213 74.0822   81.7391 63.3306  59.4896    67.1471 18.2634  15.9626
#> 446 76.5951 72.5087   80.8131 61.9667  57.8947    66.1648 17.1655  14.6268
#> 447 67.0549 63.8771   70.1058 57.8086  54.8250    60.5937 13.8288  12.3858
#> 448 71.6633 68.1053   75.1634 59.1726  55.8319    62.3975 14.9693  13.2809
#> 449 74.3043 70.7725   77.8054 60.5843  57.1666    63.9421 15.9681  14.2176
#> 450 76.8301 73.2684   80.3543 62.5507  59.0360    66.0135 17.3930  15.4440
#> 451 78.3169 74.9007   81.6469 63.7725  60.3742    67.0778 18.1436  16.1818
#> 452 80.1149 76.8567   83.2149 65.4635  62.2048    68.5612 19.3492  17.3250
#> 453 81.3213 78.1972   84.2503 66.6817  63.5982    69.5620 20.0799  18.1374
#> 454 81.3636 78.2309   84.3096 66.7311  63.6285    69.6401 20.1314  18.1305
#> 455 81.6605 78.5862   84.5347 66.9864  63.9453    69.8202 20.4105  18.4469
#> 456 81.5915 78.5176   84.4782 66.9846  63.9105    69.8687 20.3568  18.3763
#> 457 81.9587 78.9660   84.7533 67.3123  64.3390    70.0823 20.6409  18.6981
#> 458 81.3664 78.3812   84.1997 66.6616  63.6654    69.5055 20.0946  18.2423
#> 459 67.9295 65.6644   70.1336 57.3429  55.3719    59.2070 13.2771  12.4153
#> 460 69.2489 66.5827   71.8753 57.1165  54.6834    59.4681 13.4144  12.4915
#> 461 69.8412 66.6257   73.0926 57.4675  54.4259    60.5079 14.2546  13.1279
#> 462 71.1594 67.6895   74.6563 58.0812  54.7265    61.4321 14.6868  13.3317
#> 463 71.5808 68.1978   74.9829 58.0785  54.7955    61.3543 14.1960  12.7773
#> 464 73.5793 69.8899   77.3324 59.6702  56.0432    63.3427 15.8230  14.1096
#> 465 74.7371 71.2401   78.2648 60.5644  57.1112    64.0354 16.1206  14.3233
#> 466 75.0209 71.4753   78.6050 60.7805  57.2847    64.3013 16.3642  14.5289
#> 467 75.0236 71.4808   78.6131 60.7498  57.2473    64.2874 16.3189  14.4732
#> 468 75.1033 71.4994   78.7779 60.7783  57.2061    64.4115 16.3541  14.4275
#> 469 75.3288 71.7142   79.0269 60.9664  57.3778    64.6300 16.5479  14.6508
#> 470 74.0464 70.2832   77.9995 59.6437  55.8848    63.5879 15.4735  13.2795
#> 471 64.9982 58.5990   72.1171 51.5493  45.2060    58.5637 13.1741  10.7067
#> 472 65.2185 58.7796   72.3736 51.3484  44.9542    58.4218 13.5586  10.9943
#> 473 68.1526 62.2234   74.2690 54.2036  48.2672    60.3062 14.5815  11.9755
#> 474 71.3449 65.8565   76.7052 57.0721  51.6067    62.3886 15.9947  13.4346
#> 475 71.9101 66.5881   77.0480 57.5866  52.2816    62.6896 16.1657  13.6478
#> 476 72.8450 67.6777   77.7436 58.4699  53.3224    63.3317 16.5340  14.0158
#> 477 72.9363 67.7287   77.8979 58.5233  53.3400    63.4434 16.5763  13.9828
#> 478 73.0658 67.7356   78.1663 58.6199  53.3077    63.6868 16.7360  13.9731
#> 479 71.1705 66.2673   75.9227 56.6744  51.7886    61.3965 14.8890  12.1652
#> 480 72.6067 71.1831   74.3436 59.4916  58.1126    61.1844 14.6210  13.6835
#> 481 74.4004 72.9846   76.3586 60.8586  59.4771    62.7845 16.0025  15.1671
#> 482 75.6161 74.1133   78.0384 61.7957  60.3414    64.1730 16.9880  16.2818
#> 483 77.7762 76.5831   79.6782 63.7486  62.6208    65.5843 17.7261  17.0753
#> 484 78.3537 77.2268   80.1125 64.2788  63.2127    65.9753 18.0529  17.4223
#> 485 78.7213 77.6004   80.4293 64.5967  63.5302    66.2494 18.2384  17.5868
#> 486 78.7499 77.5514   80.5425 64.5746  63.4225    66.3209 18.1752  17.4356
#> 487 78.3132 76.9427   80.3752 64.0869  62.7539    66.1131 17.7740  16.8671
#> 488 77.5962 76.0136   80.0553 63.3227  61.7699    65.7558 17.2018  16.1113
#> 489 69.7226 66.6563   72.9224 57.1288  54.2320    60.1232 13.4063  12.1596
#> 490 70.3802 66.7142   74.2651 57.2684  53.7915    60.9228 13.6462  11.9875
#> 491 70.8190 66.5183   75.3798 56.9914  52.7668    61.4522 14.0404  12.0922
#> 492 73.1393 68.9987   77.2973 59.0123  54.9590    63.0584 14.8592  12.7499
#> 493 74.1562 70.1825   78.0828 59.9024  55.9817    63.7586 15.4693  13.2851
#> 494 75.4963 71.7360   79.1574 61.1255  57.3822    64.7606 16.2219  14.0418
#> 495 76.6505 73.0885   80.1080 62.2372  58.6970    65.6643 17.0691  14.9427
#> 496 77.2156 73.7434   80.5470 62.7783  59.3428    66.0624 17.3644  15.1945
#> 497 77.2200 73.7541   80.5719 62.7245  59.3106    66.0122 17.3381  15.1977
#> 498 77.2650 73.8315   80.6042 62.8137  59.3937    66.1331 17.4560  15.3487
#> 499 77.6863 74.2645   81.0102 63.2462  59.8491    66.5372 17.7928  15.6443
#> 500 76.8643 73.4486   80.2326 62.4096  59.0238    65.7396 16.8963  14.7154
#> 501 69.0488 65.1098   72.7448 56.3953  52.5933    59.9044 13.2861  11.4721
#> 502 71.8172 67.6640   75.6823 58.2109  54.1398    61.9597 14.8051  12.6838
#> 503 73.4654 69.3884   77.3346 59.3320  55.3476    63.0804 15.3131  13.1055
#> 504 75.8302 71.8726   79.6107 61.3305  57.4211    65.0481 16.5491  13.9900
#> 505 77.5029 73.8044   81.0064 62.9542  59.2511    66.4583 17.5943  15.1425
#> 506 79.3008 76.0430   82.4170 64.6396  61.3655    67.7719 18.5378  16.3209
#> 507 80.4994 77.5610   83.3485 65.7548  62.8205    68.5972 19.1924  17.1688
#> 508 80.5120 77.5948   83.3512 65.7709  62.8534    68.6085 19.1898  17.1487
#> 509 80.6163 77.7704   83.3736 65.8712  63.0064    68.6485 19.1819  17.0711
#> 510 80.8610 77.9513   83.6983 66.1089  63.2202    68.9204 19.3038  17.1644
#> 511 81.0070 78.1824   83.8074 66.2787  63.4898    69.0369 19.4120  17.4427
#> 512 80.3641 77.6353   83.1377 65.5952  62.8817    68.3504 18.6009  16.6568
#> 513 59.9605 57.4512   62.7302 52.0934  49.7516    54.6842 13.3921  12.5792
#> 514 62.9422 59.4767   66.8912 52.8164  49.4818    56.6134 13.7318  12.4993
#> 515 58.3678 55.4152   61.0817 48.1467  45.1694    50.8377 14.8182  13.5807
#> 516 53.9142 52.0882   55.4645 44.1013  42.3412    45.5379 14.9660  13.7277
#> 517 58.8863 56.1973   61.2374 47.7731  45.1227    50.0347 15.0613  13.3703
#> 518 64.0532 60.8016   67.0271 52.0086  48.8118    54.8854 15.2930  13.6218
#> 519 64.7495 61.3318   67.9156 52.5212  49.1735    55.5741 15.4732  13.6355
#> 520 65.4222 61.9800   68.5800 52.9636  49.5612    56.0440 15.5539  13.6771
#> 521 65.7260 62.2957   68.9062 53.4428  50.1093    56.4810 15.6857  13.9096
#> 522 66.0711 62.6960   69.2157 53.9011  50.5893    56.9436 15.6255  13.7847
#> 523 65.1502 62.1742   67.9483 52.3948  49.5032    55.0786 14.0929  12.3240
#> 524 72.1491 69.3281   74.8667 59.7741  57.1670    62.2322 14.9891  13.5413
#> 525 75.5259 72.3909   78.5548 61.8461  58.8273    64.7288 16.4220  14.6334
#> 526 77.0004 73.4296   80.5573 62.8863  59.3655    66.3769 17.5236  15.4823
#> 527 79.4123 75.9648   82.8408 64.9463  61.5240    68.3415 18.8192  16.6415
#> 528 80.3196 77.0203   83.6117 65.7680  62.5038    69.0165 19.3062  17.1383
#> 529 82.0063 78.9747   84.9766 67.3855  64.3606    70.3458 20.4788  18.3219
#> 530 82.6109 79.8246   85.3394 67.9243  65.1551    70.6315 20.7380  18.6845
#> 531 82.9999 80.1828   85.7479 68.3170  65.5268    71.0327 21.0963  19.0041
#> 532 82.9862 80.2562   85.6442 68.3032  65.5901    70.9402 21.0482  18.9972
#> 533 83.0956 80.3497   85.7740 68.4113  65.6782    71.0736 21.1497  19.0956
#> 534 83.4794 80.7395   86.1398 68.7919  66.0696    71.4309 21.4663  19.3910
#> 535 82.2413 79.4828   84.9948 67.5310  64.7874    70.2662 20.3099  18.2251
#> 536 74.6641 72.2303   77.2072 60.8963  58.6050    63.2743 15.6712  14.3035
#> 537 75.7431 72.7847   78.8559 61.5127  58.6322    64.5339 16.1981  14.3198
#> 538 77.5886 74.8127   80.3897 63.2567  60.5314    65.9974 17.2671  15.3151
#> 539 79.7387 77.3797   82.0156 65.1328  62.8108    67.3662 18.4915  16.6899
#> 540 80.6213 78.4232   82.7450 65.9549  63.7774    68.0540 19.0651  17.3615
#> 541 81.5190 79.5169   83.4639 66.8285  64.8321    68.7661 19.6844  18.2052
#> 542 82.1844 80.3199   84.0159 67.4871  65.6393    69.2990 20.1854  18.8534
#> 543 82.3391 80.5677   84.0791 67.6414  65.8680    69.3829 20.2934  19.0100
#> 544 82.4377 80.7280   84.1128 67.7188  66.0088    69.3935 20.3523  19.1406
#> 545 82.5321 80.7899   84.2556 67.8010  66.0692    69.5122 20.3958  19.1335
#> 546 83.0518 81.3468   84.7295 68.3022  66.6006    69.9754 20.8062  19.5191
#> 547 82.4271 80.5968   84.2841 67.7059  65.9041    69.5308 20.1928  18.8730
#> 548 73.1238 70.0256   76.1650 59.7710  56.8582    62.5887 14.9366  13.3020
#> 549 75.5898 72.2317   78.8588 61.6154  58.3806    64.7341 16.3775  14.2976
#> 550 77.3851 73.9562   80.7129 63.1660  59.7783    66.4404 17.5445  15.2710
#> 551 79.8340 76.9182   82.5573 65.3960  62.5282    68.0611 19.0196  16.9419
#> 552 81.2362 78.5776   83.6977 66.7199  64.1172    69.1151 19.8934  17.9654
#> 553 82.2873 80.0278   84.3640 67.7036  65.4204    69.8045 20.5121  18.7441
#> 554 82.8461 80.6948   84.8828 68.2855  66.1704    70.2800 20.8077  19.2382
#> 555 83.4457 81.5250   85.2173 68.8252  66.8749    70.6278 21.2489  19.7450
#> 556 83.4140 81.3654   85.3545 68.8100  66.7953    70.7114 21.2170  19.7419
#> 557 83.5639 81.6415   85.3700 68.9549  67.0346    70.7572 21.3675  19.9080
#> 558 83.7804 81.8973   85.5615 69.1485  67.2743    70.9185 21.4295  20.0124
#> 559 83.0626 80.9957   85.0728 68.4733  66.4328    70.4529 20.7793  19.2227
#> 560 56.7016 53.8399   60.0470 55.2637  52.1597    58.9132 13.9093  12.3182
#> 561 62.7391 59.6132   66.4412 57.2603  54.0098    61.1255 14.6296  12.8711
#> 562 67.8348 64.4748   71.5195 58.5146  55.1129    62.2403 14.8915  12.9192
#> 563 71.9312 68.6787   75.3655 59.9099  56.6815    63.3031 15.1865  13.2287
#> 564 73.5098 70.3037   76.9092 60.5890  57.4140    63.9439 15.4322  13.5133
#> 565 74.9642 71.9031   78.2116 61.4389  58.4049    64.6496 15.8803  14.0286
#> 566 76.5389 73.4807   79.7399 62.6430  59.6102    65.8105 16.6086  14.6500
#> 567 76.5948 73.4903   79.8578 62.6422  59.5625    65.8726 16.6164  14.6371
#> 568 77.0372 73.9566   80.2520 63.0374  59.9817    66.2196 16.8340  14.8059
#> 569 77.4535 74.3853   80.6336 63.4099  60.3667    66.5576 17.0639  15.0018
#> 570 77.7370 74.6784   80.8902 63.6528  60.6188    66.7738 17.2066  15.1213
#> 571 76.5255 73.4405   79.8866 62.3827  59.3215    65.7147 16.0306  13.9466
#> 572 71.8819 68.6956   74.9856 58.6501  55.6182    61.5621 14.2587  12.0952
#> 573 73.5906 70.5145   76.5743 59.8219  56.8279    62.7022 15.0385  12.8331
#> 574 75.7377 72.8411   78.5040 61.5845  58.7661    64.2568 16.1114  14.0018
#> 575 77.8491 75.3764   80.1919 63.4360  61.0061    65.7276 17.3980  15.6455
#> 576 79.1061 76.8960   81.1894 64.6508  62.4859    66.6812 18.3083  16.7895
#> 577 80.3908 78.3399   82.3326 65.8707  63.8394    67.7887 19.3548  17.9444
#> 578 80.9190 79.0421   82.7269 66.3420  64.5054    68.1040 19.6452  18.4022
#> 579 81.0675 79.1942   82.8709 66.4855  64.6319    68.2657 19.8488  18.5862
#> 580 81.1640 79.2839   82.9845 66.5807  64.7278    68.3699 19.8715  18.6225
#> 581 81.1229 79.2488   82.9444 66.5327  64.6831    68.3258 19.9095  18.6851
#> 582 81.4426 79.5536   83.2753 66.8580  64.9947    68.6610 20.1988  18.9397
#> 583 80.3854 78.3622   82.4003 65.7688  63.7731    67.7522 19.3042  17.9693
#> 584 70.7343 67.0160   74.6464 57.7367  54.1642    61.4670 15.0631  13.0414
#> 585 73.7300 69.9815   77.4730 60.0585  56.3991    63.6862 16.3951  14.1130
#> 586 75.3743 71.8499   78.8429 61.4057  57.9549    64.7811 17.2867  15.1282
#> 587 76.8058 74.1180   79.4261 62.5799  59.9442    65.1371 17.6969  16.0505
#> 588 77.5264 74.9502   80.0674 63.2753  60.7543    65.7508 18.3881  16.9153
#> 589 78.6681 76.2439   81.0658 64.3271  61.9457    66.6745 19.1546  17.7508
#> 590 78.7219 76.3343   81.1452 64.3535  62.0059    66.7300 19.3804  18.0453
#> 591 78.6860 76.2343   81.1928 64.3169  61.9008    66.7822 19.5275  18.1793
#> 592 78.6483 76.1855   81.1834 64.2675  61.8467    66.7536 19.5037  18.1659
#> 593 78.7997 76.3350   81.3472 64.4058  61.9847    66.9029 19.5846  18.2352
#> 594 78.9160 76.4542   81.4688 64.5179  62.0941    67.0266 19.6836  18.3355
#> 595 77.0115 74.3388   79.8738 62.5766  59.9394    65.3975 18.4572  17.0832
#>     LE65Female    LE80 LE80Male LE80Female InfantDeaths      IMR
#> 1      16.8479  6.4408   5.5557     6.9536       18.495  25.6221
#> 2      18.3144  7.6299   6.6246     8.2001       13.382  18.5965
#> 3      19.0790  8.0515   6.7999     8.7623       11.170  15.5812
#> 4      19.0933  8.1200   6.9564     8.7755        9.987  13.2336
#> 5      19.7565  8.4856   7.2652     9.2210        8.685  11.2954
#> 6      19.2620  8.2420   7.0485     8.9705        8.120  10.9588
#> 7      19.2703  8.3762   7.3535     8.9859        7.642  10.6404
#> 8      19.5518  8.6106   7.5247     9.2651        7.119  10.3384
#> 9      19.4396  8.5495   7.4738     9.2044        6.360  10.0494
#> 10     18.9342  8.1954   6.9621     8.9856        5.326   9.7706
#> 11     15.7188  6.4225   5.5673     6.9725        4.753  18.5507
#> 12     18.0262  7.4282   6.2778     8.0772        2.393  10.6049
#> 13     19.0813  7.9914   6.7889     8.7229        2.077   7.9175
#> 14     20.5740  8.6081   7.4907     9.3292        1.273   5.0888
#> 15     21.4339  9.1279   8.0891     9.8233        1.340   5.0776
#> 16     21.9160  9.3617   8.3940    10.0660        1.233   4.0932
#> 17     22.2607  9.6450   8.8294    10.2753        0.956   3.1239
#> 18     22.4507  9.7439   8.8885    10.4199        0.949   3.0552
#> 19     22.3686  9.7387   8.9210    10.3872        1.036   3.3522
#> 20     22.8561 10.0879   9.2295    10.7757        0.982   3.1381
#> 21     22.8213 10.0721   9.2618    10.7298        0.988   3.2363
#> 22     23.2103 10.3600   9.5374    11.0267        0.912   3.0808
#> 23     19.4777  7.9060   6.9984     8.3211        0.373   4.7740
#> 24     20.3008  8.3564   7.3795     8.8070        0.323   4.1495
#> 25     21.0204  8.7552   7.8132     9.2663        0.311   3.9836
#> 26     21.1952  8.9029   8.0007     9.4798        0.262   3.1443
#> 27     21.5199  9.2347   8.3230     9.8197        0.274   3.1658
#> 28     21.3900  9.0863   8.2626     9.6302        0.256   2.9304
#> 29     21.4920  9.1578   8.3314     9.7139        0.230   2.6920
#> 30     21.6425  9.3048   8.4192     9.9118        0.253   2.9878
#> 31     21.8033  9.5938   8.5063    10.3633        0.264   3.1586
#> 32     15.2664  6.0262   5.5413     6.3407        2.993  21.1312
#> 33     16.7593  6.5407   5.7180     7.0035        1.501  12.1520
#> 34     18.5334  7.3663   6.1645     8.0118        0.990   8.0184
#> 35     19.6116  7.8434   6.6617     8.5006        0.560   4.8487
#> 36     20.2312  8.2146   7.0989     8.8620        0.442   3.7370
#> 37     20.8773  8.7092   7.6254     9.3772        0.465   3.6174
#> 38     21.2217  8.9966   8.0594     9.6112        0.395   3.2443
#> 39     21.5939  9.2627   8.2505     9.9369        0.382   3.1550
#> 40     21.5493  9.2651   8.2624     9.9437        0.423   3.5521
#> 41     21.6023  9.3151   8.3536     9.9802        0.438   3.7222
#> 42     21.7967  9.5206   8.5742    10.1738        0.425   3.6181
#> 43     20.7951  8.6570   7.7318     9.3278        0.369   3.1839
#> 44     13.4150  5.7207   5.3277     6.0354      348.772 104.1578
#> 45     14.0393  6.2208   5.8619     6.4982      304.514  77.8296
#> 46     14.5130  6.3061   6.0061     6.5363      194.874  52.5072
#> 47     15.7134  6.8449   6.5038     7.0863      103.447  29.8054
#> 48     16.8831  7.2903   6.9283     7.5336       68.525  21.5819
#> 49     18.1440  7.7921   7.3739     8.0607       48.969  16.4748
#> 50     18.8389  8.2355   7.8223     8.5012       41.431  13.9942
#> 51     18.9010  8.2514   7.7992     8.5467       39.495  13.6909
#> 52     18.9743  8.2479   7.7943     8.5477       38.839  13.4449
#> 53     19.0640  8.2227   7.7248     8.5580       38.092  13.1824
#> 54     19.0760  8.1573   7.6099     8.5330       36.490  12.9406
#> 55     17.8905  7.3335   7.3373     7.3937       34.574  12.6952
#> 56     14.8921  6.2764   6.0540     6.4398        3.767  26.9593
#> 57     14.6673  5.6919   5.3606     5.9423        2.531  19.6132
#> 58     15.2520  5.8151   5.4489     6.0817        1.543  14.3898
#> 59     15.3836  5.8923   5.5187     6.1450        0.981  13.6153
#> 60     16.1387  6.2628   5.7586     6.5923        0.753  10.5122
#> 61     16.9769  6.5263   6.0298     6.8418        0.700   9.1387
#> 62     17.5259  6.7787   6.2498     7.1082        0.429   6.4922
#> 63     17.8369  7.0388   6.4444     7.4079        0.423   6.4930
#> 64     17.6948  6.9438   6.3464     7.3117        0.403   6.2957
#> 65     17.9069  7.0948   6.4604     7.4827        0.353   5.6520
#> 66     17.9791  7.1646   6.5438     7.5383        0.340   5.5229
#> 67     17.1079  6.7392   5.9175     7.2569        0.294   4.9590
#> 68     17.4973  7.3126   6.5391     7.9761        6.833  19.1327
#> 69     18.7358  7.9806   6.8301     8.7766        3.843  10.5804
#> 70     19.6600  8.3486   7.0607     9.1779        2.755   6.8479
#> 71     20.2770  8.6435   7.4136     9.4153        1.693   5.1070
#> 72     20.8269  9.0151   7.8585     9.7531        1.867   5.4454
#> 73     21.6098  9.5241   8.4192    10.2676        1.898   5.0152
#> 74     22.0087  9.8486   8.8487    10.5678        1.742   4.5285
#> 75     22.2078 10.0625   9.0533    10.7947        1.741   4.5350
#> 76     22.1735  9.9622   8.9678    10.7035        1.717   4.5309
#> 77     22.1564  9.9590   9.0436    10.6440        1.782   4.7477
#> 78     22.4021 10.1267   9.1918    10.8372        1.655   4.4362
#> 79     22.1526  9.8931   8.9758    10.6078        1.619   4.4478
#> 80     13.6234  4.8124   4.0595     5.3061       20.743  73.0594
#> 81     15.2698  5.5190   4.4651     6.1361        7.975  29.8374
#> 82     17.1754  6.5217   5.2441     7.2016        4.565  15.3639
#> 83     19.4846  7.9215   6.5854     8.6864        2.415   9.5342
#> 84     20.2925  8.8740   7.7638     9.5604        1.919   8.2465
#> 85     20.5524  9.4631   8.6243    10.0174        1.925   7.8747
#> 86     21.0251  9.7416   8.9305    10.3246        1.690   7.1036
#> 87     21.2394  9.9224   9.1191    10.5026        1.630   7.0074
#> 88     21.4305 10.1222   9.3742    10.6644        1.476   6.6955
#> 89     21.3950 10.1071   9.3583    10.6592        1.377   6.2291
#> 90     21.1934  9.9890   9.3108    10.4967        1.210   5.7074
#> 91     20.6149  8.9836   7.9823     9.8049        0.984   4.9692
#> 92     15.3090  6.0656   5.2149     6.5341     1121.063  40.1179
#> 93     17.0159  6.8566   5.9698     7.4175      487.836  27.9391
#> 94     17.5654  7.1218   6.2490     7.7141      317.705  19.1583
#> 95     18.1377  7.3646   6.5240     7.9675      228.227  12.7328
#> 96     18.8270  7.5872   6.6755     8.2778      152.993   8.6533
#> 97     18.9793  7.6366   6.7061     8.3467      146.503   8.0413
#> 98     19.0938  7.6047   6.6007     8.3935      136.486   7.4713
#> 99     19.2778  7.7513   6.7907     8.4925      109.570   6.9578
#> 100    19.3645  7.8015   6.8561     8.5307       95.477   6.4883
#> 101    19.5140  7.8276   6.8231     8.6170       73.954   6.0516
#> 102    17.1113  7.2311   6.2105     7.9358       18.049  20.7192
#> 103    17.6301  7.4388   6.3970     8.1531       14.567  17.6208
#> 104    18.3814  7.4873   6.5084     8.1994       11.523  15.1430
#> 105    18.7961  7.4898   6.5681     8.1911        8.927  12.8319
#> 106    18.9251  7.5139   6.5833     8.2254        8.435  12.4214
#> 107    19.1235  7.6021   6.6470     8.3282        8.217  12.0510
#> 108    19.2516  7.6489   6.6782     8.3873        8.091  11.6400
#> 109    19.3403  7.6746   6.6998     8.4159        7.993  11.2769
#> 110    18.3534  6.9595   5.7759     7.9532        7.777  10.8855
#> 111    18.3509  7.3371   6.4909     8.0100        1.225  14.7094
#> 112    19.1541  7.8277   6.8434     8.5807        0.895  11.2197
#> 113    20.4122  8.7019   7.6493     9.4807        0.718   9.7866
#> 114    21.0119  9.0876   7.9951     9.9001        0.630   8.9113
#> 115    22.0157  9.6328   8.4279    10.5509        0.551   7.7841
#> 116    21.4926  9.4058   8.3120    10.2347        0.526   7.5878
#> 117    21.5176  9.4401   8.3457    10.2745        0.504   7.4043
#> 118    21.7988  9.5777   8.4807    10.4186        0.489   7.2330
#> 119    21.7534  9.6500   8.6025    10.4464        0.452   7.0726
#> 120    21.7816  9.3181   8.0160    10.3975        0.402   6.9203
#> 121    16.1436  6.3528   5.8809     6.5724        0.298   7.2120
#> 122    17.7689  7.0599   5.8934     7.6119        0.242   5.7356
#> 123    18.2781  7.3342   6.1680     7.8977        0.208   4.7776
#> 124    18.8483  7.4823   6.2296     8.1511        0.166   4.4416
#> 125    18.7616  7.4255   6.2056     8.0859        0.150   4.1049
#> 126    18.7678  7.4453   6.2668     8.0864        0.142   3.9864
#> 127    19.0982  7.5366   6.2477     8.2617        0.149   4.2611
#> 128    19.2657  7.7158   6.4538     8.4183        0.133   3.9100
#> 129    18.6039  7.7214   6.7018     8.2932        0.131   3.9251
#> 130    17.7225  7.1027   6.4543     7.6416        0.146   9.7605
#> 131    18.6256  7.4313   6.6584     8.0767        0.069   5.7875
#> 132    19.4807  7.8385   6.9508     8.5813        0.050   4.1188
#> 133    20.4980  8.3954   7.4128     9.2344        0.040   3.0396
#> 134    20.8968  8.6994   7.7278     9.4908        0.037   2.6804
#> 135    20.9432  8.7197   7.7298     9.5232        0.038   2.6904
#> 136    20.8689  8.6574   7.6977     9.4697        0.038   2.7212
#> 137    20.7584  8.6727   7.7651     9.3905        0.039   2.7685
#> 138    20.6259  8.5937   7.7043     9.2998        0.040   2.8295
#> 139    21.1537  9.1251   7.6848    10.3878        0.042   2.8952
#> 140    14.1538  5.3839   4.8650     5.6681        3.041  20.6544
#> 141    14.3365  5.3054   4.5920     5.6462        2.430  15.7859
#> 142    15.2520  5.8581   5.0539     6.2649        1.421  11.0260
#> 143    17.0877  6.7203   5.9412     7.1170        0.376   4.1624
#> 144    17.7560  7.0075   6.2431     7.3929        0.352   3.4626
#> 145    18.7687  7.5485   6.7087     7.9990        0.305   2.6140
#> 146    19.2754  7.8124   7.0134     8.2684        0.272   2.4532
#> 147    19.7458  8.1642   7.2777     8.6769        0.319   2.8370
#> 148    19.6213  8.0519   7.1804     8.5653        0.305   2.6758
#> 149    19.7095  8.1296   7.2764     8.6367        0.290   2.5484
#> 150    19.9394  8.2604   7.3423     8.8158        0.286   2.5469
#> 151    19.1297  7.5331   6.5594     8.1538        0.249   2.2512
#> 152    16.5798  6.7492   6.2803     7.1169        1.008  14.2145
#> 153    17.5531  7.1142   6.2425     7.6913        0.473   8.2480
#> 154    17.8263  7.4360   6.3462     8.0991        0.475   7.5354
#> 155    18.2193  7.8975   6.8010     8.5729        0.358   5.3593
#> 156    19.0429  8.1516   7.0575     8.8478        0.277   4.3114
#> 157    19.6102  8.3924   7.4286     9.0314        0.213   3.3858
#> 158    20.6186  8.8149   7.9113     9.4560        0.216   3.7477
#> 159    20.7250  8.9249   8.0154     9.5765        0.194   3.1944
#> 160    20.8361  8.8971   7.9868     9.5657        0.227   3.7158
#> 161    20.6922  8.8090   7.8846     9.5088        0.222   3.6261
#> 162    21.0071  9.0754   8.2030     9.7242        0.180   2.9452
#> 163    21.0883  9.0847   8.1742     9.7822        0.192   3.1451
#> 164    15.5148  6.1290   5.5388     6.3431        0.384  18.1708
#> 165    15.6237  6.2503   5.2876     6.5863        0.379  17.1975
#> 166    15.7141  6.4195   5.5663     6.7320        0.262  11.6447
#> 167    17.0193  7.1501   6.0899     7.5483        0.112   8.6453
#> 168    18.2007  7.3937   6.3238     7.7629        0.079   5.4910
#> 169    19.1974  7.9382   6.6061     8.4547        0.053   3.3377
#> 170    20.2539  8.6019   7.4100     9.0833        0.035   2.5297
#> 171    20.4599  8.6390   7.4073     9.1481        0.032   2.3134
#> 172    20.4216  8.6075   7.3978     9.1120        0.032   2.3224
#> 173    20.3339  8.7398   7.4704     9.2706        0.023   1.6073
#> 174    20.7838  8.9756   7.7484     9.4853        0.022   1.5619
#> 175    20.9889  9.2751   8.2283     9.7395        0.019   1.3846
#> 176    15.4869  6.1231   5.5903     6.4413      171.305  27.0815
#> 177    16.6036  6.5234   5.7368     6.9534       91.413  16.0111
#> 178    17.8423  7.1600   6.2246     7.6734       53.810  10.4974
#> 179    19.2036  7.9389   6.8943     8.5064       26.741   6.0166
#> 180    19.8997  8.2342   7.1730     8.8203       21.508   4.8481
#> 181    20.7039  8.7209   7.6790     9.3339       18.528   4.0298
#> 182    21.0301  8.8977   7.9408     9.5034       15.310   3.5640
#> 183    21.3061  9.1334   8.1417     9.7677       15.455   3.5685
#> 184    21.2244  9.0660   8.1068     9.6894       15.094   3.5098
#> 185    21.3300  9.1668   8.2187     9.7896       14.418   3.4248
#> 186    21.5059  9.3211   8.3785     9.9450       13.922   3.3678
#> 187    20.9313  8.8791   7.8994     9.5562       13.045   3.2190
#> 188    14.7118  5.6119   5.0476     5.8906        0.876  13.4822
#> 189    16.8515  6.5961   5.6620     7.0316        0.478   7.5691
#> 190    17.6993  7.0411   6.0689     7.4812        0.366   5.6321
#> 191    19.3760  7.7324   6.6625     8.2208        0.209   3.6911
#> 192    20.7252  8.5759   7.4264     9.1269        0.174   3.0217
#> 193    21.1507  8.7946   7.6427     9.4313        0.138   2.2779
#> 194    21.5949  9.1308   8.1173     9.7493        0.095   1.7161
#> 195    21.6008  9.1055   8.0274     9.7875        0.097   1.8286
#> 196    21.7768  9.2431   8.1387     9.9539        0.099   1.9507
#> 197    21.8584  9.2641   8.2152     9.9517        0.097   2.0250
#> 198    22.0191  9.4589   8.4073    10.1504        0.094   2.0473
#> 199    22.0155  9.4479   8.3946    10.1585        0.086   1.8573
#> 200    16.7656  6.6518   5.7831     7.0788       15.525  18.3055
#> 201    18.2290  7.1777   6.0963     7.7156        8.329  10.4843
#> 202    19.9392  8.0350   6.7949     8.7211        5.703   7.4095
#> 203    21.2219  8.7797   7.4272     9.5760        3.548   4.5781
#> 204    22.0131  9.2560   7.8672    10.0902        2.851   3.6787
#> 205    22.7174  9.7715   8.3819    10.6239        2.872   3.5865
#> 206    23.0578 10.0383   8.7382    10.8736        2.755   3.6364
#> 207    23.2348 10.2125   8.9169    11.0477        2.669   3.6075
#> 208    23.1967 10.1950   8.9409    11.0162        2.755   3.7645
#> 209    23.3352 10.3199   9.0566    11.1562        2.712   3.8063
#> 210    23.4093 10.3972   9.1651    11.2209        2.643   3.7376
#> 211    22.9236  9.9581   8.6970    10.8429        2.426   3.5012
#> 212    19.3820  7.9870   6.8114     8.4965        3.341   4.3517
#> 213    20.0962  8.3232   7.2515     8.7973        2.685   3.8539
#> 214    20.5810  8.5322   7.5646     9.0581        2.366   3.4674
#> 215    20.8177  8.6569   7.7719     9.2307        2.401   3.2851
#> 216    21.1062  8.9074   7.9910     9.5106        2.753   3.5165
#> 217    21.0555  8.8694   7.9814     9.4689        2.540   3.2327
#> 218    21.0098  8.8831   8.0236     9.4765        2.502   3.1740
#> 219    21.2487  9.0942   8.2339     9.6957        2.489   3.1888
#> 220    21.1005  8.9370   8.0481     9.5794        2.376   3.0613
#> 221    16.6454  6.8164   6.0044     7.4127        4.022  27.5123
#> 222    17.1447  6.7297   6.0490     7.5420        2.614  17.1899
#> 223    18.5022  7.5742   6.7005     8.2586        1.019   9.4556
#> 224    19.2378  7.8058   6.7850     8.5453        0.591   5.5726
#> 225    20.1929  8.3249   7.1748     9.1498        0.448   4.1400
#> 226    20.8042  8.7520   7.6345     9.5457        0.413   3.5879
#> 227    20.9253  8.8911   7.8255     9.6646        0.334   3.6331
#> 228    21.1640  9.1409   8.1367     9.8559        0.338   3.6377
#> 229    20.9047  8.9863   8.0184     9.6831        0.325   3.6417
#> 230    21.3143  9.2904   8.3013     9.9998        0.313   3.5985
#> 231    21.0927  9.2086   8.2957     9.8628        0.300   3.5590
#> 232    21.8167  9.6284   8.8702    10.1983        0.274   3.2323
#> 233    14.3463  5.4646   5.0515     5.7277        5.360  35.3544
#> 234    14.6065  5.5620   4.9446     5.9233        3.322  22.0114
#> 235    15.3740  6.0720   5.3493     6.4679        1.875  15.0404
#> 236    16.5929  6.7686   5.9982     7.1663        0.910   9.3669
#> 237    17.0445  6.8595   6.0266     7.2783        0.613   6.3050
#> 238    17.8580  7.2784   6.4508     7.6821        0.473   5.1834
#> 239    18.0848  7.4492   6.6651     7.8348        0.379   4.1105
#> 240    18.5698  7.7828   6.8624     8.2386        0.372   3.9597
#> 241    18.2779  7.6174   6.8009     8.0157        0.325   3.4801
#> 242    18.4306  7.7193   6.9130     8.1114        0.299   3.2426
#> 243    18.5090  7.8448   7.1031     8.2037        0.332   3.6253
#> 244    17.8962  7.4939   6.6481     7.9186        0.316   3.3985
#> 245    16.6285  6.5846   6.6139     6.5832        0.053  12.9295
#> 246    18.9628  8.0782   7.0473     8.9114        0.035   7.6699
#> 247    19.5809  8.6909   7.7201     9.4571        0.028   5.9366
#> 248    19.7198  8.4678   7.9379     8.8285        0.013   3.0675
#> 249    20.7554  8.5549   7.6805     9.2123        0.010   2.3551
#> 250    21.2039  8.7568   7.7002     9.6215        0.011   2.2148
#> 251    21.0807  8.9470   8.3106     9.4365        0.009   2.1039
#> 252    20.9717  8.8964   7.8522     9.8014        0.003   0.7359
#> 253    21.2462  9.0676   8.5377     9.4969        0.011   2.7098
#> 254    21.4174  9.1998   8.6719     9.5957        0.007   1.6834
#> 255    21.8347  9.2693   8.5849     9.8474        0.005   1.1412
#> 256    21.8284  9.4766   9.0763     9.7919        0.013   2.8532
#> 257    13.6617  5.9440   5.3775     6.4434     2579.906  91.5798
#> 258    14.3429  6.4434   6.0575     6.7433     2001.485  68.8963
#> 259    14.6188  6.4492   6.1746     6.6703     1610.506  57.0779
#> 260    15.0065  6.6423   6.4227     6.8233     1228.819  45.5346
#> 261    15.5996  7.1438   6.8839     7.3523      877.600  34.9057
#> 262    15.6760  7.2253   6.9632     7.4347      832.164  33.0146
#> 263    15.7411  7.2962   7.0344     7.5046      768.099  31.2391
#> 264    15.8010  7.3568   7.0968     7.5632      727.372  29.5615
#> 265    15.8570  7.4050   7.1492     7.6076      677.733  28.0056
#> 266    15.3694  6.9153   6.5098     7.2519      625.665  26.5391
#> 267    13.3954  5.4131   5.1183     5.6358      300.976  63.2318
#> 268    13.8781  5.6059   5.2491     5.8726      193.810  41.2590
#> 269    14.2111  5.7460   5.3532     6.0387      161.938  33.4911
#> 270    14.4977  5.8759   5.4374     6.1926      137.835  27.5200
#> 271    14.9238  6.0491   5.5529     6.3911      110.651  22.7108
#> 272    15.0063  6.0848   5.5795     6.4300      105.200  21.8820
#> 273    15.1024  6.1240   5.6036     6.4773       99.163  21.0899
#> 274    15.1793  6.1518   5.6148     6.5144       94.538  20.3957
#> 275    15.2667  6.1937   5.6541     6.5547       90.569  19.6483
#> 276    14.2963  5.5878   4.9481     6.0371       86.986  18.9733
#> 277    15.0649  6.0944   5.5398     6.5591        1.252  19.4474
#> 278    15.7025  6.2293   5.4576     6.8014        0.823  11.1448
#> 279    17.0570  6.7373   5.7084     7.4558        0.437   8.2452
#> 280    17.9132  7.1088   6.1730     7.7214        0.338   6.2212
#> 281    19.4980  7.9664   6.9029     8.6539        0.234   3.8524
#> 282    20.6785  8.7937   7.7410     9.4938        0.277   3.6635
#> 283    21.0695  8.9979   8.1728     9.5896        0.230   3.5072
#> 284    21.1058  9.0534   8.1416     9.7374        0.196   3.0697
#> 285    21.4162  9.2349   8.4332     9.8412        0.185   2.9775
#> 286    21.5221  9.3457   8.4505    10.0263        0.172   2.8117
#> 287    21.8795  9.5375   8.6203    10.2440        0.187   3.1375
#> 288    21.6620  9.3884   8.5168    10.0871        0.162   2.8412
#> 289    18.8982  8.5471   8.0516     8.9908        0.877   9.3926
#> 290    19.4722  8.6968   8.3121     8.9904        0.746   5.6927
#> 291    20.2518  9.0014   8.6038     9.2786        0.618   4.4434
#> 292    21.4587  9.7365   9.2426    10.0726        0.605   3.7971
#> 293    21.5725  9.5435   8.9134     9.9943        0.524   3.0638
#> 294    21.7308  9.7432   9.4097     9.9850        0.520   2.9927
#> 295    22.0002  9.7456   9.0175    10.2839        0.531   3.0156
#> 296    22.0885  9.9093   9.3577    10.3093        0.530   2.9975
#> 297    21.9918  9.8459   9.3195    10.2332        0.505   2.8809
#> 298    21.9453  9.6207   9.0012    10.0858        0.384   2.2395
#> 299    16.0250  6.3330   5.8402     6.6684       26.343  29.1146
#> 300    17.1067  6.6506   5.8446     7.1236        9.209  14.3114
#> 301    18.8891  7.6282   6.6573     8.1966        4.637   8.1348
#> 302    20.4728  8.4737   7.3269     9.1551        2.449   4.5356
#> 303    21.2532  8.8449   7.6553     9.5585        1.985   3.5777
#> 304    21.8951  9.1743   7.9766     9.9251        1.787   3.1746
#> 305    21.9274  9.2139   8.1930     9.8844        1.378   2.8539
#> 306    22.4122  9.5876   8.4946    10.3121        1.317   2.8036
#> 307    22.1297  9.3658   8.3340    10.0638        1.306   2.8632
#> 308    22.4813  9.6563   8.6464    10.3402        1.245   2.8400
#> 309    22.5313  9.6767   8.6631    10.3754        1.050   2.4896
#> 310    21.6428  8.9690   7.9755     9.6928        1.006   2.4550
#> 311    15.3636  5.8771   5.2598     6.2577       26.242  13.4823
#> 312    17.6633  6.8202   6.0957     7.2958       11.793   7.3370
#> 313    19.9823  7.9747   6.9150     8.6579        5.375   4.5527
#> 314    22.3371  9.5197   7.8763    10.4966        3.923   3.2825
#> 315    23.0837  9.9061   8.1077    10.9928        2.983   2.7497
#> 316    23.7291 10.1965   8.3644    11.3877        2.497   2.3305
#> 317    24.2237 10.5306   8.8044    11.7029        1.946   1.9550
#> 318    24.3567 10.6233   8.9035    11.8055        1.935   1.9912
#> 319    24.4251 10.6485   8.9357    11.8428        1.737   1.8435
#> 320    24.4943 10.7283   9.0411    11.9150        1.719   1.8790
#> 321    24.6073 10.8132   9.1487    11.9970        1.630   1.8695
#> 322    24.8943 11.0585   9.3661    12.2695        1.515   1.7939
#> 323    14.5543  5.3584   4.3356     5.9031       45.164  45.9168
#> 324    14.6926  5.4769   3.9357     6.2979       23.629  27.7135
#> 325    16.4996  6.3938   4.5695     7.3316        8.603  12.5584
#> 326    18.8245  7.5480   5.7636     8.5272        3.621   6.0241
#> 327    19.9287  8.1437   6.4710     9.0791        1.918   4.3892
#> 328    21.5114  9.0496   7.1740    10.0329        1.475   3.2672
#> 329    22.5603  9.8054   7.9016    10.8096        1.165   2.7334
#> 330    22.7863  9.9713   8.0617    10.9884        1.064   2.6489
#> 331    22.9980 10.1257   8.2181    11.1547        0.925   2.5668
#> 332    23.0118 10.1097   8.2018    11.1696        0.811   2.4832
#> 333    23.2320 10.2578   8.3418    11.3396        0.718   2.4006
#> 334    23.8447 10.0246   8.0252    11.2210        0.639   2.3254
#> 335    16.7196  6.8642   6.0475     7.1512        0.212  10.5079
#> 336    17.0273  6.8782   5.9617     7.1658        0.174   7.9517
#> 337    17.8753  7.3654   6.3492     7.7359        0.110   5.3886
#> 338    18.6802  7.7724   6.7865     8.1524        0.091   4.1029
#> 339    18.8061  7.8410   6.7182     8.2894        0.081   3.6700
#> 340    18.8090  7.8900   6.7702     8.3460        0.085   4.0387
#> 341    18.8881  7.9226   6.8182     8.3732        0.060   3.0417
#> 342    19.2792  8.1394   6.9926     8.6113        0.064   3.3686
#> 343    19.0675  8.1458   7.2684     8.5242        0.060   3.3759
#> 344    17.7850  7.3794   6.6893     7.6669        0.289   8.3850
#> 345    17.9423  7.3304   6.4748     7.6658        0.213   7.1255
#> 346    18.5914  7.6008   6.6535     7.9949        0.153   4.8257
#> 347    19.0355  7.8121   6.8548     8.2310        0.134   4.2489
#> 348    19.2114  7.9968   6.9533     8.4539        0.139   4.4428
#> 349    19.3143  7.9603   6.8703     8.4460        0.084   2.8701
#> 350    19.5422  8.1403   7.0784     8.6076        0.095   3.3555
#> 351    19.8301  8.4384   7.3147     8.9321        0.089   3.2264
#> 352    19.0588  7.9607   6.7801     8.4998        0.068   2.6664
#> 353    14.9618  5.7822   5.1946     6.2193        0.109  24.7217
#> 354    16.0750  5.9709   5.4619     6.2455        0.048  11.5905
#> 355    17.9407  7.1032   6.1639     7.5855        0.036   7.4415
#> 356    19.4669  7.6973   6.4048     8.3891        0.029   5.1544
#> 357    20.1532  8.4198   7.3875     8.9095        0.014   2.5781
#> 358    21.1348  8.7334   7.4424     9.5015        0.020   3.4711
#> 359    21.3144  9.1844   8.1686     9.8625        0.017   2.7734
#> 360    22.0312  9.3847   8.2573    10.1416        0.022   3.7328
#> 361    21.2531  9.4409   8.5539     9.9980        0.020   3.2249
#> 362    21.6998  9.2705   8.1649    10.0608        0.027   4.3423
#> 363    22.0162  9.4392   8.4367    10.1184        0.028   4.6042
#> 364    21.6299  9.1730   8.0119    10.0333        0.029   4.4686
#> 365    16.9815  6.4407   5.6435     6.9929        0.053   9.4836
#> 366    19.0109  7.0560   5.5877     8.2123        0.024   5.2886
#> 367    20.0056  7.9909   6.6820     8.9463        0.022   5.4850
#> 368    21.3899  9.4313   8.2701    10.1828        0.022   5.5254
#> 369    22.7551 10.2178   8.6607    11.2968        0.024   5.6786
#> 370    22.6374 10.4076   9.1759    11.2152        0.032   7.1948
#> 371    23.5722 10.8236   9.1504    12.0263        0.027   6.3463
#> 372    23.3290 10.5798   8.9954    11.7224        0.024   5.5567
#> 373    22.9860 10.1617   8.5901    11.3463        0.028   6.4793
#> 374    22.3391  9.5946   8.2689    10.5966        0.017   3.8594
#> 375    13.0850  5.8771   5.8094     5.9371      178.956  79.5861
#> 376    15.1181  6.7037   6.6144     6.7795      131.431  55.6183
#> 377    16.2011  7.1290   6.9967     7.2427       88.245  36.3365
#> 378    16.8781  7.4130   7.4142     7.4239       55.202  23.1774
#> 379    17.1951  7.4681   7.4567     7.4887       43.881  18.9170
#> 380    17.3737  7.7163   7.8173     7.6491       36.710  15.8977
#> 381    17.6448  7.8601   7.9041     7.8240       29.888  13.4988
#> 382    17.6941  7.9114   7.9645     7.8675       28.312  13.0620
#> 383    17.7614  7.9705   8.0572     7.9036       26.898  12.6375
#> 384    17.8982  8.0539   8.1441     7.9796       25.941  12.2240
#> 385    18.0492  8.1049   8.1901     8.0342       25.086  11.8209
#> 386    16.1672  7.1752   6.9235     7.3819       24.032  11.4280
#> 387    16.5089  6.5765   6.1785     6.9003        2.884  12.0039
#> 388    18.3396  7.4050   6.4509     8.0493        1.570   8.7360
#> 389    18.9592  7.5993   6.3552     8.2977        1.437   7.2079
#> 390    19.2032  7.7151   6.5198     8.3799        1.073   5.1512
#> 391    19.9921  8.1616   6.9511     8.8644        0.921   4.8328
#> 392    20.7552  8.7075   7.6370     9.3604        0.700   3.7732
#> 393    20.9309  8.8116   7.8940     9.4298        0.562   3.2483
#> 394    21.0102  8.8667   7.9334     9.5158        0.601   3.4598
#> 395    21.0588  8.8869   8.0377     9.4855        0.610   3.5448
#> 396    21.0382  8.9081   8.0732     9.5029        0.585   3.4243
#> 397    21.2366  9.0674   8.2002     9.6974        0.624   3.6411
#> 398    20.7333  8.5910   7.6882     9.2787        0.656   3.8254
#> 399    15.9668  6.5244   5.7604     7.0489        1.033  16.6256
#> 400    16.6836  6.8646   5.6489     7.6092        0.647  12.7241
#> 401    18.3338  7.7265   6.6383     8.3879        0.506   8.5070
#> 402    20.1252  8.5556   7.2852     9.3523        0.347   6.1433
#> 403    20.6343  8.7684   7.7961     9.3871        0.300   5.2241
#> 404    21.1802  9.1032   8.2214     9.7405        0.320   5.0386
#> 405    21.2705  9.1758   8.4560     9.7288        0.253   4.2436
#> 406    21.7306  9.4075   8.6355    10.0138        0.207   3.5320
#> 407    21.2978  9.2086   8.4975     9.7746        0.226   3.8463
#> 408    21.6585  9.3358   8.5497     9.9766        0.211   3.6449
#> 409    21.7251  9.3964   8.7022     9.9653        0.266   4.5071
#> 410    22.3875  9.8914   9.0856    10.5486        0.217   3.7618
#> 411    16.7237  6.6187   6.1402     6.9737        0.783  12.0170
#> 412    18.0302  7.2434   6.4633     7.7661        0.410   8.0308
#> 413    18.5596  7.4237   6.3983     8.0611        0.419   6.9013
#> 414    19.7224  7.9147   6.7812     8.6198        0.223   3.7706
#> 415    20.6309  8.5326   7.3040     9.3224        0.173   3.0574
#> 416    20.9844  8.8234   7.7376     9.5501        0.168   2.7564
#> 417    21.5257  9.1454   8.1778     9.8348        0.137   2.3385
#> 418    21.5722  9.2883   8.3815     9.9302        0.126   2.1412
#> 419    21.5710  9.3003   8.4016     9.9531        0.127   2.2357
#> 420    21.7503  9.3906   8.5302    10.0245        0.127   2.2943
#> 421    21.9020  9.5201   8.6318    10.1724        0.112   2.0628
#> 422    22.0562  9.6018   8.7418    10.2461        0.091   1.7035
#> 423    15.8606  6.4403   5.7684     6.8658      784.321  40.9798
#> 424    17.2010  6.9958   6.0550     7.5406      501.524  27.9434
#> 425    18.4191  7.6352   6.5537     8.2579      315.157  17.9793
#> 426    19.5647  8.2404   7.1246     8.8960      185.627  11.3094
#> 427    20.2601  8.6014   7.4885     9.2719      147.974   9.2057
#> 428    20.9747  9.0293   7.9251     9.7340      122.074   7.5079
#> 429    21.3135  9.2450   8.2149     9.9421      103.421   6.5321
#> 430    21.5182  9.4219   8.3705    10.1402      100.358   6.3766
#> 431    21.5031  9.3993   8.3677    10.1144       96.291   6.2198
#> 432    21.6005  9.4883   8.4713    10.1995       92.498   6.0719
#> 433    21.7495  9.6059   8.5885    10.3240       89.047   5.9550
#> 434    21.0722  9.1406   8.0934     9.9096       83.019   5.7136
#> 435    15.0962  6.0010   5.3950     6.3141       19.268  35.6744
#> 436    15.9302  6.2672   5.5335     6.6330       17.639  25.2536
#> 437    16.0529  6.3825   5.5364     6.8236       10.400  18.9306
#> 438    17.3777  7.0668   6.2360     7.4744        3.052   8.0568
#> 439    18.5101  7.5835   6.6434     8.0388        2.302   6.3355
#> 440    19.2147  7.9663   6.9914     8.4657        2.078   4.9321
#> 441    19.9487  8.5287   7.5034     9.0689        1.586   4.1724
#> 442    19.9431  8.5323   7.5058     9.0797        1.600   4.0959
#> 443    19.9294  8.5409   7.5142     9.0953        1.664   4.1128
#> 444    19.8994  8.5597   7.5445     9.1105        1.502   3.8469
#> 445    20.0995  8.7884   7.7770     9.3371        1.446   3.7866
#> 446    19.3008  8.2523   6.9614     8.9967        1.282   3.5348
#> 447    14.9551  6.0072   5.3562     6.3775       11.036  60.5261
#> 448    16.3269  6.4167   5.6657     6.8338        3.869  24.4313
#> 449    17.4376  6.8490   6.0795     7.2935        1.272  10.8953
#> 450    19.0507  7.6676   6.7297     8.2594        0.679   5.7456
#> 451    19.7982  7.9924   7.0105     8.6249        0.382   3.5052
#> 452    21.0333  8.6556   7.6417     9.2985        0.260   2.5840
#> 453    21.6944  9.0817   8.1089     9.7085        0.251   2.9743
#> 454    21.8129  9.1754   8.1371     9.8582        0.280   3.2475
#> 455    22.0526  9.3287   8.2824    10.0194        0.224   2.6083
#> 456    22.0312  9.2823   8.2537     9.9658        0.285   3.3123
#> 457    22.2791  9.4951   8.5002    10.1516        0.244   2.8488
#> 458    21.6840  9.0624   8.1327     9.6888        0.199   2.3764
#> 459    13.9897  5.1338   4.9960     5.2188       20.668  47.4702
#> 460    14.1769  5.2047   5.0432     5.3112       11.090  28.8491
#> 461    15.1208  5.7688   5.5668     5.9022        7.956  24.7415
#> 462    15.7774  6.2599   5.9824     6.4121        4.259  18.6115
#> 463    15.3426  5.1822   4.8644     5.3669        3.556  15.6171
#> 464    17.2137  7.0214   6.6906     7.2300        2.348  10.4671
#> 465    17.5817  6.8883   6.4670     7.1416        1.558   7.6457
#> 466    17.8511  7.1491   6.6788     7.4287        1.430   6.8932
#> 467    17.8166  7.1074   6.6405     7.3819        1.402   6.6073
#> 468    17.9290  7.1675   6.6886     7.4477        1.233   5.9697
#> 469    18.0945  7.3273   6.9122     7.5697        1.135   5.7480
#> 470    17.3349  6.8843   6.1405     7.3274        1.078   5.5583
#> 471    14.7231  5.9917   5.0930     6.2560       19.838  15.7003
#> 472    15.2261  6.2646   5.3500     6.5253       16.141  10.9261
#> 473    16.2467  6.6371   5.7244     6.9521       15.212   8.4194
#> 474    17.6000  7.4108   6.5781     7.7281       12.693   6.5636
#> 475    17.7491  7.5415   6.7652     7.8427       11.286   5.9590
#> 476    18.1155  7.7495   6.9767     8.0534        9.206   5.3433
#> 477    18.2257  7.8453   7.0339     8.1671        8.120   4.9968
#> 478    18.5078  8.1880   7.1735     8.5906        7.175   4.7418
#> 479    16.7366  7.1470   6.0968     7.5787        6.732   4.5979
#> 480    15.6163  6.2158   5.7951     6.5479        8.069  18.1508
#> 481    16.9531  7.1207   6.8147     7.3703        5.946  13.5743
#> 482    17.8988  7.7400   7.5569     7.9201        5.140  10.0852
#> 483    18.6167  7.9828   7.7572     8.2471        4.355   7.4941
#> 484    18.9283  8.1759   7.9502     8.4516        4.238   7.0852
#> 485    19.1529  8.2832   8.0194     8.6140        4.078   6.7112
#> 486    19.2090  8.2292   7.8669     8.6816        3.812   6.3711
#> 487    19.0228  7.9541   7.4195     8.6057        3.363   6.0622
#> 488    18.7016  7.5736   6.8442     8.4410        3.014   5.7805
#> 489    14.4907  5.5901   5.2664     5.8020        2.008  25.0295
#> 490    15.1341  5.6529   5.0442     6.0365        1.946  20.2982
#> 491    15.6826  6.0561   5.3653     6.4697        0.969  12.2142
#> 492    16.4979  6.5019   5.8988     6.8371        0.468   8.5054
#> 493    17.1248  6.6658   5.8930     7.0723        0.392   7.2227
#> 494    17.8540  7.0696   6.2961     7.4579        0.344   5.6822
#> 495    18.6816  7.5381   6.8209     7.8953        0.282   5.0821
#> 496    19.0180  7.8207   7.0566     8.2039        0.311   5.4224
#> 497    18.9861  7.7367   6.9583     8.1313        0.258   4.4505
#> 498    19.0883  7.8794   7.0869     8.2851        0.283   4.8941
#> 499    19.4755  8.2277   7.4866     8.6031        0.287   5.0028
#> 500    18.6489  7.5453   6.6252     8.0357        0.284   4.9897
#> 501    14.6074  5.7754   5.1763     6.0632        0.690  24.4286
#> 502    16.3366  6.7136   5.8397     7.1001        0.454  14.1680
#> 503    16.7728  6.6093   5.7241     7.0308        0.181   8.0334
#> 504    18.3539  7.4304   6.2107     7.9904        0.081   4.5186
#> 505    19.3698  7.9378   6.6523     8.4668        0.068   3.7709
#> 506    20.2296  8.3841   7.2252     8.9067        0.058   2.5872
#> 507    20.8368  8.7771   7.6989     9.3375        0.037   1.8029
#> 508    20.8737  8.7818   7.6563     9.3897        0.038   1.8815
#> 509    20.9509  8.7645   7.5269     9.4622        0.042   2.0697
#> 510    21.1175  8.9008   7.6202     9.6393        0.032   1.6538
#> 511    21.0992  9.0323   7.9685     9.6448        0.040   2.0607
#> 512    20.3436  8.2037   7.1931     8.8289        0.039   2.0790
#> 513    14.1315  6.5428   6.4278     6.6280       68.765  67.5324
#> 514    14.8013  6.7727   6.4101     7.0407       56.102  47.5050
#> 515    15.7092  7.5028   7.1670     7.7206       46.996  45.7998
#> 516    15.7872  7.5426   7.2462     7.7325       57.932  51.8718
#> 517    16.2313  7.6831   7.0795     8.0539       41.191  35.3859
#> 518    16.4588  8.2411   7.7540     8.4912       33.407  27.9525
#> 519    16.7678  8.4887   7.7708     8.8598       30.491  26.1516
#> 520    16.8760  8.6963   7.9509     9.0747       27.447  23.7739
#> 521    16.9326  8.9071   8.3048     9.1991       30.342  26.0829
#> 522    16.9340  8.9024   8.1656     9.2676       32.673  27.8262
#> 523    15.3945  7.8488   6.8311     8.3886       25.776  21.7687
#> 524    16.1599  6.4663   5.9007     6.8104       18.628  28.1299
#> 525    17.8668  7.1167   6.3572     7.5681        6.845  11.9032
#> 526    19.2104  7.7057   6.8338     8.2334        3.097   7.6083
#> 527    20.6808  8.4657   7.4110     9.0927        1.752   4.4126
#> 528    21.1943  8.6019   7.5005     9.2989        1.711   3.7318
#> 529    22.3648  9.3538   8.1752    10.1274        1.522   3.1501
#> 530    22.5725  9.4493   8.3843    10.1797        1.104   2.6404
#> 531    22.9597  9.7907   8.6630    10.5667        1.080   2.6445
#> 532    22.8816  9.6997   8.5891    10.4736        1.044   2.6566
#> 533    22.9905  9.7867   8.6735    10.5678        0.976   2.6135
#> 534    23.3227 10.0516   8.9019    10.8638        0.932   2.5914
#> 535    22.2419  9.2154   8.1026    10.0312        0.864   2.4959
#> 536    16.9434  6.7641   6.2508     7.1616        1.233  11.2849
#> 537    17.9564  7.0421   6.1420     7.6692        0.665   6.8896
#> 538    19.0302  7.6022   6.5777     8.2714        0.744   6.1014
#> 539    20.0668  8.1743   7.1229     8.8700        0.310   3.4521
#> 540    20.5717  8.4990   7.4262     9.2405        0.246   2.4275
#> 541    21.0030  8.8232   7.8585     9.5044        0.291   2.5537
#> 542    21.3940  9.0896   8.1940     9.7474        0.278   2.4312
#> 543    21.4626  9.1774   8.3338     9.8008        0.286   2.4679
#> 544    21.4471  9.1519   8.3052     9.7846        0.271   2.3517
#> 545    21.5576  9.2282   8.3538     9.8980        0.231   2.0118
#> 546    21.9911  9.5184   8.6496    10.1807        0.232   2.0313
#> 547    21.4490  9.0019   8.1046     9.7237        0.264   2.3341
#> 548    16.2570  6.3223   5.7815     6.6580        1.528  15.3400
#> 549    18.0793  7.1367   6.1979     7.6741        0.671   9.2105
#> 550    19.4227  7.7065   6.5564     8.3709        0.571   6.9460
#> 551    20.7022  8.4281   7.3546     9.0674        0.382   4.9332
#> 552    21.4583  8.8570   7.7586     9.5284        0.307   4.2443
#> 553    21.9834  9.2472   8.1987     9.9067        0.309   3.9046
#> 554    22.1553  9.4113   8.4734    10.0421        0.341   4.0040
#> 555    22.5215  9.7299   8.7730    10.3756        0.308   3.5585
#> 556    22.4833  9.6913   8.8010    10.2975        0.311   3.5951
#> 557    22.6269  9.8109   8.9236    10.4256        0.288   3.3245
#> 558    22.6639  9.9093   9.0620    10.5076        0.282   3.2980
#> 559    22.1853  9.2929   8.3181    10.0216        0.314   3.6915
#> 560    15.6048  6.1932   5.1273     7.1123      196.425 131.6508
#> 561    16.5755  6.6365   5.4177     7.8675      146.119  95.4942
#> 562    16.7728  6.8808   5.4236     7.9481       84.645  58.7306
#> 563    16.9547  6.8260   5.3842     7.8203       43.617  31.1158
#> 564    17.2013  6.7669   5.3626     7.7867       28.254  21.6499
#> 565    17.6039  6.8205   5.4690     7.8020       19.279  15.2640
#> 566    18.4111  7.1383   5.7630     8.1353       15.804  11.3807
#> 567    18.4463  7.1233   5.7589     8.1221       15.145  10.8075
#> 568    18.7007  7.2525   5.8635     8.2622       14.344  10.2884
#> 569    18.9525  7.3943   5.9900     8.4061       13.420   9.8136
#> 570    19.1083  7.4838   6.0730     8.4885       12.178   9.3794
#> 571    18.0923  6.6436   5.3013     7.7258       10.804   8.9595
#> 572    15.9738  6.5076   5.5702     6.9844       16.620  18.4983
#> 573    16.8348  6.8722   5.6825     7.4412        9.240  12.3633
#> 574    17.8498  7.5118   6.2533     8.1774        6.391   8.0382
#> 575    18.8737  7.9547   6.8626     8.5873        3.798   5.5264
#> 576    19.6006  8.3030   7.3495     8.8887        3.718   5.1025
#> 577    20.5773  8.8857   8.0098     9.4665        3.575   4.4109
#> 578    20.7628  8.9122   8.1717     9.4525        3.021   3.8707
#> 579    20.9864  9.1275   8.3532     9.7009        2.991   3.8449
#> 580    21.0052  9.1041   8.3523     9.6725        2.952   3.8814
#> 581    21.0249  9.1392   8.4107     9.6987        2.795   3.7910
#> 582    21.3449  9.3552   8.5878     9.9510        2.799   3.8978
#> 583    20.5629  8.7180   7.9339     9.3583        2.554   3.6922
#> 584    16.9036  7.1478   6.2905     7.7643       80.997  20.8828
#> 585    18.3117  7.8513   6.6728     8.5711       47.431  12.7017
#> 586    19.0376  8.3617   7.0536     9.1198       40.288   9.6789
#> 587    19.0497  8.2410   7.2058     8.8756       28.320   7.1763
#> 588    19.6112  8.5483   7.6201     9.1371       28.515   7.0391
#> 589    20.3474  9.0288   8.1463     9.6189       24.709   6.1851
#> 590    20.5588  9.1812   8.4007     9.7330       23.371   5.8668
#> 591    20.7237  9.3280   8.5484     9.8830       23.084   5.8323
#> 592    20.7008  9.2966   8.5257     9.8564       22.198   5.7140
#> 593    20.8021  9.3745   8.6257     9.9235       21.309   5.5708
#> 594    20.9061  9.4399   8.6876     9.9973       20.922   5.5350
#> 595    19.7468  8.6229   7.8878     9.1864       19.281   5.2664
#>     LBsurvivingAge1 Under5Deaths       Q5    Q0040 Q0040Male Q0040Female
#> 1           706.772       21.367  29.7242  62.8106   72.3788     52.9598
#> 2           707.392       15.418  21.4278  53.3112   65.1919     41.0013
#> 3           708.033       12.781  17.8537  45.7490   56.2688     34.8109
#> 4           747.364       11.397  15.1620  44.3647   54.6366     33.6283
#> 5           760.446        9.888  12.8914  40.7740   51.3910     29.6312
#> 6           729.979        9.310  12.5275  41.2893   51.1970     30.9001
#> 7           708.850        8.819  12.1924  40.2723   49.4376     30.6671
#> 8           678.491        8.246  11.8426  39.8249   48.4934     30.7451
#> 9           619.727        7.432  11.5200  38.3109   46.4661     29.7663
#> 10          528.693        6.321  11.1995  36.9391   44.6340     28.8793
#> 11          252.859        5.633  22.2027  58.0982   71.3463     43.9472
#> 12          223.742        2.887  12.7639  39.9486   51.4195     27.9190
#> 13          261.412        2.476   9.4945  33.5809   44.1571     22.6511
#> 14          248.439        1.549   6.1658  28.2952   37.4304     18.9896
#> 15          263.891        1.582   6.0200  22.8985   29.9613     15.6974
#> 16          300.457        1.451   4.8369  19.9008   25.8421     13.7800
#> 17          304.664        1.154   3.7587  18.0000   23.1439     12.7353
#> 18          308.846        1.150   3.6949  17.6934   22.7141     12.5578
#> 19          307.240        1.223   3.9411  18.0921   23.4462     12.6459
#> 20          313.144        1.151   3.6722  17.2258   22.6061     11.7379
#> 21          304.460        1.160   3.7867  17.6056   22.8405     12.2514
#> 22          294.377        1.071   3.5937  17.1330   22.1470     12.0046
#> 23           77.738        0.450   5.6839  25.3014   33.8824     16.4272
#> 24           77.333        0.391   5.0048  21.9028   28.7809     14.8135
#> 25           78.050        0.371   4.7465  19.4547   25.8285     12.9312
#> 26           83.354        0.304   3.6708  15.9023   20.7672     10.8576
#> 27           86.923        0.325   3.7723  15.4955   19.6795     11.1149
#> 28           87.130        0.314   3.6086  14.9235   19.0921     10.5412
#> 29           85.210        0.273   3.1819  14.8640   18.9450     10.5618
#> 30           84.524        0.318   3.7313  15.5080   20.2089     10.5714
#> 31           83.241        0.313   3.7202  14.9716   18.6011     11.1638
#> 32          138.900        3.498  24.5850  56.3088   69.2692     42.6960
#> 33          122.150        1.813  14.6908  44.7109   55.5748     33.2425
#> 34          122.951        1.192   9.7040  34.9387   44.6222     24.7516
#> 35          115.392        0.699   6.0474  28.7079   37.7684     19.2943
#> 36          118.119        0.561   4.7761  22.1851   29.0827     15.0712
#> 37          128.233        0.570   4.4434  20.7684   27.1581     14.1950
#> 38          120.835        0.480   3.9061  17.2694   21.9313     12.5081
#> 39          120.569        0.460   3.7653  17.1500   22.5659     11.5805
#> 40          118.349        0.507   4.2176  17.4563   22.2727     12.5173
#> 41          116.933        0.517   4.3552  16.9606   21.5483     12.2603
#> 42          117.035        0.489   4.1365  16.1876   20.7263     11.5492
#> 43          115.252        0.425   3.6418  15.7492   20.0229     11.3913
#> 44         3114.914      441.165 132.2374 227.1886  246.9399    206.7448
#> 45         3714.176      370.771  95.5575 171.8073  189.0052    153.9569
#> 46         3539.795      233.128  62.5217 121.8221  142.7681    100.2036
#> 47         3369.341      120.453  34.5790  85.6070  109.3028     61.1257
#> 48         3111.009       79.153  24.8261  72.5265   96.9074     47.3587
#> 49         2927.707       56.286  18.8820  64.7218   88.6820     39.9861
#> 50         2925.014       47.318  15.9988  59.1337   82.1715     35.2899
#> 51         2840.164       45.260  15.6521  59.0603   82.2367     35.0440
#> 52         2856.927       44.636  15.4229  58.3126   81.7376     34.0165
#> 53         2856.553       43.691  15.1052  55.3456   76.8776     33.0519
#> 54         2778.774       41.917  14.8138  53.0348   72.5420     32.8747
#> 55         2681.380       39.747  14.4980  53.6995   72.7909     33.9743
#> 56          135.828        4.383  31.5322  63.3195   76.8053     49.1861
#> 57          126.105        3.139  24.0076  56.1990   69.7737     42.0021
#> 58          105.324        1.960  18.0121  52.9290   68.0675     37.1739
#> 59           71.272        1.163  16.3488  47.2661   58.9549     35.0244
#> 60           71.226        0.902  12.7389  40.3724   50.9621     29.1363
#> 61           75.453        0.834  10.9494  36.3429   45.1871     26.8596
#> 62           65.526        0.511   7.7066  30.8373   39.1062     21.9139
#> 63           64.660        0.491   7.4992  30.1569   39.5642     19.9974
#> 64           63.591        0.494   7.6624  29.1925   37.7422     19.9807
#> 65           61.933        0.446   7.0611  29.8556   37.9572     21.1338
#> 66           61.210        0.416   6.6750  29.6793   37.9674     20.7623
#> 67           58.588        0.358   5.9658  28.8791   37.4607     19.6597
#> 68          349.997        8.092  22.4312  56.1536   69.5722     42.1393
#> 69          359.501        4.672  12.8770  42.2365   54.4391     29.5038
#> 70          400.593        3.316   8.3011  31.8362   41.8385     21.4627
#> 71          328.287        1.995   5.9394  24.3225   30.9687     17.4092
#> 72          341.209        2.149   6.2646  23.6149   30.0371     16.9358
#> 73          376.217        2.194   5.7989  21.0970   26.5308     15.5208
#> 74          383.074        2.033   5.2778  20.9907   26.1439     15.6595
#> 75          382.081        2.028   5.2684  21.8795   27.2734     16.2790
#> 76          376.412        1.973   5.1850  23.3678   30.0992     16.3682
#> 77          372.735        2.043   5.4142  23.7301   29.7882     17.4095
#> 78          370.917        1.913   5.0992  22.3360   28.3612     16.0149
#> 79          360.861        1.864   5.0816  25.5183   32.7532     17.9117
#> 80          268.350       24.093  84.9039 146.8654  166.1335    126.8573
#> 81          260.432        9.275  34.7455  78.4178   95.1516     61.0803
#> 82          293.415        5.410  18.3028  50.4721   65.6330     34.8675
#> 83          250.945        2.906  11.3727  37.3972   50.1514     24.2604
#> 84          230.971        2.270   9.6990  33.0582   43.9286     21.8244
#> 85          242.826        2.229   9.1464  31.6325   40.9931     21.9364
#> 86          235.815        1.949   8.1704  28.2718   36.2828     19.9617
#> 87          230.324        1.884   8.0560  27.9267   35.8416     19.7163
#> 88          217.042        1.724   7.7255  27.4014   35.1404     19.3755
#> 89          219.824        1.617   7.2341  26.8785   34.6890     18.7845
#> 90          208.983        1.440   6.6874  26.6457   34.3282     18.6929
#> 91          194.742        1.188   5.8618  26.1320   34.3818     17.5918
#> 92        27136.992     1456.387  52.7446 101.7920  112.7151     90.1937
#> 93        17120.503      625.893  35.8131  71.8217   80.9047     61.9976
#> 94        16319.760      399.793  24.1670  55.8801   63.9684     47.0677
#> 95        17712.482      283.665  15.9397  43.2780   49.9466     35.9643
#> 96        17386.583      192.466  10.7953  34.1488   39.8726     27.8190
#> 97        18201.516      183.255  10.0382  32.7064   38.2584     26.5548
#> 98        18142.382      170.302   9.3271  31.7894   37.5365     25.4097
#> 99        15264.680      141.043   8.6903  29.9574   35.1219     24.2118
#> 100       14533.957      124.101   8.1101  28.7247   33.5907     23.2973
#> 101       11781.627       99.296   7.5716  27.8637   32.8397     22.3114
#> 102         853.953       22.502  25.7405  98.3087  141.9776     52.6045
#> 103         811.955       17.943  21.5704  77.3804  109.7233     44.0397
#> 104         747.982       14.216  18.5261  67.2953   94.6517     39.1157
#> 105         685.657       10.936  15.6075  56.4881   77.4407     34.8876
#> 106         669.639       10.344  15.0975  55.7464   76.3598     34.4780
#> 107         675.173       10.066  14.6818  55.1893   75.2490     34.4908
#> 108         688.845        9.836  14.1426  54.9072   75.1893     33.9617
#> 109         702.584        9.703  13.7228  53.6105   73.3698     33.2095
#> 110         707.423        9.422  13.2197  54.7098   74.4773     34.3031
#> 111          82.124        1.435  17.2108  45.7603   57.5691     33.6050
#> 112          78.908        1.047  13.1081  40.3655   52.9840     27.7496
#> 113          72.894        0.841  11.4377  36.6749   48.1950     25.1454
#> 114          69.649        0.740  10.4047  37.6118   50.1066     24.9695
#> 115          70.368        0.645   9.0941  35.9087   48.0775     23.3551
#> 116          68.581        0.616   8.8663  37.9902   51.6139     23.8901
#> 117          67.424        0.592   8.6533  37.3502   51.1417     23.0626
#> 118          67.113        0.574   8.4547  37.5011   50.4638     24.0432
#> 119          62.914        0.534   8.2686  35.4544   47.5889     22.8546
#> 120          56.878        0.481   8.0914  35.4719   46.9185     23.5750
#> 121          40.662        0.355   8.4174  31.6330   42.8866     20.0462
#> 122          42.242        0.282   6.7361  28.0182   37.5578     18.1349
#> 123          43.264        0.240   5.5388  23.1668   30.9209     15.0517
#> 124          36.855        0.191   5.0753  19.7055   26.0305     13.0841
#> 125          36.534        0.180   4.8634  19.5009   25.8296     12.8665
#> 126          35.294        0.176   4.9019  19.0820   25.4073     12.4283
#> 127          35.005        0.179   5.0699  19.0387   26.0537     11.6373
#> 128          33.885        0.151   4.4145  19.1344   25.3589     12.5721
#> 129          33.341        0.157   4.6637  18.6639   24.9130     12.0619
#> 130          14.949        0.164  10.9899  34.0088   42.2951     24.8034
#> 131          11.780        0.080   6.5543  23.0938   29.2619     16.3410
#> 132          12.083        0.057   4.6720  17.6924   22.7934     12.2395
#> 133          13.323        0.046   3.4676  13.4954   17.5760      9.1657
#> 134          13.679        0.042   3.0665  11.1435   14.2971      7.7385
#> 135          14.201        0.044   3.0776  10.8531   13.8705      7.5791
#> 136          13.962        0.044   3.1121  10.5837   13.3949      7.5209
#> 137          13.982        0.044   3.1649  10.3900   13.0431      7.4900
#> 138          14.138        0.046   3.2356  10.2957   12.8555      7.4912
#> 139          14.474        0.048   3.3279  12.8192   16.0958      9.2818
#> 140         145.059        3.478  23.7747  60.7416   78.0099     42.7250
#> 141         149.493        2.843  18.0718  47.7007   62.2746     32.3969
#> 142         127.682        1.635  12.6596  40.9752   54.3837     26.9190
#> 143          90.149        0.475   5.2585  26.7240   36.1041     16.8420
#> 144         102.165        0.422   4.2037  23.5960   31.8459     14.8558
#> 145         116.060        0.393   3.3741  19.8931   26.9669     12.3708
#> 146         110.690        0.334   3.0162  17.8928   24.0919     11.2845
#> 147         112.361        0.390   3.4849  18.0713   23.3397     12.4496
#> 148         114.052        0.372   3.2807  17.9056   24.2476     11.1259
#> 149         113.573        0.361   3.1779  18.5486   24.7753     11.8769
#> 150         111.785        0.348   3.0911  18.4952   24.1214     12.4698
#> 151         110.038        0.309   2.7820  17.7927   23.6142     11.5516
#> 152          70.002        1.229  17.0082  44.2934   53.9827     34.0694
#> 153          56.654        0.598  10.2076  38.1927   47.7227     28.0978
#> 154          62.832        0.568   9.1231  32.8256   42.1388     22.9379
#> 155          66.418        0.413   6.1712  24.6077   31.7030     17.1782
#> 156          63.857        0.327   5.0694  20.1218   26.3475     13.6711
#> 157          62.581        0.246   3.8882  16.4722   21.2082     11.6135
#> 158          57.620        0.236   4.0810  13.9369   17.2048     10.5593
#> 159          60.760        0.227   3.7707  14.6622   17.9276     11.2733
#> 160          60.857        0.263   4.3176  14.2723   18.1471     10.2236
#> 161          60.999        0.251   4.0917  14.3591   18.0394     10.5088
#> 162          60.914        0.207   3.3849  13.5683   17.0538      9.9282
#> 163          60.829        0.214   3.4959  14.0676   17.8397     10.1305
#> 164          20.939        0.469  22.4698  74.0887  104.2636     42.4327
#> 165          21.691        0.495  22.4427  78.6479  109.9011     45.9170
#> 166          21.995        0.370  16.0253  69.0622   98.4229     38.3216
#> 167          12.913        0.142  11.0697  57.1381   80.5991     32.6022
#> 168          14.304        0.103   7.3378  46.6838   66.6010     25.7921
#> 169          15.777        0.076   4.7994  35.6476   53.0213     17.0901
#> 170          13.789        0.048   3.4291  29.6263   41.8182     16.5788
#> 171          13.999        0.040   2.8385  30.7464   39.5582     21.2843
#> 172          13.777        0.043   3.0718  25.4744   36.4320     13.6449
#> 173          14.289        0.037   2.6302  22.8622   31.3808     13.6553
#> 174          14.060        0.031   2.2252  21.6422   28.4507     14.2664
#> 175          13.219        0.027   1.9985  21.0087   29.3208     11.8931
#> 176        6145.793      199.676  31.3961  65.8858   80.5929     50.4922
#> 177        5626.977      108.137  18.8951  50.0561   63.8201     35.6424
#> 178        5075.870       65.104  12.6721  42.1753   55.9052     27.8572
#> 179        4428.209       32.121   7.2225  29.4362   39.1504     19.3390
#> 180        4419.837       25.753   5.8087  24.3952   32.4597     16.0283
#> 181        4578.718       22.096   4.8102  20.5278   27.1979     13.6337
#> 182        4280.781       18.222   4.2287  17.8825   23.5160     12.0456
#> 183        4327.606       18.231   4.2052  17.5044   22.7929     12.0040
#> 184        4273.948       17.877   4.1491  17.4493   22.7391     11.9370
#> 185        4193.419       17.276   4.0811  17.2555   22.4668     11.8220
#> 186        4116.385       16.640   3.9977  16.9890   22.1393     11.6114
#> 187        4031.283       15.377   3.7646  17.0043   22.2547     11.5186
#> 188          64.088        1.088  16.4216  54.5567   74.0676     33.8973
#> 189          62.676        0.574   9.0544  38.7507   53.6797     22.8091
#> 190          64.891        0.438   6.7964  37.9233   52.8981     22.0222
#> 191          56.443        0.251   4.3912  28.0577   38.0027     17.5801
#> 192          57.428        0.239   4.1684  25.0416   33.0237     16.6372
#> 193          60.490        0.176   2.9116  22.1251   30.7838     12.9441
#> 194          55.121        0.118   2.0987  16.7044   22.7073     10.3401
#> 195          52.530        0.120   2.2249  17.7399   23.9275     11.1713
#> 196          50.051        0.133   2.5498  18.5308   24.7324     11.9321
#> 197          47.406        0.129   2.6021  17.8145   23.4942     11.7538
#> 198          45.518        0.118   2.5052  19.4244   25.6924     12.7271
#> 199          46.366        0.110   2.3240  18.6154   25.2268     11.5469
#> 200         835.002       18.185  21.4413  57.6688   72.5251     41.8022
#> 201         794.605       10.033  12.8278  45.9539   60.0463     31.0972
#> 202         765.935        6.865   8.9280  38.6113   52.9215     24.0028
#> 203         778.039        4.296   5.5702  27.5177   36.9695     17.9219
#> 204         775.632        3.455   4.4720  22.6554   30.4216     14.8056
#> 205         802.447        3.401   4.2643  20.2808   27.3437     13.1391
#> 206         757.874        3.258   4.2958  18.2303   24.2748     12.1616
#> 207         742.357        3.144   4.2410  17.7132   23.2986     12.1222
#> 208         722.228        3.205   4.3728  17.5506   23.0933     11.9932
#> 209         714.876        3.180   4.4401  17.7616   23.5813     11.9340
#> 210         709.300        3.130   4.4174  17.7959   23.6301     11.9540
#> 211         693.844        2.809   4.0450  16.9879   22.5468     11.4305
#> 212         762.384        4.112   5.3150  23.7290   30.9621     16.1134
#> 213         689.949        3.301   4.6823  19.2104   24.8396     13.4052
#> 214         674.766        2.861   4.1707  17.2220   22.0580     12.2804
#> 215         730.438        2.858   3.9343  15.8366   19.8167     11.6778
#> 216         785.830        3.212   4.1412  15.7543   19.7864     11.4601
#> 217         782.225        2.982   3.8111  15.0723   18.7084     11.2036
#> 218         785.553        2.995   3.8023  15.1271   18.7477     11.2631
#> 219         776.670        2.955   3.7739  14.8521   18.4533     11.0060
#> 220         773.161        2.783   3.5694  14.5548   18.1692     10.6993
#> 221         142.556        4.648  31.6215  61.6088   71.9761     51.0826
#> 222         149.565        2.967  19.5692  47.2711   58.4676     35.6648
#> 223         107.541        1.158  10.7312  33.4429   43.0490     23.6098
#> 224         106.201        0.672   6.3511  25.9045   34.5451     16.8538
#> 225         108.373        0.512   4.7327  20.8662   28.0665     13.1972
#> 226         114.598        0.471   4.1130  17.0213   22.7302     10.9883
#> 227          91.764        0.386   4.1645  15.0255   19.8778     10.0560
#> 228          92.720        0.388   4.1703  14.0105   18.3937      9.5390
#> 229          88.267        0.377   4.1879  14.0697   18.3475      9.6891
#> 230          86.164        0.363   4.1264  13.1762   17.1300      9.1212
#> 231          83.332        0.349   4.0856  12.9291   16.5907      9.1526
#> 232          84.511        0.324   3.7785  15.9888   21.7193      9.9670
#> 233         146.521        5.951  39.3089  74.2025   91.2812     56.6441
#> 234         146.332        3.741  24.4252  63.6530   81.1292     45.4204
#> 235         123.249        2.120  17.0040  62.1747   82.4255     41.1123
#> 236          96.719        1.068  10.9429  41.0095   54.2270     27.3117
#> 237          97.229        0.736   7.5920  31.6747   41.9173     20.9860
#> 238          90.304        0.553   5.9885  23.9305   31.0180     16.5035
#> 239          91.652        0.473   5.1460  21.3051   27.7116     14.5974
#> 240          94.046        0.448   4.7803  19.9388   25.4637     14.1344
#> 241          92.913        0.398   4.2650  20.2573   25.9325     14.2836
#> 242          91.442        0.369   3.9936  19.4522   24.7058     13.9186
#> 243          90.987        0.402   4.3704  19.6022   25.1427     13.7312
#> 244          92.794        0.374   4.0109  19.9644   25.9222     13.6237
#> 245           4.016        0.065  15.6673  48.5467   69.9404     25.7229
#> 246           4.506        0.044   9.8944  34.8368   50.8169     17.7787
#> 247           4.747        0.033   7.1053  31.7736   44.7239     18.1600
#> 248           4.268        0.018   4.2325  25.9288   38.2126     13.2340
#> 249           4.239        0.015   3.4319  16.9665   21.9644     11.7422
#> 250           4.915        0.017   3.4217  21.0761   26.5987     15.2532
#> 251           4.122        0.014   3.2578  18.0777   24.3429     11.5062
#> 252           4.010        0.009   2.1101  19.3306   27.8010     10.3454
#> 253           3.995        0.015   3.7426  21.1318   27.1624     14.5594
#> 254           4.163        0.012   2.7805  20.3599   27.2647     12.8358
#> 255           4.399        0.008   1.7768  15.5517   19.9671     10.6563
#> 256           4.475        0.015   3.3758  18.6613   23.9909     12.7323
#> 257       26363.367     3548.734 126.4688 205.4151  196.7459    214.7372
#> 258       27637.368     2636.156  91.1444 162.3679  159.9659    165.2367
#> 259       26818.485     2093.819  73.9118 138.6553  140.5541    136.8603
#> 260       25899.360     1560.787  57.7530 113.2651  117.9063    108.3618
#> 261       24397.289     1098.966  43.4698  88.9447   94.7078     82.7094
#> 262       24490.706     1034.488  40.9777  84.5088   90.3488     78.1741
#> 263       23804.081      955.501  38.6664  80.3705   86.2561     73.9734
#> 264       23985.007      899.927  36.4860  76.4234   82.3402     69.9815
#> 265       23531.725      837.527  34.4876  72.7609   78.6865     66.3007
#> 266       22934.934      774.069  32.6054  67.8277   73.2842     61.8775
#> 267        4509.597      397.937  83.5169 148.2891  161.4896    134.6314
#> 268        4525.430      246.038  52.1490 109.5038  117.7369    100.9136
#> 269        4712.731      199.742  41.5888  95.4859  102.7323     87.8849
#> 270        4893.835      168.390  33.7416  86.1791   92.5538     79.4733
#> 271        4762.505      135.081  27.5454  75.2106   81.8704     68.1890
#> 272        4705.784      128.283  26.4992  73.3155   79.9462     66.3177
#> 273        4600.846      120.835  25.4943  71.4176   78.0754     64.3846
#> 274        4544.421      115.463  24.7219  70.4194   77.1472     63.3064
#> 275        4526.934      109.819  23.6964  68.0527   74.7478     60.9698
#> 276        4505.039      105.154  22.8492  67.5176   73.9136     60.7494
#> 277          63.352        1.461  22.7623  50.3776   58.4217     41.9441
#> 278          73.351        1.007  13.7679  37.0191   46.2121     27.3215
#> 279          52.716        0.525   9.7900  30.2807   37.6996     22.7088
#> 280          54.087        0.383   7.0569  29.4164   38.9998     19.5959
#> 281          60.452        0.286   4.7181  23.5104   30.5056     16.3730
#> 282          75.429        0.323   4.3095  19.5666   27.2849     11.8504
#> 283          65.411        0.262   3.9821  16.4289   21.3046     11.6084
#> 284          63.655        0.227   3.5396  15.3945   20.4196     10.4275
#> 285          61.625        0.216   3.4599  14.6396   18.4842     10.9114
#> 286          60.814        0.196   3.1825  14.7806   18.0663     11.5259
#> 287          58.990        0.216   3.5964  14.9263   19.0227     10.8428
#> 288          56.354        0.186   3.2264  14.3007   18.3420     10.3035
#> 289          91.865        1.060  11.2711  28.2983   33.9216     22.5174
#> 290         130.796        0.901   6.9462  24.5974   32.8407     16.1861
#> 291         138.481        0.776   5.5963  20.1289   25.8727     14.2630
#> 292         159.431        0.722   4.5910  17.4307   22.7038     12.0511
#> 293         170.805        0.639   3.7607  14.3596   18.4361     10.1733
#> 294         173.743        0.635   3.6731  14.8057   18.3965     11.1170
#> 295         176.039        0.664   3.7921  14.5322   18.0713     10.8971
#> 296         176.549        0.644   3.6501  14.1377   17.8629     10.3051
#> 297         174.341        0.634   3.6172  14.5436   18.8479     10.1126
#> 298         170.706        0.484   2.8049  13.0228   16.9328      8.9987
#> 299         877.335       30.020  33.0287  62.3586   74.5183     49.9840
#> 300         631.618       10.760  16.4313  41.2311   51.6463     30.5263
#> 301         565.605        5.283   9.2817  32.3175   43.3900     20.8213
#> 302         538.678        2.858   5.3112  23.2609   30.8652     15.4135
#> 303         551.948        2.330   4.2077  17.9218   23.9336     11.6873
#> 304         560.860        2.113   3.7481  14.7034   19.1598     10.1353
#> 305         478.417        1.641   3.3523  12.9247   16.5580      9.1752
#> 306         466.066        1.524   3.2072  12.5870   15.7219      9.3437
#> 307         451.584        1.562   3.3784  13.6096   17.2954      9.7595
#> 308         433.834        1.497   3.3600  12.8063   16.2531      9.1752
#> 309         418.715        1.259   2.9360  11.8639   15.1614      8.3728
#> 310         407.178        1.189   2.8602  11.8823   15.1023      8.4919
#> 311        1929.146       33.726  17.6558  51.7384   63.3922     39.6987
#> 312        1586.599       16.352   9.9137  31.3571   38.8891     23.4551
#> 313        1172.291        7.681   6.3560  23.3733   29.3712     17.0272
#> 314        1193.696        5.370   4.5015  19.8018   25.1148     14.2049
#> 315        1076.271        4.162   3.7743  18.4036   23.2229     13.3676
#> 316        1068.466        3.461   3.2150  16.5257   20.8278     12.0650
#> 317         993.189        2.741   2.7299  14.0315   17.5821     10.3449
#> 318         966.313        2.645   2.6955  13.7216   17.0417     10.2754
#> 319         935.957        2.445   2.5525  13.1544   16.5797      9.5926
#> 320         909.482        2.375   2.5478  13.0960   16.2649      9.8005
#> 321         863.400        2.309   2.5777  13.0108   15.9993      9.8996
#> 322         839.400        1.994   2.3100  13.0498   16.1371      9.8303
#> 323         950.593       60.400  61.8767 155.8490  174.7919    135.8003
#> 324         832.794       30.327  35.9185 114.6170  136.3296     90.9317
#> 325         676.847       10.873  15.8589  60.1382   73.6909     45.1985
#> 326         596.330        4.658   7.6080  28.8688   35.1927     21.9742
#> 327         431.182        2.527   5.5741  20.6926   24.7064     16.3443
#> 328         448.406        1.885   4.1814  14.6209   17.4626     11.5233
#> 329         423.793        1.523   3.5219  10.8949   12.8289      8.7950
#> 330         397.036        1.407   3.4150  10.2429   12.0207      8.3159
#> 331         355.241        1.245   3.3117   9.6738   11.3120      7.8970
#> 332         321.887        1.106   3.2082   9.3370   10.9011      7.6409
#> 333         294.674        0.989   3.1083   8.8143   10.2598      7.2458
#> 334         269.497        0.886   3.0245  14.7496   17.2768     11.9713
#> 335          20.133        0.257  12.8688  67.5949   97.9328     36.3426
#> 336          21.890        0.210   9.7496  60.4626   88.6118     31.5344
#> 337          20.160        0.144   6.8471  43.1629   59.8528     25.9037
#> 338          22.133        0.107   4.9009  40.1419   58.5603     20.7976
#> 339          22.063        0.106   4.8514  39.3850   56.6390     21.2207
#> 340          20.946        0.105   4.9355  39.9899   56.9374     22.1124
#> 341          19.420        0.074   3.7064  35.8926   51.2799     19.6023
#> 342          18.832        0.082   4.2253  33.6279   46.1760     20.2292
#> 343          17.578        0.080   4.3179  31.7888   44.8678     17.7129
#> 344          33.913        0.391  11.1094  59.9460   87.0605     32.0763
#> 345          29.752        0.265   8.8771  63.6522   97.0394     29.2593
#> 346          31.646        0.190   6.0472  48.5277   73.8510     22.8235
#> 347          31.616        0.165   5.2783  43.7278   63.6688     22.9379
#> 348          30.994        0.166   5.3318  39.9822   58.4027     20.8553
#> 349          29.145        0.107   3.6207  35.5658   50.7015     19.6698
#> 350          28.238        0.117   4.0825  36.2952   52.3120     19.2443
#> 351          27.437        0.102   3.6635  32.8336   46.6419     17.8956
#> 352          25.133        0.084   3.2148  31.4461   44.4631     16.9772
#> 353           4.284        0.125  27.9017  73.6917   81.3077     65.7440
#> 354           4.148        0.060  14.4368  46.5987   47.7389     45.5149
#> 355           4.867        0.050  10.3954  42.4479   44.5890     40.2008
#> 356           5.539        0.042   7.4109  34.1376   38.2365     29.9703
#> 357           5.279        0.023   4.3191  30.7307   27.3131     34.3545
#> 358           5.740        0.026   4.6047  25.3766   23.0345     27.8746
#> 359           5.978        0.032   5.1431  23.8461   21.2725     26.5297
#> 360           5.948        0.034   5.5450  22.6669   17.3730     28.2011
#> 361           6.041        0.034   5.5274  23.8228   20.0090     27.8496
#> 362           6.130        0.036   5.8077  21.1804   17.2829     25.3293
#> 363           6.114        0.046   7.2389  25.4004   22.0832     28.9578
#> 364           6.364        0.042   6.5405  23.4446   17.4248     29.7926
#> 365           5.559        0.060  10.7371  26.1959   32.4292     19.6516
#> 366           4.470        0.031   6.9708  20.3184   21.8166     18.7159
#> 367           3.917        0.028   7.1490  20.7543   24.5830     16.6454
#> 368           4.028        0.028   6.7931  20.3758   25.0764     15.2987
#> 369           4.210        0.029   6.7661  19.6451   22.6568     16.3233
#> 370           4.334        0.035   7.9550  20.7807   22.0898     19.3307
#> 371           4.182        0.033   7.6291  19.3034   23.2772     14.9474
#> 372           4.265        0.029   6.5767  18.1750   20.3630     15.7932
#> 373           4.217        0.035   8.0884  17.8981   15.3094     20.6286
#> 374           4.378        0.021   4.6132  16.5621   17.4398     15.3536
#> 375        2136.014      236.247 106.6230 206.0280  224.0085    187.9114
#> 376        2254.710      168.618  71.3933 153.3937  187.2141    118.3091
#> 377        2361.357      108.860  45.1331 101.2835  128.9091     74.4843
#> 378        2336.510       66.928  28.2000  68.0059   89.0267     48.0481
#> 379        2279.503       53.203  22.8946  59.1379   77.4854     41.7022
#> 380        2277.699       44.196  19.1596  62.6271   86.2078     40.0527
#> 381        2180.612       36.172  16.2300  55.6808   75.9175     36.1732
#> 382        2137.844       34.306  15.6992  57.0619   78.6767     36.1608
#> 383        2100.730       32.583  15.1840  59.6311   83.3988     36.5547
#> 384        2099.606       31.321  14.6829  60.5854   85.4786     36.3181
#> 385        2100.622       30.194  14.1950  59.9298   84.8799     35.5267
#> 386        2079.465       29.076  13.7959  64.9105   89.7736     40.6291
#> 387         236.652        3.769  15.6803  41.3655   50.1777     31.9763
#> 388         178.865        1.937  10.8079  31.3796   38.2911     24.0549
#> 389         199.250        1.751   8.8562  26.5872   32.3407     20.5714
#> 390         207.693        1.297   6.2615  21.6938   25.8976     17.3299
#> 391         188.780        1.119   5.8031  18.4688   21.5253     15.3240
#> 392         184.582        0.837   4.5064  15.0824   18.0690     12.0227
#> 393         171.934        0.660   3.7947  13.6436   16.6651     10.5508
#> 394         173.368        0.706   4.0505  14.0877   16.2320     11.8850
#> 395         171.046        0.698   4.0383  14.2557   17.4503     10.9560
#> 396         169.890        0.680   3.9630  13.8446   16.9200     10.6793
#> 397         170.794        0.724   4.2098  14.0249   16.6247     11.3511
#> 398         170.549        0.739   4.2998  14.3890   17.1255     11.5682
#> 399          61.225        1.268  20.4698  56.9762   70.8041     42.4961
#> 400          50.204        0.785  15.3595  47.2528   57.8364     36.3135
#> 401          59.334        0.626  10.6915  41.1231   55.2485     26.7864
#> 402          56.273        0.434   7.6550  29.9337   39.6853     20.3189
#> 403          56.985        0.360   6.2781  26.7916   34.6524     19.0441
#> 404          63.103        0.386   6.0736  23.2830   29.2085     17.4537
#> 405          59.636        0.304   5.0656  20.4560   25.0154     15.8662
#> 406          58.375        0.245   4.1636  19.5974   24.3928     14.7263
#> 407          58.381        0.274   4.6352  21.1838   26.2827     15.9466
#> 408          57.208        0.262   4.4966  20.8774   25.1874     16.4142
#> 409          58.596        0.326   5.4889  22.0554   28.2358     15.6889
#> 410          57.206        0.257   4.4126  19.2246   23.7761     14.5101
#> 411          64.108        1.019  15.5370  41.3085   54.1798     27.6255
#> 412          50.636        0.500   9.7413  33.7381   44.8722     21.8592
#> 413          60.545        0.512   8.5422  30.8555   40.4835     20.6129
#> 414          58.979        0.286   4.8152  26.1831   35.2280     16.6952
#> 415          56.306        0.222   3.9044  21.3245   27.6468     14.7522
#> 416          60.508        0.199   3.2647  18.0958   23.2326     12.7262
#> 417          58.493        0.169   2.8504  14.1879   18.0870     10.0475
#> 418          58.437        0.151   2.5550  14.6615   18.6274     10.4437
#> 419          56.262        0.160   2.7781  13.9733   17.7586      9.9384
#> 420          54.813        0.141   2.5394  14.2234   18.9069      9.2402
#> 421          54.164        0.141   2.5547  14.4167   18.8774      9.6825
#> 422          52.952        0.112   2.0755  13.7724   17.8768      9.4148
#> 423       18543.329     1009.141  52.8983  96.8345  111.8169     81.3346
#> 424       17549.353      633.927  35.4292  72.7046   88.0124     56.7339
#> 425       17271.981      387.508  22.1776  55.4115   70.5088     39.6830
#> 426       16267.141      224.736  13.6959  39.8279   51.1417     28.0586
#> 427       15934.388      178.085  11.0657  34.3956   44.2672     24.1498
#> 428       16128.680      146.299   8.9823  30.8773   40.0845     21.3354
#> 429       15726.741      123.645   7.7897  28.5949   37.0497     19.8017
#> 430       15636.045      119.958   7.5974  29.2034   37.9632     20.0736
#> 431       15348.757      115.142   7.3978  29.4121   38.4674     19.9592
#> 432       15123.653      110.717   7.2176  29.1703   38.1752     19.7619
#> 433       14837.165      106.619   7.0737  28.8805   37.8688     19.4784
#> 434       14397.406       99.420   6.7743  31.2991   41.1255     21.0078
#> 435         524.778       21.449  39.8042  76.9111   95.8167     57.2120
#> 436         683.644       19.586  28.1955  66.4178   87.6524     44.1296
#> 437         538.321       11.774  21.2867  58.9819   79.8775     36.9719
#> 438         375.356        3.596   9.3958  37.6129   52.5754     21.9787
#> 439         362.529        2.677   7.3815  32.0840   45.2517     18.3265
#> 440         420.280        2.390   5.7404  28.3948   40.5962     15.8076
#> 441         378.257        1.850   4.8442  24.5412   34.8418     13.7143
#> 442         391.022        1.853   4.7491  24.2950   34.5726     13.4849
#> 443         407.636        1.910   4.7535  24.2419   34.2465     13.7162
#> 444         391.315        1.740   4.4705  24.6048   34.8229     13.8488
#> 445         380.965        1.672   4.3819  24.5311   34.9711     13.5366
#> 446         358.485        1.485   4.0650  25.6669   36.7233     14.0074
#> 447         174.719       13.475  73.8396 113.4552  132.0794     95.5242
#> 448         154.517        4.723  29.5033  67.8348   86.3835     49.1219
#> 449         115.609        1.607  13.7496  50.4105   68.5687     31.9645
#> 450         118.193        0.871   7.4663  38.8347   55.0805     22.3175
#> 451         108.499        0.480   4.3845  28.4345   39.8690     16.9110
#> 452         100.522        0.331   3.2763  20.5753   26.5781     14.6295
#> 453          84.576        0.309   3.6321  15.6882   21.0119     10.4330
#> 454          86.212        0.332   3.8514  15.1591   19.6494     10.6897
#> 455          85.430        0.276   3.2216  15.5276   20.2343     10.8687
#> 456          85.779        0.349   4.0588  15.8649   19.8262     11.9646
#> 457          85.038        0.306   3.5668  15.6985   19.8862     11.5405
#> 458          83.208        0.251   2.9657  15.5504   20.1129     11.0071
#> 459         402.592       24.578  55.9775  96.2933  110.6439     81.5711
#> 460         371.971       13.721  35.2447  74.6087   89.8923     59.1521
#> 461         308.379       10.619  32.0871  72.5333   90.5154     54.2838
#> 462         224.341        5.086  22.1600  56.0876   70.9386     40.9595
#> 463         226.321        4.095  18.1186  48.3970   61.7229     34.6630
#> 464         223.420        2.773  12.4360  40.1582   52.1588     27.6004
#> 465         203.203        1.876   9.2387  31.8038   41.2012     21.8699
#> 466         207.464        1.712   8.3093  29.8110   38.4201     20.6900
#> 467         212.407        1.687   8.0326  29.7635   38.3936     20.6024
#> 468         205.729        1.530   7.4379  28.1154   36.1930     19.5166
#> 469         195.665        1.395   7.0225  27.7092   35.9730     18.8892
#> 470         192.255        1.303   6.6575  28.6369   36.9192     19.7813
#> 471        1250.503       24.934  19.6351 111.3707  162.1281     56.8892
#> 472        1458.761       20.307  13.8505 104.5902  151.4289     55.3772
#> 473        1801.940       20.839  11.8670  83.5646  117.8964     48.2673
#> 474        1923.735       15.533   8.0781  61.8112   86.6852     36.3028
#> 475        1877.041       14.000   7.3748  56.9413   79.3403     33.9877
#> 476        1687.720       11.723   6.6504  51.7508   71.7480     31.2500
#> 477        1605.890       10.431   6.2231  49.9435   69.1066     30.2754
#> 478        1489.925        9.250   5.8928  49.0049   67.9693     29.5083
#> 479        1452.255        8.659   5.7253  56.9292   78.5287     34.6393
#> 480         437.565        9.880  22.2588  50.8475   55.4440     45.5059
#> 481         427.873        7.311  16.5583  43.1988   47.9065     36.1108
#> 482         501.900        6.252  12.2611  38.8314   45.2462     27.9142
#> 483         577.882        5.266   9.1103  33.4006   40.7508     21.9578
#> 484         596.933        5.112   8.6167  32.3984   39.8523     21.1579
#> 485         606.678        4.918   8.1662  31.3672   38.8815     20.4825
#> 486         596.070        4.613   7.7570  30.2783   37.7217     19.9305
#> 487         547.912        4.120   7.3855  29.2755   36.3575     19.4988
#> 488         512.765        3.726   7.0470  28.5889   35.1722     19.1499
#> 489          78.502        2.386  29.8562  69.2477   89.0670     48.9111
#> 490          93.642        2.243  23.2885  56.4611   74.4276     37.8953
#> 491          78.502        1.136  14.2274  47.5518   64.0222     30.2922
#> 492          54.395        0.559  10.0757  35.0423   48.5172     20.9978
#> 493          54.034        0.465   8.6247  30.8685   41.5385     19.7085
#> 494          60.232        0.408   6.8083  26.6892   35.5482     17.3486
#> 495          55.312        0.360   6.4392  24.5497   32.7308     15.8753
#> 496          57.162        0.356   6.2121  23.4229   29.8907     16.5730
#> 497          57.681        0.317   5.4802  22.7608   30.1273     14.9570
#> 498          57.354        0.340   5.8649  23.6447   31.4062     15.4126
#> 499          56.837        0.351   6.0970  24.0463   31.3276     16.3276
#> 500          56.420        0.342   5.9778  23.5910   31.3232     15.3978
#> 501          27.548        0.823  28.9046  73.2675   94.8765     50.5900
#> 502          31.724        0.530  16.6508  53.8433   71.6153     35.0754
#> 503          22.176        0.223   9.7351  40.0140   55.4566     23.8335
#> 504          18.025        0.095   5.2784  28.8231   40.7534     16.2252
#> 505          18.092        0.085   4.6778  24.4800   33.3555     15.0925
#> 506          22.323        0.074   3.3815  17.8111   23.8281     11.1358
#> 507          20.663        0.048   2.3021  15.8900   21.2488     10.0694
#> 508          20.359        0.049   2.3837  15.7230   20.8784     10.1124
#> 509          20.252        0.049   2.4124  14.4318   18.4479     10.0433
#> 510          19.507        0.046   2.3105  14.2611   19.2100      8.8432
#> 511          19.207        0.049   2.5197  15.0785   20.8115      8.7046
#> 512          18.625        0.045   2.3663  12.8076   17.2090      7.8194
#> 513         972.075       94.326  93.9412 194.2164  215.4158    171.5109
#> 514        1125.751       75.519  63.3124 151.9116  179.6590    121.0795
#> 515         979.044       72.031  68.8918 244.5985  263.1418    228.5487
#> 516        1077.910       85.178  78.2258 317.7107  316.0761    320.1715
#> 517        1125.867       62.553  53.4880 232.2505  238.5110    227.0578
#> 518        1162.350       46.542  39.0795 151.5043  167.3928    135.2663
#> 519        1133.780       42.551  36.2423 143.6965  161.3291    125.2680
#> 520        1130.372       38.179  32.8740 136.1478  154.5982    117.0274
#> 521        1136.615       40.686  35.0655 133.3884  152.4828    113.5722
#> 522        1144.818       42.762  36.6550 129.8504  149.6200    109.4092
#> 523        1159.250       34.376  29.2899 119.5367  137.4444    101.1501
#> 524         645.415       21.067  31.7858  62.4939   74.9471     49.6814
#> 525         565.369        8.490  14.4816  38.8736   49.1990     28.1469
#> 526         403.714        3.854   9.3940  38.6842   52.7522     23.9901
#> 527         397.535        2.121   5.3970  25.3266   34.2613     15.9553
#> 528         457.467        2.074   4.5517  20.5775   27.4791     13.1983
#> 529         480.132        1.866   3.8328  14.4711   18.1986     10.4913
#> 530         416.088        1.305   3.0961  11.8474   15.0428      8.5214
#> 531         405.946        1.318   3.1935  11.8152   14.8553      8.6604
#> 532         389.097        1.256   3.1576  12.0855   15.0821      8.9873
#> 533         369.282        1.199   3.1449  12.0222   15.0233      8.9278
#> 534         356.747        1.154   3.1358  11.5986   14.5798      8.5215
#> 535         342.622        1.043   2.9524  12.1026   15.3287      8.7695
#> 536         108.498        1.482  13.3819  40.0939   49.6992     29.8605
#> 537          96.018        0.806   8.3301  31.8972   40.8579     22.3742
#> 538         122.202        0.864   7.1948  26.7085   33.7408     19.2615
#> 539          89.762        0.356   3.9462  18.5158   24.0307     12.7156
#> 540         100.919        0.328   3.2670  16.2568   20.5830     11.7287
#> 541         114.011        0.357   3.1478  15.2923   19.4164     10.9575
#> 542         113.777        0.337   2.9371  15.6705   20.4454     10.6256
#> 543         115.521        0.344   2.9666  15.1552   19.4461     10.6113
#> 544         114.167        0.319   2.7549  15.4568   20.1129     10.4927
#> 545         114.486        0.301   2.5861  15.2431   19.3290     10.8792
#> 546         113.468        0.289   2.5028  14.4563   18.1221     10.5131
#> 547         112.472        0.316   2.7680  14.4885   18.5532     10.0972
#> 548          98.478        1.847  18.4470  48.1668   62.1717     33.5592
#> 549          72.503        0.800  11.0150  38.0807   49.9664     25.8379
#> 550          81.809        0.693   8.5166  35.2049   47.3612     22.5469
#> 551          77.067        0.453   5.8182  24.0991   31.7543     16.2985
#> 552          71.982        0.363   5.0058  19.3758   24.8673     13.7793
#> 553          78.907        0.346   4.3992  14.9463   17.7360     12.1148
#> 554          85.182        0.390   4.5821  14.2844   18.2831     10.1342
#> 555          86.487        0.340   3.9311  13.0145   15.1402     10.8308
#> 556          86.265        0.359   4.1513  13.5216   17.0079      9.8774
#> 557          86.643        0.343   3.9553  13.3189   16.4194     10.0852
#> 558          85.152        0.324   3.7743  12.4112   15.4257      9.2631
#> 559          84.944        0.363   4.2459  13.7842   17.2340     10.1739
#> 560        1349.093      276.436 186.8282 242.4004  258.2448    225.9726
#> 561        1426.628      193.415 127.2275 169.8094  184.4493    154.3868
#> 562        1361.187      106.946  73.8031 109.1313  122.1319     95.4309
#> 563        1363.623       52.534  37.5129  64.2196   73.5390     54.4276
#> 564        1277.719       33.700  25.7714  48.9046   56.9481     40.5209
#> 565        1244.202       22.792  18.0436  37.4336   43.8808     30.7212
#> 566        1375.398       18.513  13.4162  28.8497   34.2131     23.2710
#> 567        1387.536       17.796  12.7341  28.4919   34.4530     22.2879
#> 568        1380.003       16.902  12.1206  26.1679   31.1418     20.9926
#> 569        1350.646       15.881  11.5614  24.5122   29.0315     19.8105
#> 570        1277.957       14.520  11.0556  23.2585   27.5102     18.8338
#> 571        1185.650       12.952  10.5691  22.7384   27.1307     18.1693
#> 572         881.595       19.351  21.3911  46.0756   54.8707     36.8640
#> 573         741.843       10.627  14.3870  36.3367   43.6375     28.7334
#> 574         791.998        7.501   9.5338  29.6679   37.9313     21.4585
#> 575         681.312        4.460   6.4438  25.0358   32.2744     17.8595
#> 576         725.998        4.303   5.9350  22.1098   28.1639     16.0624
#> 577         808.969        4.142   5.1286  20.4171   25.6084     15.2071
#> 578         776.630        3.532   4.4997  18.5508   23.2193     13.7999
#> 579         773.477        3.493   4.4677  18.6533   23.1712     14.0557
#> 580         754.631        3.389   4.4256  18.1966   22.7214     13.5825
#> 581         730.700        3.218   4.3252  18.8878   23.6791     13.9968
#> 582         711.997        3.217   4.4350  18.7793   23.5125     13.9475
#> 583         685.092        2.917   4.1667  18.5674   23.2594     13.7703
#> 584        3821.527       93.072  24.1881  67.2469   84.8968     49.5696
#> 585        3703.421       55.980  15.1896  51.2417   67.2554     34.8693
#> 586        4136.926       47.510  11.5243  46.5979   62.6855     29.6930
#> 587        3932.086       33.289   8.4744  35.9066   45.9576     25.1237
#> 588        4030.780       33.280   8.2340  35.7422   46.1109     24.5979
#> 589        3957.712       29.149   7.2460  32.1718   41.1526     22.5602
#> 590        3962.043       27.359   6.8636  34.1398   43.9119     23.6260
#> 591        3932.927       27.142   6.8431  36.5654   47.2810     25.0116
#> 592        3853.402       26.084   6.6809  37.0058   48.0719     25.0609
#> 593        3797.755       25.144   6.5286  36.0426   46.5862     24.6618
#> 594        3754.697       24.610   6.4664  36.0506   46.6629     24.5837
#> 595        3625.471       22.849   6.1789  42.1460   55.4986     27.6618
#>        Q0060 Q0060Male Q0060Female    Q1550 Q1550Male Q1550Female    Q1560
#> 1   181.7842  226.4618    136.6136  67.8092   84.4197     51.0873 153.7611
#> 2   157.4304  197.8421    116.4085  62.0308   79.8124     43.8662 136.4739
#> 3   140.8921  177.1817    104.0316  54.4757   69.8168     38.7595 122.8743
#> 4   135.9233  167.6677    103.5371  54.4422   68.8354     39.6041 120.4260
#> 5   125.7332  156.6954     93.9010  51.1637   65.9430     35.8617 112.4054
#> 6   129.4225  159.7543     98.2569  53.0629   67.6137     38.0079 116.4460
#> 7   123.3782  149.0271     97.0895  51.1073   63.8194     37.9464 110.5497
#> 8   122.3040  147.6843     96.3091  51.2120   63.2405     38.7522 110.1007
#> 9   120.0495  143.2181     96.3463  49.1882   60.1517     37.8251 108.0071
#> 10  128.5655  155.3115    101.1639  51.1165   62.4280     39.3962 117.2783
#> 11  186.8964  231.8747    138.2694  70.8192   88.9615     51.3355 165.1726
#> 12  139.3959  179.4906     96.3438  53.7507   71.3284     35.0896 125.9595
#> 13  106.1939  134.9796     75.5272  42.5900   57.0575     27.4852  95.9835
#> 14   84.3856  105.4899     62.4847  37.9719   50.5287     25.2556  77.3770
#> 15   73.3135   92.4979     53.6965  32.1367   42.8834     21.2901  66.7170
#> 16   67.7332   84.8451     50.3729  29.2230   37.9896     20.3501  62.2456
#> 17   66.1276   82.9800     49.2433  28.7804   37.5855     19.9386  61.7584
#> 18   64.6168   80.7214     48.5207  28.2837   36.3913     20.1541  60.4150
#> 19   65.4026   82.0804     48.7578  28.7948   37.9800     19.6053  60.9217
#> 20   62.7351   78.6319     46.8542  27.1241   35.3790     18.8403  58.5770
#> 21   63.0902   79.9023     46.2723  27.6602   36.4781     18.8010  58.7693
#> 22   61.3245   77.3137     45.3470  26.7999   35.0317     18.5164  57.2914
#> 23  101.6172  133.3848     69.0816  40.9360   54.7729     26.6874  95.2244
#> 24   89.4968  117.6475     60.7226  33.9346   45.5977     21.9065  83.7809
#> 25   79.9105  105.7842     53.5864  30.4596   41.1782     19.4484  74.7168
#> 26   69.1288   89.3222     48.5014  25.7001   33.7378     17.4657  64.9003
#> 27   66.5751   84.8670     47.8637  24.5514   32.1131     16.7678  62.2891
#> 28   64.7376   83.3659     45.6332  23.6528   31.1447     15.9416  60.6300
#> 29   65.6124   83.4393     47.3027  24.7435   31.8033     17.4853  61.9275
#> 30   62.7577   80.2616     44.7457  24.3654   32.0937     16.4236  58.4429
#> 31   63.1456   81.3098     44.4867  23.5006   30.5050     16.3253  58.9221
#> 32  174.6689  221.0262    127.1701  63.0564   80.1090     45.5596 150.2918
#> 33  148.4916  190.7281    105.1487  57.7409   74.7859     40.0461 133.2459
#> 34  117.8348  150.1107     84.5350  49.9128   64.1313     35.0124 107.2883
#> 35  106.8696  137.5521     74.8347  45.5058   59.9103     30.5244 100.2417
#> 36   94.2239  120.2473     67.2014  37.5709   49.3126     25.4603  88.7079
#> 37   86.1205  108.0578     63.4635  33.9078   43.3427     24.1828  81.1274
#> 38   76.3935   94.0540     58.2421  28.9275   36.5937     21.0454  71.9275
#> 39   73.2937   91.2494     54.7521  28.6437   36.8056     20.2325  69.0278
#> 40   71.2430   88.3186     53.6345  27.9124   35.6780     19.9287  66.3946
#> 41   69.9654   85.7708     53.6721  27.1235   34.2401     19.8209  65.1232
#> 42   67.2056   82.7399     51.1802  26.2367   33.9213     18.3594  62.6219
#> 43   69.5254   86.5040     51.9866  26.6561   34.4332     18.6833  65.3260
#> 44  383.8757  423.4841    342.1314 159.6391  178.9973    140.3623 276.5302
#> 45  318.1450  356.4201    279.1991 128.7814  146.4197    111.1549 235.7459
#> 46  257.2870  304.2641    208.8656 102.2406  126.5538     77.1915 199.9555
#> 47  210.8823  264.9419    154.0113  88.6843  119.8697     56.8000 177.0912
#> 48  186.8503  240.9717    130.6969  83.3829  116.6355     49.3007 162.2922
#> 49  169.6891  222.0662    115.5929  80.1423  113.3436     46.1047 150.9783
#> 50  153.9895  202.4255    104.1334  73.8817  105.2221     41.7330 137.9598
#> 51  154.0333  202.5764    104.0508  74.0394  105.1212     42.1258 138.2904
#> 52  148.3579  195.5486     99.7683  71.7731  102.7206     39.9659 132.7474
#> 53  144.2230  189.8614     97.4035  68.5863   97.5276     38.9222 128.9329
#> 54  140.7853  183.8607     96.7875  65.9608   92.4897     38.8536 125.7001
#> 55  152.7737  198.1305    106.4091  71.2289   98.2117     43.6671 138.5436
#> 56  161.9895  194.9704    127.2509  58.7571   73.3970     43.7348 130.6275
#> 57  169.5448  216.1280    120.6832  63.0984   84.5231     40.9960 145.5060
#> 58  178.4638  239.0197    114.8540  72.7735  101.9955     42.7302 160.0295
#> 59  178.7125  241.5724    114.2430  70.1579   97.1603     42.5483 162.5383
#> 60  169.8134  233.3619    104.4161  65.0295   88.5606     40.5931 156.5742
#> 61  154.9433  209.3047     98.5468  59.6777   80.0079     38.1147 143.3121
#> 62  145.6720  194.1952     94.4907  54.7051   72.3772     35.6683 137.3408
#> 63  146.2018  195.8268     93.4964  54.5212   73.1654     34.3849 138.2935
#> 64  144.6140  192.5185     93.6350  53.3041   71.3191     33.8634 136.6769
#> 65  144.4254  192.0690     93.6598  53.0286   70.2784     34.4042 136.6386
#> 66  140.8759  189.1799     89.1445  53.9861   73.1746     33.2352 133.6176
#> 67  159.0561  212.3914    101.5155  58.7515   79.4649     36.3335 152.7164
#> 68  168.7641  212.0674    123.1534  64.1687   82.8187     44.9963 145.7937
#> 69  139.6527  179.2266     98.7458  55.0176   72.3030     36.8923 125.6239
#> 70  108.4546  137.4563     78.1903  43.2010   57.4441     28.4572  99.0667
#> 71   87.9530  108.2760     67.1516  35.4087   45.5691     25.0021  81.1951
#> 72   82.8649  101.8675     63.4299  33.9505   43.4001     24.2121  75.9145
#> 73   75.4893   92.1438     58.4356  30.2065   38.3743     21.8478  69.2162
#> 74   71.9953   87.3491     56.2967  29.4285   37.5855     21.0943  66.1370
#> 75   73.2541   88.7904     57.3714  30.8378   39.3259     22.1510  67.3666
#> 76   74.5398   91.8099     56.8441  32.6123   42.5387     22.4443  68.8452
#> 77   74.6640   92.1635     56.7490  32.6748   42.3376     22.7766  68.7222
#> 78   71.9768   88.6801     54.8527  31.2950   40.2957     22.0434  66.3844
#> 79   79.8885  100.2171     58.9830  36.8307   48.4471     24.8754  74.3266
#> 80  303.4777  354.7256    249.6377 118.6233  147.2902     88.6478 232.7439
#> 81  199.7410  246.2568    151.1747  83.7335  109.5022     57.0106 166.7364
#> 82  149.8861  190.4656    107.8604  62.4760   85.2286     39.1083 131.3428
#> 83  118.0313  152.0659     83.0767  48.3644   67.3580     28.9617 105.9052
#> 84  105.6845  135.7491     75.0050  44.4745   61.2837     27.3008  95.1933
#> 85  100.8188  126.9534     74.1706  43.2893   58.4485     27.7660  90.9083
#> 86   93.2708  116.8378     69.2598  38.5699   51.3539     25.4254  84.3381
#> 87   91.4048  114.3677     68.0033  37.7307   50.1975     24.8983  82.6300
#> 88   89.4194  111.4863     66.9263  36.9935   48.9287     24.7033  80.9501
#> 89   89.3587  111.8271     66.4297  37.0684   49.0961     24.6777  81.4268
#> 90   91.5472  115.0871     67.5034  38.0286   50.2404     25.4460  84.1759
#> 91   94.1070  119.5963     67.9957  39.5760   52.3397     26.4175  87.6852
#> 92  213.7021  245.4840    178.4646  77.9728   93.4704     61.3177 159.7323
#> 93  158.1254  189.0041    124.6020  57.1330   71.6778     41.9361 118.9261
#> 94  136.3155  167.1179    103.4807  51.7578   65.3856     37.4443 108.1012
#> 95  118.3923  147.8807     87.4043  46.6057   58.9000     33.6353  98.7473
#> 96  104.8937  133.2720     74.9689  41.6178   53.1513     29.3604  91.2784
#> 97  102.4194  130.5281     72.7644  40.5994   51.9210     28.5453  89.7282
#> 98  101.9591  131.3653     70.8670  40.4666   52.2602     27.8724  90.1270
#> 99   97.2746  124.5825     68.4632  38.4042   49.1214     26.9481  86.2811
#> 100  94.7902  121.2262     66.9115  37.3202   47.5071     26.4096  84.5322
#> 101  94.6928  122.8918     64.8829  37.3719   48.2891     25.6525  85.1147
#> 102 196.4973  260.7597    128.5222 106.7106  160.0825     50.9548 171.4491
#> 103 162.1546  212.9677    109.7277  83.0861  122.4222     42.8486 140.4585
#> 104 141.0713  184.0512     97.1483  72.0190  104.7294     38.6787 121.8693
#> 105 124.7677  159.1022     90.0041  61.7468   86.5077     36.5642 108.1496
#> 106 123.4361  157.3562     89.0823  61.4476   85.9294     36.5272 107.2774
#> 107 122.7711  155.9046     89.2154  61.2909   85.3106     36.8246 106.9364
#> 108 121.7681  154.9150     88.1317  61.5461   85.7363     36.8664 106.4135
#> 109 119.1854  151.5591     86.3254  60.2264   83.7822     36.1845 104.1836
#> 110 138.9119  177.0372    100.2041  67.4657   92.7202     41.7117 124.7703
#> 111 119.1639  146.3519     91.5861  49.7161   64.6020     34.6197 101.0017
#> 112 109.2259  137.7940     80.6980  49.0220   67.2839     30.9985  95.0991
#> 113 100.5963  128.2244     73.1775  44.8032   61.4368     28.4108  88.0401
#> 114 102.1841  131.6947     72.8846  46.5135   64.7923     28.3684  90.7908
#> 115  94.7020  124.2012     65.3081  44.0590   61.2081     26.8318  84.7751
#> 116  98.0932  128.7980     67.3602  47.9259   66.9500     28.7215  88.1514
#> 117  97.4744  124.7931     70.0815  47.3948   65.3071     29.1955  87.9304
#> 118  99.2597  128.3536     70.1414  48.4521   66.0503     30.6131  90.0059
#> 119  96.0123  123.9882     68.0434  46.3967   64.2338     28.3427  86.8468
#> 120 100.4995  128.3543     72.7297  47.9982   63.7188     32.0446  91.5354
#> 121 138.5163  191.0035     84.8784  53.7406   77.8695     28.5403 129.5928
#> 122 125.0971  174.2328     74.6526  47.8490   68.1444     26.9976 117.9079
#> 123 112.4179  155.2744     68.0159  40.5894   57.0984     23.6362 106.3088
#> 124  97.5106  133.7970     60.7095  33.4143   46.2465     20.2195  91.8176
#> 125  95.8622  131.4294     59.8132  33.0794   46.0875     19.6739  90.2994
#> 126  94.0590  128.4625     59.1921  32.0496   44.3562     19.3503  88.4298
#> 127  94.6564  130.7111     57.9300  32.3173   45.9985     18.1630  89.1087
#> 128  91.8798  125.9792     57.2535  33.0012   46.0754     19.4046  86.9281
#> 129  92.3265  126.2747     57.9108  31.9690   43.5531     19.8993  87.2668
#> 130 109.6623  138.8437     79.5140  43.0105   55.5765     29.4023  97.5714
#> 131  87.5791  111.9036     61.7607  33.6797   43.9076     22.6574  80.2818
#> 132  74.8392   96.6939     51.8583  27.5803   36.3482     18.2821  69.4981
#> 133  62.0443   80.8611     42.5324  21.9174   29.4055     14.2781  58.0617
#> 134  53.6572   69.5861     37.3879  18.2360   24.4334     11.9769  50.2120
#> 135  52.6824   68.5427     36.5544  17.7669   23.8678     11.5983  49.2425
#> 136  51.7715   67.0606     36.3104  17.3185   23.1554     11.4100  48.3138
#> 137  51.2382   66.1824     36.2137  17.0192   22.6877     11.2749  47.7422
#> 138  51.1536   66.0633     36.2467  16.9053   22.5358     11.1909  47.5947
#> 139  58.0172   70.2705     45.7355  19.9690   24.9413     14.8343  54.1240
#> 140 191.3899  249.7842    132.5739  73.4195  100.7105     46.0748 168.4747
#> 141 184.0780  248.2284    119.6922  66.3448   92.9886     39.0280 166.1571
#> 142 176.3950  244.0597    106.3385  67.3476   96.0763     37.5470 163.8948
#> 143 131.1696  179.2310     81.7867  50.2162   70.0645     29.5642 124.9744
#> 144 117.8255  159.9847     74.3113  44.1835   60.8594     26.6582 112.7520
#> 145 102.6456  139.6432     64.1480  37.6597   51.6580     22.7571  98.5699
#> 146  87.0918  116.2467     56.3960  32.9739   44.9294     20.1933  83.4277
#> 147  86.0060  113.3428     57.2346  32.3781   42.9025     21.1335  82.0015
#> 148  84.9944  113.4404     54.8374  31.7101   42.9216     19.7033  81.1843
#> 149  85.4155  114.2210     54.7332  32.6062   44.3371     20.0170  81.7415
#> 150  84.1794  111.1772     55.4232  32.4153   43.1705     20.8790  80.4048
#> 151  87.6381  115.6107     57.7634  33.1245   44.1555     21.2705  84.3768
#> 152 149.4516  179.4132    118.8378  55.8761   67.3638     44.2033 131.5011
#> 153 147.2304  178.3990    115.4449  58.8965   71.2169     46.0271 136.5816
#> 154 138.6342  166.4266    109.6275  51.8467   65.6835     37.2004 128.6805
#> 155 109.5384  133.2953     84.5757  42.9122   54.9714     30.3014 102.9240
#> 156  96.0295  117.3276     73.8097  36.0542   46.1130     25.6162  90.6226
#> 157  88.4974  109.3170     66.9454  30.8433   39.3547     22.0630  84.2865
#> 158  71.8938   87.5798     55.7416  24.0040   30.6408     17.1807  67.3899
#> 159  71.4547   87.1196     55.3185  24.5602   30.9025     18.0452  67.2430
#> 160  67.6115   83.3723     51.3319  23.1174   29.5836     16.4433  63.0592
#> 161  67.7444   82.8591     52.1457  23.0891   29.1565     16.8367  63.3308
#> 162  62.8066   77.9087     47.2358  21.7077   28.0297     15.2131  58.9333
#> 163  61.7776   76.2103     46.8969  22.1839   28.2240     15.9908  57.7411
#> 164 197.0131  279.9487    124.9983  93.6461  139.1719     51.1647 174.7386
#> 165 225.8393  324.7954    134.0560 106.6302  163.8113     48.5470 203.7918
#> 166 220.3012  317.5300    121.8742 103.2490  156.3359     49.2746 203.5281
#> 167 224.1820  319.5568    128.5754 107.0373  160.5944     52.9090 212.8626
#> 168 193.9483  281.5064    107.7517  85.9829  130.0944     41.1686 186.0300
#> 169 140.3922  209.3273     72.9687  60.4915   91.9449     27.9908 134.5747
#> 170 120.6099  174.1558     67.4363  52.3451   76.4405     27.0961 116.1840
#> 171 121.3079  172.4148     70.4309  52.8459   73.6379     31.1253 117.5099
#> 172 109.5454  158.6800     60.0596  46.4169   68.3146     23.2016 105.5690
#> 173 110.1520  161.1431     58.7057  44.1831   64.0002     23.1186 106.7424
#> 174 106.3472  151.2446     60.9337  43.1562   59.0357     26.2439 102.9876
#> 175 109.3250  154.6127     62.7305  42.7976   61.4039     22.6154 106.4228
#> 176 175.8716  222.5987    131.1483  66.5219   87.4841     45.8118 145.4151
#> 177 158.8872  210.4337    107.8288  62.7347   85.6607     39.0709 139.7383
#> 178 142.1791  191.1623     91.3224  58.5381   81.5464     34.6249 128.9517
#> 179 116.6702  156.7751     75.3650  48.9209   67.9091     29.4034 108.6706
#> 180 105.9082  142.6437     68.3762  41.9502   57.9658     25.5207  99.4583
#> 181  93.9851  126.2209     61.3633  35.2516   48.3010     21.8820  88.6100
#> 182  82.7317  109.5664     55.4924  30.5035   41.3843     19.3282  77.9721
#> 183  80.7594  106.6933     54.4095  29.8171   40.1803     19.1566  76.0252
#> 184  79.2426  104.4036     53.6484  29.5685   39.8903     18.9383  74.5652
#> 185  78.4283  103.3620     53.0338  29.3247   39.5732     18.7629  73.8308
#> 186  76.1101  100.2287     51.5138  28.6798   38.7714     18.2669  71.6107
#> 187  79.2338  104.7859     53.1093  29.9508   40.5510     19.0011  75.0060
#> 188 191.8505  271.7708    114.9980  78.3993  115.6394     41.1206 174.8441
#> 189 148.3277  214.4702     82.6841  59.3477   86.6628     30.4372 138.5932
#> 190 136.0299  190.8168     77.8048  62.1571   89.7356     32.5872 128.3760
#> 191 110.1211  149.7835     68.0503  49.5135   68.5847     29.3798 105.0438
#> 192 106.4819  142.9353     67.9485  44.3139   60.9815     26.7945 101.0004
#> 193  91.3031  124.0953     56.8960  38.5426   53.7325     22.5029  87.8238
#> 194  72.2325   97.1503     46.2788  29.9168   41.5041     17.6916  69.5817
#> 195  72.5525   98.0431     45.8880  30.3220   42.0120     17.9470  69.5723
#> 196  71.1568   93.3724     47.9178  30.3608   41.4083     18.6342  68.0516
#> 197  70.5684   92.8657     47.2412  29.7393   40.3436     18.4674  67.5432
#> 198  69.1528   91.0619     46.1691  30.7218   41.3124     19.4386  66.0648
#> 199  70.5156   95.0184     44.6467  31.8383   43.9930     18.8501  67.7855
#> 200 174.8814  227.3984    120.4644  71.8730   95.8592     46.6756 153.6167
#> 201 155.1032  210.5877     97.1069  66.0411   91.0909     39.6332 141.4927
#> 202 128.7328  177.9174     77.4979  57.0526   80.9090     32.2969 119.1933
#> 203 106.6508  145.4760     66.5935  47.6261   66.1599     28.9623 100.3654
#> 204  96.7968  131.9573     61.2971  41.1078   56.6614     25.6162  91.7964
#> 205  89.3119  120.6611     58.0907  35.6793   48.8752     22.5225  84.5766
#> 206  80.1242  106.7373     53.7478  31.2114   42.5579     19.9287  75.3531
#> 207  77.6380  102.9239     52.6307  30.1004   40.6123     19.6641  72.9661
#> 208  76.4096  100.3904     52.6870  29.4005   39.8061     19.0463  71.6455
#> 209  75.8958   99.3999     52.6492  29.5440   39.8253     19.3111  71.0525
#> 210  74.0712   97.0192     51.3602  28.9690   39.1337     18.8403  69.2492
#> 211  74.2295   97.6701     51.0283  28.8653   39.2394     18.5164  69.7740
#> 212 101.1112  131.8337     68.7102  41.3204   55.1792     26.8042  95.1961
#> 213  90.4897  117.4799     62.5913  34.3774   45.5405     22.8157  85.1628
#> 214  82.4829  106.8540     57.6292  29.8085   39.0376     20.3501  77.8125
#> 215  76.0378   96.9849     54.3441  26.8210   34.8001     18.5360  71.6587
#> 216  74.8155   94.9409     53.8615  26.3133   33.9406     18.3103  70.1432
#> 217  71.9107   90.9779     52.1101  25.3440   32.5582     17.7997  67.6371
#> 218  72.2536   91.4959     52.2524  25.5287   32.7033     18.0256  67.9412
#> 219  69.7301   88.2194     50.5164  24.8772   32.2002     17.2298  65.4425
#> 220  69.9618   89.1313     50.0415  25.2143   32.6646     17.4460  65.9740
#> 221 152.3829  185.9804    119.9891  53.5474   67.7773     39.8670 120.7830
#> 222 127.1186  161.8316     92.5873  47.4233   62.5102     32.4150 106.5447
#> 223  97.3208  127.5571     66.7501  39.3397   53.4402     25.0912  85.4627
#> 224  88.7720  120.9008     55.7018  37.6170   52.7388     22.0604  81.6096
#> 225  81.5387  113.5478     48.7798  33.1113   47.0594     18.7957  76.1967
#> 226  74.8172  104.7266     44.7486  29.0264   41.1513     16.7017  70.2700
#> 227  71.5620  100.8085     43.3410  25.8295   36.6374     15.1214  67.0722
#> 228  67.9819   95.1831     41.9492  23.9622   33.7629     14.3003  63.6253
#> 229  69.5858   97.2299     43.1113  24.0840   33.8213     14.4457  65.1761
#> 230  65.7851   91.9841     40.7295  22.2184   31.2325     13.2762  61.4359
#> 231  66.0089   91.6418     41.4771  21.8879   30.4802     13.3232  61.6863
#> 232  72.4924   98.4464     47.2862  26.9180   36.7231     16.9387  68.3537
#> 233 191.5227  237.9489    146.1348  71.1243   94.1397     48.5518 155.1989
#> 234 218.4506  286.2806    150.6168  89.0292  121.5888     56.4256 196.1828
#> 235 234.9254  320.3660    147.8067 103.3962  145.5445     60.0138 219.5126
#> 236 203.4400  281.5644    124.7993  87.3905  124.2642     50.1109 193.1267
#> 237 189.1188  263.9280    114.2581  75.4647  107.4302     43.2948 181.7505
#> 238 162.4223  224.9005    100.9274  55.9264   78.2675     33.1288 156.3842
#> 239 136.9593  183.2608     91.1137  42.8473   57.9624     27.2323 131.4968
#> 240 130.8875  177.6227     84.4180  40.3775   54.4326     25.8403 125.8079
#> 241 129.0774  173.0218     85.3070  40.2850   53.9124     26.1325 124.1848
#> 242 126.3489  170.8949     81.7050  39.9755   53.3445     26.0546 122.2332
#> 243 122.2616  164.5344     79.6365  37.9938   50.7851     24.6218 117.3093
#> 244 125.9996  169.1254     82.1465  40.1192   53.3161     26.2591 121.7542
#> 245 146.4252  201.8098     86.6441  63.5927   89.8448     35.4369 130.1669
#> 246 118.0331  155.6887     77.6945  47.3261   67.4664     26.0935 106.9077
#> 247 108.5560  130.5595     85.7920  43.1280   55.5509     30.0643 100.1642
#> 248  86.1221  106.1184     65.0035  36.5389   49.8207     22.7557  81.0583
#> 249  65.8572   75.0349     56.1771  25.1822   29.0611     21.1420  61.6014
#> 250  60.3695   76.7072     43.0659  29.3570   37.6047     20.6622  55.9472
#> 251  62.8118   75.2706     49.9901  26.7243   33.4333     19.7234  58.3100
#> 252  58.6536   71.4535     45.1553  27.4151   37.4122     16.8486  55.5914
#> 253  61.5972   80.9624     41.3329  25.6791   34.9641     15.7300  56.4231
#> 254  60.9168   74.9416     45.9831  28.8908   37.2774     19.7719  57.6190
#> 255  58.8073   68.7516     48.0698  25.8833   31.2900     19.8495  56.4524
#> 256  61.4507   73.7707     48.2130  27.3927   32.0691     22.1216  56.7525
#> 257 354.1165  370.0737    337.7112 125.6699  133.2255    117.6355 243.6000
#> 258 301.1141  323.3177    277.4911 114.1723  126.7883    100.2918 218.6910
#> 259 269.0040  298.1505    237.2403 105.5350  122.6802     86.7368 200.5799
#> 260 239.9212  271.4827    205.3205  94.5283  113.1679     74.1950 185.5901
#> 261 215.8511  243.8819    185.3525  82.5871   99.5247     64.1679 174.5922
#> 262 211.1568  238.3085    181.6507  80.1362   96.6315     62.1975 172.1963
#> 263 206.5762  232.9597    177.9312  77.7768   93.8716     60.2697 169.7408
#> 264 201.8932  227.6962    173.8960  75.4459   91.2007     58.3016 167.0674
#> 265 197.1832  222.6379    169.5737  73.1875   88.6599     56.3419 164.1912
#> 266 201.7262  229.2219    171.8916  71.4694   86.6108     54.9930 170.8218
#> 267 285.1887  313.3898    257.0185 108.9514  119.9410     98.1061 209.9185
#> 268 247.1770  271.4532    223.3198  99.5597  107.0609     91.9553 198.4419
#> 269 231.9022  255.9455    207.9143  95.0413  102.3277     87.6021 192.2954
#> 270 223.2852  247.2718    198.9283  93.5885  100.7932     86.1997 190.6052
#> 271 207.0770  232.4259    181.1583  86.6640   94.8768     78.1931 179.8843
#> 272 204.1103  229.5476    178.0723  85.3984   93.7246     76.8006 177.8487
#> 273 201.0466  226.7420    174.7099  84.0642   92.5882     75.2512 175.6882
#> 274 199.5379  225.6856    172.6971  83.5590   92.4013     74.4038 174.7789
#> 275 195.5721  221.6483    168.7854  81.7111   90.5989     72.4973 171.8328
#> 276 215.8576  245.9483    184.8662  87.5399   96.7845     77.9588 193.5383
#> 277 175.6084  207.4819    141.5696  62.3921   74.8322     49.6453 153.3039
#> 278 153.3501  191.2425    113.6134  50.8831   63.8224     37.1619 138.8966
#> 279 117.8319  144.6456     89.6997  42.2936   53.2309     31.0478 107.5432
#> 280 102.8912  127.8214     76.7641  42.0995   54.2907     29.6903  95.1781
#> 281  83.3988  101.6727     64.4668  35.1735   45.1013     25.0314  77.9792
#> 282  73.7074   92.1573     54.8874  30.8318   41.5233     20.1051  68.9144
#> 283  65.3068   79.0549     51.5596  25.2047   32.8387     17.6425  61.0265
#> 284  62.4749   76.3490     48.6015  24.6852   32.8097     16.6203  58.5039
#> 285  59.8579   74.4594     45.3318  23.4678   30.4566     16.5810  55.9621
#> 286  61.1922   74.2690     48.1453  24.5099   30.5147     18.5655  57.4993
#> 287  60.9958   76.0950     45.8859  23.7800   30.7765     16.8366  56.9659
#> 288  58.5205   71.1076     46.0051  23.2102   29.4962     17.0136  54.8794
#> 289  94.5533  113.2965     76.3196  32.9473   40.5625     25.2520  82.6601
#> 290  84.3433  108.5846     60.4850  34.0545   47.3528     20.8665  76.6350
#> 291  75.6120   96.2136     55.4772  30.2126   40.2596     20.2430  69.3217
#> 292  65.3637   82.9454     48.1459  25.3510   34.1840     16.5063  59.9534
#> 293  60.8466   77.9180     44.1295  21.8267   28.6703     14.9421  56.2250
#> 294  59.3484   74.9819     44.0416  22.2778   28.3664     16.1529  54.8590
#> 295  58.5315   74.6643     42.6991  21.7928   28.1575     15.3944  54.0729
#> 296  57.9208   74.8701     41.2212  21.3700   28.3026     14.3773  53.6688
#> 297  57.2103   73.7463     40.8807  21.4286   28.2389     14.5603  53.0784
#> 298  56.0352   72.1026     40.1466  20.7093   27.0852     14.2668  52.6013
#> 299 166.7864  209.7236    124.6107  58.6946   76.7545     41.1494 134.7048
#> 300 137.9260  184.1210     92.5911  49.4801   66.7667     32.2776 120.6689
#> 301 105.8708  141.3210     70.1864  42.1200   58.0565     25.8110  95.8547
#> 302  82.2891  107.7615     56.5987  33.6504   45.6073     21.4271  76.1015
#> 303  69.2703   89.6579     48.6718  27.5551   36.8441     18.0452  64.3607
#> 304  60.8894   77.6180     44.2004  23.2597   30.6020     15.8432  56.5665
#> 305  56.7310   71.3996     42.1533  20.9855   27.3199     14.5826  52.8959
#> 306  54.6718   68.5445     40.9073  20.0262   25.5090     14.4742  50.8349
#> 307  56.1444   70.7958     41.5112  21.3810   27.8158     14.8191  52.1083
#> 308  53.7353   67.3979     40.0630  20.0888   25.8403     14.1884  49.8492
#> 309  51.8997   65.1017     38.6513  19.4882   25.1191     13.6855  48.5164
#> 310  55.3125   70.0157     40.5914  20.2336   26.0643     14.2475  51.9658
#> 311 155.7334  193.4763    120.5059  63.5218   80.3849     47.1331 137.0841
#> 312 110.2065  142.5359     78.7784  44.5944   58.6027     30.1366  99.2010
#> 313  88.7869  116.8335     60.0643  34.5387   45.0536     23.5971  81.4547
#> 314  78.7898  104.0636     52.4511  31.5642   41.4945     21.1139  73.5347
#> 315  73.8785   97.5636     49.1489  30.1871   39.6908     20.2031  69.3834
#> 316  66.4625   86.9347     45.0329  27.4217   35.6587     18.8108  62.6001
#> 317  57.4104   73.7569     40.3041  23.2801   29.8165     16.4827  54.0289
#> 318  56.5016   72.0604     40.2175  22.7499   29.0497     16.2072  53.2247
#> 319  54.6208   69.8959     38.6232  22.0403   28.2046     15.6463  51.5004
#> 320  54.0403   68.5835     38.8155  21.6349   27.3685     15.6955  50.8767
#> 321  53.4489   67.6609     38.5752  21.3272   26.8723     15.5872  50.2605
#> 322  53.2578   67.5212     38.3348  21.7694   27.4269     15.9121  50.3907
#> 323 337.0146  405.3442    264.4525 153.8842  187.6934    119.7035 280.7012
#> 324 295.0071  376.6330    208.4580 134.5349  175.8991     90.2603 259.4326
#> 325 195.2427  260.7507    124.6020  86.3042  116.2016     53.2015 177.3881
#> 326 123.9321  170.5615     72.8025  48.5318   67.2204     28.0710 115.0382
#> 327  98.6259  136.0098     57.9915  33.8155   46.6400     20.0141  92.0416
#> 328  72.4266  102.6096     40.1385  23.7837   32.9198     13.9971  67.4218
#> 329  52.9179   75.2870     29.6396  17.5758   23.9733     10.8390  48.7264
#> 330  49.6286   70.4912     27.9863  16.5501   22.5029     10.3043  45.5878
#> 331  46.6338   66.0304     26.5456  15.4083   20.8685      9.6812  42.7203
#> 332  45.2115   63.9184     25.8659  14.8505   20.0600      9.3682  41.3959
#> 333  42.6172   60.0240     24.6301  13.8891   18.6754      8.8413  38.9274
#> 334  57.0738   76.4780     36.8029  24.1784   30.7068     17.2156  53.4828
#> 335 238.0504  342.7668    133.6531 112.6301  170.7978     54.2907 225.2871
#> 336 230.6383  335.0587    127.1335 106.7395  162.2798     50.8800 220.4936
#> 337 187.2818  270.4259    106.8362  82.2872  122.8003     41.8012 179.4676
#> 338 165.3807  240.4191     91.1698  75.3325  111.8462     38.0473 159.7602
#> 339 163.6372  234.0508     93.7674  75.4421  111.0109     38.8262 158.3168
#> 340 162.2101  234.3160     90.5368  73.7248  108.5272     38.0954 156.6856
#> 341 161.7901  233.7638     90.3061  72.5598  106.3493     37.9223 157.2541
#> 342 151.8285  214.7702     89.7871  67.0660   97.2776     35.9865 147.1261
#> 343 150.4459  216.5108     84.4055  67.6313   98.4595     35.7118 145.6728
#> 344 208.2850  303.3010    114.4198  99.9026  151.9034     47.5332 197.2578
#> 345 232.3041  340.9765    120.5920 111.8771  173.2486     49.0845 223.2614
#> 346 197.1005  290.4375    104.3076  91.8362  141.3987     42.0407 190.7923
#> 347 170.8505  251.1599     91.2499  80.2841  120.7363     39.4988 164.8254
#> 348 167.3344  247.8815     87.5263  78.3379  120.6836     35.8612 161.5676
#> 349 149.6966  217.7292     82.9157  70.8195  104.5154     36.9501 145.1609
#> 350 145.9930  211.8146     80.6073  68.2899  101.7081     34.0759 141.2421
#> 351 141.2873  205.4321     77.2968  64.1687   93.8407     33.3415 136.9690
#> 352 157.6462  227.7565     86.0534  69.7242  101.5375     35.8226 153.7951
#> 353 211.5814  262.9942    159.7328  79.9442   97.1422     62.8951 182.9940
#> 354 157.1652  192.4804    124.0038  62.2273   76.1173     47.5094 140.8486
#> 355 137.1775  162.2407    110.8963  58.4292   73.5499     42.2275 124.2108
#> 356 113.7680  135.0013     91.3895  46.4752   59.2756     33.0515 103.5220
#> 357  94.3562  108.5744     79.3990  38.3102   44.2033     32.2340  86.5180
#> 358  86.4129   99.3371     72.8598  35.9322   40.0269     31.6629  78.6992
#> 359  69.4207   79.2734     58.7985  27.5870   29.4574     25.6016  60.8062
#> 360  71.4746   80.6477     61.4850  26.0684   25.8500     26.2591  62.8434
#> 361  68.8704   73.0836     64.2480  30.1421   29.9523     30.2772  60.6809
#> 362  67.1377   73.8732     59.8686  22.5761   26.0497     18.9580  57.5600
#> 363  69.7085   73.9627     65.0857  25.6097   25.8451     25.4116  59.3327
#> 364  67.3733   74.4143     59.7180  24.8532   26.8724     22.7962  57.4636
#> 365  93.3410  114.6245     73.3905  30.9309   40.0937     21.6577  82.2839
#> 366  77.3143   86.0947     68.5806  23.8446   28.1028     19.3982  69.2906
#> 367  69.2333   81.1574     57.0535  23.9390   28.0028     19.6092  60.7686
#> 368  66.6297   84.4097     48.1627  25.9011   34.4417     16.7912  58.4123
#> 369  62.2289   74.8020     49.0158  20.8235   26.2146     15.0525  54.0481
#> 370  67.3757   80.8147     53.2933  24.0455   27.3499     20.4236  58.6566
#> 371  62.3071   71.5627     52.4600  21.7047   26.8499     16.0832  54.0609
#> 372  62.9005   73.5945     51.6584  21.5696   23.6420     19.3325  55.6112
#> 373  58.3863   61.0639     55.5828  20.4394   21.7299     18.9911  48.5620
#> 374  62.4737   76.3978     46.8688  23.9226   28.9849     17.9311  56.2971
#> 375 372.2272  412.1912    331.2230 170.9726  198.5104    143.7998 285.1394
#> 376 305.1460  368.4294    239.6294 142.4204  189.9957     93.8162 244.8151
#> 377 232.3030  287.1979    176.7734 101.9418  140.8138     63.9991 191.1849
#> 378 180.0194  224.8906    136.1021  74.9677  105.1044     46.4686 153.2637
#> 379 164.0902  205.2105    124.1598  68.2837   95.2475     42.8689 141.7785
#> 380 167.2108  215.0334    120.6676  76.2523  109.9572     44.1912 148.2922
#> 381 159.0978  205.4354    114.5599  71.6233  102.4298     42.4850 142.8339
#> 382 161.5049  209.8577    115.0068  74.2965  107.0787     43.2340 145.7333
#> 383 165.6903  216.8888    116.3538  78.5311  114.2009     44.6213 150.3466
#> 384 167.1031  220.1477    115.9503  80.5335  117.9108     44.9403 152.3307
#> 385 164.5727  218.5816    112.5427  80.1489  117.5985     44.4849 150.2322
#> 386 223.5586  293.0455    155.9344 102.1351  145.2522     61.2613 210.4540
#> 387 140.1031  177.8330    102.1918  49.6884   61.7511     37.3063 122.8279
#> 388 116.5263  149.8091     82.8544  42.3032   53.3918     30.6020 104.5866
#> 389 102.0005  127.1450     75.9564  36.7562   45.4355     27.6505  92.1577
#> 390  90.8671  107.4825     73.5747  34.7662   40.7370     28.5933  83.9208
#> 391  78.6606   89.6176     67.3849  28.8888   33.1095     24.5730  72.2636
#> 392  69.6698   79.5240     59.6053  24.1139   28.4378     19.7033  64.6380
#> 393  62.3951   71.3242     53.3321  21.9877   26.3272     17.5836  58.1225
#> 394  62.8248   70.2460     55.3079  22.0900   25.8890     18.2416  58.3552
#> 395  60.7533   69.9477     51.3891  21.9111   26.3662     17.3772  56.0731
#> 396  59.8490   68.8313     50.7155  21.2693   25.7136     16.7580  55.4358
#> 397  58.3189   67.2373     49.2709  21.1798   25.3823     16.9251  53.7599
#> 398  59.5036   69.8355     49.0042  22.1837   26.7166     17.5934  54.7469
#> 399 179.4163  219.6073    137.3152  71.0873   89.5626     51.7338 158.3479
#> 400 154.2696  184.1443    122.9135  60.1034   71.8576     47.9808 138.3107
#> 401 129.7327  156.2036    102.4100  53.1273   67.8952     38.2204 118.3039
#> 402  94.3981  113.7750     74.9784  39.5214   51.7338     27.5436  85.6649
#> 403  84.1305  102.1994     66.1952  36.9914   47.0092     27.2421  76.9059
#> 404  76.2872   92.6016     60.3312  33.2476   41.5233     25.2946  69.6993
#> 405  70.0909   82.4367     58.0786  29.5937   36.3624     22.9720  64.2718
#> 406  70.3473   84.4363     56.5725  29.4728   36.7478     22.3172  65.3588
#> 407  71.0347   85.6340     56.6663  30.6943   39.1914     22.2879  65.7896
#> 408  70.9418   85.2278     56.8504  29.7789   37.1715     22.3563  65.7198
#> 409  72.8505   89.0180     56.7871  30.7574   38.8454     22.5811  66.5916
#> 410  67.3559   80.1304     54.6560  28.2174   35.6491     20.7615  62.1653
#> 411 134.8712  177.5387     89.9215  51.1730   69.4319     32.0066 118.1639
#> 412 118.8087  158.8127     76.6822  46.1446   63.3448     27.9811 107.9601
#> 413 106.8403  138.5656     73.3955  42.8949   56.4822     28.3795  97.1339
#> 414  90.1082  112.6925     66.1657  38.8416   51.7717     25.2361  84.5286
#> 415  77.2937   93.6288     60.1098  32.5531   41.2740     23.4702  72.5887
#> 416  69.1987   83.8790     53.6927  27.9720   35.5912     19.9385  65.2634
#> 417  57.5134   69.4809     44.7655  22.5976   28.6224     16.1679  54.2849
#> 418  57.2346   69.0812     44.6033  22.9007   29.3118     16.0596  54.1594
#> 419  54.3614   65.2987     42.7188  21.2358   26.5414     15.5774  51.0218
#> 420  54.1495   65.7843     41.7468  21.8834   28.3795     14.9669  50.9934
#> 421  52.6869   64.4849     40.1225  21.6501   27.9422     14.9669  49.5083
#> 422  51.6601   62.8937     39.7095  22.3178   28.3990     15.8530  48.9405
#> 423 216.8881  264.5122    170.0173  80.2156  102.1365     58.4909 167.4724
#> 424 180.4499  228.7366    131.9193  69.0033   92.2528     45.0602 146.3272
#> 425 149.0996  192.7727    103.8016  60.3105   82.7656     37.0388 126.9901
#> 426 121.0879  156.2405     84.7370  50.8487   69.1798     31.9360 106.9808
#> 427 111.0126  143.3107     77.7376  46.1351   62.1910     29.6015  99.4341
#> 428 101.9206  131.4787     71.6266  42.0496   56.5527     27.1240  92.3828
#> 429  95.0770  121.4201     68.0325  39.2930   52.3786     25.8017  86.7092
#> 430  95.1903  121.5757     68.0410  40.1528   53.6424     26.2162  87.0126
#> 431  94.5992  121.0002     67.3853  40.5004   54.3088     26.2151  86.5925
#> 432  93.7963  120.1351     66.6236  40.3925   54.2124     26.0850  85.9840
#> 433  92.1497  118.1707     65.2862  40.0364   53.7927     25.7820  84.4854
#> 434 104.8572  134.7843     73.8250  46.4972   62.2610     30.1367  97.5854
#> 435 192.8193  247.6614    140.2562  73.0817  100.1377     46.6502 155.8675
#> 436 198.3195  269.4624    126.9885  80.2716  116.2464     43.1162 172.0716
#> 437 205.2915  285.3822    121.1752  84.3999  123.9661     43.2821 185.6843
#> 438 164.2048  231.1282     95.8717  67.6343   99.4926     34.7647 154.6882
#> 439 150.7125  213.2576     86.7149  60.2629   89.1447     30.3536 142.9709
#> 440 136.6333  194.7838     78.1524  53.5651   79.9949     26.4386 130.4321
#> 441 118.9757  167.8906     68.2368  45.7650   67.5785     22.8718 113.7248
#> 442 117.7852  166.4847     67.1621  45.3713   66.9200     22.7510 112.6370
#> 443 116.3007  164.0857     66.5565  45.0472   66.0958     22.9468 111.1843
#> 444 116.5885  164.6671     66.3426  45.8002   67.8300     22.6300 111.5983
#> 445 113.8999  160.9954     64.6286  44.8837   66.3195     22.3199 109.1025
#> 446 124.1244  175.7374     69.6985  49.1485   72.5534     24.4560 119.7434
#> 447 220.5421  272.0384    170.8714  73.8167   99.8287     49.7309 152.3018
#> 448 171.4835  225.6768    118.3936  68.6662   95.5427     42.8164 141.6726
#> 449 141.6964  191.2326     92.9853  62.4971   88.2688     37.0560 126.3521
#> 450 117.9501  162.7278     73.5270  57.4878   83.4605     31.4547 109.3619
#> 451 104.2977  145.9590     63.1440  48.7566   70.6037     27.0378  98.8742
#> 452  89.7722  125.4607     55.0447  39.1742   54.7918     23.9388  85.6413
#> 453  76.6295  108.7284     46.0918  29.9554   42.3089     18.1630  72.4091
#> 454  76.9636  107.7647     47.7782  28.5458   39.2202     18.3496  72.6789
#> 455  76.3519  106.3063     48.0552  28.9753   39.3067     19.1248  72.5427
#> 456  75.5380  105.1110     47.7206  28.6464   39.2010     18.6048  70.9548
#> 457  73.1027  100.0957     47.7595  27.4500   36.8056     18.5360  68.9753
#> 458  75.7830  105.2297     48.0646  29.0416   39.9501     18.5655  72.3221
#> 459 205.3051  243.3097    169.2054  71.5705   88.5262     54.8905 152.5554
#> 460 201.3501  251.7999    151.1767  78.9287  104.2378     53.5622 167.4117
#> 461 207.2580  270.3783    142.6267  82.9166  114.4265     51.2234 176.6295
#> 462 193.9282  260.1696    127.6655  77.3285  108.8927     46.1416 171.4435
#> 463 187.1402  253.4288    120.9279  70.6953   99.8919     41.5329 169.7091
#> 464 169.4421  234.6116    103.4477  65.3259   91.9722     37.7298 156.7556
#> 465 146.6744  201.3773     90.7750  53.1864   73.7769     31.5225 136.9216
#> 466 145.8798  201.7077     88.6490  52.1815   72.2937     30.9897 136.9302
#> 467 144.5378  199.1189     88.3123  52.5626   73.1005     30.8637 135.9782
#> 468 143.9374  198.5614     87.2742  51.6437   71.7369     30.3402 135.9777
#> 469 141.8730  196.7093     84.4406  51.2891   71.8947     29.3313 134.3676
#> 470 152.5237  208.8767     92.9700  54.7499   76.0064     31.9969 145.4546
#> 471 327.8839  469.4226    170.5659 174.6623  265.8319     76.4174 311.2259
#> 472 341.2336  486.2733    181.9464 186.5674  279.5188     87.9142 329.3166
#> 473 281.4969  403.9854    155.2057 147.7870  219.6877     73.5442 269.8670
#> 474 231.1907  333.0367    128.7681 117.7252  172.9834     61.4532 223.0290
#> 475 221.3142  318.4219    124.3824 110.8841  162.3256     58.7591 213.6734
#> 476 205.2294  295.5069    116.0031 101.2656  147.6665     54.4763 198.1127
#> 477 204.8000  295.1923    115.2800 100.3791  146.1948     54.2113 198.1153
#> 478 205.0239  295.7139    114.8239  99.9207  145.8144     53.7037 198.7316
#> 479 216.4950  299.8089    133.4727 108.5560  153.6005     63.0191 210.7209
#> 480 148.9691  164.2557    128.1342  54.4856   59.8081     47.5533 126.3091
#> 481 138.7443  155.5173    112.7919  51.2579   57.6516     40.8414 121.3935
#> 482 133.2174  153.7070     95.9462  49.1390   58.1495     31.9230 119.1874
#> 483  96.3405  107.9018     74.6469  38.0824   45.8543     24.0272  84.5150
#> 484  89.8184   99.9075     71.6791  36.4373   44.0468     23.2876  78.5754
#> 485  85.6809   95.0657     69.6784  35.3629   42.9703     22.8689  75.0510
#> 486  84.6357   94.1358     68.8720  34.9748   42.6981     22.7905  74.6235
#> 487  87.8322   98.4732     69.4774  35.6500   43.5284     23.0739  78.4259
#> 488  94.4839  107.3880     70.8105  37.3653   45.5345     23.5164  85.6374
#> 489 192.0301  245.5969    136.7216  76.5029  106.8138     45.9508 163.4487
#> 490 193.5968  262.7566    123.1526  73.9502  106.3493     41.4179 171.4474
#> 491 201.2112  284.4045    116.6297  80.6669  119.3461     41.3699 187.6277
#> 492 158.4589  227.6111     88.7259  60.7374   89.4716     31.0575 148.1081
#> 493 148.8896  210.7474     85.7173  56.4341   81.2674     30.7280 140.1047
#> 494 130.1867  182.7394     76.1457  47.9467   68.9666     26.0546 122.6818
#> 495 118.2904  163.3837     71.4794  43.1183   61.5916     23.6752 111.3251
#> 496 110.9641  151.5784     69.0335  40.7354   55.5666     25.1484 104.3093
#> 497 111.2246  151.4460     69.4412  39.9151   54.7823     24.2121 105.2387
#> 498 112.8764  154.5456     69.3972  40.5796   56.7086     23.4800 106.3725
#> 499 108.3918  147.2934     67.8788  39.7555   54.6878     23.9291 101.7658
#> 500 110.3878  149.6908     69.3180  39.7884   54.8674     23.7534 103.8923
#> 501 208.4232  280.0341    143.7160  86.7601  124.6346     51.8987 180.7923
#> 502 185.0519  254.9297    120.6883  80.4571  113.3253     46.2075 168.7983
#> 503 160.1413  221.9674     95.5356  64.3031   90.7757     36.1375 149.9057
#> 504 130.2379  176.6400     80.4171  53.5778   75.2515     30.1592 124.2942
#> 505 112.4984  152.6646     69.1535  44.6492   63.3665     24.7299 107.1280
#> 506  91.0145  122.6394     56.5026  33.7783   46.9170     19.4892  86.9899
#> 507  75.1577  101.0891     47.3272  27.4935   37.3256     16.8428  72.0796
#> 508  74.7661   99.8433     47.9495  26.9338   36.3496     16.7264  71.6496
#> 509  72.0356   93.8047     48.8410  24.8701   32.5775     16.4757  68.9759
#> 510  68.7250   90.3607     45.5143  24.5126   33.5155     14.6373  65.7443
#> 511  67.2925   91.1828     41.4109  24.9538   34.7706     13.9930  64.0405
#> 512  67.8530   90.0930     43.6746  24.9045   32.9343     15.8167  65.0914
#> 513 369.1574  418.5550    314.0899 170.4028  201.8185    135.8611 291.3360
#> 514 336.0922  405.3727    256.2338 159.7851  204.5681    108.7907 282.9272
#> 515 451.2491  516.1330    391.4005 281.8842  322.6522    245.9735 404.7767
#> 516 544.5417  587.4738    507.7870 376.8486  397.6856    361.3054 498.9322
#> 517 460.3876  515.8485    413.1586 296.2922  326.0097    273.0755 423.2329
#> 518 359.9248  420.9850    305.4172 202.4694  234.4276    173.3161 329.3887
#> 519 347.9828  409.6783    292.0498 194.2954  226.8755    163.5792 319.1251
#> 520 335.7672  396.5150    281.2368 186.8380  219.1990    156.1702 309.0797
#> 521 328.0472  387.9221    273.3130 178.5936  210.1957    148.1039 299.3618
#> 522 316.4353  372.6912    264.3395 168.8056  198.5265    139.5265 286.2649
#> 523 326.2709  377.2127    278.8393 168.6091  194.9384    142.4947 302.2760
#> 524 158.6968  198.2156    120.5408  58.3941   75.5535     41.2836 127.4580
#> 525 122.8812  162.1962     83.1035  46.5426   63.0825     29.7874 107.0885
#> 526 113.2530  155.9513     69.2761  50.1939   72.1731     27.4269 102.7076
#> 527  90.0551  125.4120     53.6321  39.5322   56.0481     22.4443  83.7189
#> 528  81.5948  113.0920     49.1188  34.0455   47.1998     20.2815  76.2967
#> 529  69.7230   93.5926     45.1745  25.8183   34.4718     16.7285  65.2889
#> 530  61.7663   80.9983     42.1920  20.9415   27.2032     14.4348  58.0964
#> 531  59.8604   78.6146     40.7928  20.3045   26.2493     14.1391  56.1661
#> 532  59.1755   77.0287     41.0612  20.2930   26.0838     14.2968  55.4726
#> 533  58.3079   76.2071     40.1688  19.8628   25.6552     13.8729  54.6218
#> 534  56.4380   73.5241     39.1222  18.9767   24.5535     13.2119  52.8000
#> 535  59.8315   77.8870     41.4832  20.4443   26.4927     14.1884  56.4244
#> 536 127.5939  157.0920     96.6141  50.6953   63.7475     37.0367 112.7264
#> 537 119.0739  152.2477     84.5215  48.7161   63.4946     33.1772 109.8177
#> 538  98.5341  123.0923     72.9423  39.1902   49.8734     27.8644  90.5350
#> 539  76.8208   92.4660     60.3964  30.0599   38.4224     21.2999  72.0957
#> 540  69.6141   83.8983     54.7238  26.3987   33.7377     18.7225  65.6195
#> 541  61.4921   75.6620     46.7118  23.7598   30.5826     16.6007  57.8129
#> 542  57.3359   70.7034     43.3355  22.7407   29.5351     15.5971  53.7383
#> 543  55.6708   67.5387     43.2355  22.7676   29.4089     15.7743  52.0905
#> 544  54.8276   66.6434     42.3933  23.1385   29.9523     15.9219  51.4946
#> 545  53.7445   65.4296     41.4455  22.4425   28.5058     16.0203  50.5412
#> 546  51.1505   61.1770     40.5823  21.4673   26.7750     15.8136  48.2029
#> 547  52.3966   64.5594     39.5454  21.1288   26.5414     15.3411  49.0874
#> 548 146.3499  188.2068    104.1976  55.1389   73.6286     36.4684 126.5222
#> 549 121.2390  158.8445     83.6874  48.4426   64.1312     32.4227 108.9291
#> 550 104.1957  136.3864     70.9243  46.1241   62.2764     29.2633  94.8822
#> 551  83.6593  106.7776     59.8190  34.0925   45.6550     22.2683  77.0018
#> 552  71.0483   90.7015     50.8374  28.9443   37.1234     20.6048  65.3642
#> 553  61.9306   75.7894     47.7129  23.0024   29.1856     16.6793  57.0747
#> 554  54.7374   67.8787     41.0784  19.8167   25.8792     13.5671  49.6035
#> 555  51.6389   62.3195     40.6026  18.7842   23.0697     14.3855  47.2178
#> 556  52.0848   65.2575     38.3998  19.0045   24.6413     13.1823  47.4809
#> 557  51.1025   62.2254     39.5914  19.1034   24.5633     13.4685  46.5414
#> 558  47.9005   59.0600     36.3589  17.6110   22.3172     12.7480  43.6186
#> 559  49.6477   61.9708     36.8884  18.5746   23.5971     13.3797  44.8294
#> 560 373.8904  423.6516    319.1787 110.0957  136.5368     82.3314 220.6664
#> 561 293.1451  343.7458    237.9786  83.7414  107.6073     58.7611 183.7415
#> 562 221.3211  271.9098    168.5574  67.3804   89.5893     44.1528 154.9426
#> 563 161.3483  206.9893    113.9500  53.5732   71.7331     34.5236 126.0310
#> 564 140.9175  185.1370     94.8114  47.1598   63.2853     30.3483 116.2043
#> 565 121.7371  161.4740     80.2421  40.9949   54.5369     26.9677 104.1656
#> 566 102.4607  136.9259     66.5116  34.4294   45.9189     22.5017  89.3131
#> 567 101.7241  136.6435     65.2527  34.8860   47.1058     22.1785  89.2505
#> 568  96.6537  129.5133     62.4692  32.2758   43.1253     21.0170  84.7494
#> 569  92.5657  123.9342     60.0244  30.4589   40.5746     19.9830  81.1973
#> 570  89.6655  120.0123     58.2575  29.2420   38.9139     19.2491  78.7896
#> 571  94.8773  128.2144     60.2516  30.7875   41.2937     19.9600  84.5990
#> 572 164.5095  203.1397    125.6556  56.1026   68.1842     43.8687 143.4783
#> 573 143.9865  177.5355    109.9650  48.1597   59.4214     36.5359 129.2942
#> 574 114.0826  140.5306     87.1030  41.1412   52.6248     29.7874 103.8970
#> 575  94.9219  116.0608     73.9444  37.8228   48.2758     27.6019  87.9124
#> 576  85.8737  104.5048     67.3663  34.2601   43.6488     25.0704  79.4149
#> 577  79.7139   97.0356     62.7676  32.1461   41.0631     23.4311  74.0798
#> 578  74.1008   90.0296     58.4671  30.5751   38.6051     22.6496  69.1371
#> 579  75.1234   90.8125     59.7181  31.2738   39.6812     22.9329  70.2366
#> 580  73.5583   89.8207     57.5813  30.6557   39.0088     22.3563  68.6844
#> 581  75.5059   92.2752     59.0034  32.0177   40.7946     23.2358  70.7168
#> 582  74.1563   90.4392     58.1561  31.3689   39.6428     23.0697  69.3229
#> 583  80.2285   99.0310     61.7661  33.3553   42.0982     24.5633  75.7352
#> 584 205.7011  261.3730    149.6700  85.2388  111.6685     59.3179 182.6231
#> 585 164.0321  211.4865    116.7544  68.2618   91.7814     44.6428 148.5252
#> 586 143.9843  185.0328    101.8453  63.1981   86.6902     38.8166 131.9174
#> 587 123.2293  153.6377     91.7220  54.3987   71.0776     36.8538 114.1259
#> 588 121.0797  151.3160     89.5129  54.6096   70.7338     37.5181 112.3533
#> 589 112.6631  140.0094     84.2196  49.3187   63.0544     34.7421 105.0374
#> 590 115.3791  142.0811     87.1554  51.1445   65.2443     36.0347 108.0886
#> 591 118.4467  146.2149     88.8884  54.2038   69.6831     37.5566 111.1829
#> 592 118.7185  146.8896     88.5881  54.9768   70.9196     37.7972 111.5830
#> 593 117.0109  145.0196     86.9924  54.0234   69.6366     37.1908 110.0262
#> 594 116.1037  144.1988     85.9052  54.1701   70.0552     37.0175 109.1709
#> 595 135.6155  169.8915     98.3707  66.0294   86.3156     43.9930 129.0779
#>     Q1560Male Q1560Female NetMigrations    CNMR
#> 1    197.4676    109.9454        15.719   0.480
#> 2    176.0215     96.5923       -22.775  -0.612
#> 3    158.2172     87.1983       -22.068  -0.563
#> 4    151.5085     88.8609        -5.003  -0.121
#> 5    142.6926     81.3872         5.464   0.126
#> 6    146.2386     85.9373         5.215   0.119
#> 7    135.6841     84.8695         4.931   0.111
#> 8    135.0631     84.6033         5.742   0.129
#> 9    130.7116     84.8456         5.397   0.120
#> 10   143.5978     90.3862         0.292   0.006
#> 11   208.4190    118.6852       256.295  20.342
#> 12   165.0816     84.0836        89.189   6.058
#> 13   123.9048     66.3093       100.093   5.844
#> 14    97.9544     56.0670       111.186   5.811
#> 15    85.4655     47.5903       131.371   6.473
#> 16    78.6083     45.7122       166.752   7.531
#> 17    78.3227     45.1968       212.350   8.867
#> 18    76.0895     44.7957       254.648  10.466
#> 19    77.2990     44.6142       255.023  10.312
#> 20    74.0639     43.1513       226.412   9.013
#> 21    75.1836     42.3951       207.142   8.129
#> 22    73.0078     41.6191        44.447   1.727
#> 23   126.5553     63.2043        17.631   2.200
#> 24   111.7663     55.2076        50.676   6.158
#> 25   100.3327     48.6945        22.570   2.698
#> 26    84.7062     44.7097       115.175  13.324
#> 27    80.3758     43.8113        65.976   7.551
#> 28    79.0414     41.7725        45.478   5.169
#> 29    79.3821     44.0312        35.296   3.992
#> 30    75.4795     40.9480        41.090   4.627
#> 31    76.7915     40.5931        39.601   4.439
#> 32   194.4279    105.5983        19.393   2.014
#> 33   174.6780     90.9454        11.482   1.168
#> 34   138.6382     75.0727         8.299   0.833
#> 35   130.5205     68.6779        13.952   1.361
#> 36   114.3119     62.1639        50.576   4.826
#> 37   102.2919     59.3273       105.232   9.622
#> 38    89.4079     53.9786        63.536   5.635
#> 39    86.2426     51.2975        28.090   2.479
#> 40    82.9380     49.3697        37.981   3.339
#> 41    80.4769     49.3222        50.604   4.428
#> 42    77.7603     47.0283        58.469   5.088
#> 43    82.3233     47.7713        43.777   3.793
#> 44   312.4441    239.6356       -18.779  -0.197
#> 45   270.4094    201.3981       -38.918  -0.321
#> 46   243.8676    155.4854       -30.555  -0.205
#> 47   229.1087    122.9297       -45.800  -0.263
#> 48   215.1197    107.9092       -88.868  -0.481
#> 49   202.3564     98.2357      -261.539  -1.350
#> 50   185.4649     89.3181      -173.611  -0.861
#> 51   185.9171     89.5039       -92.989  -0.458
#> 52   178.9903     85.3768      -156.296  -0.764
#> 53   173.6710     83.2655      -230.334  -1.118
#> 54   167.8556     82.8596      -129.216  -0.623
#> 55   183.0919     93.2210       -78.437  -0.376
#> 56   159.9981    100.0897       -11.315  -1.333
#> 57   190.3167     98.9282        -2.045  -0.231
#> 58   219.3926     98.1078      -116.817 -13.241
#> 59   224.9779     98.8380       -26.211  -3.276
#> 60   219.4245     92.2445       -14.435  -1.876
#> 61   196.9053     87.9588       -21.668  -2.913
#> 62   185.5338     86.6172        -4.227  -0.589
#> 63   187.2425     86.4528        -9.482  -1.330
#> 64   183.9603     86.4893        -6.109  -0.863
#> 65   183.9522     86.3157        -3.873  -0.551
#> 66   182.1057     81.7175        -2.156  -0.309
#> 67   206.0967     95.1719        30.167   4.351
#> 68   187.1770    102.5611       304.627  14.208
#> 69   163.9202     86.2700       122.743   5.003
#> 70   127.3062     69.6832       181.461   6.530
#> 71   100.9263     61.0566       201.727   6.530
#> 72    94.3480     57.1141       204.526   6.305
#> 73    85.4107     52.6721       225.369   6.590
#> 74    81.2030     50.7566       224.332   6.238
#> 75    82.7912     51.6105       329.455   9.063
#> 76    85.8038     51.4967       372.685  10.125
#> 77    86.0049     51.0508       420.224  11.268
#> 78    82.6444     49.7499       387.685  10.261
#> 79    94.2755     53.8461       256.592   6.722
#> 80   283.6983    179.7255       -36.079  -3.665
#> 81   212.0804    119.7339       -28.060  -2.438
#> 82   170.8764     90.6210        -1.274  -0.095
#> 83   139.1867     71.8467         7.067   0.456
#> 84   124.5837     65.3033        14.289   0.874
#> 85   116.5784     64.7970        26.048   1.516
#> 86   107.5346     60.7504        55.689   3.086
#> 87   105.2751     59.5912       135.864   7.438
#> 88   102.6448     58.8767       220.621  11.888
#> 89   103.4985     58.9447       237.807  12.587
#> 90   107.3863     60.5067       181.339   9.446
#> 91   112.5929     62.2272        26.042   1.344
#> 92   190.8596    125.3863       -11.187  -0.010
#> 93   148.8963     86.7088       -62.622  -0.049
#> 94   138.0099     76.5587      -103.701  -0.079
#> 95   127.4814     68.8280      -184.144  -0.136
#> 96   119.0459     62.1876      -646.941  -0.463
#> 97   117.2605     60.8553      -153.056  -0.109
#> 98   118.9755     59.7901       -94.625  -0.067
#> 99   113.0852     58.1451      -198.206  -0.140
#> 100  110.5061     57.2701      -656.091  -0.461
#> 101  112.8884     55.8697       -91.577  -0.064
#> 102  234.9844    104.6919       -27.878  -0.713
#> 103  190.1544     89.5366       -41.465  -0.984
#> 104  163.6795     79.4170       -34.220  -0.764
#> 105  141.3376     74.7532       -41.123  -0.876
#> 106  140.0999     74.2304       104.373   2.200
#> 107  139.1045     74.5328       431.072   8.956
#> 108  138.5754     73.9479       495.524  10.108
#> 109  135.5810     72.4782       396.826   7.951
#> 110  161.9367     87.2326       227.130   4.486
#> 111  126.4892     75.3790         7.949   2.546
#> 112  122.4906     67.9388         8.826   2.241
#> 113  114.7997     61.6321         4.567   1.072
#> 114  119.7265     62.1789         2.357   0.517
#> 115  113.6425     56.1235         1.617   0.336
#> 116  118.3016     58.0770         1.649   0.339
#> 117  114.9958     60.8492         1.671   0.340
#> 118  118.5335     61.5509         1.673   0.337
#> 119  114.3800     59.3998         1.653   0.331
#> 120  118.8716     64.3720         1.029   0.204
#> 121  181.9815     76.1605       -47.629 -11.010
#> 122  166.9879     67.5894        10.629   2.464
#> 123  148.9586     62.1858        -3.995  -0.929
#> 124  127.8764     55.3084       -27.501  -6.573
#> 125  125.6787     54.4924       -32.144  -7.771
#> 126  122.3529     54.1394       -44.557 -10.923
#> 127  124.0276     53.7136       -25.016  -6.215
#> 128  120.9640     52.3965       -13.239  -3.321
#> 129  121.0442     53.0699        -8.552  -2.163
#> 130  125.7032     68.6622         1.371   1.739
#> 131  104.1292     55.0142        10.753  11.347
#> 132   90.9633     46.9673        12.616  12.176
#> 133   76.5711     38.8980        11.793  10.456
#> 134   65.9237     34.1867        11.277   9.247
#> 135   64.8948     33.3484        10.951   8.852
#> 136   63.4052     33.0752        10.632   8.477
#> 137   62.4905     32.9381        10.311   8.114
#> 138   62.3091     32.9079         9.983   7.759
#> 139   65.9669     42.2955         9.653   7.413
#> 140  225.4582    111.7041        -9.353  -0.954
#> 141  229.1679    103.4941         1.738   0.169
#> 142  230.7540     95.0452        -3.529  -0.343
#> 143  172.6287     76.1265         4.420   0.432
#> 144  154.5796     69.6553        26.203   2.549
#> 145  135.4368     60.2394        34.927   3.338
#> 146  112.2636     53.0984         5.037   0.479
#> 147  109.1333     53.4676         5.465   0.519
#> 148  109.1333     51.5916         5.747   0.545
#> 149  110.4418     51.1837         5.849   0.554
#> 150  107.1265     51.9614         5.553   0.526
#> 151  111.9351     54.9714         4.336   0.411
#> 152  158.5016    104.3005        20.947   4.250
#> 153  166.7916    105.9202         0.803   0.157
#> 154  155.1964    101.1331         8.667   1.686
#> 155  125.8913     78.8479        10.441   1.955
#> 156  111.1354     69.2738         6.887   1.271
#> 157  104.8647     63.0076        17.533   3.160
#> 158   82.9472     51.3829        42.284   7.440
#> 159   82.4426     51.6200        33.391   5.829
#> 160   78.2121     47.4475        24.561   4.260
#> 161   77.9079     48.3234        18.919   3.265
#> 162   73.6194     43.8209         9.488   1.632
#> 163   71.5234     43.5723        10.851   1.861
#> 164  256.4014    105.2583         6.158   4.522
#> 165  303.0538    112.7739         4.619   3.128
#> 166  300.0225    106.7781        -2.660  -1.694
#> 167  308.0198    118.0593        -3.083  -2.207
#> 168  274.1893     99.3245        -5.208  -3.844
#> 169  203.0413     67.8486        -3.781  -2.840
#> 170  169.8605     62.9045         4.261   3.241
#> 171  168.1901     67.1866         1.081   0.822
#> 172  154.5371     56.3171         5.202   3.948
#> 173  157.2639     55.8970         7.089   5.362
#> 174  147.2263     58.3715         5.386   4.059
#> 175  151.4202     60.1877         3.694   2.778
#> 176  190.2152    103.2937      -374.041  -0.973
#> 177  189.9780     90.4600       780.858   1.920
#> 178  177.0629     79.2305       676.024   1.610
#> 179  148.2803     67.9819       673.775   1.576
#> 180  135.7822     62.4298      1220.827   2.809
#> 181  120.5668     56.3268       656.784   1.491
#> 182  104.5312     51.0550      1510.502   3.403
#> 183  101.6447     50.0389      1025.818   2.306
#> 184   99.4378     49.3043      1145.236   2.570
#> 185   98.4804     48.7641      1355.230   3.035
#> 186   95.4468     47.3388      1415.453   3.164
#> 187  100.3350     49.1409      1066.639   2.382
#> 188  253.8923     99.6037       -36.579  -7.941
#> 189  204.1167     73.8787        -2.212  -0.463
#> 190  183.0615     70.3342         8.920   1.789
#> 191  144.4328     63.3073         2.497   0.482
#> 192  137.2330     62.7358         9.251   1.763
#> 193  120.4197     53.6474        14.080   2.625
#> 194   94.5201     43.6105        12.655   2.309
#> 195   94.8822     43.1130        17.321   3.152
#> 196   90.1906     44.9008        13.356   2.425
#> 197   89.8903     44.1650        11.822   2.143
#> 198   87.7581     43.3235        15.671   2.838
#> 199   91.9448     42.2993        17.504   3.166
#> 200  204.6812    101.1330       182.941   3.600
#> 201  195.9163     84.9075        54.718   1.014
#> 202  167.5741     68.9759        43.323   0.760
#> 203  138.6467     60.9627       171.637   2.885
#> 204  126.5815     56.7463       191.417   3.106
#> 205  115.6748     53.6568        52.644   0.830
#> 206  101.6004     49.3982        -0.345  -0.005
#> 207   97.9274     48.3329        15.548   0.239
#> 208   95.3618     48.2282       102.984   1.577
#> 209   94.2031     48.2092       132.925   2.029
#> 210   91.7633     47.0283        71.972   1.095
#> 211   92.9251     46.9044       145.593   2.209
#> 212  125.4453     63.3448       174.594   2.134
#> 213  111.7929     57.6797        81.351   0.992
#> 214  101.9058     53.2782       130.116   1.610
#> 215   92.4624     50.1299      1175.283  14.319
#> 216   89.9632     49.5313       517.480   6.253
#> 217   86.5167     48.0474       452.988   5.451
#> 218   86.9003     48.2568       403.908   4.845
#> 219   83.6072     46.5898       319.082   3.819
#> 220   84.9991     46.2179       203.468   2.433
#> 221  153.1204     90.0277       -54.166  -6.192
#> 222  139.7772     73.8571        47.460   4.916
#> 223  114.7783     55.9813        26.294   2.563
#> 224  113.1823     49.2016        54.661   5.069
#> 225  107.8643     43.8458        33.297   3.032
#> 226   99.9119     40.5195         2.001   0.180
#> 227   96.0758     39.1473       -43.462  -4.016
#> 228   90.5553     37.9178        10.484   0.973
#> 229   92.5854     38.9877        10.483   0.975
#> 230   87.3849     36.6803        17.938   1.672
#> 231   87.1177     37.3996        36.762   3.430
#> 232   93.8135     43.7178         6.353   0.594
#> 233  199.3986    112.8404        -0.096  -0.009
#> 234  263.2345    129.7899       -17.795  -1.664
#> 235  305.1153    132.6828        16.991   1.637
#> 236  271.4482    114.5155        13.414   1.316
#> 237  256.3213    107.3764        16.925   1.681
#> 238  218.9332     94.9095        10.592   1.061
#> 239  177.6118     85.9228        13.856   1.408
#> 240  172.2818     79.6951         0.068   0.007
#> 241  168.0329     80.5689        20.200   2.064
#> 242  166.7339     77.6774        34.190   3.498
#> 243  159.1752     75.1930        34.339   3.515
#> 244  164.5144     78.3596         9.147   0.938
#> 245  183.4375     73.0263        -1.754  -8.578
#> 246  140.6084     71.1148        -0.629  -2.757
#> 247  119.7277     80.0774        -0.971  -3.810
#> 248   99.3286     61.7969         1.877   6.673
#> 249   70.2056     52.5382         3.925  13.223
#> 250   72.4050     38.5173        -2.055  -6.459
#> 251   70.0227     46.2661         1.499   4.529
#> 252   67.6715     42.8759         4.128  12.301
#> 253   76.2743     35.6442         8.348  24.301
#> 254   70.9383     43.4575         6.638  18.812
#> 255   65.2537     46.9608         5.030  13.945
#> 256   67.2561     45.5023         2.498   6.814
#> 257  268.6900    216.9523       125.514   0.145
#> 258  247.6726    187.1909      -143.960  -0.136
#> 259  235.3879    162.1616      -929.454  -0.805
#> 260  221.2643    146.1962       -50.905  -0.041
#> 261  205.0081    141.3712      -655.085  -0.493
#> 262  201.4511    140.2995        81.248   0.060
#> 263  197.9863    138.9882      -251.642  -0.185
#> 264  194.5230    137.2065      -589.794  -0.429
#> 265  191.1199    134.9258      -978.969  -0.705
#> 266  199.7139    139.4246       -73.806  -0.053
#> 267  234.8955    185.6239        11.539   0.063
#> 268  220.5958    177.1251       -42.697  -0.198
#> 269  214.5136    170.4740       -76.784  -0.333
#> 270  213.0616    168.0482       -57.752  -0.234
#> 271  203.8190    155.6277       -28.487  -0.109
#> 272  201.9236    153.4159       -28.991  -0.110
#> 273  200.0676    150.9071       -29.467  -0.110
#> 274  199.6901    149.4095       -29.911  -0.111
#> 275  196.6982    146.4854       -30.421  -0.112
#> 276  222.6532    163.7545       -18.743  -0.068
#> 277  184.0908    120.5605        -8.892  -3.003
#> 278  175.5694    100.6296        -2.876  -0.842
#> 279  133.2813     80.6424        -8.203  -2.334
#> 280  119.2491     70.0273        31.298   8.231
#> 281   96.6635     58.6027        63.983  15.398
#> 282   86.7724     50.7471       -26.974  -5.917
#> 283   74.3324     47.7618        13.376   2.844
#> 284   72.0803     44.9581        18.967   3.990
#> 285   70.7710     41.2165        28.883   6.004
#> 286   70.3156     44.7384        33.387   6.852
#> 287   71.6070     42.3568        29.663   6.013
#> 288   67.3172     42.5292        15.746   3.160
#> 289  101.1486     64.7348       178.732  39.325
#> 290  100.1375     53.6239        63.409  10.376
#> 291   89.4647     49.7088        10.975   1.631
#> 292   77.2687     43.0378        12.906   1.759
#> 293   72.9266     39.9207        29.735   3.692
#> 294   70.2294     39.8472        24.308   2.961
#> 295   69.9342     38.5448        14.518   1.736
#> 296   70.4794     37.1283        15.615   1.835
#> 297   69.1389     37.2746        16.134   1.864
#> 298   68.4345     36.9734        16.573   1.883
#> 299  175.8078     94.9275       -62.216  -1.165
#> 300  165.6744     76.9115       295.642   5.241
#> 301  130.5119     61.1317        35.317   0.619
#> 302  101.3487     50.6807        56.065   0.979
#> 303   84.3674     44.1937       258.702   4.421
#> 304   73.0263     40.1805       274.387   4.561
#> 305   67.3078     38.6051        39.389   0.650
#> 306   64.4962     37.3063        84.568   1.398
#> 307   66.5054     37.7587        95.147   1.576
#> 308   63.2137     36.5070        83.686   1.388
#> 309   61.4696     35.5430        46.634   0.776
#> 310   66.4494     37.4892        85.281   1.423
#> 311  172.9841    104.1571        33.731   0.316
#> 312  130.4422     69.0690       -92.314  -0.780
#> 313  108.8481     53.4865       124.582   1.010
#> 314   98.3783     47.6856        23.468   0.185
#> 315   92.6801     45.0918       113.017   0.884
#> 316   82.8004     41.4754       131.860   1.029
#> 317   70.1854     37.1330       168.896   1.327
#> 318   68.7245     37.0078       314.732   2.475
#> 319   66.6081     35.6876       322.564   2.539
#> 320   65.3004     35.7841       320.601   2.526
#> 321   64.3839     35.4851       318.190   2.511
#> 322   64.5243     35.6105        42.001   0.333
#> 323  350.4376    207.6490       -27.999  -0.860
#> 324  342.0725    172.6951      -148.341  -3.889
#> 325  242.9066    107.1031        79.294   1.799
#> 326  161.4675     64.2320       -84.960  -1.817
#> 327  129.2374     51.6635       -47.821  -0.999
#> 328   97.3908     35.3962        52.042   1.067
#> 329   70.8544     25.7227       276.427   5.422
#> 330   66.2084     24.2183        91.568   1.785
#> 331   61.8741     22.9061       104.029   2.021
#> 332   59.8664     22.3150       118.220   2.289
#> 333   56.0976     21.2037       128.622   2.485
#> 334   72.6533     33.4738       112.631   2.172
#> 335  329.8409    121.7908       -15.679  -6.620
#> 336  325.3089    116.9738       -11.134  -4.971
#> 337  263.1018     98.6488       -36.128 -17.222
#> 338  234.5363     86.0324       -10.826  -5.474
#> 339  229.5829     87.4936       -12.327  -6.290
#> 340  228.6115     85.3649        -7.867  -4.050
#> 341  229.1361     85.9958        -4.972  -2.579
#> 342  210.6163     84.4956        -3.416  -1.784
#> 343  211.6574     79.8284        -3.147  -1.655
#> 344  292.9234    102.9828       -16.077  -4.593
#> 345  331.4806    112.6541       -51.357 -15.458
#> 346  284.2874     98.0356       -78.887 -25.466
#> 347  245.3972     85.0631       -22.560  -7.764
#> 348  242.4864     81.4419       -30.612 -10.670
#> 349  212.8861     78.8479       -28.027  -9.906
#> 350  206.9445     76.0895        -3.459  -1.234
#> 351  200.9184     73.2858        10.665   3.816
#> 352  223.6823     82.5527        19.884   7.112
#> 353  236.2888    129.2328         0.853   2.514
#> 354  180.1320    103.2922         0.840   2.310
#> 355  152.4842     94.3707         3.992  10.458
#> 356  127.4415     78.1753         4.516  10.355
#> 357  104.3005     67.6389         6.310  13.559
#> 358   94.5926     61.8966         7.909  15.587
#> 359   73.0356     47.6523        11.377  19.976
#> 360   74.9063     49.7214        12.760  21.868
#> 361   67.1213     53.6143         9.643  16.166
#> 362   67.9652     46.3133        10.145  16.683
#> 363   66.5007     51.5916        10.503  16.936
#> 364   69.1249     44.8626         6.967  11.048
#> 365  103.0088     62.9935         0.568   1.544
#> 366   79.1107     59.4485         1.591   3.979
#> 367   73.2510     48.0036         1.626   3.934
#> 368   76.7442     39.3776         0.741   1.753
#> 369   66.0519     41.4820         9.588  21.547
#> 370   71.9420     44.7432         8.624  18.943
#> 371   62.6767     44.9331        14.372  30.716
#> 372   65.8012     44.9312        16.961  35.003
#> 373   53.7699     43.0237        20.302  40.281
#> 374   70.9506     39.8673         6.904  13.323
#> 375  325.7155    244.1069      -164.100  -3.229
#> 376  308.9435    179.2101      -252.177  -3.747
#> 377  245.3337    137.0020      -321.764  -3.885
#> 378  196.8568    111.0476      -356.433  -3.614
#> 379  181.7417    103.3428      -310.278  -2.932
#> 380  195.3836    102.7950       -40.845  -0.359
#> 381  188.4990     99.2430      -291.044  -2.404
#> 382  193.5129    100.0784      -304.472  -2.491
#> 383  201.1045    101.7166      -227.499  -1.844
#> 384  204.9518    101.8713      -175.356  -1.408
#> 385  203.8020     98.9145      -169.628  -1.349
#> 386  279.9135    143.1715      -147.456  -1.163
#> 387  158.6869     87.1559        32.438   2.485
#> 388  136.7844     72.1916        54.010   3.814
#> 389  116.4263     67.1026        53.564   3.564
#> 390  100.0538     67.1586        59.308   3.693
#> 391   82.8371     61.4039       -22.496  -1.366
#> 392   74.1751     54.9147        33.703   2.010
#> 393   66.7107     49.4267        55.585   3.249
#> 394   65.5527     51.0793        88.743   5.158
#> 395   64.7675     47.2474        86.332   4.986
#> 396   63.9815     46.7709        87.197   5.005
#> 397   62.3608     45.0536       109.003   6.215
#> 398   64.7487     44.6046        67.598   3.833
#> 399  196.8006    118.3591         4.511   1.598
#> 400  167.2497    108.0457       -15.423  -4.902
#> 401  142.8572     93.1427        70.432  20.734
#> 402  104.3004     67.0746        -6.604  -1.712
#> 403   94.4023     59.6095        19.212   4.646
#> 404   85.4198     54.4042         6.722   1.546
#> 405   76.5052     52.3879        70.870  15.360
#> 406   79.1702     51.8950        75.512  16.016
#> 407   79.9526     51.9045        68.349  14.202
#> 408   80.0906     51.5441        59.139  12.067
#> 409   82.5160     50.8041        69.770  13.984
#> 410   74.2676     50.1964        42.124   8.309
#> 411  158.2070     76.3574        -1.034  -0.267
#> 412  146.5181     67.5503         3.763   0.921
#> 413  127.5331     65.2163         1.818   0.429
#> 414  106.6620     61.0941         9.805   2.183
#> 415   88.3783     56.0009        18.588   4.021
#> 416   79.6121     50.1204        42.865   8.767
#> 417   65.8330     41.9928        30.242   5.827
#> 418   65.8424     41.7054        26.417   5.045
#> 419   61.9388     39.4027        21.657   4.104
#> 420   62.5014     38.7301        18.473   3.478
#> 421   60.8594     37.4315        25.707   4.807
#> 422   59.9292     37.2582        11.277   2.096
#> 423  214.3767    121.9959       490.678   0.532
#> 424  193.8556     99.0191       898.048   0.879
#> 425  169.8314     82.7961      2405.371   2.162
#> 426  141.3936     71.5299      2009.988   1.674
#> 427  131.0512     66.9701      2999.000   2.407
#> 428  121.4107     62.7141      3383.262   2.618
#> 429  112.5482     60.2467      5501.588   4.112
#> 430  112.9427     60.3899      4775.975   3.544
#> 431  112.5269     59.9170      5639.570   4.156
#> 432  111.8576     59.3471      5388.362   3.944
#> 433  110.0366     58.1612      5032.996   3.661
#> 434  127.0877     67.0509      2244.004   1.625
#> 435  208.6401    106.3582       -66.859  -2.055
#> 436  241.9231    102.9171       -42.420  -1.192
#> 437  265.4244    102.4983       -50.339  -1.323
#> 438  221.3497     86.8455       -15.921  -0.416
#> 439  205.3003     79.3521       -41.942  -1.100
#> 440  188.4561     72.1954       119.623   3.140
#> 441  162.4813     63.2147         3.887   0.102
#> 442  161.1020     62.3303        -5.675  -0.148
#> 443  158.7643     61.7195       -21.535  -0.563
#> 444  159.5529     61.5353        -0.223  -0.006
#> 445  156.2276     59.8296         7.696   0.201
#> 446  171.2125     65.5247         3.920   0.103
#> 447  202.7300    104.7482      -191.862 -22.131
#> 448  193.7018     91.5725        29.881   3.060
#> 449  174.6445     79.2807       -34.855  -3.489
#> 450  153.5808     65.6742        60.586   5.892
#> 451  140.3075     58.0283        15.537   1.479
#> 452  121.2988     50.9749        -5.627  -0.532
#> 453  104.0138     42.4526        -3.209  -0.309
#> 454  103.0995     43.9452        -0.775  -0.075
#> 455  102.0764     44.7384        13.979   1.353
#> 456  100.5127     43.1800        22.495   2.179
#> 457   95.6965     43.9547        63.031   6.094
#> 458  101.8878     44.4900        54.076   5.214
#> 459  187.7492    120.0112        71.919   3.594
#> 460  215.9187    119.8654       -16.668  -0.752
#> 461  238.7686    113.6091       -38.157  -1.663
#> 462  237.0890    106.3136       -92.451  -4.194
#> 463  235.4703    104.4796      -131.176  -6.184
#> 464  221.5680     91.4090      -122.364  -5.989
#> 465  191.2558     81.5705       -35.751  -1.799
#> 466  192.3309     80.3114       -33.073  -1.672
#> 467  190.2119     80.2562       -33.081  -1.680
#> 468  190.3496     79.6950       -33.018  -1.685
#> 469  189.0044     77.2437       -27.909  -1.431
#> 470  201.8298     85.9410       -13.202  -0.681
#> 471  454.1960    153.4187       550.401   3.751
#> 472  475.4708    169.6696       263.541   1.823
#> 473  393.4167    142.9048       307.555   2.137
#> 474  325.0844    120.7198       384.756   2.648
#> 475  310.9809    116.8106       447.645   3.071
#> 476  288.4626    109.0608       396.619   2.713
#> 477  288.5089    108.8458       339.972   2.322
#> 478  289.4600    108.7170       336.494   2.296
#> 479  294.0512    127.8665       334.094   2.283
#> 480  140.9976    106.0172       468.515  28.960
#> 481  137.7406     95.7981       518.565  25.222
#> 482  139.0905     82.3897       504.955  20.072
#> 483   95.1543     63.7378       465.292  15.523
#> 484   87.7976     61.3166       -26.997  -0.879
#> 485   83.6510     59.8481      -920.812 -29.914
#> 486   83.4375     59.5488      -988.751 -32.562
#> 487   88.4901     60.6286       191.582   6.287
#> 488   98.0647     62.3887       -74.725  -2.411
#> 489  215.6285    110.0948        -4.919  -1.087
#> 490  239.1464    103.2251        -5.522  -1.110
#> 491  270.5881    103.7361        -9.402  -1.785
#> 492  216.4916     79.5201        -0.831  -0.154
#> 493  201.4861     77.6404        -0.561  -0.104
#> 494  175.0990     68.8735        -1.814  -0.336
#> 495  156.1844     64.8329         2.549   0.470
#> 496  144.4931     62.9139         3.487   0.642
#> 497  144.8266     64.2155         3.279   0.603
#> 498  147.8997     63.0919         3.446   0.633
#> 499  140.3680     61.6292         3.128   0.574
#> 500  142.8231     63.2793         4.350   0.797
#> 501  251.7104    117.7025         0.260   0.149
#> 502  238.1271    105.5348         3.128   1.644
#> 503  210.8298     86.5441         0.618   0.309
#> 504  170.0928     75.2206         3.124   1.572
#> 505  147.3198     63.7733         6.317   3.163
#> 506  118.7733     52.3042        -0.410  -0.201
#> 507   97.9004     44.3781         0.712   0.346
#> 508   96.6727     44.8987         1.195   0.580
#> 509   90.9364     45.5719         1.359   0.659
#> 510   87.0920     42.8599        14.640   7.074
#> 511   87.4658     38.6838        16.352   7.849
#> 512   87.1210     41.1511        28.514  13.562
#> 513  341.8313    235.3028       258.127   8.744
#> 514  353.5084    202.0439       259.718   6.374
#> 515  473.0637    342.5019      -136.794  -2.901
#> 516  544.0836    460.9838        31.286   0.632
#> 517  480.4910    375.2541        68.563   1.310
#> 518  391.2645    274.8583       641.150  11.303
#> 519  381.3144    263.4689      -879.235 -15.355
#> 520  370.4274    254.6096       343.146   5.954
#> 521  359.2923    245.3319       318.260   5.430
#> 522  342.7696    234.5402       331.124   5.557
#> 523  353.0225    255.5307       369.901   6.108
#> 524  164.6472     92.2263       -60.580  -1.792
#> 525  145.0316     69.0224        20.166   0.537
#> 526  144.7920     59.5248       -30.684  -0.785
#> 527  118.7204     47.7332       176.269   4.297
#> 528  107.3228     44.3753       629.803  14.327
#> 529   89.0071     40.9193        69.406   1.482
#> 530   77.0684     38.8166        -1.979  -0.042
#> 531   74.5453     37.5181       106.474   2.278
#> 532   73.0727     37.6432       201.135   4.291
#> 533   72.3123     36.7189       337.467   7.166
#> 534   69.6181     35.7841       464.783   9.798
#> 535   74.2491     38.3359       236.854   4.968
#> 536  140.4882     83.7538        47.242   5.874
#> 537  142.0339     76.3851        10.040   1.208
#> 538  114.4093     65.7209        35.668   4.168
#> 539   87.2380     56.2274        24.900   2.807
#> 540   79.5845     51.0793        27.030   2.993
#> 541   71.8761     43.1513        51.175   5.457
#> 542   66.8974     39.9693        80.534   8.218
#> 543   63.9628     39.6524       119.234  12.016
#> 544   63.2792     39.0953       102.671  10.208
#> 545   62.0701     38.4128        87.517   8.601
#> 546   58.1602     37.7106        72.619   7.065
#> 547   60.8688     36.6515        37.302   3.603
#> 548  166.2330     86.9916       -18.326  -2.965
#> 549  144.9889     73.2209        17.841   2.823
#> 550  126.4766     62.3139        58.428   8.703
#> 551   99.4416     53.9218        24.463   3.405
#> 552   84.2667     45.9890        33.203   4.468
#> 553   71.1334     42.6441        76.388   9.761
#> 554   62.2670     36.4684        71.876   8.677
#> 555   58.1884     35.8708        71.009   8.479
#> 556   60.2111     34.2787        45.658   5.401
#> 557   57.5855     35.1185        41.253   4.844
#> 558   54.6216     32.2486        44.517   5.190
#> 559   56.7746     32.4808        55.523   6.426
#> 560  277.4811    158.6232      -150.924  -4.119
#> 561  238.0573    124.8977      -151.969  -3.347
#> 562  206.9569    100.9494       -27.193  -0.485
#> 563  171.6575     78.8875      -195.996  -2.996
#> 564  160.2069     70.5037      -174.177  -2.512
#> 565  143.6251     63.0800        55.532   0.757
#> 566  123.4306     53.8083      1063.140  13.287
#> 567  123.8300     53.2128       352.063   4.312
#> 568  117.2470     51.0157       659.846   7.942
#> 569  112.1910     49.1151       187.570   2.222
#> 570  108.7584     47.8398       -15.690  -0.184
#> 571  117.5978     50.3911        37.934   0.441
#> 572  180.2717    106.8854       -15.254  -0.274
#> 573  161.7859     96.5462       -25.187  -0.448
#> 574  129.2851     78.1199        57.132   0.996
#> 575  108.4558     67.6063       153.917   2.606
#> 576   97.4491     61.5729       308.279   5.087
#> 577   91.1272     57.4441       274.811   4.362
#> 578   84.5597     54.0637       347.839   5.320
#> 579   85.6576     55.1320       324.649   4.927
#> 580   84.5963     53.0983       272.311   4.104
#> 581   87.1650     54.5744       259.744   3.891
#> 582   85.2735     53.6947       232.727   3.468
#> 583   94.1850     57.6703       144.221   2.141
#> 584  236.9897    128.4573       744.902   3.585
#> 585  194.9830    102.5701       595.916   2.593
#> 586  172.0819     90.8727      1084.720   4.281
#> 587  143.8936     83.3689      1248.392   4.435
#> 588  141.9394     81.5429      1369.224   4.630
#> 589  131.8758     77.1791      1594.453   5.126
#> 590  134.3118     80.4125      1722.127   5.281
#> 591  138.5347     82.1030      1889.129   5.739
#> 592  139.2580     82.0204      1864.738   5.613
#> 593  137.5262     80.5872      1764.961   5.268
#> 594  136.8186     79.4833      1774.500   5.253
#> 595  162.9578     92.2989       329.769   0.972
sex_comparable_measures()
#>  [1] "retirement_age"   "TPopulation1July" "Deaths"           "LEx"             
#>  [5] "LE15"             "LE65"             "LE80"             "Q0040"           
#>  [9] "Q0060"            "Q1550"            "Q1560"
retirement_countries()
#>  [1] "Argentina"                    "Australia"                   
#>  [3] "Austria"                      "Belgium"                     
#>  [5] "Brazil"                       "Bulgaria"                    
#>  [7] "Canada"                       "Chile"                       
#>  [9] "China (People's Republic of)" "Colombia"                    
#> [11] "Costa Rica"                   "Croatia"                     
#> [13] "Cyprus"                       "Czech Republic"              
#> [15] "Denmark"                      "Estonia"                     
#> [17] "Finland"                      "France"                      
#> [19] "Germany"                      "Greece"                      
#> [21] "Hungary"                      "Iceland"                     
#> [23] "India"                        "Indonesia"                   
#> [25] "Ireland"                      "Israel"                      
#> [27] "Italy"                        "Japan"                       
#> [29] "Korea"                        "Latvia"                      
#> [31] "Lithuania"                    "Luxembourg"                  
#> [33] "Malta"                        "Mexico"                      
#> [35] "Netherlands"                  "New Zealand"                 
#> [37] "Norway"                       "Poland"                      
#> [39] "Portugal"                     "Romania"                     
#> [41] "Russia"                       "Saudi Arabia"                
#> [43] "Slovak Republic"              "Slovenia"                    
#> [45] "South Africa"                 "Spain"                       
#> [47] "Sweden"                       "Switzerland"                 
#> [49] "Türkiye"                      "United Kingdom"              
#> [51] "United States"
```

Plot retirement-age trends across OECD and EU membership groups:

``` r
plot_retirement_trends()
```

<img src="man/figures/README-unnamed-chunk-4-1.png" alt="" width="100%" />

Map OECD and EU membership groups:

``` r
map_groups(year = 2020)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" alt="" width="100%" />

Compare countries in a single year:

``` r
plot_measure_snapshot(
  measure = "LE65",
  year = 2020,
  level = "country",
  countries = c("China", "Japan", "Germany", "Turkey")
)
```

<img src="man/figures/README-unnamed-chunk-6-1.png" alt="" width="100%" />

Study women-men differences:

``` r
plot_sex_gap_trends(
  measure = "retirement_age",
  level = "country",
  countries = c("China", "Japan", "Germany")
)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" alt="" width="100%" />

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

<img src="man/figures/README-unnamed-chunk-8-1.png" alt="" width="100%" />

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
#> Warning: vignette 'getting-started' not found
```
