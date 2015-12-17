# alternative haven.R
# Bastiaan Quast

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

# now subset all to the important variables

## create a list of variables for each type of data.frame
vars_child <- c('hhid', 'pid')

## subset to relevant variables
child1 %<>% subset(select=vars_child)
child2 %<>% subset(select=vars_child)
child3 %<>% subset(select=vars_child)

## add wave indicator
child1 %<>% cbind(wave = 1)
child2 %<>% cbind(wave = 2)
child3 %<>% cbind(wave = 3)

## remove wave indicator from variable names
names(child1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(child2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(child3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )

## merge
child <- rbind(child1, child2, child3)
