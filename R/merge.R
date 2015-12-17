# merge.R
# --------------------------------------------
# instructions for merging data
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(magrittr)
library(haven)
library(dplyr)
library(tidyr)


# load data
load('data/imported.RData')

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


# save to file
save(adult, child, hhder, indiv)