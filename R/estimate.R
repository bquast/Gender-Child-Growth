# estimate.R
# ------------------------------
# instructions for estimation
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(plm)
library(magrittr)
# library(dplyr)
# library(neuralnet)
# library(nnet)
# library(NeuralNetTools)


# load data
load('data/merged.RData')


# wave as integer
NIDS$wave <- as.integer(NIDS$wave)


# create pdata.frame
NIDS <- pdata.frame(child, index = c('pid','wave') )


# estimation

## height for age
zhfa1 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, model="within")
zhfa2 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, model="between")
zhfa3 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zhfa4 <- plm(zhfa ~ post_treatment*spen_man + post_treatment*spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zhfa5 <- plm(zhfa ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zhfa6 <- plm(zhfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
zhfa7 <- plm(zhfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, best_age_yrs < 4, model="between")
zhfa8 <- plm(zhfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, c_age_days1 < 1460 & c_age_days1 > 180, model="between")
zhfa9 <- plm(zhfa ~ post_treatment*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 1460, model="between")
summary(zhfa1)
summary(zhfa2)
summary(zhfa3) # use this one
summary(zhfa4) # use this one, woman added is not significant
summary(zhfa5) # this one works using the 60-65 distinction for men but not for woman
summary(zhfa6)
summary(zhfa7) # this one works with interaction for children < 4
summary(zhfa8) # this one works slightly better than the one above
summary(zhfa9)

## weight for age
zwfa1  <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, model="within")
zwfa2  <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, model="between")
zwfa3  <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="within")
zwfa4  <- plm(zwfa ~ post_treatment*spen_man + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa5  <- plm(zwfa ~ spen_man + post_treatment*spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa6  <- plm(zwfa ~ post_treatment*spen_man + post_treatment*spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa7  <- plm(zwfa ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfa8  <- plm(zwfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
zwfa9  <- plm(zwfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 2920, model='random')
zwfa10 <- plm(zwfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 3285, model='random')
zwfa11 <- plm(zwfa ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, c_age_days1 > 180 & c_age_days1 < 3285, model='random')
summary(zwfa1)
summary(zwfa2)
summary(zwfa3)
summary(zwfa4)
summary(zwfa5)
summary(zwfa6)
summary(zwfa7)
summary(zwfa8)
summary(zwfa9) # work well
summary(zwfa10) # works very well
summary(zwfa11) # with random too

## weight for height
zwfh1 <- plm(zwfh ~ post_treatment*man_60_65 + spen_woman + hhincome, NIDS, model="within")
zwfh2 <- plm(zwfh ~ post_treatment*man_60_65 + spen_woman + hhincome, NIDS, model="between")
zwfh3 <- plm(zwfh ~ post_treatment*man_60_65 + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="within")
zwfh4 <- plm(zwfh ~ post_treatment*man_60_65 + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh5 <- plm(zwfh ~ post_treatment*man_60_65 + spen_woman*post_treatment + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh6 <- plm(zwfh ~ post_treatment*man_60_65 + spen_woman*post_treatment + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh7 <- plm(zwfh ~ post_treatment*man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zwfh8 <- plm(zwfh ~ post_treatment*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
summary(zwfh1) # these all do no work, suggesting the effect is more long run
summary(zwfh2)
summary(zwfh3)
summary(zwfh4)
summary(zwfh5)
summary(zwfh6)
summary(zwfh7) # something positive for woman_65, same as BMI
summary(zwfh8)

## BMI (Body Mass Index)
zbmi1 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, model="within")
zbmi2 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, model="between")
zbmi3 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="within")
zbmi4 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, NIDS, best_age_yrs < 6, model="between")
zbmi5 <- plm(zbmi ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, NIDS, best_age_yrs < 6, model="between")
zbmi6 <- plm(zbmi ~ post_treatment*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, best_age_yrs < 6, model="between")
summary(zbmi1) # these all do not work either also suggesting effect is long run, not short run
summary(zbmi2)
summary(zbmi3)
summary(zbmi4)
summary(zbmi5) # also works with within
summary(zbmi6)


# Food expenditure
expf1 <- plm(expf ~ post_treatment*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, model="random")
expf2 <- plm(expf ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, model="random")
summary(expf1)
summary(expf2)


# Non-Food expenditure
expnf1 <- plm(expnf ~ post_treatment*man_60_65 + man_65 + woman_60_65 + woman_65 + hhincome + woman, NIDS, model="random")
expnf2 <- plm(expnf ~ post_treatment*man_60_65 + post_treatment*man_65 + woman_60_65*post_treatment + post_treatment*woman_65 + hhincome + woman, NIDS, model="random")
summary(expnf1)
summary(expnf2)


# save results

## remove data
rm(NIDS)
rm(child)

## save everything else
save.image(file = 'data/results.RData')
