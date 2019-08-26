stations.fac <- cut(quakes$stations,breaks=c(0,50,100,150))
stations.fac[1:5]

#Using base R graphics
boxplot(quakes$mag~stations.fac,xlab="# stations detected",ylab="Magnitude",col="gray")

#Using ggplot2 functionality
qplot(stations.fac,quakes$mag,geom="boxplot",xlab="# stations detected",ylab="Magnitude")
