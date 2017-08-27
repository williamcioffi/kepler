#kepler confirmed planets
#as of 23June2016

k <- read.table("planets_kepler.csv", header = TRUE, sep = ',')

plot(k$pl_bmassj, k$pl_radj, log = 'xy', pch = 16, col = temperaturecolors)


radius <- k$pl_radj
radius <- radius / (max(radius, na.rm = TRUE))
radius <- radius*100

library(rgl)
plot3d(log(k$pl_bmassj), k$pl_eqt, log(k$pl_orbsmax), type = 's', radius = radius, col = "grey")
points3d(log(1/300), 255, log(1), col = "blue", radius = 100/(11*max(k$pl_radj, na.rm = TRUE)))