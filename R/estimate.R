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


# estimation

## height for age
zhfa1 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zhfa2 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zhfa3 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
zhfa4 <- plm(zhfa ~ spen_man*post_treatment + spen_woman*post_treatment + hhincome, child, best_age_yrs < 6, model="between")
zhfa5 <- plm(zhfa ~ spen_man_60_65 + spen_man_65 + spen_woman_60_65 + spen_woman_65 + hhincome, child, best_age_yrs < 6, model="between")
summary(zhfa1)
summary(zhfa2)
summary(zhfa3) # use this one
summary(zhfa4) # use this one, woman added is not significant
summary(zhfa5) # this one works using the 60-65 distinction for men but not for woman

## weight for age
zwfa1 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zwfa2 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zwfa3 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="within")
zwfa4 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
zwfa5 <- plm(zwfa ~ spen_man + spen_woman*post_treatment + hhincome, child, best_age_yrs < 6, model="between")
zwfa6 <- plm(zwfa ~ spen_man*post_treatment + spen_woman*post_treatment + hhincome, child, best_age_yrs < 6, model="between")
# zwfa7 <- nnet(zwfa ~ spen_man + spen_woman + hhincome + post_treatment, child[which(child$best_age_yrs < 6),], size = 3)
summary(zwfa1)
summary(zwfa2)
summary(zwfa3)
summary(zwfa4) # use this one
summary(zwfa5) # use this one, does not work for women
summary(zwfa6) # use this one
# plotnet(zwfa7)

## weight for height
zwfh1 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zwfh2 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zwfh3 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="within")
zwfh4 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
zwfh5 <- plm(zwfh ~ spen_man + spen_woman*post_treatment + hhincome, child, best_age_yrs < 6, model="between")
zwfh6 <- plm(zwfh ~ spen_man*post_treatment + spen_woman*post_treatment + hhincome, child, best_age_yrs < 6, model="between")
summary(zwfh1) # these all do no work, suggesting the effect is more long run
summary(zwfh2)
summary(zwfh3)
summary(zwfh4)
summary(zwfh5)
summary(zwfh6)

## BMI (Body Mass Index)
zbmi1 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zbmi2 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zbmi3 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="within")
zbmi4 <- plm(zbmi ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
summary(zbmi1) # these all do not work either also suggesting effect is long run, not short run
summary(zbmi2)
summary(zbmi3)
summary(zbmi4)

