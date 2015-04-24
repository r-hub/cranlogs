


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
#>   '/private/var/folders/ws/7rmdm_cn2pd8l1c3lqyycv0c0000gn/T/RtmpAn00D1/devtools1b201eab1f47/metacran-cranlogs-26a0c66'  \
#>   --library='/Library/Frameworks/R.framework/Versions/3.1/Resources/library'  \
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
#> 1 2015-03-10 479895
```

The last week, or the last month can be also easily queried:


```r
cran_downloads(when = "last-week")
```

```
#>         date  count
#> 1 2015-03-04 367826
#> 2 2015-03-05 299499
#> 3 2015-03-06 289606
#> 4 2015-03-07 220802
#> 5 2015-03-08 191514
#> 6 2015-03-09 424308
#> 7 2015-03-10 479895
```

The `package` argument queries a specific package:


```r
cran_downloads(when = "last-week", package = c("magrittr", "dplyr"))
```

```
#>     package       date count
#> 1  magrittr 2015-03-04  1461
#> 2  magrittr 2015-03-05  1446
#> 3  magrittr 2015-03-06  1327
#> 4  magrittr 2015-03-07   842
#> 5  magrittr 2015-03-08   805
#> 6  magrittr 2015-03-09  1477
#> 7  magrittr 2015-03-10  1738
#> 8     dplyr 2015-03-04  2025
#> 9     dplyr 2015-03-05  1997
#> 10    dplyr 2015-03-06  1841
#> 11    dplyr 2015-03-07  1240
#> 12    dplyr 2015-03-08  1304
#> 13    dplyr 2015-03-09  2117
#> 14    dplyr 2015-03-10  2100
```

Alternative intervals can also be specified:


```r
cran_downloads(package = "plyr", from = "2014-01-01", to = "2014-02-01")
```

```
#>    package       date count
#> 1     plyr 2014-01-02   604
#> 2     plyr 2014-01-03   637
#> 3     plyr 2014-01-04   403
#> 4     plyr 2014-01-05   430
#> 5     plyr 2014-01-06   870
#> 6     plyr 2014-01-07  1044
#> 7     plyr 2014-01-08  1158
#> 8     plyr 2014-01-09  1178
#> 9     plyr 2014-01-10  1092
#> 10    plyr 2014-01-11   489
#> 11    plyr 2014-01-12   560
#> 12    plyr 2014-01-13  1274
#> 13    plyr 2014-01-14  1323
#> 14    plyr 2014-01-15  1434
#> 15    plyr 2014-01-16  1379
#> 16    plyr 2014-01-17  1094
#> 17    plyr 2014-01-18   541
#> 18    plyr 2014-01-19   564
#> 19    plyr 2014-01-20  1206
#> 20    plyr 2014-01-21  1474
#> 21    plyr 2014-01-22  1572
#> 22    plyr 2014-01-23  1556
#> 23    plyr 2014-01-24  1541
#> 24    plyr 2014-01-25   766
#> 25    plyr 2014-01-26   823
#> 26    plyr 2014-01-27  1536
#> 27    plyr 2014-01-28  1551
#> 28    plyr 2014-01-29  1558
#> 29    plyr 2014-01-30  1535
#> 30    plyr 2014-01-31  1181
#> 31    plyr 2014-02-01   662
```

## Raw JSON API

See [here](https://github.com/metacran/cranlogs.app).
