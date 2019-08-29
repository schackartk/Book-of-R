# 17.1 A teacher wants to test all of the 10th-grade students at his school to
#      gauge their basic mathematical understanding, but the photocopier
#      breaks after making only six copies of the test. With no other choice,
#      he chooses six students at random to take the test. Their results,
#      recorded as a score out of 65, have a sample mean of 41.1. The
#       standard deviation of the marks of this test is known to be 11.3.

# 17.1a Find the standard error associated with the mean test score

xbar <- 41.1
sigma <- 11.3
n <- 6

se <- sigma/sqrt(n)

# 17.1b Assuming the scores themselves are normally distributed, evaluate
#       the probability that the mean score lies between 45 and 55 if
#       the teacher took another sample of the same size.

pnorm(55, xbar, se) - pnorm(45, xbar, se)

# 17.1c A student who gets less than half the questions correct receives a
#       failing grade (F). Find the probability that the average score is an
#       F based on another sample of the same size.

pnorm(65/2, xbar, se)

# 17.1  A marketing company wants to find out which of two energy drinks
#       teenagers prefer—drink A or drink B. It surveys 140 teens, and the
#       results indicate that only 35 percent prefer drink A.

n <- 140
p.hat <- 0.35

# 17.1d Use a quick check to decide whether it is valid to use the normal
#       distribution to represent the sampling distribution of this
#       proportion

test1 <- (n*p.hat) > 5
test2 <- n*(1-p.hat) > 5
test.comb <- all(test1,test2)
sprintf("Normal distribution can be used to represent sampling distribution: %s", test.comb)

# 17.1e What is the probability that in another sample of the same
#       size, the proportion of teenagers who prefer drink A is greater
#       than 0.4?

p.se <- sqrt(p.hat*(1-p.hat)/n) # Standard error of the sampling distribution
pnorm(0.4,p.hat,p.se)

# 17.1f Find the two values of this sampling distribution that identify the central 80%.

lower <- qnorm(0.1,p.hat,p.se)
upper <- qnorm(0.9,p.hat,p.se)

lower
upper

# 17.1 In Section 16.2.4, the time between cars passing an individual’s
#      location was modeled using an exponential distribution. Say that on
#      the other side of town, her friend is curious about a similar problem.
#      Standing outside her house, she records 63 individual times between
#      cars passing. These sampled times have a mean of ¯x = 37.8 seconds
#      with a standard deviation of s = 34.51 seconds.

x.bar <- 37.8
s.dev <- 34.51

# 17.1g The friend inspects a histogram of her raw measurements
#       and notices that her raw data are heavily right-skewed. Briefly
#       identify and describe the nature of the sampling distribution
#       with respect to the sample mean and calculate the appropriate
#       standard error.

s.error <- s.dev/sqrt(63)
xvals <- seq(x.bar - 4*s.error, x.bar + 4*s.error, length=200)
yvals <- dnorm(xvals, x.bar, s.error)
plot(xvals, yvals, type="l", lty=2, xlab="x_bar, Average Time Between Cars (sec)", ylab="Probability Density")

# 17.1h Using the standard error from (g) and the appropriate probability
#       distribution, calculate the probability that in another sample
#       of the same size, the sample mean time between cars passing is as
#       follows:

#      i. More than 40 seconds

pnorm(40, x.bar, s.error, lower.tail = FALSE)

#     ii. Less than half a minute

pnorm(30, x.bar, s.error)

#    iii. Between the given sample mean and 40 seconds

pnorm(40, x.bar, s.error) - pnorm(x.bar, x.bar, s.error)
