# merge.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for merging the waves into a tidy data frame

# load packages
library(dplyr)
library(tidyr)
library(plm)

# load the data
load('transformed.Child.W1.RData')
load('transformed.Child.W2.RData')
load('transformed.Child.W3.RData')

# merge the waves
Child.W12 <- merge( Child.W1, Child.W2, by='pid' )
Child <- merge( Child.W12, Child.W3, by='pid')

# convert to long format
Child.Long <- gather(Child, variable, value, -pid)

# extract the wave indicators in variable names
# and write these to a new variable: wave
Child.Long$wave <- as.numeric(gsub('^w([1-3]).*','\\1', as.character(Child.Long$variable)))

# remove the wave indication in variable names
Child.Long$variable <- gsub('^w[1-3].', "", as.character(Child.Long$variable) )

# to wide format
Child.Wide <- spread(Child.Long, variable, value)

# encode data types as numeric
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
Child.Wide$woman.60.64 <- as.logical(Child.Wide$woman.60.64) 
Child.Wide$man.60.64 <- as.logical(Child.Wide$man.60.64) 
Child.Wide$h.tinc <- as.double(Child.Wide$h.tinc)
Child.Wide$best.edu <- as.factor(Child.Wide$best.edu)

# create time effect dummy
Child.Wide$elig.men.60 <- ifelse(Child.Wide$wave == 2 | Child.Wide$wave == 3, TRUE, FALSE)

# declare panel data frame
Child.Panel <- pdata.frame(Child.Wide, index=c("pid","wave"))

# save the data
save(Child.Panel, file='Child.Panel.RData')
save(Child.Wide, file='Child.Wide.RData')