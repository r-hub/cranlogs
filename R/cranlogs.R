
#' Download Logs from the RStudio CRAN Mirror
#'
#' @docType package
#' @name cranlogs
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
NULL

url <- "http://cranlogs.r-pkg.org/downloads/daily/"

#' Daily package downloads from the RStudio CRAN mirror
#'
#' @param package A package to query, or \code{NULL} for a sum of
#'   downloads for all packages.
#' @param when \code{last_day}, \code{last_week} or \code{last_month}.
#'   If this is given, then \code{from} and \code{to} are ignored.
#' @param from Start date, in \code{yyyy-mm-dd} format, or
#'   \code{yesterday}. It is ignored if \code{when} is given.
#' @param to End date, in \code{yyyy-mm-dd} format, or
#'   \code{yesterday}. It is ignored if \code{when} is given.
#' @return A list with entries: \itemize{
#'   \item \code{downloads} The downloads, in a two-column data frame:
#'     date and download count.
#'   \item \code{start} Start date.
#'   \item \code{end} End date.
#'   \item \code{package} The queried package. This entry is missing
#'     if the total number of downloads for all packages was queried.
#' }
#'
#' @export
#' @examples
#'
#' ## All downloads yesterday
#' cran_downloads()
#'
#' ## All downloads for 'dplyr' yesterday
#' cran_downloads(package = "dplyr")
#'
#' ## Daily downloads for 'igraph' last week
#' cran_downloads(package = "igraph", when = "last-week")
#'
#' ## Downloads in the specified time interval
#' cran_downloads(from = "2014-06-30", to = "2014-08-08")

cran_downloads <- function(package = NULL,
                           when = c("last-day", "last-week", "last-month"),
                           from = "last-day", to = "last-day") {

  if (!missing(when)) {
    interval <- match.arg(when)
  } else {
    if (from == to) {
      interval <- from
    } else {
      interval <- paste(from, sep = ":", to)
    }
  }

  if (is.null(package)) {
    package <- ""
  } else {
    package <- paste0("/", package)
  }

  r <- fromJSON(content(GET(paste0(url, interval, package)), as = "text"))
  class(r) <- "cranlogs"
  r

}
