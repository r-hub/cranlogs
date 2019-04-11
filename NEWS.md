# cranlogs 2.1.1

* Update the definition of the argument values "last-day", "last-week" and "last-month" to make them consistent with the database: "last-day" is the last day for which data is available, "last-week" 6 days prior to that last day with data, "last-month" 29 days prior to that last day with data.

* Drop row names after reordering which avoids having meaningless row names (@patperry, #23)

* Fix R download counts if a day is missing data (e.g. 2015-08-23).

# cranlogs 2.1.0

* Query downloads of R: `cran_downloads("R")`.

# cranlogs 2.0.0

* First release on CRAN.
* Queries return data frames.

# cranlogs 1.0.0

* First public release.
