# 16.2 Every Saturday, at the same time, an individual stands by the side of
#      a road and tallies the number of cars going by within a 120-minute
#      window. Based on previous knowledge, she believes that the mean
#      number of cars going by during this time is exactly 107. Let X represent
#      the appropriate Poisson random variable of the number of cars
#      passing her position in each Saturday session.

# 16.2a What is the probability that more than 100 cars pass her on any given Saturday?

1 - ppois(q=100, lambda=107)

# 16.2b Determine the probability that no cars pass

dpois(x=0, lambda=107)
ppois(q=0, lambda=107)

# 16.2c Plot the relevant Poisson mass function over the values in 60 <= x <= 150

probs = dpois(x=60:150, lambda=107)

barplot(probs,space=0,names.arg=60:150, xlab="x (Number of Cars)",ylab="Pr(X = x)")

# 16.2d Simulate 260 results from this distribution.
#       Plot the simulated results using hist; use xlim to set the horizontal
#       limits from 60 to 150. Compare your histogram to the shape of your
#       mass function from (c).

sim <- rpois(n=260,lambda=107)

hist(sim,xlim=c(60,150),col="lightblue",xlab="x (Number of cars seen in 120 min time window)",ylab="Number of Occurences (Frequency)",main="Simulated Poisson Distribution histogram\n[lambda = 107]")

     