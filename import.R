# import.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for importing the Stata files

# install and load the foreign package
install.packages('foreign')
library(foreign)

# read wave 1 data
Admin.W1 <- read.dta( 'stata12/Admin_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Adult.W1 <- read.dta( 'stata12/Adult_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Child.W1 <- read.dta( 'stata12/Child_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Derived.W1 <- read.dta( 'stata12/hhderived_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Questionnaire.W1 <- read.dta( 'stata12/HHQuestionnaire_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Roster.W1 <- read.dta( 'stata12/HouseholdRoster_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Individual.Derived.W1 <- read.dta( 'stata12/indderived_W1_Anon_V5.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )

# save wave 1 data
save.image('Wave1.RData')

# clear workspace
rm(list = ls())

# read wave 2 data
Admin.W2 <- read.dta( 'stata12/Admin_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Adult.W3 <- read.dta( 'stata12/Adult_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Child.W2 <- read.dta( 'stata12/Child_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Derived.W2 <- read.dta( 'stata12/hhderived_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Questionnaire.W2 <- read.dta( 'stata12/HHQuestionnaire_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Roster.W2 <- read.dta( 'stata12/HouseholdRoster_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Individual.Derived.W2 <- read.dta( 'stata12/indderived_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )

# save wave 2 data
save.image('Wave2.RData')

# clear workspace
rm(list = ls())

# read wave 3 data
Admin.W3 <- read.dta( 'stata12/Admin_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Adult.W2 <- read.dta( 'stata12/Adult_W2_Anon_V2.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Child.W3 <- read.dta( 'stata12/Child_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Derived.W3 <- read.dta( 'stata12/hhderived_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Questionnaire.W3 <- read.dta( 'stata12/HHQuestionnaire_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Roster.W3 <- read.dta( 'stata12/HouseholdRoster_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )
Individual.Derived.W3 <- read.dta( 'stata12/indderived_W3_Anon_V1.2.dta', convert.underscore=TRUE, warn.missing.labels=FALSE )

# save wave 3 data
save.image('Wave3.RData')