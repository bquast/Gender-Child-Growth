# extract.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# for extracting the data files
# from the zip files

# this file assumes the .zip files
# are located in the working directory

# list the stata12 zip files
stata12_files <- dir(pattern = 'stata12.zip$')

# unzip the listed stata12 files
for (i in stata12_files) {
  unzip(i)
}

# list the SAS zip files
sas_files <- dir(pattern = 'stata12.zip$')

# unzip the listed SAS files
for (i in sas_files) {
  unzip(i)
}

# list the SPSS zip files
spss_files <- dir(pattern = 'stata12.zip$')

# unzip the listed SPSS files
for (i in spss_files) {
  unzip(i)
}
