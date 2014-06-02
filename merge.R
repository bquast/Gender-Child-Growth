# merge.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for merging the waves into a tidy data frame


# instal and load packages
install.packages('reshape2')
library(reshape2)
install.packages('plm')
library(plm)

# load the data
load('transformed.Child.W1.RData')
load('transformed.Child.W2.RData')

# MERGE THE WAVES

Child.W12 <- merge(Child.W1, Child.W2, by="pid")
head(Child.W12)
# w123_child <- merge(w12_child, w3_child, by="pid")
# head(w123_child)


# convert to long format
Child.W12.Long <- melt(Child.W12, id.var="pid")
head(Child.W12.Long)

## extract the wave indicatio in variable names
all(grepl("^w[1-2].*", as.character(Child.W12.Long$variable)))
Child.W12.Long$wave <- as.numeric(gsub("^w([1-3]).*","\\1", as.character(Child.W12.Long$variable)))

## remove the wave indication in variable names
Child.W12.Long$variable2 <- gsub("^w[1-3].","", as.character(Child.W12.Long$variable))

## back in wide for plm
Child.W12.Wide <- dcast(Child.W12.Long[, c("pid", "variable2", "value", "wave")], pid+wave~variable2)
Child.W12.Wide[1:5,1:7]

# save the finished data.frame
save(Child.W12.Wide, file="Child.Wide.RData")

# levels(w12_child_long$variable)[!grepl("^w[1-3]",
#                                        levels(w12_child_long$variable))]
# levels(w12_child_long$variable)[grepl("\\.[xy]$",
#                                      levels(w12_child_long$variable))]

# small cleanup
rm(Child.W12)
rm(Child.W12.Long)

# some analysis of variables
typeof(Child.W12.Wide$wave)
typeof(Child.W12.Wide$pid)

typeof(Child.W12.Wide$zbmi)
typeof(Child.W12.Wide$zhfa)
typeof(Child.W12.Wide$zwfa)
typeof(Child.W12.Wide$zwfh)

typeof(Child.W12.Wide$spen.d.w)
typeof(Child.W12.Wide$spen.d.m)

typeof(Child.W12.Wide$c.age.d)
typeof(Child.W12.Wide$c.age.m)

typeof(Child.W12.Wide$a.spen)

typeof(Child.W12.Wide$h.tinc)
typeof(Child.W12.Wide$best.edu)
typeof(Child.W12.Wide$fwag)



# encode data types as numeric
# IMPORTANT ENCODES SPEN AS INTEGER
Child.W12.Wide$wave <- as.integer(Child.W12.Wide$wave)

Child.W12.Wide$zbmi <- as.double(Child.W12.Wide$zbmi)
Child.W12.Wide$zhfa <- as.double(Child.W12.Wide$zhfa)
Child.W12.Wide$zwfa <- as.double(Child.W12.Wide$zwfa)
Child.W12.Wide$zwfh <- as.double(Child.W12.Wide$zwfh)

Child.W12.Wide$spen.d.m <- as.logical(Child.W12.Wide$spen.d.m) 
Child.W12.Wide$spen.d.w <- as.logical(Child.W12.Wide$spen.d.w) 

Child.W12.Wide$a.spen <- as.double(Child.W12.Wide$a.spen)
Child.W12.Wide$a.spen.w <- as.double(Child.W12.Wide$a.spen.w)
Child.W12.Wide$a.spen.m <- as.double(Child.W12.Wide$a.spen.m)
Child.W12.Wide$id.spen <- as.double(Child.W12.Wide$id.spen)
Child.W12.Wide$id.spen.w <- as.double(Child.W12.Wide$id.spen.w)
Child.W12.Wide$id.spen.m <- as.double(Child.W12.Wide$id.spen.m)


Child.W12.Wide$c.age.d <- as.integer(Child.W12.Wide$c.age.d)
Child.W12.Wide$c.age.m <- as.integer(Child.W12.Wide$c.age.m)

Child.W12.Wide$woman.60 <- as.logical(Child.W12.Wide$woman.60) 
Child.W12.Wide$man.60 <- as.logical(Child.W12.Wide$man.60) 
Child.W12.Wide$woman.65 <- as.logical(Child.W12.Wide$woman.65) 
Child.W12.Wide$man.65 <- as.logical(Child.W12.Wide$man.65) 
Child.W12.Wide$woman.60.65 <- as.logical(Child.W12.Wide$woman.60.65) 
Child.W12.Wide$man.60.65 <- as.logical(Child.W12.Wide$man.60.65) 


Child.W12.Wide$h.tinc <- as.double(Child.W12.Wide$h.tinc)
Child.W12.Wide$best.edu <- as.factor(Child.W12.Wide$best.edu)




# create time effect dummy
Child.W12.Wide$elig.men.60 <- ifelse(Child.W12.Wide$wave == 2 | Child.W12.Wide$wave == 3, TRUE, FALSE)


# declare panel data frame
Child.Panel <- pdata.frame(Child.W12.Wide, index=c("pid","wave"))


# save the data
save(Child.Panel, file='Child.Panel.RData')
save(Child.W12.Wide, file='Child.Wide.RData')