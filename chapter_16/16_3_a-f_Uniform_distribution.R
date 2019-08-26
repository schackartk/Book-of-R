# 16.3 You visit a national park and are informed that the height
#      of a certain species of tree in the forest is uniformly
#      distributed between 3 and 70 feet.

# 16.3a What is the probability you encounter a tree shorter than 5.5 feet?

punif(5.5,min=3,max=70)

# 16.3b For this probability density function, what is the height that marks
#       the cutoff point of the tallest 15 percent of trees?

qunif(0.85,min=3,max=70)

# 16.3c Evaluate the mean and standard deviation of the tree height dist.

mean_height <- (70+3)/2
std_dev_height <- sqrt(((70-3)^2)/12)

# 16.3d Using (c), confirm that the chance that you encounter a tree with a
#       height that is within half a standard deviation of the mean is roughly
#       28.9%.

punif(mean_height + 0.5*std_dev_height, min=3, max=70) - punif(mean_height - 0.5*std_dev_height, min=3, max=70)

# 16.3e At what height is the density function itself? Show it in a plot.

mi <- 3
ma <- 70
unif1 <- 1/(ma-mi)
plot(c(mi,ma), rep(unif1,2), type="o", pch=19, xlim=c(0,75),ylim=c(0,1.25*unif1),ylab="f(x)",xlab="x")
abline(h=0,lty=2)
segments(c(mi-10,ma+10,mi,ma), rep(0,4), rep(c(mi,ma),2), rep(c(0,unif1),each=2), lty=rep(1:2,each=2))
points(c(mi,ma),c(0,0))

# 16.4 Simulate 10 observed tree heights. Based on these data, use quantile to
#      estimate the answer you arrived at in (b). Repeat your simulation, this
#      time generating 1,000 variates, and estimate (b) again. What do you notice?

low_rep <- runif(n=10, min=3, max=70)
high_rep <- runif(n=1000, min=3,max=70)

quantile(low_rep,0.85)
quantile(high_rep,0.85)
