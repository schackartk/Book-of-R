# 16.1 A forested nature reserve has 13 bird-viewing platforms scattered
#      throughout a large block of land. The naturalists claim that at
#      any point in time, there is a 75 percent chance of seeing birds at
#      each platform. Suppose you walk through the reserve and visit
#      every platform. If you assume that all relevant conditions are satisfied,
#      let X be a binomial random variable representing the total
#      number of platforms at which you see birds.


# 16.1a Visualize the probability mass function of the binomial distribution of interest.

num_sites = 13
probability = 0.75
X.prob <- dbinom(x=0:num_sites,size=num_sites,prob=probability)

barplot(X.prob,names.arg=0:num_sites,space=0,xlab="x",ylab="Pr(X = x)")

# 16.1b What is the probability you see birds at all sites?

prob_all = round(dbinom(x=num_sites,size=num_sites,prob=probability)*10000)/100
sprintf("The probability of seeing at least one bird at each of the %s sites is %s%%.", num_sites,prob_all)

# 16.1c What is the probability you see birds at more than 9 sites?
sum(dbinom(x=10:num_sites,size=num_sites,prob=probability))

# 16.1d What is the probability of seeing birds at between 8 and 11 sites (inclusively)?
#       Confirm your answer using only the d-function and then again using only the p-function.

sum(dbinom(x=8:11,size=num_sites,prob=probability))
pbinom(q=11,size=num_sites,prob=probability) - pbinom(q=7,size=num_sites,prob=probability)

# 16.1e Probability of seeing birds at fewer than 9 sites
pbinom(q=8,size=num_sites,prob=probability)


# 16.1f Simulate realizations of X that represent 10 different visits to the reserve;
#       Store your resulting vector as an object

my_visits <- rbinom(n=10,size=num_sites,prob=probability)

# 16.1g Compute the mean and standard deviation of the distribution of interest.

mean(my_visits)
sd(my_visits)

