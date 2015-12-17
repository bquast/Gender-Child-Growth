# replicate.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# runs all R files in the correct sequence

# download is currently not functional
# will have to be done manually due to the login system
# source('download.R')
source('import.R')
rm(list = ls())
source('merge.R')
rm(list = ls())
source('estimate.R')
rm(list = ls())
source('train.R')
