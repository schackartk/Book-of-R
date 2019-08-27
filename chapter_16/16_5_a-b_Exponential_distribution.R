# 16.5a Situated in the central north island of New Zealand, the Pohutu
#       geyser is said to be the largest active geyser in the southern
#       hemisphere. Suppose that it erupts an average of 3,500 times
#       every year.

#      i. Evlauate the parameter lambda.e wrt a time scale in days

lambda.e <- 3500/365.25 # Eruptions per day

#     ii. Plot the density function of interest. What's the mean wait
#         in days between eruptions?

mu <- 1/lambda.e
var <- 1/(lambda.e^2)
xval <- seq(0, 1, length=200)
yval <- dexp(x=xval, rate=lambda.e)
plot(xval*24, yval,type="l", xlab="Time Between Eruptions (hr)", ylab="Probability Density", main="Geyser Eruption Expoential Probability Density")
abline(h=0,col="gray")
abline(v=0,col="gray")

#   iii. What's the probability of waiting less than 30 minutes for 
#        the next eruption?

pexp(0.5/24,rate=lambda.e)

#   iv. What waiting time defines the longest 10% of waits?
#       Convert your answer to hours.

long_10 <- (qexp(0.9,rate=lambda.e))

long_10_x <- xval[xval >= long_10]
long_10_y <- yval[xval >= long_10]

polygon(rbind(c(long_10*24,0), cbind(long_10_x*24,long_10_y), c(24,0)), border=NA, col="gray")

# 16.5b You can also use the exponential distribution to model certain
#       product survival times, or “time-to-failure” type of variables. Say
#       a manufacturer of a particular air conditioning unit knows that
#       the product has an average life of 11 years before it needs any
#       type of repair callout. Let the random variable X represent the
#       time until the necessary repair of one of these units and assume
#       X follows an exponential distribution with λe = 1/11.

lambda.ac <- 1/11

#     i. The company offers a five-year full repair warranty on this
#        unit. What’s the probability that a randomly selected air
#        conditioner owner makes use of the warranty?

pexp(5,lambda.ac)

#    ii. Rival company offers a six-year guarantee on its competing
#        air conditioning unit but knows that its units last, on average,
#        only nine years before requiring some kind of repair. What
#        are the chances of making use of that warranty?

pexp(6,1/9)

#   iii. Determine the probabilities that the units in (i) and the
#        units in (ii) last more than 15 years.

1 - pexp(15,1/11)
1 - pexp(15,1/9)