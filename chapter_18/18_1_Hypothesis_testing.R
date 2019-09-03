# 18.1

# 18.1a Adult domestic cats of a certain breed are said to have an average
#       weight of 3.5 kilograms. A feline enthusiast disagrees and collects
#       a sample of 73 weights of cats of this breed. From her sample,
#       she calculates a mean of 3.97 kilograms and a standard deviation
#       of 2.21 kilograms. Perform a hypothesis test to test her claim
#       that the true mean weight μ is not 3.5 kilograms by setting up the
#       appropriate hypothesis, carrying out the analysis, and interpreting
#       the p-value (assume the significance level is α = 0.05).

alpha <- 0.05

mu <- 3.5 # Null hypothesis mean

x.bar <- 3.97 # Sample mean
x.sd <- 2.21 # Sample standard deviation
size <- 73 # Sample size

x.se <- x.sd/sqrt(size) # Standard error

x.T <- (x.bar - mu)/x.se # Test statistic (t)

p.val <- 2*pt(-x.T,df=size-1) # p value

reject <- (abs(p.val) < alpha)

if (reject){
  conc <- "reject"
} else {
  conc <- "fail to reject"
}

p.val <- round(p.val,digits=3)

sprintf('We %s the null hypothesis that the average weight is %s (α=%s, p=%s)',conc, mu, alpha, p.val)

# 18.1b Suppose it was previously believed that the mean magnitude of
#       seismic events off the coast of Fiji is 4.3 on the Richter scale. Use
#       the data in the mag variable of the ready-to-use quakes data set,
#       providing 1,000 sampled seismic events in that area, to test the
#       claim that the true mean magnitude is in fact greater than 4.3.
#       Set up appropriate hypotheses, use t.test (conduct the test at a
#       significance level of α = 0.01), and draw a conclusion.

alpha <- 0.01
mu <- 4.3
p.val <- t.test(x=quakes$mag, mu=mu, alternative="greater",conf.level=1-alpha)$p.value

reject <- (abs(p.val) < alpha)

if (reject){
  conc <- "reject"
} else {
  conc <- "fail to reject"
}

p.val <- round(p.val,digits=3)

sprintf('We %s the null hypothesis that the average magnitude is %s (α=%s, p=%s)',conc, mu, alpha, p.val)

# 18.1c Manually compute a two-sided confidence interval for the true mean of (b)

avg <- mean(quakes$mag)
size <- length(quakes$mag)
std.dev <- sd(quakes$mag)
std.err <- std.dev/sqrt(size)

CI <- avg + c(-1,1)*qt(p=0.995, df=size-1)*std.err
