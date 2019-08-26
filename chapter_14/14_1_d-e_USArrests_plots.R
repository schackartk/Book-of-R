# 14.1d Use ggplot2 functionality to generate a right-exclusive histogram
#       of the proportion of urban population for the states. Set your
#       breaks to be 10 units each, between 0 and 100. Have the histogram
#       show the first quartile, the median, and the third quartile;
#       then provide a matching legend. Use colors as you like and
#       include appropriate axis annotation.


hist(USArrests[,3],breaks=seq(0,100,10),right=FALSE,col="lightgreen",main="Urban Population Proportion",xlab="Urban Population (%)",ylab="Number of States (Frequency)")
abline(v=c(quantile(USArrests[,3],0.25),median(USArrests[,3]),quantile(USArrests[,3],0.75)),lty=c(2,3,4),lwd=2)
legend("topleft",legend=c("First Quartile","Median","Third Quartile"),lty=c(2,3,4),lwd=2)

# 14.1e The code t(as.matrix(USArrests[,-3])) creates a matrix of the USArrests
#       data without the urban population column, and the
#       built-in R object state.abb provides the two-letter state abbreviations,
#       in alphabetical order, as a character vector. Use these two
#       structures and base R graphics to produce a horizontal, stacked
#       barplot with the horizontal bars labeled with state abbreviations
#       and with each bar split according to the type of
#       crime (murder, rape, and assault). Include a legend.

crimes <- t(as.matrix(USArrests[,-3]))
barplot(crimes,beside=FALSE,horiz=TRUE,las=1,main="Number of Arrests By Crima and State\n(1973)",names.arg=state.abb,legend.text=c("Murder","Assault","Rape"),xlab="Number of Arrests per 100,000 Residents",ylab="State")
