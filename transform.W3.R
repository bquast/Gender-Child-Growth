# transform.W3.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for transforming the imported object to a tidy data frame

# install and load the required packages
library(dplyr)

# construct a length-of-month object
month <- (3*365 + 366) / (4*12)

# load the imported RData file
load("Wave3.RData")


### possibly treat these same as the other recoded vars ####
# encode month factor variables as numeric
Child.W3$w3.c.dob.m <- as.integer(Child.W3$w3.c.dob.m)
Child.W3$w3.c.intrv.m <- as.integer(Child.W3$w3.c.intrv.m)
Child.W3$w3.c.intrv.d <- as.integer(Child.W3$w3.c.intrv.d)


# filter out the missing value codes and write them to separate variables
attach(Child.W3)
Child.W3$w3.c.dob.y.flg <- ifelse(w3.c.dob.y >= 2020, w3.c.dob.y, NA)
Child.W3$w3.c.dob.y <- ifelse(w3.c.dob.y <= 2020, w3.c.dob.y, NA)
Child.W3$w3.c.dob.m.flg <- ifelse(Child.W3$w3.c.dob.m > 12, w3.c.dob.m, NA)
Child.W3$w3.c.dob.m <- ifelse(w3.c.dob.m <= 12, w3.c.dob.m, NA)
Child.W3$w3.c.intrv.y.flg <- ifelse(w3.c.intrv.y <= 0, w3.c.intrv.y, NA)
Child.W3$w3.c.intrv.y <- ifelse(w3.c.intrv.y >= 0, w3.c.intrv.y, NA)
Child.W3$w3.c.intrv.m.flg <- ifelse(w3.c.intrv.m > 12, w3.c.intrv.m, NA)
Child.W3$w3.c.intrv.m <- ifelse(w3.c.intrv.m <= 12, w3.c.intrv.m, NA)
Child.W3$w3.c.intrv.d.flg <- ifelse(w3.c.intrv.d > 31, w3.c.intrv.d, NA)
Child.W3$w3.c.intrv.d <- ifelse(w3.c.intrv.d <= 31, w3.c.intrv.d, NA)
Child.W3$w3.c.height.1.flg <- ifelse(w3.c.height.1 <= 0, w3.c.height.1, NA)
Child.W3$w3.c.height.2.flg <- ifelse(w3.c.height.2 <= 0, w3.c.height.2, NA)
Child.W3$w3.c.height.3.flg <- ifelse(w3.c.height.3 <= 0, w3.c.height.3, NA)
Child.W3$w3.c.height.1 <- ifelse(w3.c.height.1 >= 0, w3.c.height.1, NA)
Child.W3$w3.c.height.2 <- ifelse(w3.c.height.2 >= 0, w3.c.height.2, NA)
Child.W3$w3.c.height.3 <- ifelse(w3.c.height.3 >= 0, w3.c.height.3, NA)
Child.W3$w3.c.weight.1.flg <- ifelse(w3.c.weight.1 <= 0, w3.c.weight.1, NA)
Child.W3$w3.c.weight.2.flg <- ifelse(w3.c.weight.2 <= 0, w3.c.weight.2, NA)
Child.W3$w3.c.weight.3.flg <- ifelse(w3.c.weight.3 <= 0, w3.c.weight.3, NA)
Child.W3$w3.c.weight.1 <- ifelse(w3.c.weight.1 >= 0, w3.c.weight.1, NA)
Child.W3$w3.c.weight.2 <- ifelse(w3.c.weight.2 >= 0, w3.c.weight.2, NA)
Child.W3$w3.c.weight.3 <- ifelse(w3.c.weight.3 >= 0, w3.c.weight.3, NA)
detach(Child.W3)

# filter out the erronous dob months
Child.W3$w3.c.dob.m[6283] <- NA
#### report these to NIDS ####

# construct age in days and months
Child.W3$w3.c.intrv.dt <- as.Date(
  ifelse( is.na(Child.W3$w3.c.intrv.y), NA, 
    paste(Child.W3$w3.c.intrv.y, Child.W3$w3.c.intrv.m, 1, sep="-")
    )
)

Child.W3$w3.c.dob.dt <- as.Date(
  ifelse( is.na(Child.W3$w3.c.dob.y), NA, 
          paste(Child.W3$w3.c.dob.y, Child.W3$w3.c.dob.m, 1, sep="-")
  )
)

Child.W3$w3.c.age.d <- as.numeric(Child.W3$w3.c.intrv.dt - Child.W3$w3.c.dob.dt)
Child.W3$w3.c.age.m <- Child.W3$w3.c.age.d %/% month

# filter out gender missing value codes
Child.W3$w3.c.gen.flg <- ifelse(!as.numeric(Child.W3$w3.c.gen) %in% 5:6, Child.W3$w3.c.gen, NA)
Child.W3$w3.c.gen <- ifelse(as.numeric(Child.W3$w3.c.gen) %in% 5:6, Child.W3$w3.c.gen, NA)
Adult.W3$w3.a.gen.flg <- ifelse(!as.numeric(Adult.W3$w3.a.gen) %in% 5:6, Adult.W3$w3.a.gen, NA)
Adult.W3$w3.a.gen <- ifelse(as.numeric(Adult.W3$w3.a.gen) %in% 5:6, Adult.W3$w3.a.gen, NA)
Household.Roster.W3$w3.r.gen.flg <- ifelse(!as.numeric(Household.Roster.W3$w3.r.gen) %in% 5:6, Household.Roster.W3$w3.r.gen, NA)
Household.Roster.W3$w3.r.gen <- ifelse(as.numeric(Household.Roster.W3$w3.r.gen) %in% 5:6, Household.Roster.W3$w3.r.gen, NA)
Individual.Derived.W3$w3.best.gen.flg <- ifelse(!as.numeric(Individual.Derived.W3$w3.best.gen) %in% 2:3, Individual.Derived.W3$w3.best.gen, NA)
Individual.Derived.W3$w3.best.gen <- ifelse(as.numeric(Individual.Derived.W3$w3.best.gen) %in% 2:3, Individual.Derived.W3$w3.best.gen, NA)

# create woman logical dummies
Child.W3$w3.c.woman <- Child.W3$w3.c.gen == 6
Adult.W3$w3.a.woman <- Adult.W3$w3.a.gen == 6
Household.Roster.W3$w3.r.woman <- Household.Roster.W3$w3.r.gen == 6
Individual.Derived.W3$w3.best.woman <- Individual.Derived.W3$w3.best.gen == 3

# transform the pension variable into a dummy
Individual.Derived.W3$w3.spen.d <- ifelse(is.na(Individual.Derived.W3$w3.spen), FALSE, TRUE)

# construct woman and man pension dummies
w3.spen.d.w.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.spen.d == TRUE & Individual.Derived.W3$w3.best.woman == TRUE),]$w3.hhid
w3.spen.d.m.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.spen.d == TRUE & Individual.Derived.W3$w3.best.woman == FALSE),]$w3.hhid
w3.woman.60.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.best.woman == TRUE & Individual.Derived.W3$w3.best.age.yrs >= 60),]$w3.hhid
w3.man.60.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.best.woman == FALSE & Individual.Derived.W3$w3.best.age.yrs >= 60),]$w3.hhid
w3.woman.65.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.best.woman == TRUE & Individual.Derived.W3$w3.best.age.yrs >= 65),]$w3.hhid
w3.man.65.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.best.woman == FALSE & Individual.Derived.W3$w3.best.age.yrs >= 65),]$w3.hhid
w3.woman.60.64.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.best.woman == TRUE & Individual.Derived.W3$w3.best.age.yrs >= 60 & Individual.Derived.W3$w3.best.age.yrs < 65),]$w3.hhid
w3.man.60.64.hhid <- Individual.Derived.W3[which(Individual.Derived.W3$w3.best.woman == FALSE & Individual.Derived.W3$w3.best.age.yrs >= 60 & Individual.Derived.W3$w3.best.age.yrs < 65),]$w3.hhid

# create pension dummies in Child data frame
Child.W3$w3.spen.d.w <- Child.W3$w3.hhid %in% w3.spen.d.w.hhid
Child.W3$w3.spen.d.m <- Child.W3$w3.hhid %in% w3.spen.d.m.hhid
Child.W3$w3.woman.60 <- Child.W3$w3.hhid %in% w3.woman.60.hhid
Child.W3$w3.man.60 <- Child.W3$w3.hhid %in% w3.man.60.hhid
Child.W3$w3.woman.65 <- Child.W3$w3.hhid %in% w3.woman.65.hhid
Child.W3$w3.man.65 <- Child.W3$w3.hhid %in% w3.man.65.hhid
Child.W3$w3.woman.60.64 <- Child.W3$w3.hhid %in% w3.woman.60.64.hhid
Child.W3$w3.man.60.64 <- Child.W3$w3.hhid %in% w3.man.60.64.hhid
#### ANALYSE these variables, add descriptions above each line ####


# filter out missing value codes for the adults raw data set pension income
attach(Adult.W3)
Adult.W3$w3.a.incgovpen.v.flg <- ifelse(w3.a.incgovpen.v < 0, w3.a.incgovpen.v, NA)
Adult.W3$w3.a.incgovpen.v <- ifelse(w3.a.incgovpen.v >= 0, w3.a.incgovpen.v, NA)
detach(Adult.W3)

# create data frames of household pension income (by gender)
Group.A.W3 <- group_by(Adult.W3, w3.hhid, w3.a.woman)
Spen.A.W3 <- Group.A.W3 %>%  summarise(hh.spen = sum(w3.a.incgovpen.v) )
Group.IndD.W3 <- group_by(Individual.Derived.W3, w3.hhid, w3.best.woman)
Spen.IndD.W3 <- Group.IndD.W3 %>%  summarise(hh.spen = sum(w3.spen) )

# merge pension income data to child
Child.W3$w3.a.spen <- Spen.A.W3$hh.spen[match (Child.W3$w3.hhid, Spen.A.W3$w3.hhid) ]
Child.W3$w3.a.spen.w <- Spen.A.W3[Spen.A.W3$w3.a.woman == TRUE,]$hh.spen[match (Child.W3$w3.hhid, Spen.A.W3$w3.hhid) ]
Child.W3$w3.a.spen.m <- Spen.A.W3[Spen.A.W3$w3.a.woman == FALSE,]$hh.spen[match (Child.W3$w3.hhid, Spen.A.W3$w3.hhid) ]
Child.W3$w3.id.spen <- Spen.IndD.W3$hh.spen[match (Child.W3$w3.hhid, Spen.IndD.W3$w3.hhid) ]
Child.W3$w3.id.spen.w <- Spen.IndD.W3[Spen.IndD.W3$w3.best.woman == TRUE,]$hh.spen[match (Child.W3$w3.hhid, Spen.IndD.W3$w3.hhid) ]
Child.W3$w3.id.spen.m <- Spen.IndD.W3[Spen.IndD.W3$w3.best.woman == FALSE,]$hh.spen[match (Child.W3$w3.hhid, Spen.IndD.W3$w3.hhid) ]

# merge the z-scores into the Child data frame
Child.W3$w3.zhfa <- Individual.Derived.W3$w3.zhfa[match(Child.W3$pid, Individual.Derived.W3$pid)]
Child.W3$w3.zwfh <- Individual.Derived.W3$w3.zwfh[match(Child.W3$pid, Individual.Derived.W3$pid)]
Child.W3$w3.zwfa <- Individual.Derived.W3$w3.zwfa[match(Child.W3$pid, Individual.Derived.W3$pid)]
Child.W3$w3.zbmi <- Individual.Derived.W3$w3.zbmi[match(Child.W3$pid, Individual.Derived.W3$pid)]
Child.W3$w3.fwag <- Individual.Derived.W3$w3.fwag[match(Child.W3$pid, Individual.Derived.W3$pid)]

# merge household income, parent education
Child.W3$w3.fwag <- Individual.Derived.W3$w3.fwag[match(Child.W3$pid, Individual.Derived.W3$pid)]
Child.W3$w3.h.tinc <- Household.Questionnaire.W3$w3.h.tinc[match(Child.W3$w3.hhid, Household.Questionnaire.W3$w3.hhid)]
Child.W3$w3.best.edu <- Individual.Derived.W3$w3.best.edu[match(Child.W3$w3.c.respid, Individual.Derived.W3$pid)]
Child.W3$w3.best.age.yrs <- Individual.Derived.W3$w3.best.age.yrs[match(Child.W3$w3.c.respid, Individual.Derived.W3$pid)]
#### see what other covariates can be used ####


######
#### AFTER EVERYTHING IS DONE, ANALYSE ALL NEWLY CREATED VARIABLES
######

# save the transformed pdata.frame to a file
save(Child.W3, file = "transformed.Child.W3.RData")