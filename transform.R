# transform.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for transforming the imported object to a tidy data frame

# install and load the required packages
install.packages('reshape2')
library(reshape2)

# construct a length-of-month object
month <- (3*365 + 366) / (4*12)

# load the imported RData file
load("imported.RData")

#### EVALUATE these variables before reencoding ####
summary(Child.W1$w1.c.height.1)

summary(Child.W1$w1.c.height.2)

summary(Child.W1$w1.c.height.3)
table(Child.W1$w1.c.height.3)
length(table(Child.W1$w1.c.height.3))
str(Child.W1$w1.c.height.3)

summary(Child.W1$w1.c.weight.1)

summary(Child.W1$w1.c.weight.2)

summary(Child.W1$w1.c.weight.3)
table(Child.W1$w1.c.weight.3)
length(table(Child.W1$w1.c.weight.3))
str(Child.W1$w1.c.weight.3)

# encode month factor variables as numeric
Child.W1$w1.c.dob.m <- as.numeric(Child.W1$w1.c.dob.m)
Child.W1$w1.c.intrv.m <- as.numeric(Child.W1$w1.c.intrv.m)

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

# construct age in days and months
Child.W1$w1.c.intrv.dt <- as.Date(paste(Child.W1$w1.c.intrv.y, Child.W1$w1.c.intrv.m, Child.W1$w1.c.intrv.d, sep="-"))
Child.W1$w1.c.dob.dt <- as.Date(paste(Child.W1$w1.c.dob.y, Child.W1$w1.c.dob.m,1, sep="-"))
Child.W1$w1.c.age.d <- as.numeric(Child.W1$w1.c.intrv.dt - Child.W1$w1.c.dob.dt)
Child.W1$w1.c.age.m <- Child.W1$w1.c.age.d %/% month
#### analyse these created variables and describe them above ####

# construct woman dummies
Child.W1$w1.c.woman <- Child.W1$w1.c.gen == 6
Household.Roster.W1$w1.r.woman <- Household.Roster.W1$w1.r.gen == 6
Individual.Derived.W1$w1.best.gen <- ifelse(as.numeric(Individual.Derived.W1$w1.best.gen) %in% 5:6, Individual.Derived.W1$w1.best.gen, NA)
Individual.Derived.W1$w1.best.woman <- Individual.Derived.W1$w1.best.gen == 6


#### REDO this procedure with nominal values in stead of dummies ####

# transform the pension variable into a dummy
Individual.Derived.W1$w1.spen.d <- ifelse(is.na(Individual.Derived.W1$w1.spen), FALSE, TRUE)

# construct woman and man pension dummies
## possibly redo this with the match function ##

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

# the match function from the old transformations
# w1_child$w1_zhfa <- w1_indderived$w1_zhfa[match(w1_child$pid, w1_indderived$pid)]

# create dataframe of household pension income (by gender)
Spen.W1 <- ddply(Individual.Derived.W1, .(w1.hhid, w1.best.woman), summarize, hh.spen = sum(w1.spen))
Child.W1$w1.spen <- Spen.W1$hh.spen[match (Child.W1$w1.hhid, Spen.W1$w1.hhid) ]
Child.W1$w1.spen.w <- Spen.W1[Spen.W1$w1.best.woman == TRUE,]$hh.spen[match (Child.W1$w1.hhid, Spen.W1$w1.hhid) ]
Child.W1$w1.spen.m <- Spen.W1[Spen.W1$w1.best.woman == FALSE,]$hh.spen[match (Child.W1$w1.hhid, Spen.W1$w1.hhid) ]

# create pension dummies in Child data frame
Child.W1$w1.spen.d.w <- Child.W1$w1.hhid %in% w1.spen.d.w.hhid
Child.W1$w1.spen.d.m <- Child.W1$w1.hhid %in% w1.spen.d.m.hhid
Child.W1$w1.woman.60 <- Child.W1$w1.hhid %in% w1.woman.60.hhid
Child.W1$w1.man.60 <- Child.W1$w1.hhid %in% w1.man.60.hhid
Child.W1$w1.woman.65 <- Child.W1$w1.hhid %in% w1.woman.65.hhid
Child.W1$w1.man.65 <- Child.W1$w1.hhid %in% w1.man.65.hhid
#### ANALYSE these variables, add descriptions above each line ####

#### MERGE household income, parent education, etc. ####

# save the transformed pdata.frame to a file
save(Child.W1, file = "transformed.Child.W1.RData")