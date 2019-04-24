#' Create Markdown code for a cranlogs badge
#'
#' @param package_name name of the package 
#' @param summary One of "last-day", "last-week", "last-month", "grand-total".
#' @param color Either a hex color code or one of "brightgreen", "green", "yellowgreen",
#'  "yellow", "orange", "red", "lightgrey", "blue".
#'
#' @return The string to be copy-pasted to the README source.
#' @export
#'
#' @examples
#' cranlogs_badge("praise")
#' cranlogs_badge("praise", summary = "grand-total")
#' cranlogs_badge("praise", summary = "last-week", color = "orange")
#' cranlogs_badge("praise", color = "ff8c69")
cranlogs_badge <- function(package_name, 
                           summary = c("last-month", "last-day", 
                                       "last-week", "grand-total"),
                         color = "blue"){
  
  summary <- match.arg(summary)
  
  url <- paste0("http://cranlogs.r-pkg.org/badges/",
               summary, "/",
               package_name, 
               "?color=", color)
  
  paste0("[![CRAN RStudio mirror downloads](",
         url, ")](", url, ")")
}