# replicate.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# runs all R files in the correct sequence

source('extract.R')
source('import.R')
source('transform.W1.R')
source('transform.W2.R')
source('transform.W3.R')
source('merge.R')
source('estimate.R')