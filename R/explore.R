# explore.R
# ---------------------------------------
# exploratory data analysis
#
# Bastiaan Quast
# bquast@gmail.com

# create explore function
explore <- function(data) {
  chr <- sapply(data,  attr, "label")
  ids <- names(chr)
  names(chr) <- NULL
  data.frame(description = chr, id = ids)
}