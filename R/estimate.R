# estimate.R
# ------------------------------
# instructions for estimation
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(magrittr)
library(dplyr)
library(plm)


# load data
load('data/merged.RData')


# 
zhfa1 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zhfa2 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zhfa3 <- plm(zhfa ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
summary(zhfa1)
summary(zhfa2)
summary(zhfa3)

zwfa1 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zwfa2 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zwfa3 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="within")
zwfa4 <- plm(zwfa ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
summary(zwfa1)
summary(zwfa2)
summary(zwfa3)
summary(zwfa4)

zwfh1 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, model="within")
zwfh2 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, model="between")
zwfh3 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="within")
zwfh4 <- plm(zwfh ~ spen_man*post_treatment + spen_woman + hhincome, child, best_age_yrs < 6, model="between")
summary(zwfh1)
summary(zwfh2)
summary(zwfh3)
summary(zwfh4)