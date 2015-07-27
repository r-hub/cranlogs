


# Download logs from the RStudio CRAN mirror

[![Linux Build Status](https://travis-ci.org/metacran/cranlogs.svg?branch=master)](https://travis-ci.org/metacran/cranlogs)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/metacran/cranlogs?svg=true)](https://ci.appveyor.com/project/gaborcsardi/cranlogs)
[![CRAN version](http://www.r-pkg.org/badges/version/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/cranlogs)](http://www.r-pkg.org/pkg/cranlogs)

[RStudio](http://www.rstudio.com) publishes the download logs from
their CRAN package mirror daily at http://cran-logs.rstudio.com.

This R package queries a database that contains the daily download
numbers for each package.

## Installation

You can install `cranlogs` from Github:


```r
library(devtools)
install_github("metacran/cranlogs")
```

## Usage

It has a very simple API. By default it shows the total number of
package downloads from the previous day.


```r
library(cranlogs)
cran_downloads()
```

```
#>         date  count
#> 1 2015-07-25 274520
```

The last week, or the last month can be also easily queried:


```r
cran_downloads(when = "last-week")
```

```
#>         date  count
#> 1 2015-07-19 229277
#> 2 2015-07-20 393883
#> 3 2015-07-21 377063
#> 4 2015-07-22 342425
#> 5 2015-07-23 346116
#> 6 2015-07-24 383373
#> 7 2015-07-25 274520
```

The `package` argument queries a specific package:


```r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

```
#>          date count  package
#> 1  2015-07-19  2230 magrittr
#> 2  2015-07-20  4019 magrittr
#> 3  2015-07-21  4146 magrittr
#> 4  2015-07-22  3865 magrittr
#> 5  2015-07-23  3908 magrittr
#> 6  2015-07-24  4065 magrittr
#> 7  2015-07-25  2329 magrittr
#> 8  2015-07-19  1058    dplyr
#> 9  2015-07-20  2107    dplyr
#> 10 2015-07-21  2137    dplyr
#> 11 2015-07-22  1904    dplyr
#> 12 2015-07-23  1931    dplyr
#> 13 2015-07-24  1814    dplyr
#> 14 2015-07-25  1068    dplyr
```

Alternative intervals can also be specified:


```r
cran_downloads(package = "plyr", from = "2014-01-01", to = "2014-02-01")
```

```
#>          date count package
#> 32 2014-01-01     0    plyr
#> 1  2014-01-02   604    plyr
#> 2  2014-01-03   637    plyr
#> 3  2014-01-04   403    plyr
#> 4  2014-01-05   430    plyr
#> 5  2014-01-06   870    plyr
#> 6  2014-01-07  1044    plyr
#> 7  2014-01-08  1158    plyr
#> 8  2014-01-09  1178    plyr
#> 9  2014-01-10  1092    plyr
#> 10 2014-01-11   489    plyr
#> 11 2014-01-12   560    plyr
#> 12 2014-01-13  1274    plyr
#> 13 2014-01-14  1323    plyr
#> 14 2014-01-15  1434    plyr
#> 15 2014-01-16  1379    plyr
#> 16 2014-01-17  1094    plyr
#> 17 2014-01-18   541    plyr
#> 18 2014-01-19   564    plyr
#> 19 2014-01-20  1206    plyr
#> 20 2014-01-21  1474    plyr
#> 21 2014-01-22  1572    plyr
#> 22 2014-01-23  1556    plyr
#> 23 2014-01-24  1541    plyr
#> 24 2014-01-25   766    plyr
#> 25 2014-01-26   823    plyr
#> 26 2014-01-27  1536    plyr
#> 27 2014-01-28  1551    plyr
#> 28 2014-01-29  1558    plyr
#> 29 2014-01-30  1535    plyr
#> 30 2014-01-31  1181    plyr
#> 31 2014-02-01   662    plyr
```

For downloads of R itself, give `"R"` instead of a package:


```r
cran_downloads("R")
```

```
#>          date version  os count
#> 1  2015-07-25  2.13.0 osx     1
#> 2  2015-07-25  2.14.2 osx     1
#> 3  2015-07-25  2.15.2 osx     1
#> 4  2015-07-25  2.15.3 osx     1
#> 5  2015-07-25   3.0.0 osx     1
#> 6  2015-07-25   3.1.0 osx     1
#> 7  2015-07-25   3.2.0 osx     1
#> 8  2015-07-25   3.2.1 osx   115
#> 9  2015-07-25  latest osx     4
#> 10 2015-07-25  2.11.1 src     1
#> 11 2015-07-25  2.12.1 src     1
#> 12 2015-07-25   2.2.1 src     1
#> 13 2015-07-25   3.0.2 src    59
#> 14 2015-07-25   3.0.3 src     1
#> 15 2015-07-25   3.1.0 src    47
#> 16 2015-07-25   3.1.1 src     9
#> 17 2015-07-25   3.1.2 src    67
#> 18 2015-07-25   3.2.0 src    54
#> 19 2015-07-25   3.2.1 src   115
#> 20 2015-07-25  2.14.1 win    56
#> 21 2015-07-25  2.15.2 win     1
#> 22 2015-07-25  2.15.3 win     1
#> 23 2015-07-25   2.6.0 win     1
#> 24 2015-07-25   3.0.2 win     1
#> 25 2015-07-25   3.1.1 win    58
#> 26 2015-07-25   3.1.2 win     1
#> 27 2015-07-25   3.1.3 win     2
#> 28 2015-07-25   3.2.0 win   163
#> 29 2015-07-25   3.2.1 win   780
```

## Top downloaded packages

Last day:


```r
cran_top_downloads()
```

```
#>    rank  package count       from         to
#> 1     1     Rcpp  3778 2015-07-25 2015-07-25
#> 2     2     plyr  2730 2015-07-25 2015-07-25
#> 3     3  stringi  2722 2015-07-25 2015-07-25
#> 4     4  ggplot2  2702 2015-07-25 2015-07-25
#> 5     5  stringr  2522 2015-07-25 2015-07-25
#> 6     6 reshape2  2338 2015-07-25 2015-07-25
#> 7     7 magrittr  2329 2015-07-25 2015-07-25
#> 8     8   scales  2235 2015-07-25 2015-07-25
#> 9     9    RCurl  2235 2015-07-25 2015-07-25
#> 10   10   digest  2160 2015-07-25 2015-07-25
```

Last week:


```r
cran_top_downloads("last-week")
```

```
#>    rank  package count       from         to
#> 1     1     Rcpp 29526 2015-07-19 2015-07-25
#> 2     2     plyr 29401 2015-07-19 2015-07-25
#> 3     3  stringi 29257 2015-07-19 2015-07-25
#> 4     4  ggplot2 28779 2015-07-19 2015-07-25
#> 5     5  stringr 27328 2015-07-19 2015-07-25
#> 6     6 magrittr 24562 2015-07-19 2015-07-25
#> 7     7 reshape2 24384 2015-07-19 2015-07-25
#> 8     8   scales 23419 2015-07-19 2015-07-25
#> 9     9   digest 23176 2015-07-19 2015-07-25
#> 10   10    RCurl 21360 2015-07-19 2015-07-25
```

## Raw JSON API

See [here](https://github.com/metacran/cranlogs.app).
