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
  
  pkg_url <- paste0("https://r-pkg.org/pkg/", package_name)
  
  badge_url <- paste0("https://cranlogs.r-pkg.org/badges/",
               summary, "/",
               package_name, 
               "?color=", color)
  
  paste0("[![CRAN RStudio mirror downloads](",
         badge_url, ")](", pkg_url, ")")
  
}

project_name = function(base_path = usethis::proj_get()) {
  # taken from usethis
  proj_crit = function ()  {
    rprojroot::has_file(".here") | 
      rprojroot::is_rstudio_project | 
      rprojroot::is_r_package | 
      rprojroot::is_git_root | 
      rprojroot::is_remake_project | 
      rprojroot::is_projectile_project
  }
  
  proj_find = function(path = ".") {
    tryCatch(rprojroot::find_root(proj_crit(), path = path), 
             error = function(e) NULL)
  }
  possibly_in_proj = function (path = ".") !is.null(proj_find(path))
  if (!possibly_in_proj(base_path)) {
    return(fs::path_file(base_path))
  }
  
  is_package = function (base_path = usethis::proj_get()) 
  {
    res <- tryCatch(rprojroot::find_package_root_file(path = base_path), 
                    error = function(e) NULL)
    !is.null(res)
  }
  if (is_package(base_path)) {
    desc <- desc::description$new(base_path)
    as.list(desc$get(desc$fields()))$Package
  }
  else {
    fs::path_file(base_path)
  }
}

#' @rdname cranlogs_badge
#' @export
use_cranlogs_badge = function(
  summary = c("last-month", "last-day", 
              "last-week", "grand-total"),
  color = "blue") {
  summary <- match.arg(summary)
  if ( !(requireNamespace("fs", quietly = TRUE) &&
         requireNamespace("usethis", quietly = TRUE) &&
         requireNamespace("desc", quietly = TRUE) &&
         requireNamespace("rprojroot", quietly = TRUE)) ) {
    stop("Cannot use use_cranlogs_badge without fs, usethis, ", 
         "desc, and rprojroot packages")
  }
  package_name = project_name()
  
  pkg_url <- paste0("https://r-pkg.org/pkg/", package_name)
  
  badge_url <- paste0("https://cranlogs.r-pkg.org/badges/",
                      summary, "/",
                      package_name, 
                      "?color=", color)

  usethis::use_badge("CRAN RStudio mirror downloads", pkg_url, badge_url)
}
