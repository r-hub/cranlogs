
#' Download Logs from the RStudio CRAN Mirror
#'
#' @docType package
#' @name cranlogs
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
NULL

base_url  <- "http://cranlogs.r-pkg.org/"
daily_url <- paste0(base_url, "downloads/daily/")
top_url   <- paste0(base_url, "top/")

#' Daily package downloads from the RStudio CRAN mirror
#'
#' @param packages A character vector, the packages to query,
#'   or \code{NULL} for a sum of downloads for all packages.
#' @param when \code{last_day}, \code{last_week} or \code{last_month}.
#'   If this is given, then \code{from} and \code{to} are ignored.
#' @param from Start date, in \code{yyyy-mm-dd} format, or
#'   \code{last-day}. It is ignored if \code{when} is given.
#' @param to End date, in \code{yyyy-mm-dd} format, or
#'   \code{last-day}. It is ignored if \code{when} is given.
#' @return A data frame with columns:
#'   \item \code{package} The package. This column is missing if
#'     all packages were queried.
#'   \item \code{date} Day of the downloads, it is a Date object.
#'   \item \code{count} Download count.
#'
#' @family CRAN downloads
#' @export
#' @examples
#'
#' ## All downloads yesterday
#' cran_downloads()
#'
#' ## All downloads for 'dplyr' yesterday
#' cran_downloads(packages = "dplyr")
#'
#' ## Daily downloads for 'igraph' last week
#' cran_downloads(packages = "igraph", when = "last-week")
#'
#' ## Downloads in the specified time interval
#' cran_downloads(from = "2014-06-30", to = "2014-08-08")
#'
#' ## Multiple packages
#' cran_downloads(packages = c("ggplot2", "plyr", "dplyr"))

cran_downloads <- function(packages = NULL,
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

  if (is.null(packages)) {
    packages <- ""
  } else {
    packages <- paste(packages, collapse = ",")
    packages <- paste0("/", packages)
  }

  r <- fromJSON(content(GET(paste0(daily_url, interval, packages)), as = "text"),
                simplifyVector = FALSE)

  if ("error" %in% names(r) && r$error == "Invalid query") {
    stop("Invalid query, probably invalid dates")
  }

  to_df(r)

}

to_df <- function(res) {
  if (length(res) == 1 && is.null(res[[1]]$package)) {
    to_df_1(res[[1]])
  } else {
    dfs <- lapply(res, to_df_1)
    for (i in seq_along(res)) dfs[[i]]$package <- res[[i]]$package
    do.call(rbind, dfs)
  }
}

to_df_1 <- function(res1) {
  df <- data.frame(
    stringsAsFactors = FALSE,
    date = as.Date(vapply(res1$downloads, "[[", "", "day")),
    count = vapply(res1$downloads, "[[", 1, "downloads")
  )
  fill_in_dates(df, as.Date(res1$start), as.Date(res1$end))
}

fill_in_dates <- function(df, start, end) {
  if (start > end) stop("Empty time interval")
  if (end > Sys.Date()) warning("Time interval in the future")

  dates <- seq(start, end, by = as.difftime(1, units = "days"))
  if (any(! dates %in% df$date)) {
    df2 <- data.frame(
      stringsAsFactors = FALSE,
      date = dates[! dates %in% df$date],
      count = 0
    )
    df <- rbind(df, df2)
    df <- df[order(df$date),]
  }
  df
}

#' Top downloaded packages from the RStudio CRAN mirror
#'
#' @param when \code{last_day}, \code{last_week} or \code{last_month}.
#' @return A data frame with columns: \code{rank}, \code{package},
#'   \code{count}, \code{from}, \code{to}.
#'
#' @family CRAN downloads
#' @export
#' @examples
#'
#' ## Default is last day
#' cran_top_downloads()
#'
#' ## Last week instead
#'cran_top_downloads(when = "last-week")

cran_top_downloads <- function(when = c("last-day", "last-week",
                                 "last-month"), count = 10) {

  when <- match.arg(when)
  r <- fromJSON(content(GET(paste0(top_url, when, '/', count)), as = "text"),
                simplifyVector = FALSE)

  df <- data.frame(
    stringsAsFactors = FALSE,
    rank = seq_along(r$downloads),
    package = vapply(r$downloads, "[[", "", "package"),
    count = as.integer(vapply(r$downloads, "[[", "", "downloads")),
    from = as.Date(r$start),
    to = as.Date(r$end)
  )

  if (nrow(df) != count) {
    warning("Requested ", count, " packages, returned only ", nrow(df))
  }

  df
}
