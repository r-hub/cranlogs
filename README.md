
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Download logs from the RStudio CRAN mirror

[![Linux Build
Status](https://travis-ci.org/r-hub/cranlogs.svg?branch=master)](https://travis-ci.org/r-hub/cranlogs)
[![Windows Build
status](https://ci.appveyor.com/api/projects/status/github/metacran/cranlogs?svg=true)](https://ci.appveyor.com/project/gaborcsardi/cranlogs)
[![CRAN
version](http://www.r-pkg.org/badges/version/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)

[RStudio](http://www.rstudio.com) publishes the download logs from their
CRAN package mirror daily at <http://cran-logs.rstudio.com>.

This R package queries a database that contains the daily download
numbers for each package.

The RStudio CRAN mirror is not the only CRAN mirror, but it’s a popular
one: it’s the default choice for RStudio users. The actual number of
downloads over all CRAN mirrors is unknown.

## Installation

You can install `cranlogs` from CRAN:

``` r
install.packages("cranlogs")
```

Or get the development version from Github:

``` r
# install.packages("remotes")
remotes::install_github("r-hub/cranlogs")
```

## Usage

It has a very simple API. By default it shows the total number of
package downloads from the last day for which data is available.

``` r
library(cranlogs)
cran_downloads()
```

    #>         date   count
    #> 1 2019-04-09 3509140

The last week (6 days prior to the last day for which data is
available), or the last month (29 days prior to the last day for which
data is available) can be also easily queried:

``` r
cran_downloads(when = "last-week")
```

    #>         date   count
    #> 1 2019-04-03 3561940
    #> 2 2019-04-04 3356194
    #> 3 2019-04-05 2916302
    #> 4 2019-04-06 1686660
    #> 5 2019-04-07 1650173
    #> 6 2019-04-08 3369344
    #> 7 2019-04-09 3509140

The `package` argument queries a specific package:

``` r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

    #>          date count  package
    #> 1  2019-04-03 24362 magrittr
    #> 2  2019-04-04 23068 magrittr
    #> 3  2019-04-05 19868 magrittr
    #> 4  2019-04-06  9830 magrittr
    #> 5  2019-04-07  9834 magrittr
    #> 6  2019-04-08 22549 magrittr
    #> 7  2019-04-09 24774 magrittr
    #> 8  2019-04-03 34602    dplyr
    #> 9  2019-04-04 33678    dplyr
    #> 10 2019-04-05 30217    dplyr
    #> 11 2019-04-06 17107    dplyr
    #> 12 2019-04-07 17541    dplyr
    #> 13 2019-04-08 32777    dplyr
    #> 14 2019-04-09 34267    dplyr

Alternative intervals can also be specified:

``` r
cran_downloads(package = "plyr", from = "2014-01-01", to = "2014-02-01")
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

For downloads of R itself, give `"R"` instead of a package:

``` r
cran_downloads("R")
```

    #>          date      version  os count
    #> 1  2019-04-09       latest  NA    10
    #> 2  2019-04-09       2.10.0 osx     3
    #> 3  2019-04-09       2.10.1 osx     4
    #> 4  2019-04-09       2.11.0 osx     4
    #> 5  2019-04-09       2.11.1 osx     3
    #> 6  2019-04-09       2.12.0 osx     4
    #> 7  2019-04-09       2.12.1 osx     4
    #> 8  2019-04-09       2.12.2 osx     3
    #> 9  2019-04-09       2.13.0 osx     3
    #> 10 2019-04-09       2.13.1 osx     2
    #> 11 2019-04-09       2.13.2 osx     1
    #> 12 2019-04-09       2.14.0 osx     1
    #> 13 2019-04-09       2.14.1 osx     2
    #> 14 2019-04-09       2.14.2 osx     2
    #> 15 2019-04-09       2.15.0 osx     2
    #> 16 2019-04-09       2.15.1 osx     4
    #> 17 2019-04-09       2.15.2 osx     3
    #> 18 2019-04-09       2.15.3 osx     3
    #> 19 2019-04-09        3.0.0 osx     4
    #> 20 2019-04-09        3.0.1 osx     3
    #> 21 2019-04-09        3.0.2 osx     2
    #> 22 2019-04-09        3.0.3 osx     2
    #> 23 2019-04-09        3.1.0 osx     6
    #> 24 2019-04-09        3.1.1 osx     2
    #> 25 2019-04-09        3.1.2 osx     5
    #> 26 2019-04-09        3.1.3 osx     4
    #> 27 2019-04-09        3.2.0 osx     2
    #> 28 2019-04-09        3.2.1 osx    12
    #> 29 2019-04-09        3.2.2 osx     2
    #> 30 2019-04-09        3.2.3 osx     1
    #> 31 2019-04-09        3.2.4 osx    18
    #> 32 2019-04-09        3.3.0 osx     1
    #> 33 2019-04-09        3.3.1 osx     2
    #> 34 2019-04-09        3.3.2 osx     2
    #> 35 2019-04-09        3.3.3 osx    58
    #> 36 2019-04-09        3.4.0 osx     7
    #> 37 2019-04-09        3.4.1 osx     5
    #> 38 2019-04-09        3.4.2 osx     2
    #> 39 2019-04-09        3.4.3 osx     3
    #> 40 2019-04-09        3.4.4 osx    77
    #> 41 2019-04-09        3.5.0 osx     3
    #> 42 2019-04-09        3.5.1 osx     5
    #> 43 2019-04-09        3.5.2 osx     8
    #> 44 2019-04-09        3.5.3 osx   732
    #> 45 2019-04-09       latest osx   475
    #> 46 2019-04-09       2.15.0 src     1
    #> 47 2019-04-09       2.15.2 src     2
    #> 48 2019-04-09        3.0.0 src     1
    #> 49 2019-04-09        3.0.3 src     3
    #> 50 2019-04-09        3.2.2 src    13
    #> 51 2019-04-09        3.2.3 src     1
    #> 52 2019-04-09        3.2.5 src     1
    #> 53 2019-04-09        3.3.0 src     1
    #> 54 2019-04-09        3.3.2 src     1
    #> 55 2019-04-09        3.3.3 src    58
    #> 56 2019-04-09        3.4.0 src     2
    #> 57 2019-04-09        3.4.1 src    11
    #> 58 2019-04-09        3.4.2 src     4
    #> 59 2019-04-09        3.4.3 src     4
    #> 60 2019-04-09        3.4.4 src     3
    #> 61 2019-04-09        3.5.0 src     3
    #> 62 2019-04-09        3.5.1 src    30
    #> 63 2019-04-09        3.5.2 src    10
    #> 64 2019-04-09        3.5.3 src   143
    #> 65 2019-04-09       latest src     3
    #> 66 2019-04-09       2.13.1 win     1
    #> 67 2019-04-09       2.13.2 win     1
    #> 68 2019-04-09       2.15.1 win     1
    #> 69 2019-04-09        3.0.0 win     1
    #> 70 2019-04-09        3.0.1 win     1
    #> 71 2019-04-09        3.0.2 win     1
    #> 72 2019-04-09        3.0.3 win     2
    #> 73 2019-04-09        3.1.0 win     3
    #> 74 2019-04-09        3.1.1 win     1
    #> 75 2019-04-09        3.1.3 win     1
    #> 76 2019-04-09        3.2.0 win     1
    #> 77 2019-04-09        3.2.1 win     6
    #> 78 2019-04-09        3.2.5 win     9
    #> 79 2019-04-09        3.3.0 win     2
    #> 80 2019-04-09        3.3.1 win     1
    #> 81 2019-04-09        3.3.2 win     1
    #> 82 2019-04-09        3.3.3 win    41
    #> 83 2019-04-09        3.4.2 win     2
    #> 84 2019-04-09        3.4.3 win    19
    #> 85 2019-04-09        3.4.4 win    46
    #> 86 2019-04-09        3.5.0 win    27
    #> 87 2019-04-09        3.5.1 win     4
    #> 88 2019-04-09        3.5.2 win     1
    #> 89 2019-04-09        3.5.3 win  4168
    #> 90 2019-04-09 3.5.3patched win   464
    #> 91 2019-04-09   3.6.0alpha win     1
    #> 92 2019-04-09        devel win    83

## Top downloaded packages

Last day for which data is available:

``` r
cran_top_downloads()
```

    #>    rank    package count       from         to
    #> 1     1      rlang 48277 2019-04-09 2019-04-09
    #> 2     2       Rcpp 40549 2019-04-09 2019-04-09
    #> 3     3    ggplot2 38956 2019-04-09 2019-04-09
    #> 4     4   devtools 35528 2019-04-09 2019-04-09
    #> 5     5      dplyr 34267 2019-04-09 2019-04-09
    #> 6     6     tibble 34220 2019-04-09 2019-04-09
    #> 7     7 data.table 32990 2019-04-09 2019-04-09
    #> 8     8       glue 30676 2019-04-09 2019-04-09
    #> 9     9        cli 30167 2019-04-09 2019-04-09
    #> 10   10     pillar 28162 2019-04-09 2019-04-09

Last week (6 days prior to the last day for which data is available):

``` r
cran_top_downloads("last-week")
```

    #>    rank    package  count       from         to
    #> 1     1      rlang 280296 2019-04-03 2019-04-09
    #> 2     2       Rcpp 228031 2019-04-03 2019-04-09
    #> 3     3    ggplot2 204579 2019-04-03 2019-04-09
    #> 4     4      dplyr 200189 2019-04-03 2019-04-09
    #> 5     5     tibble 196472 2019-04-03 2019-04-09
    #> 6     6 data.table 186475 2019-04-03 2019-04-09
    #> 7     7       glue 171998 2019-04-03 2019-04-09
    #> 8     8        cli 169534 2019-04-03 2019-04-09
    #> 9     9     pillar 161821 2019-04-03 2019-04-09
    #> 10   10 assertthat 154795 2019-04-03 2019-04-09

## Raw JSON API

See [here](https://github.com/r-hubs/cranlogs.app).
