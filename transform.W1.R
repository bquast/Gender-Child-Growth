# transform.W1.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for transforming the imported object to a tidy data frame

# install and load the required packages
library(dplyr)


### add these variables of interest
# w1_c_popgrp
# w1_c_slpm - nights under roof month
# w1_c_hlthdes perceived health status
# w1_c_brwghtg weight at birth grams
# w1_c_hlser child has/had serious disabilities
# w1_c_hlserbrn born with disability
# w1_c_hlserbrn ill 3 days last month
# w1_c_mthali bio mother alive
# w1_c_mthhh mother is resident
# w1_c_mthsch mother highest school grade
# w1_c_mthtrt mother secondary education
# w1_c_fthali bio father alive
# w1_c_fthhh bio father resident
# w1_c_fthsch father highest school grade
# w1_c_fthtrt father secondary education
# w1_c_grcur child related social grant



# construct a length-of-month object
month <- (3*365 + 366) / (4*12)

# load the imported RData file
load("Wave1.RData")

# encode month factor variables as numeric
Child.W1$w1.c.dob.m <- as.numeric(Child.W1$w1.c.dob.m)
Child.W1$w1.c.intrv.m <- as.numeric(Child.W1$w1.c.intrv.m)

# encode as numeric
Household.Derived.W1$w1.hhgeo2011 <- as.numeric(Household.Derived.W1$w1.hhgeo2011)
Household.Derived.W1$w1.hhgeo2001 <- as.numeric(Household.Derived.W1$w1.hhgeo2001)

# filter out missing value codes for the adults raw data set pension income
attach(Adult.W1)
Adult.W1$w1.a.incgovpen.v.c <- ifelse(w1.a.incgovpen.v < 0, w1.a.incgovpen.v, NA)
Adult.W1$w1.a.incgovpen.v <- ifelse(w1.a.incgovpen.v >= 0, w1.a.incgovpen.v, NA)
detach(Adult.W1)

# filter out the missing value codes and write them to separate variables
attach(Child.W1)
Child.W1$w1.c.dob.y.c <- ifelse(w1.c.dob.y >= 2020, w1.c.dob.y, NA)
Child.W1$w1.c.dob.y <- ifelse(w1.c.dob.y <= 2020, w1.c.dob.y, NA)
Child.W1$w1.c.dob.m.c <- ifelse(Child.W1$w1.c.dob.m > 12, w1.c.dob.m, NA)
Child.W1$w1.c.dob.m <- ifelse(w1.c.dob.m <= 12, w1.c.dob.m, NA)
Child.W1$w1.c.intrv.y.c <- ifelse(w1.c.intrv.y <= 0, w1.c.intrv.y, NA)
Child.W1$w1.c.intrv.y <- ifelse(w1.c.intrv.y >= 0, w1.c.intrv.y, NA)
Child.W1$w1.c.intrv.m.c <- ifelse(w1.c.intrv.m > 12, w1.c.intrv.m, NA)
Child.W1$w1.c.intrv.m <- ifelse(w1.c.intrv.m <= 12, w1.c.intrv.m, NA)
Child.W1$w1.c.intrv.d.c <- ifelse(w1.c.intrv.d > 31, w1.c.intrv.d, NA)
Child.W1$w1.c.intrv.d <- ifelse(w1.c.intrv.d <= 31, w1.c.intrv.d, NA)
Child.W1$w1.c.height.1.c <- ifelse(w1.c.height.1 <= 0, w1.c.height.1, NA)
Child.W1$w1.c.height.2.c <- ifelse(w1.c.height.2 <= 0, w1.c.height.2, NA)
Child.W1$w1.c.height.3.c <- ifelse(w1.c.height.3 <= 0, w1.c.height.3, NA)
Child.W1$w1.c.height.1 <- ifelse(w1.c.height.1 >= 0, w1.c.height.1, NA)
Child.W1$w1.c.height.2 <- ifelse(w1.c.height.2 >= 0, w1.c.height.2, NA)
Child.W1$w1.c.height.3 <- ifelse(w1.c.height.3 >= 0, w1.c.height.3, NA)
Child.W1$w1.c.weight.1.c <- ifelse(w1.c.weight.1 <= 0, w1.c.weight.1, NA)
Child.W1$w1.c.weight.2.c <- ifelse(w1.c.weight.2 <= 0, w1.c.weight.2, NA)
Child.W1$w1.c.weight.3.c <- ifelse(w1.c.weight.3 <= 0, w1.c.weight.3, NA)
Child.W1$w1.c.weight.1 <- ifelse(w1.c.weight.1 >= 0, w1.c.weight.1, NA)
Child.W1$w1.c.weight.2 <- ifelse(w1.c.weight.2 >= 0, w1.c.weight.2, NA)
Child.W1$w1.c.weight.3 <- ifelse(w1.c.weight.3 >= 0, w1.c.weight.3, NA)
detach(Child.W1)

# filter out missing value code
attach(Household.Derived.W1)
Household.Derived.W1$w1.hhgeo2001.c <- ifelse(w1.hhgeo2001 < 0, w1.hhgeo2001, NA)
Household.Derived.W1$w1.hhgeo2001 <- ifelse(w1.hhgeo2001 > 0, w1.hhgeo2001, NA)
Household.Derived.W1$w1.hhgeo2011.c <- ifelse(w1.hhgeo2011 < 0, w1.hhgeo2011, NA)
Household.Derived.W1$w1.hhgeo2011 <- ifelse(w1.hhgeo2011 > 0, w1.hhgeo2011, NA)
Household.Derived.W1$w1.hhsizer.c <- ifelse(w1.hhsizer < 0, w1.hhsizer, NA)
Household.Derived.W1$w1.hhsizer <- ifelse(w1.hhsizer > 0, w1.hhsizer, NA)
Household.Derived.W1$w1.hhincome.c <- ifelse(w1.hhincome < 0, w1.hhincome, NA)
Household.Derived.W1$w1.hhincome <- ifelse(w1.hhincome > 0, w1.hhincome, NA)
detach(Household.Derived.W1)

# filter out the erronous dob months
Child.W1$w1.c.dob.m[39] <- NA
Child.W1$w1.c.dob.m[425] <- NA

# construct age in days and months
Child.W1$w1.c.intrv.dt <- as.Date(paste(Child.W1$w1.c.intrv.y, Child.W1$w1.c.intrv.m, Child.W1$w1.c.intrv.d, sep="-"))
Child.W1$w1.c.dob.dt <- as.Date(paste(Child.W1$w1.c.dob.y, Child.W1$w1.c.dob.m, 1, sep="-"))
Child.W1$w1.c.age.d <- as.numeric(Child.W1$w1.c.intrv.dt - Child.W1$w1.c.dob.dt)
Child.W1$w1.c.age.m <- Child.W1$w1.c.age.d %/% month

# filter out gender missing value codes
Child.W1$w1.c.gen.c <- ifelse(!as.numeric(Child.W1$w1.c.gen) %in% 5:6, Child.W1$w1.c.gen, NA)
Child.W1$w1.c.gen <- ifelse(as.numeric(Child.W1$w1.c.gen) %in% 5:6, Child.W1$w1.c.gen, NA)
Adult.W1$w1.a.gen.c <- ifelse(!as.numeric(Adult.W1$w1.a.gen) %in% 5:6, Adult.W1$w1.a.gen, NA)
Adult.W1$w1.a.gen <- ifelse(as.numeric(Adult.W1$w1.a.gen) %in% 5:6, Adult.W1$w1.a.gen, NA)
Household.Roster.W1$w1.r.gen.c <- ifelse(!as.numeric(Household.Roster.W1$w1.r.gen) %in% 5:6, Household.Roster.W1$w1.r.gen, NA)
Household.Roster.W1$w1.r.gen <- ifelse(as.numeric(Household.Roster.W1$w1.r.gen) %in% 5:6, Household.Roster.W1$w1.r.gen, NA)
Individual.Derived.W1$w1.best.gen.c <- ifelse(!as.numeric(Individual.Derived.W1$w1.best.gen) %in% 5:6, Individual.Derived.W1$w1.best.gen, NA)
Individual.Derived.W1$w1.best.gen <- ifelse(as.numeric(Individual.Derived.W1$w1.best.gen) %in% 5:6, Individual.Derived.W1$w1.best.gen, NA)

# create woman logical dummies
Child.W1$w1.c.woman <- Child.W1$w1.c.gen == 6
Adult.W1$w1.a.woman <- Adult.W1$w1.a.gen == 6
Household.Roster.W1$w1.r.woman <- Household.Roster.W1$w1.r.gen == 6
Individual.Derived.W1$w1.best.woman <- Individual.Derived.W1$w1.best.gen == 6

# transform the pension variable into a dummy
Individual.Derived.W1$w1.spen.d <- ifelse(is.na(Individual.Derived.W1$w1.spen), FALSE, TRUE)

# construct woman and man pension dummies
w1.spen.d.w.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.spen.d == TRUE & Individual.Derived.W1$w1.best.woman == TRUE),]$w1.hhid
w1.spen.d.m.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.spen.d == TRUE & Individual.Derived.W1$w1.best.woman == FALSE),]$w1.hhid
w1.woman.60.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.best.woman == TRUE & Individual.Derived.W1$w1.best.age.yrs >= 60),]$w1.hhid
w1.man.60.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.best.woman == FALSE & Individual.Derived.W1$w1.best.age.yrs >= 60),]$w1.hhid
w1.woman.65.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.best.woman == TRUE & Individual.Derived.W1$w1.best.age.yrs >= 65),]$w1.hhid
w1.man.65.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.best.woman == FALSE & Individual.Derived.W1$w1.best.age.yrs >= 65),]$w1.hhid
w1.woman.60.64.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.best.woman == TRUE & Individual.Derived.W1$w1.best.age.yrs >= 60 & Individual.Derived.W1$w1.best.age.yrs < 65),]$w1.hhid
w1.man.60.64.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.best.woman == FALSE & Individual.Derived.W1$w1.best.age.yrs >= 60 & Individual.Derived.W1$w1.best.age.yrs < 65),]$w1.hhid

# create pension dummies in Child data frame
Child.W1$w1.spen.d.w <- Child.W1$w1.hhid %in% w1.spen.d.w.hhid
Child.W1$w1.spen.d.m <- Child.W1$w1.hhid %in% w1.spen.d.m.hhid
Child.W1$w1.woman.60 <- Child.W1$w1.hhid %in% w1.woman.60.hhid
Child.W1$w1.man.60 <- Child.W1$w1.hhid %in% w1.man.60.hhid
Child.W1$w1.woman.65 <- Child.W1$w1.hhid %in% w1.woman.65.hhid
Child.W1$w1.man.65 <- Child.W1$w1.hhid %in% w1.man.65.hhid
Child.W1$w1.woman.60.64 <- Child.W1$w1.hhid %in% w1.woman.60.64.hhid
Child.W1$w1.man.60.64 <- Child.W1$w1.hhid %in% w1.man.60.64.hhid

# create data frames of household pension income (by gender)
Group.A.W1 <- group_by(Adult.W1, w1.hhid, w1.a.woman)
Spen.A.W1 <- Group.A.W1 %>%  summarise(hh.spen = sum(w1.a.incgovpen.v) )
Group.IndD.W1 <- group_by(Individual.Derived.W1, w1.hhid, w1.best.woman)
Spen.IndD.W1 <- Group.IndD.W1 %>%  summarise(hh.spen = sum(w1.spen) )

# merge pension income data to child
Child.W1$w1.a.spen <- Spen.A.W1$hh.spen[match (Child.W1$w1.hhid, Spen.A.W1$w1.hhid) ]
Child.W1$w1.a.spen.w <- Spen.A.W1[Spen.A.W1$w1.a.woman == TRUE,]$hh.spen[match (Child.W1$w1.hhid, Spen.A.W1$w1.hhid) ]
Child.W1$w1.a.spen.m <- Spen.A.W1[Spen.A.W1$w1.a.woman == FALSE,]$hh.spen[match (Child.W1$w1.hhid, Spen.A.W1$w1.hhid) ]
Child.W1$w1.id.spen <- Spen.IndD.W1$hh.spen[match (Child.W1$w1.hhid, Spen.IndD.W1$w1.hhid) ]
Child.W1$w1.id.spen.w <- Spen.IndD.W1[Spen.IndD.W1$w1.best.woman == TRUE,]$hh.spen[match (Child.W1$w1.hhid, Spen.IndD.W1$w1.hhid) ]
Child.W1$w1.id.spen.m <- Spen.IndD.W1[Spen.IndD.W1$w1.best.woman == FALSE,]$hh.spen[match (Child.W1$w1.hhid, Spen.IndD.W1$w1.hhid) ]

# merge the z-scores into the Child data frame
Child.W1$w1.zhfa <- Individual.Derived.W1$w1.zhfa[match(Child.W1$pid, Individual.Derived.W1$pid)]
Child.W1$w1.zwfh <- Individual.Derived.W1$w1.zwfh[match(Child.W1$pid, Individual.Derived.W1$pid)]
Child.W1$w1.zwfa <- Individual.Derived.W1$w1.zwfa[match(Child.W1$pid, Individual.Derived.W1$pid)]
Child.W1$w1.zbmi <- Individual.Derived.W1$w1.zbmi[match(Child.W1$pid, Individual.Derived.W1$pid)]
Child.W1$w1.fwag <- Individual.Derived.W1$w1.fwag[match(Child.W1$pid, Individual.Derived.W1$pid)]

# merge household income, parent education
Child.W1$w1.fwag <- Individual.Derived.W1$w1.fwag[match(Child.W1$pid, Individual.Derived.W1$pid)]
Child.W1$w1.best.edu <- Individual.Derived.W1$w1.best.edu[match(Child.W1$w1.c.respid, Individual.Derived.W1$pid)]
Child.W1$w1.best.age.yrs <- Individual.Derived.W1$w1.best.age.yrs[match(Child.W1$w1.c.respid, Individual.Derived.W1$pid)]
Child.W1$w1.hhincome <- Household.Derived.W1$w1.hhincome[match(Child.W1$w1.hhid, Household.Derived.W1$w1.hhid)]
Child.W1$w1.h.tinc <- Household.Questionnaire.W1$w1.h.tinc[match(Child.W1$w1.hhid, Household.Questionnaire.W1$w1.hhid)]

#### see what other covariates can be used ####


######
#### AFTER EVERYTHING IS DONE, ANALYSE ALL NEWLY CREATED VARIABLES
######

# save the transformed pdata.frame to a file
save(Child.W1, file = "transformed.Child.W1.RData")