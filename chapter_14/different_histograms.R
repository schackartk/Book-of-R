hist(mtcars$hp,breaks=seq(0,400,25),col="gray",main="Power",xlab="Power (hp)")
abline(v=c(mean(mtcars$hp),median(mtcars$hp)),lty=c(2,3),lwd=2)
legend("topright",legend=c("mean power","median power"),lty=c(2,3),lwd=2)

qplot(mtcars$hp,geom="blank",main="Power",xlab="Power (hp)") + geom_histogram(color="black",fill="white",breaks=seq(0,400,25),closed="right")+geom_vline(mapping=aes(xintercept=c(mean(mtcars$hp),median(mtcars$hp)),linetype=factor(c("mean","median"))),show.legend=TRUE)+scale_linetype_manual(values=c(2,3))+labs(linetype="")
