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

#### CHECK THESE FOR WARNINGS #####
# filter out the missing value codes and write them to separate variables
attach(Child.W1)
Child.W1$w1.c.dob.y.c <- ifelse(w1.c.dob.y >= 2009, w1.c.dob.y, NA)
Child.W1$w1.c.dob.y <- ifelse(w1.c.dob.y <= 2008, w1.c.dob.y, NA)
Child.W1$w1.c.dob.m.c <- ifelse(w1.c.dob.m >= 13, w1.c.dob.m, NA)
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

# save the transformed pdata.frame to a file
save(transformed, file = "transformed.RData")