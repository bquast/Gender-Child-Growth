# import.R
# --------------------------------------------------------
# instructions for importing the SPSS files
# Bastiaan Quast
# bquast@gmail.com

# install and load the foreign package
install.packages('foreign')
library(foreign)

# read the stata file
stata <- read.dta('stata12/Child_W1_Anon_V5.2.dta')