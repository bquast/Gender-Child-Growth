# download.R
# -----------------------------------------
# download files from www.datafirst.ac.za/dataportal
# NOTA BENE: must be logged in to portal in order to downlaod files
#
# Bastiaan Quast
# bquast@gmail.com

# skip line and add description of files ignored by git
write('\n', file = '.gitignore', append = TRUE)
write('# Raw data file', file = '.gitignore', append = TRUE)

# Wave 1

## download the SAS-version of the Wave 1 dataset
sas1 <- 'nids-w1-2008-v5.3-20150619-sas.zip'
download.file(url = 'https://www.datafirst.uct.ac.za/dataportal/index.php/catalog/451/download/6036', destfile = sas1)
write(sas1, file = '.gitignore', append = TRUE)

## download the SPSS-version of the Wave 1 dataset
spss1 <- 'nids-w1-2008-v5.3-20150619-spss.zip'
download.file(url = 'https://www.datafirst.uct.ac.za/dataportal/index.php/catalog/451/download/6037', destfile = spss1)
write(spss1, file = '.gitignore', append = TRUE)

## download the Stata-version of the Wave 1 dataset (Stata 12)
stata1 <- 'nids-w1-2008-v5.3-20150619-stata12.zip'
download.file(url = 'https://www.datafirst.uct.ac.za/dataportal/index.php/catalog/451/download/6038', destfile = stata1)
write(stata1, file = '.gitignore', append = TRUE)


# Wave 2

## download the SAS-version of the Wave 2 dataset
sas2 <- 'nids-w2-2010-2011-v2.3-20150619-sas.zip'
download.file(url = 'https://www.datafirst.uct.ac.za/dataportal/index.php/catalog/452/download/5999', destfile = sas2)
write(sas2, file = '.gitignore', append = TRUE)

## download the SPSS-version of the Wave 2 dataset
spss2 <- 'nids-w2-2010-2011-v2.3-20150619-spss.zip'
download.file(url = 'http://datafirst.uct.ac.za/dataportal/index.php/catalog/452/download/6000', destfile = spss2)
write(spss2, file = '.gitignore', append = TRUE)

## download the Stata-version on the Wave 2 dataset (Stata 12)
stata2 <- 'nids-w2-2010-2011-v2.3-20150619-stata12.zip'
download.file(url = 'http://datafirst.uct.ac.za/dataportal/index.php/catalog/452/download/6001', destfile = stata2)
write(stata2, file = '.gitignore', append = TRUE)


# Wave 3

## download the SAS-version onf the Wave 3 dataset
sas3 <- 'nids-w3-2012-v1.3-20150619-sas.zip'
download.file(url = 'http://datafirst.uct.ac.za/dataportal/index.php/catalog/453/download/7275', destfile = sas3)
write(sas3, file = '.gitignore', append = TRUE)


## download the SPSS-version of the Wave 1 dataset
spss3 <- 'nids-w3-2012-v1.3-20150619-spss.zip'
download.file(url = 'https://www.datafirst.uct.ac.za/dataportal/index.php/catalog/451/download/7276', destfile = spss3)
write(spss3, file = '.gitignore', append = TRUE)

## download the Stata-version of the Wave 1 dataset (Stata 12)
stata3 <- 'nids-w3-2012-v1.3-20150619-stata12.zip'
download.file(url = 'https://www.datafirst.uct.ac.za/dataportal/index.php/catalog/451/download/7277', destfile = stata3)
write(stata3, file = '.gitignore', append = TRUE)

# end .gitignore file with empty line
write('\n', file = '.gitignore', append = TRUE)

