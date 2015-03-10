# haven.r
# Bastiaan Quast
# bquast@gmail.com
#
# import SPSS of Stata files using the new haven package (development version)

library(haven)

# test read Stata12
Child_W1_Stata <- read_sav("stata12/Child_W1_Anon_V5.2.dta")

# test read SPSS
Child_W1_SPSS <- read_spss("spss/Child_W1_Anon_V5.2.sav")

# test read SAS
Child_W1_SAS <- read_sas("sas/Child_W1_Anon_V5_2.sas7bdat")