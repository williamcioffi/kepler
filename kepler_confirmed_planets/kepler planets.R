# This file was produced by the NASA Exoplanet Archive  http://exoplanetarchive.ipac.caltech.edu
# Tue Jun 20 07:32:04 2017
#
# COLUMN pl_hostname:    Host Name
# COLUMN pl_letter:      Planet Letter
# COLUMN pl_discmethod:  Discovery Method
# COLUMN pl_pnum:        Number of Planets in System
# COLUMN pl_orbper:      Orbital Period [days]
# COLUMN pl_orbpererr1:  Orbital Period Upper Unc. [days]
# COLUMN pl_orbpererr2:  Orbital Period Lower Unc. [days]
# COLUMN pl_orbperlim:   Orbital Period Limit Flag
# COLUMN pl_orbsmax:     Orbit Semi-Major Axis [AU]
# COLUMN pl_orbsmaxerr1: Orbit Semi-Major Axis Upper Unc. [AU]
# COLUMN pl_orbsmaxerr2: Orbit Semi-Major Axis Lower Unc. [AU]
# COLUMN pl_orbsmaxlim:  Orbit Semi-Major Axis Limit Flag
# COLUMN pl_orbeccen:    Eccentricity
# COLUMN pl_orbeccenerr1: Eccentricity Upper Unc.
# COLUMN pl_orbeccenerr2: Eccentricity Lower Unc.
# COLUMN pl_orbeccenlim: Eccentricity Limit Flag
# COLUMN pl_orbincl:     Inclination [deg]
# COLUMN pl_orbinclerr1: Inclination Upper Unc. [deg]
# COLUMN pl_orbinclerr2: Inclination Lower Unc. [deg]
# COLUMN pl_orbincllim:  Inclination Limit Flag
# COLUMN pl_bmassj:      Planet Mass or M*sin(i)[Jupiter mass]
# COLUMN pl_bmassjerr1:  Planet Mass or M*sin(i)Upper Unc. [Jupiter mass]
# COLUMN pl_bmassjerr2:  Planet Mass or M*sin(i)Lower Unc. [Jupiter mass]
# COLUMN pl_bmassjlim:   Planet Mass or M*sin(i)Limit Flag
# COLUMN pl_bmassprov:   Planet Mass or M*sin(i) Provenance
# COLUMN pl_radj:        Planet Radius [Jupiter radii]
# COLUMN pl_radjerr1:    Planet Radius Upper Unc. [Jupiter radii]
# COLUMN pl_radjerr2:    Planet Radius Lower Unc. [Jupiter radii]
# COLUMN pl_radjlim:     Planet Radius Limit Flag
# COLUMN pl_dens:        Planet Density [g/cm**3]
# COLUMN pl_denserr1:    Planet Density Upper Unc. [g/cm**3]
# COLUMN pl_denserr2:    Planet Density Lower Unc. [g/cm**3]
# COLUMN pl_denslim:     Planet Density Limit Flag
# COLUMN pl_ttvflag:     TTV Flag
# COLUMN pl_kepflag:     Kepler Field Flag
# COLUMN pl_k2flag:      K2 Mission Flag
# COLUMN pl_nnotes:      Number of Notes
# COLUMN ra_str:         RA [sexagesimal]
# COLUMN ra:             RA [sexagesimal]
# COLUMN dec_str:        Dec [sexagesimal]
# COLUMN dec:            Dec [sexagesimal]
# COLUMN st_dist:        Distance [pc]
# COLUMN st_disterr1:    Distance Upper Unc. [pc]
# COLUMN st_disterr2:    Distance Lower Unc. [pc]
# COLUMN st_distlim:     Distance Limit Flag
# COLUMN st_optmag:      Optical Magnitude [mag]
# COLUMN st_optmagerr:   Optical Magnitude Unc. [mag]
# COLUMN st_optmaglim:   Optical Magnitude Limit Flag
# COLUMN st_optmagblend: Optical Magnitude Blend Flag
# COLUMN st_optband:     Optical Magnitude Band
# COLUMN gaia_gmag:      G-band (Gaia) [mag]
# COLUMN gaia_gmagerr:   G-band (Gaia) Unc. [mag]
# COLUMN gaia_gmaglim:   G-band (Gaia) Limit Flag
# COLUMN st_teff:        Effective Temperature [K]
# COLUMN st_tefferr1:    Effective Temperature Upper Unc. [K]
# COLUMN st_tefferr2:    Effective Temperature Lower Unc. [K]
# COLUMN st_tefflim:     Effective Temperature Limit Flag
# COLUMN st_teffblend:   Effective Temperature Blend Flag
# COLUMN st_mass:        Stellar Mass [Solar mass]
# COLUMN st_masserr1:    Stellar Mass Upper Unc. [Solar mass]
# COLUMN st_masserr2:    Stellar Mass Lower Unc. [Solar mass]
# COLUMN st_masslim:     Stellar Mass Limit Flag
# COLUMN st_massblend:   Stellar Mass Blend Flag
# COLUMN st_rad:         Stellar Radius [Solar radii]
# COLUMN st_raderr1:     Stellar Radius Upper Unc. [Solar radii]
# COLUMN st_raderr2:     Stellar Radius Lower Unc. [Solar radii]
# COLUMN st_radlim:      Stellar Radius Limit Flag
# COLUMN st_radblend:    Stellar Radius Blend Flag
# COLUMN rowupdate:      Date of Last Update
#





#constants
earth_orbper <- 365
earth_orbsmax <- 1
earth_bmassj <- 1/121.9 
earth_orbeccen <- 0.0167
earth_dens <- 5.51 #g/cm3
earth_radj <- 0.08921
sol_teff <- 5778
sol_mass <- 1
sol_rad <- 1

#look at kepler planets
a <- read.table("planets.csv", header = TRUE, sep = ',')

#create a unique id for each one
a[, 'uid'] <- 1:nrow(a)

notdese <- -which(a$pl_orbper > 10000)

source("~/documents/cioffi.r")

betterpairs(a[notdese, c(
	'pl_discmethod',
	'pl_pnum',				#num planets
	'pl_orbper',				#days
	'pl_orbsmax', 			#AU
	'pl_orbeccen',			#eccentricity
	'pl_bmassj',				#jupiter masses
	'pl_dens',				#
	'st_teff',				#temp of star in K
	'gaia_gmag',				#g-band magnitude
	'st_dist',				#parsecs
	'st_rad',
	'st_mass'
)])

plot(a$pl_orbper[notdese], a$pl_bassj[notdese], pch = 16, cex = .5, col = rgb(0, 0, 0, 0.1))

plot(a$pl_orbper[a$pl_orbper < 10000], a$pl_bmassj[a$pl_orbper < 10000])
points(earth_orbper, earth_bmassj, pch = 16, col = "blue")


plot(a$pl_radj[a$pl_orbsmax < 2], a$pl_orbsmax[a$pl_orbsmax < 2], type = 'n')
text(a$pl_radj[a$pl_orbsmax < 2], a$pl_orbsmax[a$pl_orbsmax < 2], a$uid[a$pl_orbsmax < 2], cex = .25)
points(earth_radj, earth_orbsmax, pch = 16, col = "blue")

a[2512, ]

library(scatterplot3d)

scatterplot3d(a$pl_radj[a$pl_orbsmax < 2], a$pl_orbsmax[a$pl_orbsmax < 2], a$st_teff[a$pl_orbsmax <2])



library(rgl)
library(scatterplot3d)

plot3d(a$pl_radj, a$pl_orbsmax, a$st_teff)
points3d(earth_radj, earth_orbsmax, sol_teff, pch = 16, col = "blue")
points3d(earth_radj, earth_orbsmax, sol_teff, size = 10, col = "blue")

dese <- c(
	which(a$pl_orbsmax < 2 & a$st_teff < 10000)
)

plot3d(a$pl_radj[dese], a$pl_orbsmax[dese], a$st_teff[dese])
points3d(earth_radj, earth_orbsmax, sol_teff, size = 10, col = "blue")

