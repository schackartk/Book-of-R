# Book of R exercise 11.3c

geolist <- function(listy){
    
    #Helper function to calculate geometric mean of vector elements
    geom_mean <- function(vec){
        prod <- 1 # Initialize what will become the product of all elements
        
        # Take the product of all elements
        for(num in vec){
            prod <- prod*num
        }
        g_mean <- prod^(1/length(vec))
        
        return(g_mean) 
    }
    
    if(!all(lapply(listy,FUN=function(x){is.numeric(x)}))){
        return("Operation could not be completed because not all elements are numeric/matrix")
    }
    
    out <- list()
    i <- 1
    
    for(member in listy){
        if(is.vector(member)){
            listy[[i]] <- geom_mean(member)
        }
        if(is.matrix(member)){
            listy[[i]] <- apply(member,MARGIN=1,FUN=function(x){geom_mean(x)})
        }
        
        i <- i+1
    }
    return(listy)
}