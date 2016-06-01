# estimate.R
# ------------------------------
# instructions for estimation
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(plm)
# library(pglm)
library(lmtest)
library(magrittr)
library(broom)
# library(dplyr)


# load data
load('data/merged.RData')


# add CPI
# substantial changes to CPI in 2009, using jan 2009 for 2008
# original 2008 value was 79.3
# base year is 2008 (December)
# using average here
# CPI document is stored in 'misc' folder
cpi <- data.frame(year = c(2008, 2012, 2013), cpi = c(81.4, 97.8, 103.4))


# create pdata.frame
NIDS <- pdata.frame(child, index = c('pid','wave') )

# estimation

## height for age
zhfa1 <- plm(zhfa ~ spen_man*event + spen_woman + hhincome, NIDS, model="within")
zhfa2 <- plm(zhfa ~ spen_man*event + spen_woman + hhincome, NIDS, model="between")
zhfa3 <- plm(zhfa ~ spen_man*event + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zhfa4 <- plm(zhfa ~ event*spen_man + event*spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zhfa5 <- plm(zhfa ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zhfa6 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
zhfa7 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, best_age_yrs < 4, model="between")
zhfa8 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, c_age_days1 < 1460 & c_age_days1 > 180, model="between")
zhfa9 <- plm(zhfa ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 1460, model="between")
zhfa20 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome, NIDS, best_age_yrs < 4 & woman==TRUE, model="between")
zhfa21 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome, NIDS, c_age_days1 < 1460 & c_age_days1 > 180 & woman==TRUE,  model="between")
zhfa22 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome, NIDS, best_age_yrs < 4 & woman==FALSE, model="between")
zhfa23 <- plm(zhfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome, NIDS, c_age_days1 < 1460 & c_age_days1 > 180 & woman==FALSE, model="between")
summary(zhfa1)
summary(zhfa2)
summary(zhfa3) # use this one
summary(zhfa4) # use this one, woman added is not significant
summary(zhfa5) # this one works using the 60-65 distinction for men but not for woman
summary(zhfa6)
summary(zhfa7) # this one works with interaction for children < 4
summary(zhfa8) # this one works slightly better than the one above
summary(zhfa9)
summary(zhfa20) # no result for girls
summary(zhfa21) # no result for girls
summary(zhfa22) # same result for boys
summary(zhfa23) # same result for boys


## weight for age
zwfa1  <- plm(zwfa ~ spen_man*event + spen_woman + hhincome, NIDS, model="within")
zwfa2  <- plm(zwfa ~ spen_man*event + spen_woman + hhincome, NIDS, model="between")
zwfa3  <- plm(zwfa ~ spen_man*event + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="within")
zwfa4  <- plm(zwfa ~ event*spen_man + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa5  <- plm(zwfa ~ spen_man + event*spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa6  <- plm(zwfa ~ event*spen_man + event*spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa7  <- plm(zwfa ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa8  <- plm(zwfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, best_age_yrs < 6 , model="between")
zwfa9  <- plm(zwfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 2920, model='pooling')
zwfa10 <- plm(zwfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 3285, model='pooling')
zwfa21 <- plm(zwfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 3285, model='pooling')
zwfa22 <- plm(zwfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome, NIDS, c_age_days1 > 180 & c_age_days1 < 2920 & woman==TRUE,  model='pooling')
zwfa23 <- plm(zwfa ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome, NIDS, c_age_days1 > 180 & c_age_days1 < 2920 & woman==FALSE, model='pooling')
summary(zwfa2)
summary(zwfa3)
summary(zwfa4)
summary(zwfa5)
summary(zwfa6)
summary(zwfa7)
summary(zwfa8)
summary(zwfa9) # work well
summary(zwfa10) # works very well
summary(zwfa21) # with random too
summary(zwfa22) # with random too # does not work for girls
summary(zwfa23) # with random too # MALE CHILDREN ONLY

## weight for height
zwfh1 <- plm(zwfh ~ event*man_60_65 + spen_woman + hhincome, NIDS, model="within")
zwfh2 <- plm(zwfh ~ event*man_60_65 + spen_woman + hhincome, NIDS, model="between")
zwfh3 <- plm(zwfh ~ event*man_60_65 + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="within")
zwfh4 <- plm(zwfh ~ event*man_60_65 + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh5 <- plm(zwfh ~ event*man_60_65 + spen_woman*event + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh6 <- plm(zwfh ~ event*man_60_65 + spen_woman*event + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh7 <- plm(zwfh ~ event*man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh8 <- plm(zwfh ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
zwfh9 <- plm(zwfh ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome, NIDS, best_age_yrs < 6 & woman==TRUE, model="between")
zwfh10 <- plm(zwfh ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome, NIDS, best_age_yrs < 6 & woman==FALSE, model="between")
summary(zwfh1) # these all do no work, suggesting the effect is more long run
summary(zwfh2)
summary(zwfh3)
summary(zwfh4)
summary(zwfh5)
summary(zwfh6)
summary(zwfh7) # something positive for woman_65, same as BMI
summary(zwfh8)
summary(zwfh9)
summary(zwfh10)

## BMI (Body Mass Index)
zbmi1 <- plm(zbmi ~ spen_man*event + spen_woman + hhincome, NIDS, model="within")
zbmi2 <- plm(zbmi ~ spen_man*event + spen_woman + hhincome, NIDS, model="between")
zbmi3 <- plm(zbmi ~ spen_man*event + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="within")
zbmi4 <- plm(zbmi ~ spen_man*event + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zbmi5 <- plm(zbmi ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zbmi6 <- plm(zbmi ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
summary(zbmi1) # these all do not work either also suggesting effect is long run, not short run
summary(zbmi2)
summary(zbmi3)
summary(zbmi4)
summary(zbmi5) # also works with within
summary(zbmi6)


# Food expenditure
expf1 <- plm(expf ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, model='within')
expf2 <- plm(expf ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, model='within')
summary(expf1)
summary(expf2)

# standard error correction
tidy( coeftest(expf1, vcov=vcovHC(expf1,type="HC0",cluster="group")) )


# Non-Food expenditure
expnf1 <- plm(expnf ~ event*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, model='within')
expnf2 <- plm(expnf ~ event*man_60_65 + event*man_65 + woman_60_65*event + event*woman_65 + hhincome + woman, NIDS, model='within')
summary(expnf1)
summary(expnf2)


# save results

## remove data
rm(NIDS)
rm(child)

## save everything else
save.image(file = 'data/results-stata12.RData')
