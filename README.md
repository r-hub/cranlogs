
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cranlogs <a href='https://r-hub.github.io/cranlogs'><img src='man/figures/logo.png' align="right" height="138.5" /></a>

> Download logs from the RStudio CRAN mirror

<!-- badges: start -->

[![Linux Build
Status](https://travis-ci.org/r-hub/cranlogs.svg?branch=master)](https://travis-ci.org/r-hub/cranlogs)
[![Windows Build
status](https://ci.appveyor.com/api/projects/status/github/metacran/cranlogs?svg=true)](https://ci.appveyor.com/project/gaborcsardi/cranlogs)
[![CRAN
version](http://www.r-pkg.org/badges/version/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)
[![cran
checks](https://cranchecks.info/badges/worst/cranlogs)](https://cranchecks.info/pkgs/cranlogs)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Gitter
chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/r-hub/community)
<!-- badges: end -->

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
    #> 1 2019-06-03 2984098

The last week (6 days prior to the last day for which data is
available), or the last month (29 days prior to the last day for which
data is available) can be also easily queried:

``` r
cran_downloads(when = "last-week")
```

    #>         date   count
    #> 1 2019-05-28 3357745
    #> 2 2019-05-29 3402931
    #> 3 2019-05-30 2850552
    #> 4 2019-05-31 2679422
    #> 5 2019-06-01 1521284
    #> 6 2019-06-02 1430552
    #> 7 2019-06-03 2984098

The `package` argument queries a specific package:

``` r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

    #>          date count  package
    #> 1  2019-05-28 22077 magrittr
    #> 2  2019-05-29 22338 magrittr
    #> 3  2019-05-30 19090 magrittr
    #> 4  2019-05-31 17059 magrittr
    #> 5  2019-06-01  8970 magrittr
    #> 6  2019-06-02  8732 magrittr
    #> 7  2019-06-03 20478 magrittr
    #> 8  2019-05-28 37569    dplyr
    #> 9  2019-05-29 36296    dplyr
    #> 10 2019-05-30 32649    dplyr
    #> 11 2019-05-31 29470    dplyr
    #> 12 2019-06-01 18458    dplyr
    #> 13 2019-06-02 18414    dplyr
    #> 14 2019-06-03 35872    dplyr

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
    #> 1  2019-06-03       2.11.0 osx     1
    #> 2  2019-06-03       2.12.2 osx     1
    #> 3  2019-06-03       2.13.1 osx     1
    #> 4  2019-06-03       2.13.2 osx     4
    #> 5  2019-06-03       2.15.1 osx     1
    #> 6  2019-06-03        3.0.1 osx     1
    #> 7  2019-06-03        3.0.2 osx     1
    #> 8  2019-06-03        3.0.3 osx     1
    #> 9  2019-06-03        3.1.1 osx     1
    #> 10 2019-06-03        3.2.0 osx     1
    #> 11 2019-06-03        3.2.1 osx     4
    #> 12 2019-06-03        3.2.4 osx     1
    #> 13 2019-06-03        3.3.0 osx     1
    #> 14 2019-06-03        3.3.2 osx     1
    #> 15 2019-06-03        3.3.3 osx    63
    #> 16 2019-06-03        3.4.0 osx     1
    #> 17 2019-06-03        3.4.1 osx     2
    #> 18 2019-06-03        3.4.3 osx     1
    #> 19 2019-06-03        3.4.4 osx    39
    #> 20 2019-06-03        3.5.0 osx     3
    #> 21 2019-06-03        3.5.1 osx     3
    #> 22 2019-06-03        3.5.2 osx     8
    #> 23 2019-06-03        3.5.3 osx    67
    #> 24 2019-06-03        3.6.0 osx   601
    #> 25 2019-06-03       latest osx   378
    #> 26 2019-06-03       2.12.0 src     1
    #> 27 2019-06-03       2.15.0 src     2
    #> 28 2019-06-03        3.1.2 src     2
    #> 29 2019-06-03        3.1.3 src     1
    #> 30 2019-06-03        3.2.1 src     2
    #> 31 2019-06-03        3.2.5 src     1
    #> 32 2019-06-03        3.3.0 src     2
    #> 33 2019-06-03        3.3.2 src     1
    #> 34 2019-06-03        3.3.3 src     2
    #> 35 2019-06-03        3.4.0 src     1
    #> 36 2019-06-03        3.4.1 src     8
    #> 37 2019-06-03        3.4.2 src     9
    #> 38 2019-06-03        3.4.3 src     1
    #> 39 2019-06-03        3.4.4 src     2
    #> 40 2019-06-03        3.5.0 src     6
    #> 41 2019-06-03        3.5.1 src    33
    #> 42 2019-06-03        3.5.2 src     6
    #> 43 2019-06-03        3.5.3 src     7
    #> 44 2019-06-03        3.6.0 src    96
    #> 45 2019-06-03       2.13.2 win     1
    #> 46 2019-06-03        3.2.1 win     3
    #> 47 2019-06-03        3.2.5 win     3
    #> 48 2019-06-03        3.3.0 win     1
    #> 49 2019-06-03        3.3.1 win     1
    #> 50 2019-06-03        3.3.2 win     1
    #> 51 2019-06-03        3.3.3 win    55
    #> 52 2019-06-03        3.4.0 win     1
    #> 53 2019-06-03        3.4.2 win     2
    #> 54 2019-06-03        3.4.3 win    13
    #> 55 2019-06-03        3.4.4 win    22
    #> 56 2019-06-03        3.5.0 win     3
    #> 57 2019-06-03        3.5.1 win     2
    #> 58 2019-06-03        3.5.2 win     4
    #> 59 2019-06-03        3.5.3 win    99
    #> 60 2019-06-03        3.6.0 win  3281
    #> 61 2019-06-03 3.6.0patched win   355
    #> 62 2019-06-03        devel win   126

## Top downloaded packages

Last day for which data is available:

``` r
cran_top_downloads()
```

    #>    rank    package count       from         to
    #> 1     1     tibble 39389 2019-06-03 2019-06-03
    #> 2     2      dplyr 35872 2019-06-03 2019-06-03
    #> 3     3       Rcpp 35770 2019-06-03 2019-06-03
    #> 4     4      rlang 34822 2019-06-03 2019-06-03
    #> 5     5       glue 31795 2019-06-03 2019-06-03
    #> 6     6     pillar 29322 2019-06-03 2019-06-03
    #> 7     7 assertthat 29016 2019-06-03 2019-06-03
    #> 8     8    ggplot2 28970 2019-06-03 2019-06-03
    #> 9     9         R6 27613 2019-06-03 2019-06-03
    #> 10   10     digest 27229 2019-06-03 2019-06-03

Last week (6 days prior to the last day for which data is available):

``` r
cran_top_downloads("last-week")
```

    #>    rank    package  count       from         to
    #> 1     1     tibble 219807 2019-05-28 2019-06-03
    #> 2     2      dplyr 208728 2019-05-28 2019-06-03
    #> 3     3       Rcpp 207477 2019-05-28 2019-06-03
    #> 4     4      rlang 203337 2019-05-28 2019-06-03
    #> 5     5       glue 185937 2019-05-28 2019-06-03
    #> 6     6     pillar 181062 2019-05-28 2019-06-03
    #> 7     7    ggplot2 170697 2019-05-28 2019-06-03
    #> 8     8 assertthat 168843 2019-05-28 2019-06-03
    #> 9     9         R6 161778 2019-05-28 2019-06-03
    #> 10   10     digest 160828 2019-05-28 2019-06-03

## Raw JSON API

See [the GitHub repo of the API of the CRAN downloads
database](https://github.com/r-hub/cranlogs.app).
