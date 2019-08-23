facrec <- function(x){
    if(x==0){
        return(1)
    } else {
        return(x*facrec(x-1))
    }
    
}