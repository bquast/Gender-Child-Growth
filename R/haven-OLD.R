# haven.r
# ----------------------------------------------------
# import SAS files (sab7bdat) using the haven package
#
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(magrittr)
library(haven)
library(dplyr)
library(tidyr)

# read SAS source files
child1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/ChildW1AnonV5_3.sas7bdat')
child2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/ChildW2AnonV2_3.sas7bdat')
child3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/ChildW3AnonV1_3.sas7bdat')
indiv1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/indderivedW1AnonV5_3.sas7bdat')
indiv2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/indderivedW2AnonV2_3.sas7bdat')
indiv3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/indderivedW3AnonV1_3.sas7bdat')
house1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/hhderivedW1AnonV5_3.sas7bdat')
house2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/hhderivedW2AnonV2_3.sas7bdat')
house3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/hhderivedW3AnonV1_3.sas7bdat')
adult1 <- read_sas(b7dat = 'data/nids-v1-2008-v5.3-20150619-sas/AdultW1AnonV5_3.sas7bdat')
adult2 <- read_sas(b7dat = 'data/nids-w2-2010-2012-2.3-20150619-sas/AdultW2AnonV2_3.sas7bdat')
adult3 <- read_sas(b7dat = 'data/nids-w3-2012-v1.3-20150619-sas/AdultW3AnonV1_3.sas7bdat')

# put in long form
child1 %<>% gather(key, value, -pid)
child2 %<>% gather(key, value, -pid)
child3 %<>% gather(key, value, -pid)
indiv1 %<>% gather(key, value, -pid)
indiv2 %<>% gather(key, value, -pid)
indiv3 %<>% gather(key, value, -pid)

# add wave indicator variable
child1 %<>% cbind(wave = 1)
child2 %<>% cbind(wave = 2)
child3 %<>% cbind(wave = 3)
indiv1 %<>% cbind(wave = 1)
indiv2 %<>% cbind(wave = 2)
indiv3 %<>% cbind(wave = 3)

# combine data.frames
child <- rbind(child1, child2, child3)
indiv <- rbind(indiv1, indiv2, indiv3)

# remove wave indicator from variable name
child$key %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
indiv$key %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )

# put in wide form
child %<>% spread(key, value)
indiv %<>% spread(key, value)

# put into panel data frame
library(plm)
child %<>% pdata.frame(index = c('pid', 'wave'))
indiv %<>% pdata.frame(index = c('pid', 'wave'))

# save data
save(file = 'data/child.RData', child)
save(file = 'data/indiv.RData', indiv)

# merge
childindiv <- merge(child, indiv, by = c('pid', 'wave'))

# save merged data
save(file = 'data/childindiv.RData', childindiv)
