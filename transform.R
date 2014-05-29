# transform.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for transforming the imported object to a tidy data frame

# install and load the required packages
install.packages('reshape2')
install.packages('plm')
library(reshape2)
library(plm)

# construct a length-of-month object
month <- (3*365 + 366) / (4*12)

# load the imported RData file
load("imported.RData")

#### EVALUATE these variables before reencoding ####
summary(Child.W1$w1.c.dob.y)
summary(Child.W1$w1.c.dob.m)
summary(Child.W1$w1.c.intrv.y)
summary(Child.W1$w1.c.intrv.m)
summary(Child.W1$w1.c.intrv.d)
# and these also
summary(Child.W1$w1.c.height.1)
summary(Child.W1$w1.c.height.2)
summary(Child.W1$w1.c.height.3)
summary(Child.W1$w1.c.weight.1)
summary(Child.W1$w1.c.weight.2)
summary(Child.W1$w1.c.weight.3)
# also
summary(Child.W1$w1.c.gen)

# encode certain variables of type factor as numeric
Child.W1$w1.c.dob.m <- as.numeric(Child.W1$w1.c.dob.m)
Child.W1$w1.c.intrv.m <- as.numeric(Child.W1$w1.c.intrv.m)
Child.W1$w1.c.gen <- as.numeric(Child.W1$w1.c.gen)
Household.Roster.W1$w1.r.gen <- as.numeric(Household.Roster.W1$w1.r.gen)

#### CHECK THESE FOR WARNINGS #####
# filter out the missing value codes and write them to separate variables
attach(Child.W1)
Child.W1$w1.c.dob.y.c <- ifelse(w1.c.dob.y >= 2009, w1.c.dob.y, NA)
Child.W1$w1.c.dob.y <- ifelse(w1.c.dob.y <= 2008, w1.c.dob.y, NA)
Child.W1$w1.c.dob.m.c <- ifelse(Child.W1$w1.c.dob.m >= 13, w1.c.dob.m, NA)
Child.W1$w1.c.dob.m <- ifelse(w1.c.dob.m <= 12, w1.c.dob.m, NA)
Child.W1$w1.c.intrv.y.c <- ifelse(w1.c.intrv.y <= 0, w1.c.intrv.y, NA)
Child.W1$w1.c.intrv.y <- ifelse(w1.c.intrv.y >= 0, w1.c.intrv.y, NA)
Child.W1$w1.c.intrv.m.c <- ifelse(w1.c.intrv.m <= 0, w1.c.intrv.m, NA)
Child.W1$w1.c.intrv.m <- ifelse(w1.c.intrv.m >= 0, w1.c.intrv.m, NA)
Child.W1$w1.c.intrv.d.c <- ifelse(w1.c.intrv.d <= 0, w1.c.intrv.d, NA)
Child.W1$w1.c.intrv.d <- ifelse(w1.c.intrv.d >= 0, w1.c.intrv.d, NA)
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

# construct age in days and months
Child.W1$w1.c.intrv.dt <- as.Date(paste(Child.W1$w1.c.intrv.y, Child.W1$w1.c.intrv.m, Child.W1$w1.c.intrv.d, sep="-"))
Child.W1$w1.c.dob.dt <- as.Date(paste(Child.W1$w1.c.dob.y, Child.W1$w1.c.dob.m,1, sep="-"))
Child.W1$w1.c.age.d <- as.numeric(Child.W1$w1.c.intrv.dt - Child.W1$w1.c.dob.dt)
Child.W1$w1.c.age.m <- Child.W1$w1.c.age.d %/% month

# construct woman dummies
Child.W1$w1.c.woman <- Child.W1$w1.c.gen == 6
Household.Roster.W1$w1.r.woman <- Household.Roster.W1$w1.r.gen == 6
w1.woman <- Household.Roster.W1$pid[Household.Roster.W1$w1.r.woman == TRUE]
Individual.Derived.W1$w1.woman <- ifelse(Individual.Derived.W1$pid %in% w1.woman, TRUE, FALSE)
rm(w1.woman)


#### REDO this procedure with nominal instead of dummies ####

# construct woman and man pension dummies
# transform the pension variable into a dummy
#### REDO THIS DUMMY ASAP #################################################
Individual.Derived.W1$w1.spen.d <- ifelse(Individual.Derived.W1$w1.spen > 0, TRUE, FALSE)
# list the household IDs with a female pension recipient
w1.spen.d.w.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.spen.d == TRUE & Individual.Derived.W1$w1.woman == TRUE),]$w1.hhid
# list the household IDs with a male pension recipient
w1.spen.d.m.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.spen.d == TRUE & Individual.Derived.W1$w1.woman == FALSE),]$w1.hhid
# list the household IDs with awoman aged 60+
w1.woman.60.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.woman == TRUE & Individual.Derived.W1$w1.best.age.yrs >= 60),]$w1.hhid
# list the household IDs with a man agen 60+
w1.man.60.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.woman == FALSE & Individual.Derived.W1$w1.best.age.yrs >= 60),]$w1.hhid
# list the household IDs with a woman agen 65+
w1.woman.65.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.woman == TRUE & Individual.Derived.W1$w1.best.age.yrs >= 65),]$w1.hhid
# list the household IDs with a man agen 65+
w1.man.65.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.woman == FALSE & Individual.Derived.W1$w1.best.age.yrs >= 65),]$w1.hhid
# list the household IDs with a woman agen 60-64
w1.woman.60.65.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.woman == TRUE & Individual.Derived.W1$w1.best.age.yrs >= 60 & Individual.Derived.W1$w1.best.age.yrs < 65),]$w1.hhid
# list the household IDs with a man agen 60-64
w1.man.60.65.hhid <- Individual.Derived.W1[which(Individual.Derived.W1$w1.woman == FALSE & Individual.Derived.W1$w1.best.age.yrs >= 60 & Individual.Derived.W1$w1.best.age.yrs < 65),]$w1.hhid


# create a pension dummies in Child dataframe
Child.W1$w1.spen.d.w <- Child.W1$w1.hhid %in% w1.spen.d.w.hhid
Child.W1$w1.spen.d.m <- Child.W1$w1.hhid %in% w1.spen.d.m.hhid
Child.W1$w1.woman.60 <- Child.W1$w1.hhid %in% w1.woman.60.hhid
Child.W1$w1.man.60 <- Child.W1$w1.hhid %in% w1.man.60.hhid
Child.W1$w1.woman.65 <- Child.W1$w1.hhid %in% w1.woman.65.hhid
Child.W1$w1.man.65 <- Child.W1$w1.hhid %in% w1.man.65.hhid
#### ANALYSE these variables, add descriptions on top ####

#### MERGE household income, parent education, etc. ####

# save the transformed pdata.frame to a file
save(Child.W1, file = "transformed.Child.W1.RData")