# 16.4 A tutor knows that the length of time taken to complete a certain
#      statistics question by first-year undergraduate students, X, is
#      normally distributed with a mean of 17 minutes and a standard
#      deviation of 4.5 minutes.

mu <- 17
sigma <- 4.5

# 16.4a
#      i. What is the probability a randomly selected undergraduate
#         takes more than 20 minutes to complete the question?

1 - pnorm(20, mean=mu, sd=sigma)

#     ii. What's the chance that a student takes between 5 and 10
#         minutes to finish the question?

pnorm(10, mean=mu, sd=sigma) - pnorm(5, mean=mu, sd=sigma)

#   iii. Find the time that marks off the slowest 10% of students

slowest_10_time <- qnorm(p=0.1, mean=mu, sd=sigma)

#    iv. Plot the normal distribution of interest between +- 4sigma
#        and shade in the probability area of (iii), the slowest 10%
#        of students.

times <- seq(mu-4*sigma,mu+4*sigma,length=500)
probs <- dnorm(times, mean=mu, sd=sigma)
slowest_10_x_vals <- times[times>=0 & times<=slowest_10_time]
slowest_10_y_vals <- probs[times>=0 & times<=slowest_10_time]

plot(times, probs, type="l", las=1, xlim=c(mu-4*sigma,mu+4*sigma), xlab="Question Completion Time (min)", ylab="Probability") #las=1 forces horizontal y-axis labels
abline(h=0,col="gray") # horizontal line at 0
abline(v=c(slowest_10_time),lty=2)
legend("topleft", legend=c("0.1 quantile"), lty=2, bty="n")
polygon(rbind(c(0,0), cbind(slowest_10_x_vals,slowest_10_y_vals), c(slowest_10_time,0)), border=NA, col="gray")

#     v. Generate a realization of times based on a class of 10 students
#        completing the question.

sims <- rnorm(n=10,mu,sigma)

points(sims,rep(0,times=length(sims))) # Just for fun

# 16.4b A meticulous gardener is interested in the length of blades
#      of grass on his lawn. He believes that blade length X follows a
#      normal distribution centered on 10 mm with a variance of 2 mm.

grass_mu <- 10
grass_var <- 2
grass_sd <- sqrt(grass_var)

#      i. Find the probability that a blade of grass is between 9.5 and 11 mm long

pnorm(11, grass_mu, grass_sd) - pnorm(9.5, grass_mu, grass_sd)

#     ii. What are the standardized values of 9.5 and 11 in the context of this dist?
#         Using the standardized values, confirm that you can obtain the same prob
#         you found in (i) with the standard normal density.

z_11 <- (11-grass_mu)/grass_sd
z_9.5 <- (9.5-grass_mu)/grass_sd
pnorm(z_11) - pnorm(z_9.5)

#    iii. Below which value are the shortest 2.5% of blade lengths found?

shortest_2.5 <- qnorm(0.025, grass_mu, grass_sd)

#     iv. Standardize your answer from (iii).

(shortest_2.5-grass_mu)/grass_sd
