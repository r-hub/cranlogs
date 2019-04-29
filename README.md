---
output:
  github_document:
    html_preview: false
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# cranlogs

> Download logs from the RStudio CRAN mirror

<!-- badges: start -->
[![Linux Build Status](https://travis-ci.org/r-hub/cranlogs.svg?branch=master)](https://travis-ci.org/r-hub/cranlogs)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/metacran/cranlogs?svg=true)](https://ci.appveyor.com/project/gaborcsardi/cranlogs)
[![CRAN version](http://www.r-pkg.org/badges/version/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)
<!-- badges: end -->

[RStudio](http://www.rstudio.com) publishes the download logs from
their CRAN package mirror daily at http://cran-logs.rstudio.com.

This R package queries a database that contains the daily download
numbers for each package.

The RStudio CRAN mirror is not the only CRAN mirror, but it's a popular
one: it's the default choice for RStudio users. The actual number of
downloads over all CRAN mirrors is unknown.

## Installation

You can install `cranlogs` from CRAN:

```r
install.packages("cranlogs")
```

Or get the development version from Github:


```r
# install.packages("remotes")
remotes::install_github("r-hub/cranlogs")
```

## Usage

It has a very simple API. By default it shows the total number of
package downloads from the last day for which data is available.


```r
library(cranlogs)
cran_downloads()
```

```
#>         date   count
#> 1 2019-04-27 1854905
```

The last week (6 days prior to the last day for which data is available),
or the last month (29 days prior to the last day for which data is
available) can be also easily queried:


```r
cran_downloads(when = "last-week")
```

```
#>         date   count
#> 1 2019-04-21 1457773
#> 2 2019-04-22 2519866
#> 3 2019-04-23 3075545
#> 4 2019-04-24 3292028
#> 5 2019-04-25 3193704
#> 6 2019-04-26 2868266
#> 7 2019-04-27 1854905
```

The `package` argument queries a specific package:


```r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

```
#>          date count  package
#> 1  2019-04-21  7638 magrittr
#> 2  2019-04-22 15553 magrittr
#> 3  2019-04-23 20282 magrittr
#> 4  2019-04-24 21837 magrittr
#> 5  2019-04-25 20755 magrittr
#> 6  2019-04-26 19577 magrittr
#> 7  2019-04-27 10914 magrittr
#> 8  2019-04-21 15065    dplyr
#> 9  2019-04-22 26176    dplyr
#> 10 2019-04-23 31885    dplyr
#> 11 2019-04-24 36479    dplyr
#> 12 2019-04-25 33564    dplyr
#> 13 2019-04-26 30938    dplyr
#> 14 2019-04-27 19318    dplyr
```

Alternative intervals can also be specified:


```r
cran_downloads(package = "plyr", from = "2014-01-01", to = "2014-02-01")
```

```
#>          date count package
#> 1  2014-01-01     0    plyr
#> 2  2014-01-02   604    plyr
#> 3  2014-01-03   637    plyr
#> 4  2014-01-04   403    plyr
#> 5  2014-01-05   430    plyr
#> 6  2014-01-06   870    plyr
#> 7  2014-01-07  1044    plyr
#> 8  2014-01-08  1158    plyr
#> 9  2014-01-09  1178    plyr
#> 10 2014-01-10  1092    plyr
#> 11 2014-01-11   489    plyr
#> 12 2014-01-12   560    plyr
#> 13 2014-01-13  1274    plyr
#> 14 2014-01-14  1323    plyr
#> 15 2014-01-15  1434    plyr
#> 16 2014-01-16  1379    plyr
#> 17 2014-01-17  1094    plyr
#> 18 2014-01-18   541    plyr
#> 19 2014-01-19   564    plyr
#> 20 2014-01-20  1206    plyr
#> 21 2014-01-21  1474    plyr
#> 22 2014-01-22  1572    plyr
#> 23 2014-01-23  1556    plyr
#> 24 2014-01-24  1541    plyr
#> 25 2014-01-25   766    plyr
#> 26 2014-01-26   823    plyr
#> 27 2014-01-27  1536    plyr
#> 28 2014-01-28  1551    plyr
#> 29 2014-01-29  1558    plyr
#> 30 2014-01-30  1535    plyr
#> 31 2014-01-31  1181    plyr
#> 32 2014-02-01   662    plyr
```

For downloads of R itself, give `"R"` instead of a package:


```r
cran_downloads("R")
```

```
#>          date      version  os count
#> 1  2019-04-27       2.10.0 osx     1
#> 2  2019-04-27       2.10.1 osx     1
#> 3  2019-04-27       2.11.0 osx     3
#> 4  2019-04-27       2.11.1 osx     1
#> 5  2019-04-27       2.12.0 osx     1
#> 6  2019-04-27       2.12.1 osx     2
#> 7  2019-04-27       2.12.2 osx     1
#> 8  2019-04-27       2.13.0 osx     2
#> 9  2019-04-27       2.13.1 osx     1
#> 10 2019-04-27       2.13.2 osx     1
#> 11 2019-04-27       2.14.0 osx     3
#> 12 2019-04-27       2.14.1 osx     1
#> 13 2019-04-27       2.14.2 osx     2
#> 14 2019-04-27       2.15.0 osx     3
#> 15 2019-04-27       2.15.1 osx     2
#> 16 2019-04-27       2.15.2 osx     1
#> 17 2019-04-27       2.15.3 osx     2
#> 18 2019-04-27        3.0.0 osx     1
#> 19 2019-04-27        3.1.0 osx     1
#> 20 2019-04-27        3.1.3 osx     1
#> 21 2019-04-27        3.2.1 osx     2
#> 22 2019-04-27        3.2.4 osx    44
#> 23 2019-04-27        3.3.0 osx     2
#> 24 2019-04-27        3.3.3 osx    49
#> 25 2019-04-27        3.4.0 osx     1
#> 26 2019-04-27        3.4.1 osx     2
#> 27 2019-04-27        3.4.3 osx     2
#> 28 2019-04-27        3.4.4 osx    60
#> 29 2019-04-27        3.5.0 osx     3
#> 30 2019-04-27        3.5.1 osx     4
#> 31 2019-04-27        3.5.2 osx     5
#> 32 2019-04-27        3.5.3 osx    14
#> 33 2019-04-27        3.6.0 osx   487
#> 34 2019-04-27       latest osx   202
#> 35 2019-04-27        2.1.0 src     1
#> 36 2019-04-27       2.12.1 src     1
#> 37 2019-04-27        2.2.0 src     1
#> 38 2019-04-27        2.6.0 src     1
#> 39 2019-04-27        3.0.0 src     1
#> 40 2019-04-27        3.0.1 src     1
#> 41 2019-04-27        3.0.3 src     6
#> 42 2019-04-27        3.2.0 src     1
#> 43 2019-04-27        3.2.2 src     1
#> 44 2019-04-27        3.2.3 src     2
#> 45 2019-04-27        3.2.4 src     1
#> 46 2019-04-27        3.3.0 src     1
#> 47 2019-04-27        3.4.0 src     2
#> 48 2019-04-27        3.4.1 src     4
#> 49 2019-04-27        3.4.2 src     2
#> 50 2019-04-27        3.4.4 src     3
#> 51 2019-04-27        3.5.0 src     1
#> 52 2019-04-27        3.5.1 src     8
#> 53 2019-04-27        3.5.2 src     2
#> 54 2019-04-27        3.5.3 src     8
#> 55 2019-04-27        3.6.0 src    52
#> 56 2019-04-27       latest src     2
#> 57 2019-04-27       2.13.0 win     1
#> 58 2019-04-27       2.13.2 win     1
#> 59 2019-04-27       2.14.0 win     1
#> 60 2019-04-27       2.14.1 win     1
#> 61 2019-04-27        3.0.1 win     1
#> 62 2019-04-27        3.2.1 win     4
#> 63 2019-04-27        3.2.3 win     1
#> 64 2019-04-27        3.2.5 win    11
#> 65 2019-04-27        3.3.0 win     9
#> 66 2019-04-27        3.3.1 win     2
#> 67 2019-04-27        3.3.3 win    19
#> 68 2019-04-27        3.4.1 win     2
#> 69 2019-04-27        3.4.3 win    10
#> 70 2019-04-27        3.4.4 win    22
#> 71 2019-04-27        3.5.0 win     8
#> 72 2019-04-27        3.5.1 win     8
#> 73 2019-04-27        3.5.2 win     8
#> 74 2019-04-27        3.5.3 win   140
#> 75 2019-04-27 3.5.3patched win   119
#> 76 2019-04-27        3.6.0 win  2178
#> 77 2019-04-27 3.6.0patched win    83
#> 78 2019-04-27        devel win   134
```

## Top downloaded packages

Last day for which data is available:


```r
cran_top_downloads()
```

```
#>    rank              package count       from         to
#> 1     1             devtools 30485 2019-04-27 2019-04-27
#> 2     2       microbenchmark 19588 2019-04-27 2019-04-27
#> 3     3                dplyr 19318 2019-04-27 2019-04-27
#> 4     4       assertive.base 19216 2019-04-27 2019-04-27
#> 5     5 assertive.reflection 19210 2019-04-27 2019-04-27
#> 6     6             fortunes 19204 2019-04-27 2019-04-27
#> 7     7          googledrive 19171 2019-04-27 2019-04-27
#> 8     8                rlang 18953 2019-04-27 2019-04-27
#> 9     9                 Rcpp 17224 2019-04-27 2019-04-27
#> 10   10              ggplot2 16977 2019-04-27 2019-04-27
```

Last week (6 days prior to the last day for which data is available):


```r
cran_top_downloads("last-week")
```

```
#>    rank    package  count       from         to
#> 1     1   devtools 234247 2019-04-21 2019-04-27
#> 2     2      rlang 210403 2019-04-21 2019-04-27
#> 3     3      dplyr 193425 2019-04-21 2019-04-27
#> 4     4       Rcpp 191614 2019-04-21 2019-04-27
#> 5     5    ggplot2 176468 2019-04-21 2019-04-27
#> 6     6     tibble 173132 2019-04-21 2019-04-27
#> 7     7 data.table 149969 2019-04-21 2019-04-27
#> 8     8       glue 141711 2019-04-21 2019-04-27
#> 9     9        cli 140817 2019-04-21 2019-04-27
#> 10   10     pillar 140412 2019-04-21 2019-04-27
```

## Raw JSON API

See [the GitHub repo of the API of the CRAN downloads
  database](https://github.com/r-hub/cranlogs.app).
