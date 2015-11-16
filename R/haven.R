# haven.r
# ----------------------------------------------------
# import SAS files (sab7bdat) using the haven package
#
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(haven)

# read SAS source files
child1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/ChildW1AnonV5_3.sas7bdat')
indiv1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/indderivedW1AnonV5_3.sas7bdat')
house1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/hhderivedW1AnonV5_3.sas7bdat')
adult1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/AdultW1AnonV5_3.sas7bdat')

child2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/ChildW2AnonV2_3.sas7bdat')
child3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/ChildW3AnonV1_3.sas7bdat')

# remove the wave indication from variable names
names(child1) <- gsub('^w[1-3].', '', names(child1) )
names(indiv1) <- gsub('^w[1-3].', '', names(indiv1) )
names(house1) <- gsub('^w[1-3].', '', names(house1) )
names(adult1) <- gsub('^w[1-3].', '', names(adult1) )

names(child2) <- gsub('^w[1-3].', '', names(child2) )
names(child3) <- gsub('^w[1-3].', '', names(child3) )

# merge
childder1   <- merge(child1, indiv1, by = 'pid')
childhouse1 <- merge(child1, house1, by = 'hhid')
adulthouse1 <- merge(adult1, house1, by = 'hhid')

# add wave indentifier
childhouse1 <- cbind(wave = 1, childhouse1)
adulthouse1 <- cbind(wave = 1, adulthouse1)
# child1 <- cbind(wave = 1, child1)
# house1 <- cbind(wave = 1, house1)
# adult1 <- cbind(wave = 1, adult1)
# child2 <- cbind(wave = 2, child2)
# child3 <- cbind(wave = 3, child3)

# save results
save(file = 'data/child_sas.RData', child1, child2, child3)
