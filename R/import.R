# import.R
# --------------------------------------------
# instructions for importing data
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(haven)


# read SAS source files
adult1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/AdultW1AnonV5_3.sas7bdat')
adult2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/AdultW2AnonV2_3.sas7bdat')
adult3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/AdultW3AnonV1_3.sas7bdat')
child1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/ChildW1AnonV5_3.sas7bdat')
child2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/ChildW2AnonV2_3.sas7bdat')
child3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/ChildW3AnonV1_3.sas7bdat')
indiv1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/indderivedW1AnonV5_3.sas7bdat')
indiv2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/indderivedW2AnonV2_3.sas7bdat')
indiv3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/indderivedW3AnonV1_3.sas7bdat')
hhder1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/hhderivedW1AnonV5_3.sas7bdat')
hhder2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/hhderivedW2AnonV2_3.sas7bdat')
hhder3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/hhderivedW3AnonV1_3.sas7bdat')


# save to file
save.image(file = 'data/imported.RData')
