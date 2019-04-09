check_date <- function(string){
  if(is.na(as.Date(string, format = "%Y-%m-%d"))){
    stop(paste0("The date '", string, "' is not yyyy-mm-dd formatted."),
         call. = FALSE)
  }
}