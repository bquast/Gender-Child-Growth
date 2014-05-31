# merge.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for merging the waves into a tidy data frame


# instal and load packages
install.packages('reshape2')
library(reshape2)
install.packages('plm')
library(plm)

## MERGE THE WAVES

Child.W12 <- merge(Child.W1, Child.W2, by="pid")
head(Child.W12)
# w123_child <- merge(w12_child, w3_child, by="pid")
# head(w123_child)


# convert to long format
Child.W12.long <- melt(Child.W12, id.var="pid")
head(Child.W12.long)

## extract the wave indicatio in variable names
all(grepl("^w[1-2].*", as.character(Child.W12.long$variable))) # check
Child.W12.long$wave <- as.numeric(gsub("^w([1-3]).*","\\1",
                                        as.character(Child.W12.long$variable)))

## remove the wave indication in variable names
Child.W12.long$variable2 <- gsub("^w[1-3].","",
                                  as.character(Child.W12.long$variable))



## back in wide for plm
Child.W12.wide <- dcast(Child.W12.long[, c("pid", "variable2",
                                             "value", "wave")], pid+wave~variable2)
Child.W12.wide[1:5,1:7]

# save the finished data.frame
save(Child.W12.wide, file="Child.Wide.RData")

# levels(w12_child_long$variable)[!grepl("^w[1-3]",
#                                        levels(w12_child_long$variable))]
# levels(w12_child_long$variable)[grepl("\\.[xy]$",
#                                      levels(w12_child_long$variable))]

rm(Child.W12)
rm(Child.W12.long)

################# not looked at this bit yet ##########
# encode data types as numeric
# IMPORTANT ENCODES SPEN AS INTEGER
w123_child_wide$wave <- as.integer(w123_child_wide$wave)
w123_child_wide$pid <- as.integer(w123_child_wide$pid)

w123_child_wide$w_zbmi <- as.double(w123_child_wide$w_zbmi)
w123_child_wide$w_zhfa <- as.double(w123_child_wide$w_zhfa)
w123_child_wide$w_zwfa <- as.double(w123_child_wide$w_zwfa)
w123_child_wide$w_zwfh <- as.double(w123_child_wide$w_zwfh)
w123_child_wide$w_spen_m <- as.factor(w123_child_wide$w_spen_m) 
w123_child_wide$w_spen_w <- as.factor(w123_child_wide$w_spen_w) 
w123_child_wide$w_c_age_d <- as.double(w123_child_wide$w_c_age_d)
w123_child_wide$w_c_age_m <- as.double(w123_child_wide$w_c_age_m)

w123_child_wide$w_h_tinc <- as.double(w123_child_wide$w_h_tinc)
w123_child_wide$w_best_edu <- as.factor(w123_child_wide$w_best_edu)

# create time effect dummy
w123_child_wide$elig.men.60 <- ifelse(w123_child_wide$wave == 2 | w123_child_wide$wave == 3, 1, 0)

# check object types
typeof(w123_child_wide$pid)
typeof(w123_child_wide$wave)

typeof(w123_child_wide$w_zbmi)
typeof(w123_child_wide$w_zhfa)
typeof(w123_child_wide$w_zwfa)
typeof(w123_child_wide$w_zwfh)
typeof(w123_child_wide$w_spen_m)
typeof(w123_child_wide$w_spen_w)
typeof(w123_child_wide$w_c_age_d)
typeof(w123_child_wide$w_c_age_m)

typeof(w123_child_wide$w_h_tinc)
typeof(w123_child_wide$w_best_edu)
###################### until here ##################

# declare panel data frame
Child.Panel <- pdata.frame(Child.W12.wide, index=c("pid","wave"))
save(Child.Panel, file="Child.Panel.RData")


# save the data
save.image("Child.Wide.RData")


# another test
table(table(Child.W12.wide$wave))