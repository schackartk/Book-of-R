dat <- chickwts$weight[chickwts$feed=="sunflower"]

plot(dat,rep(0,length(dat)),yaxt="n",ylab="",xlab="Sunflower Diet Chick Weights",bty="n",cex=2,cex.axis=1.5,cex.lab=1.5)
abline(h=0,col="gray",lty=2)

IQR(dat)
sd(dat)

dat_adj <- dat[dat!=min(dat)]

plot(dat_adj,rep(0,length(dat_adj)),yaxt="n",ylab="",xlab="Sunflower Diet Chick Weights",bty="n",cex=2,cex.axis=1.5,cex.lab=1.5)
abline(h=0,col="gray",lty=2)

IQR(dat_adj)
sd(dat_adj)