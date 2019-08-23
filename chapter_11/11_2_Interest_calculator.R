# Book of R Exercise 11.2
# Calculating compounded interest


interesting <-
    function(principal,
             rate,
             frequency = 12,
             n_per,
             plotit = TRUE,
             ...) {
        missed <- vector()
        
        if(all(c(missing(principal),missing(rate),missing(frequency)))){
            cat("Usage interesting\tprincipal, rate, [frequency], n_per, [plotit]\n")
            cat("Required arguments:\n")
            cat("\tprincipal  \t\tInitial amount\n")
            cat("\trate       \t\tAnnual interest rate\n")
            cat("\tper        \t\tNumber of years\n")
            cat("Optional arguments:\n")
            cat("\t[frequency] \t\tNumber of compounds per year\n")
            cat("\t[plotit]   \t\tPlot values, if FALSE, return value vector\n")
            return()
        }
        if (missing(principal)) {
            missed <- c(missed, 'principal')
        }
        if (missing(rate)) {
            missed <- c(missed, 'rate')
        }
        if (missing(n_per)) {
            missed <- c(missed, 'n_per')
        }
        for (miss in missed) {
            cat("Missing argument ", miss, ".\n", sep = '')
        }
        
        steps <- seq(from = 1, to = n_per, by = 1)
        finals <- vector()
        n <- 1
        for (i in steps) {
            finals[n] <- principal * (1 + (rate / (100 * frequency))) ^ (frequency *
                                                                             i)
            n <- n + 1
        }
        
        if (plotit) {
            plot(
                steps,
                finals,
                type = "s",
                xlab = "Number of Periods (n_per",
                ylab = "Balance",
                main = "
             Compound Interest Calculator",
                ...
            )
        }else{
            return(finals)
        }
    }