


# Download logs from the RStudio CRAN mirror

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
#>   '/private/var/folders/ws/7rmdm_cn2pd8l1c3lqyycv0c0000gn/T/Rtmp3q7C6N/devtools4bd674d7d759/metacran-cranlogs-b7335a7'  \
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
#> $downloads
#>          day downloads
#> 1 2014-10-29    224093
#> 
#> $start
#> [1] "2014-10-29"
#> 
#> $end
#> [1] "2014-10-29"
#> 
#> attr(,"class")
#> [1] "cranlogs"
```

The last week, or the last month can be also easily queried:


```r
cran_downloads(when = "last-week")
```

```
#> $downloads
#>          day downloads
#> 1 2014-10-23    219635
#> 2 2014-10-24    230757
#> 3 2014-10-25    169231
#> 4 2014-10-26    138603
#> 5 2014-10-27    220410
#> 6 2014-10-28    211953
#> 7 2014-10-29    224093
#> 
#> $start
#> [1] "2014-10-23"
#> 
#> $end
#> [1] "2014-10-29"
#> 
#> attr(,"class")
#> [1] "cranlogs"
```

The `package` argument queries a specific package:


```r
cran_downloads(when = "last-week", package = "magrittr")
```

```
#> $downloads
#>          day downloads
#> 1 2014-10-23       645
#> 2 2014-10-24       551
#> 3 2014-10-25       293
#> 4 2014-10-26       467
#> 5 2014-10-27       644
#> 6 2014-10-28       656
#> 7 2014-10-29       665
#> 
#> $start
#> [1] "2014-10-23"
#> 
#> $end
#> [1] "2014-10-29"
#> 
#> $package
#> [1] "magrittr"
#> 
#> attr(,"class")
#> [1] "cranlogs"
```

Alternative intervals can also be specified:


```r
cran_downloads(package = "plyr", from = "2014-01-01", to = "2014-02-01")
```

```
#> $downloads
#>           day downloads
#> 1  2014-01-02       604
#> 2  2014-01-03       637
#> 3  2014-01-04       403
#> 4  2014-01-05       430
#> 5  2014-01-06       870
#> 6  2014-01-07      1044
#> 7  2014-01-08      1158
#> 8  2014-01-09      1178
#> 9  2014-01-10      1092
#> 10 2014-01-11       489
#> 11 2014-01-12       560
#> 12 2014-01-13      1274
#> 13 2014-01-14      1323
#> 14 2014-01-15      1434
#> 15 2014-01-16      1379
#> 16 2014-01-17      1094
#> 17 2014-01-18       541
#> 18 2014-01-19       564
#> 19 2014-01-20      1206
#> 20 2014-01-21      1474
#> 21 2014-01-22      1572
#> 22 2014-01-23      1556
#> 23 2014-01-24      1541
#> 24 2014-01-25       766
#> 25 2014-01-26       823
#> 26 2014-01-27      1536
#> 27 2014-01-28      1551
#> 28 2014-01-29      1558
#> 29 2014-01-30      1535
#> 30 2014-01-31      1181
#> 31 2014-02-01       662
#> 
#> $start
#> [1] "2014-01-01"
#> 
#> $end
#> [1] "2014-02-01"
#> 
#> $package
#> [1] "plyr"
#> 
#> attr(,"class")
#> [1] "cranlogs"
```

## Raw JSON API

See [here](https://github.com/metacran/cranlogs.app).
