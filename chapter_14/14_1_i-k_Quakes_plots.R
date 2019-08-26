# 14.1i Return to the built-in quakes dataset. Create a factor vector corresponding to the magnitudes.
#       Each entry should assume one of three categories based on breaks marked by the minimum
#       magnitude, the 1/3 quantile, the 2/3 quantile, and the maximum magnitude.

quakes.fac <- cut(quakes$mag,breaks=c(0,quantile(quakes$mag,1/3),quantile(quakes$mag,2/3),max(quakes$mag)))

# 14.1j,k Recreate the plot shown next, where low-, medium-, and high-magnitude events,
#       according to your factor vector from (i), are plotted with pch being assigned
#       1, 2, and 3, respectively


quake_pch <- rep(NA,times=length(quakes.fac)) # I like to initialize with a bad number so that bugs become apparent quicker
legend_caption <- rep(NA,times=length(levels(quakes.fac)))

# Cycle through the quake mgnitude factor vector, greating plotting point characters and legend
for (i in seq(1,length(levels(quakes.fac)),1)) {
  quake_pch[quakes.fac == levels(quakes.fac)[i]] <- i
  legend_caption[i] <- levels(quakes.fac)[i]
}

# Plot the output
plot(quakes$long, quakes$lat,pch=quake_pch,xlab="Longitude", ylab="Latitude",main="Spatial Distribution of Earthquake Magnitudes")
legend("bottomleft",legend=legend_caption,pch=seq(1,length(levels(quakes.fac)),1))
