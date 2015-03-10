# extract.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# for extracting the data files
# from the zip files

# this file assumes the .zip files
# are located in the working directory

# view the stata12 zip files
stata12_files <- dir(pattern = 'stata12.zip$')

for (i in stata12_files) {
  unzip(i)
}