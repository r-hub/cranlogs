
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
    #> 1 2019-04-15 3120190

The last week (6 days prior to the last day for which data is
available), or the last month (29 days prior to the last day for which
data is available) can be also easily queried:

``` r
cran_downloads(when = "last-week")
```

    #>         date   count
    #> 1 2019-04-09 3509140
    #> 2 2019-04-10 3592299
    #> 3 2019-04-11 3279415
    #> 4 2019-04-12 2958889
    #> 5 2019-04-13 1610975
    #> 6 2019-04-14 1603488
    #> 7 2019-04-15 3120190

The `package` argument queries a specific package:

``` r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

    #>          date count  package
    #> 1  2019-04-09 24774 magrittr
    #> 2  2019-04-10 25623 magrittr
    #> 3  2019-04-11 23260 magrittr
    #> 4  2019-04-12 19542 magrittr
    #> 5  2019-04-13  9747 magrittr
    #> 6  2019-04-14  9154 magrittr
    #> 7  2019-04-15 20447 magrittr
    #> 8  2019-04-09 34267    dplyr
    #> 9  2019-04-10 34473    dplyr
    #> 10 2019-04-11 33077    dplyr
    #> 11 2019-04-12 28859    dplyr
    #> 12 2019-04-13 16565    dplyr
    #> 13 2019-04-14 16497    dplyr
    #> 14 2019-04-15 31009    dplyr

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
    #> 1  2019-04-15       2.12.2 osx     1
    #> 2  2019-04-15       2.13.0 osx     1
    #> 3  2019-04-15       2.13.2 osx     1
    #> 4  2019-04-15       2.15.1 osx     2
    #> 5  2019-04-15        3.1.3 osx     1
    #> 6  2019-04-15        3.2.1 osx     5
    #> 7  2019-04-15        3.2.4 osx     3
    #> 8  2019-04-15        3.3.0 osx     1
    #> 9  2019-04-15        3.3.2 osx     1
    #> 10 2019-04-15        3.3.3 osx    43
    #> 11 2019-04-15        3.4.0 osx     1
    #> 12 2019-04-15        3.4.1 osx     1
    #> 13 2019-04-15        3.4.2 osx     2
    #> 14 2019-04-15        3.4.3 osx     4
    #> 15 2019-04-15        3.4.4 osx    32
    #> 16 2019-04-15        3.5.0 osx     4
    #> 17 2019-04-15        3.5.2 osx    12
    #> 18 2019-04-15        3.5.3 osx   731
    #> 19 2019-04-15       latest osx   218
    #> 20 2019-04-15       2.11.0 src     3
    #> 21 2019-04-15       2.15.0 src     2
    #> 22 2019-04-15        3.1.0 src     1
    #> 23 2019-04-15        3.1.1 src    20
    #> 24 2019-04-15        3.2.0 src     2
    #> 25 2019-04-15        3.2.1 src     4
    #> 26 2019-04-15        3.2.2 src     5
    #> 27 2019-04-15        3.2.3 src     2
    #> 28 2019-04-15        3.2.4 src     3
    #> 29 2019-04-15        3.2.5 src     2
    #> 30 2019-04-15        3.3.0 src     3
    #> 31 2019-04-15        3.3.1 src     2
    #> 32 2019-04-15        3.3.2 src     1
    #> 33 2019-04-15        3.3.3 src     2
    #> 34 2019-04-15        3.4.0 src     2
    #> 35 2019-04-15        3.4.1 src    12
    #> 36 2019-04-15        3.4.3 src     2
    #> 37 2019-04-15        3.4.4 src     1
    #> 38 2019-04-15        3.5.0 src     1
    #> 39 2019-04-15        3.5.1 src    20
    #> 40 2019-04-15        3.5.2 src     2
    #> 41 2019-04-15        3.5.3 src   117
    #> 42 2019-04-15       latest src     3
    #> 43 2019-04-15       2.13.2 win     1
    #> 44 2019-04-15       2.14.2 win     1
    #> 45 2019-04-15        3.0.3 win     1
    #> 46 2019-04-15        3.1.2 win     1
    #> 47 2019-04-15        3.2.0 win     1
    #> 48 2019-04-15        3.2.1 win     1
    #> 49 2019-04-15        3.2.3 win     1
    #> 50 2019-04-15        3.2.5 win     9
    #> 51 2019-04-15        3.3.0 win     3
    #> 52 2019-04-15        3.3.3 win    29
    #> 53 2019-04-15        3.4.0 win     1
    #> 54 2019-04-15        3.4.3 win    21
    #> 55 2019-04-15        3.4.4 win    11
    #> 56 2019-04-15        3.5.0 win     4
    #> 57 2019-04-15        3.5.1 win     7
    #> 58 2019-04-15        3.5.2 win     4
    #> 59 2019-04-15        3.5.3 win  3544
    #> 60 2019-04-15 3.5.3patched win   428
    #> 61 2019-04-15    3.6.0beta win     1
    #> 62 2019-04-15        devel win    54

## Top downloaded packages

Last day for which data is available:

``` r
cran_top_downloads()
```

    #>    rank    package count       from         to
    #> 1     1   devtools 39570 2019-04-15 2019-04-15
    #> 2     2      rlang 38685 2019-04-15 2019-04-15
    #> 3     3       Rcpp 33320 2019-04-15 2019-04-15
    #> 4     4    ggplot2 33177 2019-04-15 2019-04-15
    #> 5     5      dplyr 31009 2019-04-15 2019-04-15
    #> 6     6     tibble 29820 2019-04-15 2019-04-15
    #> 7     7 data.table 28621 2019-04-15 2019-04-15
    #> 8     8       glue 25690 2019-04-15 2019-04-15
    #> 9     9        cli 25193 2019-04-15 2019-04-15
    #> 10   10     pillar 24661 2019-04-15 2019-04-15

Last week (6 days prior to the last day for which data is available):

``` r
cran_top_downloads("last-week")
```

    #>    rank    package  count       from         to
    #> 1     1      rlang 250673 2019-04-09 2019-04-15
    #> 2     2   devtools 222307 2019-04-09 2019-04-15
    #> 3     3       Rcpp 216332 2019-04-09 2019-04-15
    #> 4     4    ggplot2 208957 2019-04-09 2019-04-15
    #> 5     5      dplyr 194747 2019-04-09 2019-04-15
    #> 6     6 data.table 187612 2019-04-09 2019-04-15
    #> 7     7     tibble 186619 2019-04-09 2019-04-15
    #> 8     8       glue 164489 2019-04-09 2019-04-15
    #> 9     9        cli 160707 2019-04-09 2019-04-15
    #> 10   10     pillar 154846 2019-04-09 2019-04-15

## Raw JSON API

See [the GitHub repo of the API of the CRAN downloads
database](https://github.com/r-hub/cranlogs.app).
