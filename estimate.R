# estimate.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for the estimations


# instal and load packages
install.packages( 'plm' )
library( plm )

# load the data
load( 'Child.Panel.RData' )

# inspect the data
attach( Child.Panel )
table( a.spen )
summary( a.spen )
summary( a.spen.w )
summary( a.spen.m )
# recode the NAs to zero

table( id.spen )
summary( id.spen )
summary( id.spen.w )
summary( id.spen.m )
# why is this one so different from a.spen?

summary( c.woman ) # very high number of NAs

summary( zhfa )
summary( zwfa )
summary( zwfh )
summary( zbmi )
# many NAs

summary( h.tinc )
table( h.tinc ) # still has missing value codes

detach( Child.Panel )


# using fixed effect (within)
fe.haz0 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# fixed effect with time effect 
te.fe.haz0 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, effect="time", model="within")
# now add policy dummy
# using fixed effect (within)
fe.haz1 <- plm(zhfa ~ spend.d.m + spen.d.w + man.60 + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# add time effect
# THE man.60 VARIABLE IS ELIMINATED BY THE TIME EFFECT
# DO NOT USE THIS ESTMATION (te.fe.haz2)
# te.fe.haz1 <- plm(zhfa ~ spen.d.m + spen.d.w + man.60 + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, effect="time", model="within")
# now add interaction effect
fe.haz2 <- plm(zhfa ~ spen.d.m + spen.d.w + man.60 + h.tinc + spen.d.m*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")


# ESTIMATE MODELS 0, 1, AND 2 WITH WAZ, WHZ AND BMI
# FOR WEIGHT-FOR-AGE (WAZ, ZWFA)
fe.waz0 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
fe.waz1 <- plm(zwfa ~ spen.d.m + spen.d.w + man.60 + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
fe.waz2 <- plm(zwfa ~ spen.d.m + spen.d.w + man.60 + h.tinc + spen.d.m*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# FOR WEIGHT-FOR-HEIGHT (WHZ, ZWFH)
fe.whz0 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
fe.whz1 <- plm(zwfh ~ spen.d.m + spen.d.w + man.60 + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
fe.whz2 <- plm(zwfh ~ spen.d.m + spen.d.w + man.60 + h.tinc + spen.d.m*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# FOR BODY MASS INDEX (BMIZ, ZBMI)
fe.bmiz0 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
fe.bmiz1 <- plm(zbmi ~ spen.d.m + spen.d.w + man.60 + h.tinc, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
fe.bmiz2 <- plm(zbmi ~ spen.d.m + spen.d.w + man.60 + h.tinc + spen.d.m*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")


# results
summary(fe.haz1)
summary(fe.haz2)
summary(fe.waz1)
summary(fe.waz2)
summary(fe.whz1)
summary(fe.whz2)
summary(fe.bmiz1)
summary(fe.bmiz2)



## new estimations
# haz
ife.haz1 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
ife.haz2 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# waz
ife.waz1 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
ife.waz2 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# whz
ife.whz1 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
ife.whz2 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
# bmiz
ife.bmiz1 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")
ife.bmiz2 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60, model="within")


# results new estimations
summary(ife.haz1)
summary(ife.haz2)
summary(ife.waz1)
summary(ife.waz2)
summary(ife.whz1)
summary(ife.whz2)
summary(ife.bmiz1)
summary(ife.bmiz2)


## new estimations for girls
# haz
g.ife.haz1 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
g.ife.haz2 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
# waz
g.ife.waz1 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
g.ife.waz2 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
# whz
g.ife.whz1 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
g.ife.whz2 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
# bmiz
g.ife.bmiz1 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")
g.ife.bmiz2 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == TRUE, model="within")

# results
summary(g.ife.haz1)
summary(g.ife.haz2)
summary(g.ife.waz1)
summary(g.ife.waz2)
summary(g.ife.whz1)
summary(g.ife.whz2)
summary(g.ife.bmiz1)
summary(g.ife.bmiz2)

## new estimations for boys
# haz
b.ife.haz1 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
b.ife.haz2 <- plm(zhfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
# waz
b.ife.waz1 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
b.ife.waz2 <- plm(zwfa ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
# whz
b.ife.whz1 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
b.ife.whz2 <- plm(zwfh ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
# bmiz
b.ife.bmiz1 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc + man.60.65, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")
b.ife.bmiz2 <- plm(zbmi ~ spen.d.m + spen.d.w + h.tinc + man.60.65*man.60, Child.Panel, c.age.m >= 6 &  c.age.m <= 60 & c.woman == FALSE, model="within")

# results
summary(b.ife.haz1)
summary(b.ife.haz2)
summary(b.ife.waz1)
summary(b.ife.waz2)
summary(b.ife.whz1)
summary(b.ife.whz2)
summary(b.ife.bmiz1)
summary(b.ife.bmiz2)


### save the workspace
# remove raw data then save estimation results
rm( Child.Panel )
save.image( 'Child.Estimated.RData' )