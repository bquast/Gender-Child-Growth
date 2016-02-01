# merge.R
# --------------------------------------------
# instructions for merging data
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(magrittr)
library(dplyr)
library(plm)


# load data
load('data/imported.RData')


# now subset all to the important variables and merge

## homogenise some variable names across waves
names(hhder1)[9] <- 'hhimprent' # instead of hhimprent_exp
names(adult3)[372] <- 'a_incppen' # instead of a_incret
names(adult3)[373] <- 'a_incppen_v'# instead of a_incret_v

## recode variable if recorded differently in waves
child3$w3_c_mthhh <- ifelse(child3$w3_c_mthhh_pid > 0, 1, 2)
child3$w3_c_fthhh <- ifelse(child3$w3_c_fthhh_pid > 0, 1, 2)


## create a list of variables for each type of data.frame
vars_adult <- c('hhid',         # household ID
                'pid',          # person ID
                'a_gen',        # gender
                'a_aspen',      # state persion
                'a_incgovpen',  # income government persion
                'a_incgovpen_v',
                'a_incppen',    # income personal pension
                'a_incppen_v')   

vars_child <- c('hhid',       # household ID
                'pid',        # person ID
                'c_intrv_y',  # interview year
                'c_intrv_m',  # interview month
                'c_intrv_d',  # interview day
                'c_gen',      # gender
                'c_dob_m',    # date-of-birth month
                'c_dob_y',    # date-of-birth year
                'c_hlthdes',  # perceived health status
                'c_mthali',   # mother alive
                'c_fthali',   # father alive
                'c_mthhh',    # mother in household
                'c_fthhh',    # father in household
                'c_mthtrt',   # mother secondary school
                'c_fthtrt')   # father secondary school

vars_hhder <- c('hhid',       # household ID
                'hhincome',   # household income
                'expf',       # expenditure food?
                'expnf',      # expenditure non-food?
                'expenditure',# expenditure
                'hhgeo2011',  # geo location for 2011
                'rentexpend', # rent expenditure
                'hhimprent',  # imputed rent expenditure
                'hhagric')    # agricultural household

vars_inder <- c('hhid',       # household ID
                'pid',        # person ID
                'best_age_yrs',# best age years
                'best_race',  # race
                'best_gen',   # gender 
                'best_dob_m', # date of birth: month
                'best_dob_y', # date of brith: year
                'best_edu',   # best education
                'best_mthpid',# mother person ID
                'best_fthpid',# father person ID
                'fwag',       # monthly income primary and secondary job
                'cwag',       # monthly income casual work
                'swag',       # monthly income self-employment
                'chld',       # child support grant
                'fost',       # foster care grant
                'spen',       # old age state pension (RSA)
                'spen_flg',   # data old age state pension (RSA)
                'ppen',       # month income private / foreign pension
                'ppen_flg',   # data monthly income private / foreign pension
                'uif',        # montly income UIF payments (unemployment)
                'remt',       # monthly income remittances
                'zhfa',       # z-score height-for-age 
                'zwfa',       # z-score weight-for-age
                'zbmi',       # z-score BMI
                'zwfh')       # z-score weight-for-height

## household questionnaire
## w1_h_nfalc           # e2_1_2 - Household spent on beer, wine and spirits in the last 30 days
## w1_h_nfalcspn        # e2_2_2 - Amount spent on beer, wine and spirits in last 30 days

## remove wave indicator from variable names
names(adult1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(adult2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(adult3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
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
names(inder1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(inder2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(inder3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )

## subset to relevant variables
adult1 %<>% subset(select=vars_adult)
adult2 %<>% subset(select=vars_adult)
adult3 %<>% subset(select=vars_adult)
child1 %<>% subset(select=vars_child)
child2 %<>% subset(select=vars_child)
child3 %<>% subset(select=vars_child)
hhder1 %<>% subset(select=vars_hhder)
hhder2 %<>% subset(select=vars_hhder)
hhder3 %<>% subset(select=vars_hhder)
inder1 %<>% subset(select=vars_inder)
inder2 %<>% subset(select=vars_inder)
inder3 %<>% subset(select=vars_inder)

## add wave indicator
adult1 %<>% cbind(wave = 1)
adult2 %<>% cbind(wave = 2)
adult3 %<>% cbind(wave = 3)
child1 %<>% cbind(wave = 1)
child2 %<>% cbind(wave = 2)
child3 %<>% cbind(wave = 3)
hhder1 %<>% cbind(wave = 1)
hhder2 %<>% cbind(wave = 2)
hhder3 %<>% cbind(wave = 3)
inder1 %<>% cbind(wave = 1)
inder2 %<>% cbind(wave = 2)
inder3 %<>% cbind(wave = 3)

## merge inter-temporal
adult <- rbind(adult1, adult2, adult3)
child <- rbind(child1, child2, child3)
hhder <- rbind(hhder1, hhder2, hhder3)
inder <- rbind(inder1, inder2, inder3)


# recode certain variables

## gender numeric to woman logical
adult$a_woman <- ifelse(adult$a_gen == 2, TRUE, FALSE)
child$c_woman <- ifelse(child$c_gen == 2, TRUE, FALSE)
inder$woman   <- ifelse(inder$best_gen == 2, TRUE, FALSE)
inder$spen    <- ifelse(is.na(inder$spen), 0, inder$spen)
inder$ppen    <- ifelse(is.na(inder$ppen), 0, inder$ppen)
## state pension numeric to logical
adult$a_incgovpen   <- ifelse(adult$a_incgovpen <  0, NA, adult$a_incgovpen)
adult$a_incgovpen_l <- ifelse(adult$a_incgovpen == 2, TRUE, FALSE)
## state pension value NA to zero
adult$a_incgovpen_v <- ifelse(adult$a_incgovpen_v < 0, NA, adult$a_incgovpen_v)
adult$a_incgovpen_v <- ifelse(is.na(adult$a_incgovpen_v), 0, adult$a_incgovpen_v)
## post treatment dummy
child$post_treatment <- ifelse(child$wave == 1, FALSE, TRUE)


# save data
save(file = 'data/adult.RData', adult)
save(file = 'data/child.RData', child)
save(file = 'data/hhder.RData', hhder)
save(file = 'data/inder.RData', inder)


# create pension variables in child 
inder %>%
  filter(woman==TRUE)  %>%
  group_by(hhid, wave) %>%
  summarise(spen_woman = sum(spen))       -> spen_woman
inder %>%
  filter(woman==TRUE)  %>%
  filter(best_age_yrs >= 60 & best_age_yrs < 65) %>%
  group_by(hhid, wave) %>%
  summarise(spen_woman_60_65 = sum(spen)) -> spen_woman_60_65
inder %>%
  filter(woman==TRUE)  %>%
  filter(best_age_yrs >= 65) %>%
  group_by(hhid, wave) %>%
  summarise(spen_woman_65 = sum(spen))    -> spen_woman_65
inder %>%
  filter(woman==FALSE) %>%
  group_by(hhid, wave) %>%
  summarise(spen_man = sum(spen))         -> spen_man
inder %>%
  filter(woman==FALSE) %>%
  filter(best_age_yrs >= 60 & best_age_yrs < 65) %>%
  group_by(hhid, wave) %>%
  summarise(spen_man_60_65 = sum(spen))   -> spen_man_60_65
inder %>%
  filter(woman==FALSE) %>%
  filter(best_age_yrs >= 65) %>%
  group_by(hhid, wave) %>%
  summarise(spen_man_65 = sum(spen))      -> spen_man_65
inder %>%
  filter(woman==TRUE) %>%
  group_by(hhid, wave) %>%
  summarise(ppen_woman = sum(ppen))       -> ppen_woman
inder %>%
  filter(woman==FALSE) %>%
  group_by(hhid, wave) %>%
  summarise(ppen_man = sum(ppen))         -> ppen_man


# put into panel data.frame (pdata.frame)
adult            %<>% pdata.frame(index = c('pid',  'wave'))
child            %<>% pdata.frame(index = c('pid',  'wave'))
inder            %<>% pdata.frame(index = c('pid',  'wave'))
hhder            %<>% pdata.frame(index = c('hhid', 'wave'))
spen_woman       %<>% pdata.frame(index = c('hhid', 'wave'))
spen_woman_60_65 %<>% pdata.frame(index = c('hhid', 'wave'))
spen_woman_65    %<>% pdata.frame(index = c('hhid', 'wave'))
spen_man         %<>% pdata.frame(index = c('hhid', 'wave'))
spen_man_60_65   %<>% pdata.frame(index = c('hhid', 'wave'))
spen_man_65      %<>% pdata.frame(index = c('hhid', 'wave'))


# merge pension variables into child data.frame
child <- merge(child, spen_woman,       by = c('hhid', 'wave'), all.x = TRUE)
child <- merge(child, spen_woman_60_65, by = c('hhid', 'wave'), all.x = TRUE)
child <- merge(child, spen_woman_65,    by = c('hhid', 'wave'), all.x = TRUE)
child <- merge(child, spen_man,         by = c('hhid', 'wave'), all.x = TRUE)
child <- merge(child, spen_man_60_65,   by = c('hhid', 'wave'), all.x = TRUE)
child <- merge(child, spen_man_65,      by = c('hhid', 'wave'), all.x = TRUE)

# change missing to zero
child$spen_woman       <- ifelse(is.na(child$spen_woman),       0, child$spen_woman)
child$spen_woman_60_65 <- ifelse(is.na(child$spen_woman_60_65), 0, child$spen_woman_60_65)
child$spen_woman_65    <- ifelse(is.na(child$spen_woman_65),    0, child$spen_woman_65)
child$spen_man         <- ifelse(is.na(child$spen_man),         0, child$spen_man)
child$spen_man_60_65   <- ifelse(is.na(child$spen_man_60_65),   0, child$spen_man_60_65)
child$spen_man_65      <- ifelse(is.na(child$spen_man_65),      0, child$spen_man_65)


# merge across data.frame types
child <- merge(child, hhder, by = c('hhid', 'wave'), all.x = TRUE)
child <- merge(child, inder, by = c('pid', 'wave'),  all.x = TRUE)


# save to file
save(child, file = 'data/merged.RData')
