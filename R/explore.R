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

# child1 data.frame

# b1 - Gender
child$c_gen

# b2 - Population group
child1$c_popgrp

# b3 - Home language
child1$c_lng

# b4 - No. of nights spent under roof (Week)
child1$c_slpw

# b5 - No. of nights spent under roof (Month)
child1$c_slpm

# historgram of pension
hist(indiv1$spen)
