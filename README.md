
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cranlogs <a href='https://r-hub.github.io/cranlogs'><img src='man/figures/logo.png' align="right" height="138.5" /></a>

> Download logs from the RStudio CRAN mirror

<!-- badges: start -->

[![R build
status](https://github.com/r-hub/cranlogs/workflows/rworkflows/badge.svg)](https://github.com/r-hub/cranlogs/actions)
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

This R package queries a [web API maintained by
R-hub](https://github.com/r-hub/cranlogs.app#the-api-of-the-cran-downloads-database)
serving a database, also maintained by R-hub, that contains the daily
download numbers for each package.

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
    #> 1 2022-12-18 2996182

The last week (6 days prior to the last day for which data is
available), or the last month (29 days prior to the last day for which
data is available) can be also easily queried:

``` r
cran_downloads(when = "last-week")
```

    #>         date   count
    #> 1 2022-12-12 6056710
    #> 2 2022-12-13 6337076
    #> 3 2022-12-14 6073282
    #> 4 2022-12-15 5799764
    #> 5 2022-12-16 5442572
    #> 6 2022-12-17 3125759
    #> 7 2022-12-18 2996182

The `package` argument queries a specific package:

``` r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

    #>          date count  package
    #> 1  2022-12-12 36410 magrittr
    #> 2  2022-12-13 40604 magrittr
    #> 3  2022-12-14 36484 magrittr
    #> 4  2022-12-15 33027 magrittr
    #> 5  2022-12-16 29838 magrittr
    #> 6  2022-12-17 19336 magrittr
    #> 7  2022-12-18 18437 magrittr
    #> 8  2022-12-12 67459    dplyr
    #> 9  2022-12-13 65243    dplyr
    #> 10 2022-12-14 83682    dplyr
    #> 11 2022-12-15 64705    dplyr
    #> 12 2022-12-16 67751    dplyr
    #> 13 2022-12-17 33317    dplyr
    #> 14 2022-12-18 31816    dplyr

Alternative intervals can also be specified:

``` r
cran_downloads(package = "plyr", from = "2014-01-01", to = "2014-02-01")
```

    #>          date count package
    #> 1  2014-01-01   292    plyr
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
    #> 1  2022-12-18       2.10.1 osx     1
    #> 2  2022-12-18       2.11.0 osx     1
    #> 3  2022-12-18       2.11.1 osx     1
    #> 4  2022-12-18       2.12.1 osx     1
    #> 5  2022-12-18       2.13.1 osx     3
    #> 6  2022-12-18       2.14.1 osx     1
    #> 7  2022-12-18       2.15.1 osx     1
    #> 8  2022-12-18        3.2.1 osx     4
    #> 9  2022-12-18        3.2.4 osx     2
    #> 10 2022-12-18        3.3.1 osx     1
    #> 11 2022-12-18        3.3.2 osx     1
    #> 12 2022-12-18        3.3.3 osx    32
    #> 13 2022-12-18        3.4.4 osx     4
    #> 14 2022-12-18        3.5.3 osx     4
    #> 15 2022-12-18        3.6.1 osx     1
    #> 16 2022-12-18        3.6.2 osx     1
    #> 17 2022-12-18        3.6.3 osx    50
    #> 18 2022-12-18     3.6.3.nn osx    33
    #> 19 2022-12-18        4.0.2 osx     6
    #> 20 2022-12-18        4.0.4 osx     2
    #> 21 2022-12-18        4.0.5 osx     6
    #> 22 2022-12-18        4.1.0 osx     4
    #> 23 2022-12-18        4.1.1 osx    64
    #> 24 2022-12-18        4.1.2 osx  1179
    #> 25 2022-12-18        4.1.3 osx   715
    #> 26 2022-12-18        4.2.0 osx     3
    #> 27 2022-12-18        4.2.1 osx    19
    #> 28 2022-12-18        4.2.2 osx  4898
    #> 29 2022-12-18       latest osx     1
    #> 30 2022-12-18      release osx     9
    #> 31 2022-12-18       2.12.2 src     1
    #> 32 2022-12-18        2.3.0 src     1
    #> 33 2022-12-18        2.7.0 src     1
    #> 34 2022-12-18        3.1.3 src     1
    #> 35 2022-12-18        3.2.4 src     1
    #> 36 2022-12-18        3.2.5 src     1
    #> 37 2022-12-18        3.3.0 src     1
    #> 38 2022-12-18        3.4.0 src     1
    #> 39 2022-12-18        3.4.1 src     1
    #> 40 2022-12-18        3.4.2 src     1
    #> 41 2022-12-18        3.5.2 src     4
    #> 42 2022-12-18        3.5.3 src     3
    #> 43 2022-12-18        3.6.3 src     4
    #> 44 2022-12-18        4.0.0 src     2
    #> 45 2022-12-18        4.0.1 src     1
    #> 46 2022-12-18        4.0.2 src     1
    #> 47 2022-12-18        4.1.1 src     5
    #> 48 2022-12-18        4.1.2 src     4
    #> 49 2022-12-18        4.1.3 src     6
    #> 50 2022-12-18        4.2.0 src    15
    #> 51 2022-12-18        4.2.1 src     8
    #> 52 2022-12-18        4.2.2 src   330
    #> 53 2022-12-18       latest src     1
    #> 54 2022-12-18        3.4.1 win     1
    #> 55 2022-12-18        3.4.2 win     1
    #> 56 2022-12-18        3.4.3 win     2
    #> 57 2022-12-18        3.4.4 win     2
    #> 58 2022-12-18        3.5.3 win     2
    #> 59 2022-12-18        3.6.0 win     3
    #> 60 2022-12-18        3.6.1 win     4
    #> 61 2022-12-18        3.6.2 win     1
    #> 62 2022-12-18        3.6.3 win   122
    #> 63 2022-12-18        4.0.0 win     3
    #> 64 2022-12-18        4.0.1 win     1
    #> 65 2022-12-18        4.0.2 win     3
    #> 66 2022-12-18        4.0.3 win    35
    #> 67 2022-12-18        4.0.4 win     3
    #> 68 2022-12-18        4.0.5 win     9
    #> 69 2022-12-18        4.1.0 win     9
    #> 70 2022-12-18        4.1.1 win     5
    #> 71 2022-12-18        4.1.2 win     4
    #> 72 2022-12-18        4.1.3 win   831
    #> 73 2022-12-18        4.2.0 win    27
    #> 74 2022-12-18        4.2.1 win    16
    #> 75 2022-12-18        4.2.2 win 47464
    #> 76 2022-12-18 4.2.2patched win    17
    #> 77 2022-12-18        devel win   798
    #> 78 2022-12-18  patched.exe win     1

## Top downloaded packages

Last day for which data is available:

``` r
cran_top_downloads()
```

    #>    rank     package count       from         to
    #> 1     1     ggplot2 61663 2022-12-18 2022-12-18
    #> 2     2         cli 51625 2022-12-18 2022-12-18
    #> 3     3        ragg 48820 2022-12-18 2022-12-18
    #> 4     4       rlang 48662 2022-12-18 2022-12-18
    #> 5     5 textshaping 48466 2022-12-18 2022-12-18
    #> 6     6   lifecycle 43302 2022-12-18 2022-12-18
    #> 7     7       vctrs 40830 2022-12-18 2022-12-18
    #> 8     8    devtools 38367 2022-12-18 2022-12-18
    #> 9     9          sf 36230 2022-12-18 2022-12-18
    #> 10   10       rgeos 34583 2022-12-18 2022-12-18

Last week (6 days prior to the last day for which data is available):

``` r
cran_top_downloads("last-week")
```

    #>    rank     package  count       from         to
    #> 1     1         cli 604923 2022-12-12 2022-12-18
    #> 2     2       rlang 597346 2022-12-12 2022-12-18
    #> 3     3     ggplot2 559945 2022-12-12 2022-12-18
    #> 4     4   lifecycle 524145 2022-12-12 2022-12-18
    #> 5     5       vctrs 502146 2022-12-12 2022-12-18
    #> 6     6       dplyr 413973 2022-12-12 2022-12-18
    #> 7     7        ragg 371705 2022-12-12 2022-12-18
    #> 8     8 textshaping 365632 2022-12-12 2022-12-18
    #> 9     9      pillar 312270 2022-12-12 2022-12-18
    #> 10   10    devtools 305118 2022-12-12 2022-12-18

## Raw JSON API

See [the GitHub repo of the API of the CRAN downloads
database](https://github.com/r-hub/cranlogs.app).
