
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Download logs from the RStudio CRAN mirror

[![Linux Build
Status](https://travis-ci.org/metacran/cranlogs.svg?branch=master)](https://travis-ci.org/metacran/cranlogs)
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

## Installation

You can install `cranlogs` from Github:

``` r
# install.packages("remotes")
remotes::install_github("metacran/cranlogs")
```

## Usage

It has a very simple API. By default it shows the total number of
package downloads from the previous day.

``` r
library(cranlogs)
cran_downloads()
```

    #>         date count
    #> 1 2019-04-09     0

The last week, or the last month can be also easily queried:

``` r
cran_downloads(when = "last-week")
```

    #>         date   count
    #> 1 2019-04-01 3209146
    #> 2 2019-04-02 3579518
    #> 3 2019-04-03 3561940
    #> 4 2019-04-04 3356194
    #> 5 2019-04-05 2916302
    #> 6 2019-04-06 1686660
    #> 7 2019-04-07 1650173

The `package` argument queries a specific package:

``` r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

    #>          date count  package
    #> 1  2019-04-01 22321 magrittr
    #> 2  2019-04-02 23823 magrittr
    #> 3  2019-04-03 24362 magrittr
    #> 4  2019-04-04 23068 magrittr
    #> 5  2019-04-05 19868 magrittr
    #> 6  2019-04-06  9830 magrittr
    #> 7  2019-04-07  9834 magrittr
    #> 8  2019-04-01 31356    dplyr
    #> 9  2019-04-02 33300    dplyr
    #> 10 2019-04-03 34602    dplyr
    #> 11 2019-04-04 33678    dplyr
    #> 12 2019-04-05 30217    dplyr
    #> 13 2019-04-06 17107    dplyr
    #> 14 2019-04-07 17541    dplyr

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

    #> [1] date    version os      count  
    #> <0 rows> (or 0-length row.names)

## Top downloaded packages

Last day:

``` r
cran_top_downloads()
```

    #> No encoding supplied: defaulting to UTF-8.

    #>    rank    package count       from         to
    #> 1     1      rlang 24883 2019-04-07 2019-04-07
    #> 2     2 data.table 22283 2019-04-07 2019-04-07
    #> 3     3    ggplot2 20784 2019-04-07 2019-04-07
    #> 4     4       Rcpp 17880 2019-04-07 2019-04-07
    #> 5     5      dplyr 17541 2019-04-07 2019-04-07
    #> 6     6     tibble 15560 2019-04-07 2019-04-07
    #> 7     7       glue 13333 2019-04-07 2019-04-07
    #> 8     8   multcomp 13159 2019-04-07 2019-04-07
    #> 9     9        cli 13097 2019-04-07 2019-04-07
    #> 10   10     pillar 13033 2019-04-07 2019-04-07

Last week:

``` r
cran_top_downloads("last-week")
```

    #> No encoding supplied: defaulting to UTF-8.

    #>    rank    package  count       from         to
    #> 1     1      rlang 276709 2019-04-01 2019-04-07
    #> 2     2       Rcpp 229191 2019-04-01 2019-04-07
    #> 3     3      dplyr 197801 2019-04-01 2019-04-07
    #> 4     4     tibble 197027 2019-04-01 2019-04-07
    #> 5     5    ggplot2 184926 2019-04-01 2019-04-07
    #> 6     6       glue 171706 2019-04-01 2019-04-07
    #> 7     7 data.table 170497 2019-04-01 2019-04-07
    #> 8     8        cli 169788 2019-04-01 2019-04-07
    #> 9     9     pillar 161365 2019-04-01 2019-04-07
    #> 10   10 assertthat 154957 2019-04-01 2019-04-07

## Raw JSON API

See [here](https://github.com/metacran/cranlogs.app).
