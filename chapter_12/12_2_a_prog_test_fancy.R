prog_test <- function(n,...){
  result <- 0
  progbar <- txtProgressBar(min=0,max=n,...)
  for(i in 1:n){
    result <- result + 1
    Sys.sleep(0.5)
    setTxtProgressBar(progbar,value=i)
  }
  close(progbar)
  return(result)
}
