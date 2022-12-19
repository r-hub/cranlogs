split_batches <- function(v,
                          batch_size){
  if(is.null(v)) return(list("1"=NULL))
  batches <- split(v, ceiling(seq_along(v)/batch_size))
}