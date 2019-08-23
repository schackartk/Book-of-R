myfibrec <- function(n){
    if(n==1||n==2){
        return(1)
    } else {
        return(myfibrec(n-1)+myfibrec(n-2))
    }
}