# haven.r
# ----------------------------------------------------
# import SPSS of Stata files using the haven package
#
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(haven)

# read SAS source files
child1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/ChildW1AnonV5_3.sas7bdat')
child2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/ChildW2AnonV2_3.sas7bdat')
child3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/ChildW3AnonV1_3.sas7bdat')

# add wave indentifier
child1 <- cbind(wave = 1, child1)
child2 <- cbind(wave = 2, child2)
child3 <- cbind(wave = 3, child3)

# remove the wave indication from variable names
names(child1) <- gsub('^w[1-3].', "", names(child1) )
names(child2) <- gsub('^w[1-3].', "", names(child2) )
names(child3) <- gsub('^w[1-3].', "", names(child3) )

# merge data.frames by 'pid' variable (Person ID)
child12 <- merge(child1, child2, by = 'pid')
child <- merge(child12, child3, by = 'pid')

# save results
save(file = 'data/child_sas.RData', child)

