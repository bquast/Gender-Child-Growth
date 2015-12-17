# alternative haven.R
# Bastiaan Quast


# load libraries
library(magrittr)
library(haven)
library(dplyr)
library(tidyr)


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


# now subset all to the important variables

# homogenise some variable names across waves
names(hhder1)[9] <- 'hhimprent' # instead of hhimprent_exp


## create a list of variables for each type of data.frame
vars_adult <- c('hhid,',      # household ID
                'pid,',       # person ID
                'aspen',      # state persion
                'incgovpen',  # income government persion
                'incgovpen_v',
                'incppen',    # income personal pension
                'incppen_v')   
vars_child <- c('hhid',       # household ID
                'pid')        # person ID
vars_indiv <- c('hhid',       # household ID
                'pid',        # person ID
                'best_race',  # race
                'best_gen',   # gender 
                'best_dob_m', # date of birth: month
                'best_dob_y', # date of brith: year
                'best_edu',   # best education
                'zhfa',       # z-score height-for-age 
                'zwfa',       # z-score weight-for-age
                'zbmi',       # z-score BMI
                'zwfh')       # z-score weight-for-height
vars_hhder <- c('hhid',       # household ID
                'hhincome',   # household income
                'expf',       # expenditure food?
                'expnf',      # expenditure non-food?
                'expenditure',# expenditure
                'hhgeo2011',  # geo location for 2011
                'rentexpend', # rent expenditure
                'hhimprent', # imputed rent expenditure
                'hhagric')    # agricultural household
    

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
names(hhder1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(hhder2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(hhder3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )

## subset to relevant variables
child1 %<>% subset(select=vars_child)
child2 %<>% subset(select=vars_child)
child3 %<>% subset(select=vars_child)
hhder1 %<>% subset(select=vars_hhder)
hhder2 %<>% subset(select=vars_hhder)
hhder3 %<>% subset(select=vars_hhder)

## add wave indicator
child1 %<>% cbind(wave = 1)
child2 %<>% cbind(wave = 2)
child3 %<>% cbind(wave = 3)
hhder1 %<>% cbind(wave = 1)
hhder2 %<>% cbind(wave = 2)
hhder3 %<>% cbind(wave = 3)

## merge
child <- rbind(child1, child2, child3)
hhder <- rbind(hhder1, hhder2, hhder3)


# recode some things

## gender to woman

## some to dummies e.g. spen
