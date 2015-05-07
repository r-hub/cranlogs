


# Download logs from the RStudio CRAN mirror

[![Linux Build Status](https://travis-ci.org/metacran/cranlogs.svg?branch=master)](https://travis-ci.org/metacran/cranlogs)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/metacran/cranlogs?svg=true)](https://ci.appveyor.com/project/gaborcsardi/cranlogs)

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

```
#> Downloading github repo metacran/cranlogs@master
#> Installing cranlogs
#> '/Library/Frameworks/R.framework/Resources/bin/R' --vanilla CMD INSTALL  \
#>   '/private/var/folders/ws/7rmdm_cn2pd8l1c3lqyycv0c0000gn/T/RtmpjEx0oD/devtools17e7c1e2f982c/metacran-cranlogs-10e40e8'  \
#>   --library='/Library/Frameworks/R.framework/Versions/3.2/Resources/library'  \
#>   --install-tests
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
#> 1 2015-05-06 395385
```

The last week, or the last month can be also easily queried:


```r
cran_downloads(when = "last-week")
```

```
#>         date  count
#> 1 2015-04-30 425306
#> 2 2015-05-01 277160
#> 3 2015-05-02 211458
#> 4 2015-05-03 253502
#> 5 2015-05-04 389516
#> 6 2015-05-05 418476
#> 7 2015-05-06 395385
```

The `package` argument queries a specific package:


```r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

```
#>          date count  package
#> 1  2015-04-30  3793 magrittr
#> 2  2015-05-01  3285 magrittr
#> 3  2015-05-02  2202 magrittr
#> 4  2015-05-03  2637 magrittr
#> 5  2015-05-04  5339 magrittr
#> 6  2015-05-05  6409 magrittr
#> 7  2015-05-06  6938 magrittr
#> 8  2015-04-30  2297    dplyr
#> 9  2015-05-01  1878    dplyr
#> 10 2015-05-02  1017    dplyr
#> 11 2015-05-03  1615    dplyr
#> 12 2015-05-04  2264    dplyr
#> 13 2015-05-05  2397    dplyr
#> 14 2015-05-06  2413    dplyr
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

## Top downloaded packages

Last day:


```r
cran_top_downloads()
```

```
#>    rank      package count       from         to
#> 1     1         Rcpp  8462 2015-05-06 2015-05-06
#> 2     2      stringr  7922 2015-05-06 2015-05-06
#> 3     3     magrittr  6938 2015-05-06 2015-05-06
#> 4     4      stringi  6891 2015-05-06 2015-05-06
#> 5     5      ggplot2  6042 2015-05-06 2015-05-06
#> 6     6         plyr  5654 2015-05-06 2015-05-06
#> 7     7   colorspace  5296 2015-05-06 2015-05-06
#> 8     8       digest  5009 2015-05-06 2015-05-06
#> 9     9     reshape2  4753 2015-05-06 2015-05-06
#> 10   10 RColorBrewer  4278 2015-05-06 2015-05-06
```

Last week:


```r
cran_top_downloads("last-week")
```

```
#>    rank      package count       from         to
#> 1     1         Rcpp 41247 2015-04-30 2015-05-06
#> 2     2      stringr 36792 2015-04-30 2015-05-06
#> 3     3      ggplot2 32756 2015-04-30 2015-05-06
#> 4     4     magrittr 30603 2015-04-30 2015-05-06
#> 5     5         plyr 30370 2015-04-30 2015-05-06
#> 6     6      stringi 29170 2015-04-30 2015-05-06
#> 7     7       digest 25837 2015-04-30 2015-05-06
#> 8     8     reshape2 25101 2015-04-30 2015-05-06
#> 9     9   colorspace 24763 2015-04-30 2015-05-06
#> 10   10 RColorBrewer 22655 2015-04-30 2015-05-06
```

## Raw JSON API

See [here](https://github.com/metacran/cranlogs.app).
