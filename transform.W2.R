# transform.W2.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for transforming the imported object to a tidy data frame

# install and load the required packages
library(dplyr)

# construct a length-of-month object
month <- (3*365 + 366) / (4*12)

# load the imported RData file
load("Wave2.RData")


### possibly treat these same as the other recoded vars ####
# encode month factor variables as numeric
Child.W2$w2.c.dob.m <- as.numeric(Child.W2$w2.c.dob.m)
Child.W2$w2.c.intrv.m <- as.numeric(Child.W2$w2.c.intrv.m)

# filter out the missing value codes and write them to separate variables
attach(Child.W2)
Child.W2$w2.c.dob.y.flg <- ifelse(w2.c.dob.y >= 2020, w2.c.dob.y, NA)
Child.W2$w2.c.dob.y <- ifelse(w2.c.dob.y <= 2020, w2.c.dob.y, NA)
Child.W2$w2.c.dob.m.flg <- ifelse(Child.W2$w2.c.dob.m > 12, w2.c.dob.m, NA)
Child.W2$w2.c.dob.m <- ifelse(w2.c.dob.m <= 12, w2.c.dob.m, NA)
Child.W2$w2.c.intrv.y.flg <- ifelse(w2.c.intrv.y <= 0, w2.c.intrv.y, NA)
Child.W2$w2.c.intrv.y <- ifelse(w2.c.intrv.y >= 0, w2.c.intrv.y, NA)
Child.W2$w2.c.intrv.m.flg <- ifelse(w2.c.intrv.m > 12, w2.c.intrv.m, NA)
Child.W2$w2.c.intrv.m <- ifelse(w2.c.intrv.m <= 12, w2.c.intrv.m, NA)
Child.W2$w2.c.intrv.d.flg <- ifelse(w2.c.intrv.d > 31, w2.c.intrv.d, NA)
Child.W2$w2.c.intrv.d <- ifelse(w2.c.intrv.d <= 31, w2.c.intrv.d, NA)
Child.W2$w2.c.height.1.flg <- ifelse(w2.c.height.1 <= 0, w2.c.height.1, NA)
Child.W2$w2.c.height.2.flg <- ifelse(w2.c.height.2 <= 0, w2.c.height.2, NA)
Child.W2$w2.c.height.3.flg <- ifelse(w2.c.height.3 <= 0, w2.c.height.3, NA)
Child.W2$w2.c.height.1 <- ifelse(w2.c.height.1 >= 0, w2.c.height.1, NA)
Child.W2$w2.c.height.2 <- ifelse(w2.c.height.2 >= 0, w2.c.height.2, NA)
Child.W2$w2.c.height.3 <- ifelse(w2.c.height.3 >= 0, w2.c.height.3, NA)
Child.W2$w2.c.weight.1.flg <- ifelse(w2.c.weight.1 <= 0, w2.c.weight.1, NA)
Child.W2$w2.c.weight.2.flg <- ifelse(w2.c.weight.2 <= 0, w2.c.weight.2, NA)
Child.W2$w2.c.weight.3.flg <- ifelse(w2.c.weight.3 <= 0, w2.c.weight.3, NA)
Child.W2$w2.c.weight.1 <- ifelse(w2.c.weight.1 >= 0, w2.c.weight.1, NA)
Child.W2$w2.c.weight.2 <- ifelse(w2.c.weight.2 >= 0, w2.c.weight.2, NA)
Child.W2$w2.c.weight.3 <- ifelse(w2.c.weight.3 >= 0, w2.c.weight.3, NA)
detach(Child.W2)

# filter out the erronous dob months
Child.W2$w2.c.dob.m[199] <- NA
#### report to NIDS ####


# construct age in days and months
Child.W2$w2.c.intrv.dt <- as.Date(paste(Child.W2$w2.c.intrv.y, Child.W2$w2.c.intrv.m, Child.W2$w2.c.intrv.d, sep="-"))
Child.W2$w2.c.dob.dt <- as.Date(paste(Child.W2$w2.c.dob.y, Child.W2$w2.c.dob.m,1, sep="-"))
Child.W2$w2.c.age.d <- as.numeric(Child.W2$w2.c.intrv.dt - Child.W2$w2.c.dob.dt)
Child.W2$w2.c.age.m <- Child.W2$w2.c.age.d %/% month

# filter out gender missing value codes
Child.W2$w2.c.gen.flg <- ifelse(!as.numeric(Child.W2$w2.c.gen) %in% 5:6, Child.W2$w2.c.gen, NA)
Child.W2$w2.c.gen <- ifelse(as.numeric(Child.W2$w2.c.gen) %in% 5:6, Child.W2$w2.c.gen, NA)
Adult.W2$w2.a.gen.flg <- ifelse(!as.numeric(Adult.W2$w2.a.gen) %in% 5:6, Adult.W2$w2.a.gen, NA)
Adult.W2$w2.a.gen <- ifelse(as.numeric(Adult.W2$w2.a.gen) %in% 5:6, Adult.W2$w2.a.gen, NA)
Household.Roster.W2$w2.r.gen.flg <- ifelse(!as.numeric(Household.Roster.W2$w2.r.gen) %in% 5:6, Household.Roster.W2$w2.r.gen, NA)
Household.Roster.W2$w2.r.gen <- ifelse(as.numeric(Household.Roster.W2$w2.r.gen) %in% 5:6, Household.Roster.W2$w2.r.gen, NA)
Individual.Derived.W2$w2.best.gen.flg <- ifelse(!as.numeric(Individual.Derived.W2$w2.best.gen) %in% 5:6, Individual.Derived.W2$w2.best.gen, NA)
Individual.Derived.W2$w2.best.gen <- ifelse(as.numeric(Individual.Derived.W2$w2.best.gen) %in% 5:6, Individual.Derived.W2$w2.best.gen, NA)

# create woman logical dummies
Child.W2$w2.c.woman <- Child.W2$w2.c.gen == 6
Adult.W2$w2.a.woman <- Adult.W2$w2.a.gen == 6
Household.Roster.W2$w2.r.woman <- Household.Roster.W2$w2.r.gen == 6
Individual.Derived.W2$w2.best.woman <- Individual.Derived.W2$w2.best.gen == 6

# transform the pension variable into a dummy
Individual.Derived.W2$w2.spen.d <- ifelse(is.na(Individual.Derived.W2$w2.spen), FALSE, TRUE)

# construct woman and man pension dummies
w2.spen.d.w.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.spen.d == TRUE & Individual.Derived.W2$w2.best.woman == TRUE),]$w2.hhid
w2.spen.d.m.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.spen.d == TRUE & Individual.Derived.W2$w2.best.woman == FALSE),]$w2.hhid
w2.woman.60.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.best.woman == TRUE & Individual.Derived.W2$w2.best.age.yrs >= 60),]$w2.hhid
w2.man.60.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.best.woman == FALSE & Individual.Derived.W2$w2.best.age.yrs >= 60),]$w2.hhid
w2.woman.65.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.best.woman == TRUE & Individual.Derived.W2$w2.best.age.yrs >= 65),]$w2.hhid
w2.man.65.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.best.woman == FALSE & Individual.Derived.W2$w2.best.age.yrs >= 65),]$w2.hhid
w2.woman.60.64.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.best.woman == TRUE & Individual.Derived.W2$w2.best.age.yrs >= 60 & Individual.Derived.W2$w2.best.age.yrs < 65),]$w2.hhid
w2.man.60.64.hhid <- Individual.Derived.W2[which(Individual.Derived.W2$w2.best.woman == FALSE & Individual.Derived.W2$w2.best.age.yrs >= 60 & Individual.Derived.W2$w2.best.age.yrs < 65),]$w2.hhid

# create pension dummies in Child data frame
Child.W2$w2.spen.d.w <- Child.W2$w2.hhid %in% w2.spen.d.w.hhid
Child.W2$w2.spen.d.m <- Child.W2$w2.hhid %in% w2.spen.d.m.hhid
Child.W2$w2.woman.60 <- Child.W2$w2.hhid %in% w2.woman.60.hhid
Child.W2$w2.man.60 <- Child.W2$w2.hhid %in% w2.man.60.hhid
Child.W2$w2.woman.65 <- Child.W2$w2.hhid %in% w2.woman.65.hhid
Child.W2$w2.man.65 <- Child.W2$w2.hhid %in% w2.man.65.hhid
Child.W2$w2.woman.60.64 <- Child.W2$w2.hhid %in% w2.woman.60.64.hhid
Child.W2$w2.man.60.64 <- Child.W2$w2.hhid %in% w2.man.60.64.hhid

# filter out missing value codes for the adults raw data set pension income
attach(Adult.W2)
Adult.W2$w2.a.incgovpen.v.flg <- ifelse(w2.a.incgovpen.v < 0, w2.a.incgovpen.v, NA)
Adult.W2$w2.a.incgovpen.v <- ifelse(w2.a.incgovpen.v >= 0, w2.a.incgovpen.v, NA)
detach(Adult.W2)

# create data frames of household pension income (by gender)
Group.A.W2 <- group_by(Adult.W2, w2.hhid, w2.a.woman)
Spen.A.W2 <- Group.A.W2 %>%  summarise(hh.spen = sum(w2.a.incgovpen.v) )
Group.IndD.W2 <- group_by(Individual.Derived.W2, w2.hhid, w2.best.woman)
Spen.IndD.W2 <- Group.IndD.W2 %>%  summarise(hh.spen = sum(w2.spen) )

# merge pension income data to child
Child.W2$w2.a.spen <- Spen.A.W2$hh.spen[match (Child.W2$w2.hhid, Spen.A.W2$w2.hhid) ]
Child.W2$w2.a.spen.w <- Spen.A.W2[Spen.A.W2$w2.a.woman == TRUE,]$hh.spen[match (Child.W2$w2.hhid, Spen.A.W2$w2.hhid) ]
Child.W2$w2.a.spen.m <- Spen.A.W2[Spen.A.W2$w2.a.woman == FALSE,]$hh.spen[match (Child.W2$w2.hhid, Spen.A.W2$w2.hhid) ]
Child.W2$w2.id.spen <- Spen.IndD.W2$hh.spen[match (Child.W2$w2.hhid, Spen.IndD.W2$w2.hhid) ]
Child.W2$w2.id.spen.w <- Spen.IndD.W2[Spen.IndD.W2$w2.best.woman == TRUE,]$hh.spen[match (Child.W2$w2.hhid, Spen.IndD.W2$w2.hhid) ]
Child.W2$w2.id.spen.m <- Spen.IndD.W2[Spen.IndD.W2$w2.best.woman == FALSE,]$hh.spen[match (Child.W2$w2.hhid, Spen.IndD.W2$w2.hhid) ]

# merge the z-scores into the Child data frame
Child.W2$w2.zhfa <- Individual.Derived.W2$w2.zhfa[match(Child.W2$pid, Individual.Derived.W2$pid)]
Child.W2$w2.zwfh <- Individual.Derived.W2$w2.zwfh[match(Child.W2$pid, Individual.Derived.W2$pid)]
Child.W2$w2.zwfa <- Individual.Derived.W2$w2.zwfa[match(Child.W2$pid, Individual.Derived.W2$pid)]
Child.W2$w2.zbmi <- Individual.Derived.W2$w2.zbmi[match(Child.W2$pid, Individual.Derived.W2$pid)]
Child.W2$w2.fwag <- Individual.Derived.W2$w2.fwag[match(Child.W2$pid, Individual.Derived.W2$pid)]

# merge household income, parent education
Child.W2$w2.fwag <- Individual.Derived.W2$w2.fwag[match(Child.W2$pid, Individual.Derived.W2$pid)]
Child.W2$w2.h.tinc <- Household.Questionnaire.W2$w2.h.tinc[match(Child.W2$w2.hhid, Household.Questionnaire.W2$w2.hhid)]
Child.W2$w2.best.edu <- Individual.Derived.W2$w2.best.edu[match(Child.W2$w2.c.respid, Individual.Derived.W2$pid)]
Child.W2$w2.best.age.yrs <- Individual.Derived.W2$w2.best.age.yrs[match(Child.W2$w2.c.respid, Individual.Derived.W2$pid)]
#### see what other covariates can be used ####


######
#### AFTER EVERYTHING IS DONE, ANALYSE ALL NEWLY CREATED VARIABLES
######

# save the transformed pdata.frame to a file
save(Child.W2, file = "transformed.Child.W2.RData")