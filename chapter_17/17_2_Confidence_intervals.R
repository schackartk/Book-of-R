# 17.2 A casual runner records the average time it takes him to sprint
#      100 meters. He completes the dash 34 times under identical conditions
#      and finds that the mean of these is 14.22 seconds. Assume
#      that he knows the standard deviation of his runs is σX = 2.9 seconds.

# 17.2a Construct and interpret a 90% CI for the true mean time

n <- 34
x.bar <- 14.22
s.dev <- 2.9
s.error <- s.dev/sqrt(n)

critval <- qnorm(0.95)
x.bar + c(-1,1)*critval*s.error

# 17.2b Repeat (a), but this time, assume that the standard deviation is
#       not known and that s = 2.9 is estimated from the sample. How, if
#       at all, does this change the interval?

critval <- qt(0.95,df=n-1) # When standard deviation is unknown, we must use t-stat
x.bar + c(-1,1)*critval*s.error

# 17.2 In a particular country, the true proportion of citizens who are left
#      handed or ambidextrous is unknown. A random sample of 400
#      people is taken, and each individual is asked to identify with one
#      of three options: right-handed only, left-handed only, or ambidextrous.
#      The results show that 37 selected left-handed and 11 selected
#      ambidextrous.

n <- 400
left <- 37
ambi <- 11

p.left <- left/n
p.ambi <- ambi/n

# 17.2c Calculate and interpret a 99 percent CI for the true proportion
#       of left-handed-only citizens.

p.left.se <- sqrt(p.left*(1-p.left)/n)
p.left+c(-1,1)*qnorm(0.995)*p.left.se

# 17.2d Calculate and interpret a 99 percent CI for the true proportion
#       of citizens who are either left-handed or ambidextrous.

p.left.ambi <- (left+ambi)/n
p.left.ambi.se <- sqrt(p.left.ambi*(1-p.left.ambi)/n)
p.left.ambi+c(-1,1)*qnorm(0.995)*p.left.ambi.se


# 17.2 In Section 17.2.4, the technical interpretation of a CI with respect to
#      its confidence level was described as the proportion of many similar
#      intervals (that is, when calculated for samples of the same size from
#      the same population) that contain the true value of the parameter of
#      interest.

# 17.2e Your task is to write an example to demonstrate this behavior
#       of confidence intervals using simulation. To do so, follow these
#       instructions:

sim <- matrix(data=NA, nrow=5000, ncol=3) # Set up empty matrix, 5,000x3

for (i in seq(1,5000,1)) {
  size <- 300
  lambda_e <- 0.1
  exp.data <- rexp(n=size, rate=lambda_e) # Generate 300 data from exp dist
  
  exp.mean <- mean(exp.data) # Point estimate of generated data
  exp.sd <- sd(exp.data) # Sample standard deviation of generated data
  exp.se <- exp.sd/sqrt(size) # Calculate standard error
  
  CI <- exp.mean + c(-1,1)*qt(p=0.975, df=size-1)*exp.se # Get confidence interval using critical t (sigma unkown)
  accurate <- (CI[1] <=  1/lambda_e) &  (1/lambda_e <= CI[2]) # Test is true mean is within CI
  sim[i,] <- c(CI, accurate) # Populate sim with CI values and test result
}

proportion <- sum(sim[,3])/nrow(sim) # Proportion of CI that capture true mean (~95%)

# 17.2f Create a plot that draws the first 100 of your estimated confidence
#       intervals as separate horizontal lines drawn from l to u,
#       one on top of another. One way to do this is to first create an
#       empty plot with preset x- and y-limits (the latter as c(1,100)) and
#       then progressively add each line using lines with appropriate
#       coordinates (this could be done using another for loop). As a
#       final touch, add to the plot a red vertical line that denotes the
#       true mean. Confidence intervals that do not include the true
#       mean will not intersect that vertical line.

plot(0,type="n",
     xlab="Mean of Exponentially Distributed Variable", xlim=c(min(sim[,1]), max(sim[,2])),
     ylim=c(0,300), yaxt="n", ylab="",
     main="How Well Do Confidence Intervals Predict True Mean?")

for (i in seq(1,300,1)) {
  if (sim[i,3]) {
    color <- "black"
  } else {
    color <- "red"
  }
  lines(c(sim[i,1],sim[i,2]),c(i,i),col=color)
}

abline(v=1/lambda_e, col="green")

legend("topleft",legend=c("Accurate","Inaccurate","True Mean"),
       col=c("black","red","green"),lty=c(1,1,1))

       