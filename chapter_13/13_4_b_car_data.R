library("ggplot2")

mtcars$tranfac <- rep("auto",times=nrow(mtcars))
mtcars$tranfac[mtcars$am==1] <- "manual"

qplot(mtcars$hp,1/mtcars$qsec,colour=mtcars$tranfac,shape=mtcars$tranfac,ylab="Time inverse [sec",xlab="HP")
