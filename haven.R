# haven.r
# ----------------------------------------------------
# import SPSS of Stata files using the haven package
#
# Bastiaan Quast
# bquast@gmail.com

# load libraries
library(haven)

# test read SAS
Child_W1_SAS <- read_sas('data/nids-v1-2008-v5.3-20150619-sas/ChildW1AnonV5_3.sas7bdat')

# test read SPSS
Child_W1_SPSS <- read_spss('data/nids-v1-2008-v5.3-20150619-spss/Child_W1_Anon_V5.3.sav')

# test read Stata12
Child_W1_Stata <- read_dta('data/nids-v1-2008-v5.3-20150619-stata/Child_W1_Anon_V5.3.dta')
