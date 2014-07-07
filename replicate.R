# replicate.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# runs all R files in the correct sequence

source('extract.R')
source('import.R')
source('transform.W1.R')
rm(list = ls())
source('transform.W2.R')
rm(list = ls())
source('transform.W3.R')
rm(list = ls())
source('merge.R')
rm(list = ls())
source('estimate.R')