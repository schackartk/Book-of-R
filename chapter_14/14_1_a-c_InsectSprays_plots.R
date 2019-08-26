# 14.1a Produce a histogram of the counts of insects using base R graphics
hist(InsectSprays$count,breaks=seq(0,30,2.5),col="gray",main="Insects",xlab="Number of Insects")

# 14.1b Obtain the total number of insects found according to each spray. 
#       Then, use base R graphics to produce a vertical barplot and a pie chart of these totals,
#       labeling each plot appropriately.
totals <- tapply(InsectSprays$count,InsectSprays$spray,FUN=sum)
totals
Spray = c("A", "B", "C", "D", "E", "F")


qplot(Spray,totals,geom= "col",ylab="Total Insect Count",main = "Insect Counts by Spray Type")

pie(totals,main="Insect Counts by Spray Type")


# 14.1c Use ggplot2 functoinality to generate side-by-side boxplots of
#       the counts of instects according to each spray type and include
#       appropriate acis labels and a title.

library("ggplot2")
boxplot(InsectSprays$count~InsectSprays$spray,xlab="Spray Type",ylab="Insect Count by Lot",col="gray",main="Insect Count by Lot for 6 Spray Types")
