# import.R
# --------------------------------------------
# instructions for importing data
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(haven)


# read stata source files
adult1 <- read_dta(path = 'data/nids-w1-2008-v6-stata12/Adult_W1_Anon_V6.0.dta')
child1 <- read_dta(path = 'data/nids-w1-2008-v6-stata12/Child_W1_Anon_V6.0.dta')
hhder1 <- read_dta(path = 'data/nids-w1-2008-v6-stata12/hhderived_W1_Anon_V6.0.dta')
hhque1 <- read_dta(path = 'data/nids-w1-2008-v6-stata12/HHQuestionnaire_W1_Anon_V6.0.dta')
inder1 <- read_dta(path = 'data/nids-w1-2008-v6-stata12/indderived_W1_Anon_V6.0.dta')

adult2 <- read_dta(path = 'data/nids-w2-2010-2011-v3-stata12/Adult_W2_Anon_V3.0.dta')
child2 <- read_dta(path = 'data/nids-w2-2010-2011-v3-stata12/Child_W2_Anon_V3.0.dta')
hhder2 <- read_dta(path = 'data/nids-w2-2010-2011-v3-stata12/hhderived_W2_Anon_V3.0.dta')
hhque2 <- read_dta(path = 'data/nids-w2-2010-2011-v3-stata12/HHQuestionnaire_W2_Anon_V3.0.dta')
inder2 <- read_dta(path = 'data/nids-w2-2010-2011-v3-stata12/indderived_W2_Anon_V3.0.dta')

adult3 <- read_dta(path = 'data/nids-w3-2012-v2-stata12/Adult_W3_Anon_V2.0.dta')
child3 <- read_dta(path = 'data/nids-w3-2012-v2-stata12/Child_W3_Anon_V2.0.dta')
hhder3 <- read_dta(path = 'data/nids-w3-2012-v2-stata12/hhderived_W3_Anon_V2.0.dta')
hhque3 <- read_dta(path = 'data/nids-w3-2012-v2-stata12/HHQuestionnaire_W3_Anon_V2.0.dta')
inder3 <- read_dta(path = 'data/nids-w3-2012-v2-stata12/indderived_W3_Anon_V2.0.dta')

adult4 <- read_dta(path = 'data/nids-w4-2014-2015-v1-stata12/Adult_W4_Anon_V1.0.dta')
child4 <- read_dta(path = 'data/nids-w4-2014-2015-v1-stata12/Child_W4_Anon_V1.0.dta')
hhder4 <- read_dta(path = 'data/nids-w4-2014-2015-v1-stata12/hhderived_W4_Anon_V1.0.dta')
hhque4 <- read_dta(path = 'data/nids-w4-2014-2015-v1-stata12/HHQuestionnaire_W4_Anon_V1.0.dta')
inder4 <- read_dta(path = 'data/nids-w4-2014-2015-v1-stata12/indderived_W4_Anon_V1.0.dta')


# save to file
save.image(file = 'data/imported-stata12.RData')
