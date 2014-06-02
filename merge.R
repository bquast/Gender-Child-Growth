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
load('transformed.Child.W3.RData')

# MERGE THE WAVES

Child.W12 <- merge( Child.W1, Child.W2, by= 'pid' )
Child <- merge( Child.W12, Child.W3, by= 'pid')
head(Child)
# w123_child <- merge(w12_child, w3_child, by="pid")
# head(w123_child)


# convert to long format
Child.Long <- melt(Child, id.var="pid")
head(Child.Long)

## extract the wave indicatio in variable names
all(grepl("^w[1-3].*", as.character(Child.Long$variable)))
Child.Long$wave <- as.numeric(gsub("^w([1-3]).*","\\1", as.character(Child.Long$variable)))

## remove the wave indication in variable names
Child.Long$variable2 <- gsub("^w[1-3].","", as.character(Child.Long$variable))

## back in wide for plm
Child.Wide <- dcast(Child.Long[, c("pid", "variable2", "value", "wave")], pid+wave~variable2)
Child.Wide[1:5,1:7]

# save the finished data.frame
save(Child.Wide, file="Child.Wide.RData")

# levels(w12_child_long$variable)[!grepl("^w[1-3]",
#                                        levels(w12_child_long$variable))]
# levels(w12_child_long$variable)[grepl("\\.[xy]$",
#                                      levels(w12_child_long$variable))]

# some analysis of variables
typeof(Child.Wide$wave)
typeof(Child.Wide$pid)

typeof(Child.Wide$zbmi)
typeof(Child.Wide$zhfa)
typeof(Child.Wide$zwfa)
typeof(Child.Wide$zwfh)

typeof(Child.Wide$spen.d.w)
typeof(Child.Wide$spen.d.m)

typeof(Child.Wide$c.age.d)
typeof(Child.Wide$c.age.m)

typeof(Child.Wide$a.spen)

typeof(Child.Wide$h.tinc)
typeof(Child.Wide$best.edu)
typeof(Child.Wide$fwag)



# encode data types as numeric
# IMPORTANT ENCODES SPEN AS INTEGER
Child.Wide$wave <- as.integer(Child.Wide$wave)

Child.Wide$zbmi <- as.double(Child.Wide$zbmi)
Child.Wide$zhfa <- as.double(Child.Wide$zhfa)
Child.Wide$zwfa <- as.double(Child.Wide$zwfa)
Child.Wide$zwfh <- as.double(Child.Wide$zwfh)

Child.Wide$spen.d.m <- as.logical(Child.Wide$spen.d.m) 
Child.Wide$spen.d.w <- as.logical(Child.Wide$spen.d.w) 

Child.Wide$a.spen <- as.double(Child.Wide$a.spen)
Child.Wide$a.spen.w <- as.double(Child.Wide$a.spen.w)
Child.Wide$a.spen.m <- as.double(Child.Wide$a.spen.m)
Child.Wide$id.spen <- as.double(Child.Wide$id.spen)
Child.Wide$id.spen.w <- as.double(Child.Wide$id.spen.w)
Child.Wide$id.spen.m <- as.double(Child.Wide$id.spen.m)


Child.Wide$c.age.d <- as.integer(Child.Wide$c.age.d)
Child.Wide$c.age.m <- as.integer(Child.Wide$c.age.m)

Child.Wide$woman.60 <- as.logical(Child.Wide$woman.60) 
Child.Wide$man.60 <- as.logical(Child.Wide$man.60) 
Child.Wide$woman.65 <- as.logical(Child.Wide$woman.65) 
Child.Wide$man.65 <- as.logical(Child.Wide$man.65) 
Child.Wide$woman.60.65 <- as.logical(Child.Wide$woman.60.65) 
Child.Wide$man.60.65 <- as.logical(Child.Wide$man.60.65) 


Child.Wide$h.tinc <- as.double(Child.Wide$h.tinc)
Child.Wide$best.edu <- as.factor(Child.Wide$best.edu)




# create time effect dummy
Child.Wide$elig.men.60 <- ifelse(Child.Wide$wave == 2 | Child.Wide$wave == 3, TRUE, FALSE)


# declare panel data frame
Child.Panel <- pdata.frame(Child.Wide, index=c("pid","wave"))


# save the data
save(Child.Panel, file='Child.Panel.RData')
save(Child.Wide, file='Child.Wide.RData')