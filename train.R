# train.R
# -------------------------------------------
# instructions for training a neural network
#
# Bastiaan Quast
# bquast@gmail.com

# load the data
load( 'Child.Panel.RData' )

# inspect the data
attach( Child.Panel )
table( a.spen )
summary( a.spen )
table( a.spen.w )
summary( a.spen.w )
table( a.spen.m )
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

