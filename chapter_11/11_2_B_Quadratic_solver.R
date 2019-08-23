quad_roots <- function(A,B,C){
    
    # Check for arguments
    if(all(missing(A),missing(B),missing(C))){
        cat("Usage quadroots\t\tA B C\n")
        cat("Determine th roots of AX^2 + BX + C = 0\n")
        cat("Required arguments:\n")
        cat("\tA    \t\tCoefficient of X^2\n")
        cat("\tB    \t\tCoefficient of X\n")
        cat("\tC    \t\tCoefficient of X^0\n")
        return()
    }
    if(missing(A)){
        cat("Missing argument 'A'\n")
    }
    if(missing(B)){
        cat("Missing argument 'B'\n")
    }
    if(missing(C)){
        cat("Missing argument 'C'\n")
    }
    if(any(missing(A),missing(B),missing(C))){
        return(cat("Unable to compute due to missing arguments."))
    }
    
    #Evaluate Roots
    det <- (B^2)-(4*A*C)
    roots <- vector()
    
    if(det<0){
        return(cat(B,"^2 - 4*",A,"*",C," < 0; Has no real solutions",sep=""))
    }else if(det==0){
        roots[1] <- -1*B/(2*A)
    }else if(det>0){
        roots[1] <- (-1*B-(B^2-4*A*C)^0.5)/(2*A)
        roots[2] <- (-1*B+(B^2-4*A*C)^0.5)/(2*A)
    }
    return(roots)
}