# import.R
# --------------------------------------------------------
# Bastiaan Quast, bquast@gmail.com
# instructions for importing the Stata files

# install and load the foreign package
install.packages('foreign')
library(foreign)

# read the Stata files
# Administrator files
Admin.W1 <- read.dta( 'stata12/Admin_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Admin.W2 <- read.dta( 'stata12/Admin_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Admin.W3 <- read.dta( 'stata12/Admin_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
# Adult file
Adult.W1 <- read.dta( 'stata12/Adult_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Adult.W2 <- read.dta( 'stata12/Adult_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Adult.W3 <- read.dta( 'stata12/Adult_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
# Child files
Child.W1 <- read.dta( 'stata12/Child_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Child.W2 <- read.dta( 'stata12/Child_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Child.W3 <- read.dta( 'stata12/Child_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
# Household Derived files
Household.Derived.W1 <- read.dta( 'stata12/hhderived_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Derived.W2 <- read.dta( 'stata12/hhderived_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Derived.W3 <- read.dta( 'stata12/hhderived_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
# Household Questionnaire
Household.Questionnaire.W1 <- read.dta( 'stata12/HHQuestionnaire_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Questionnaire.W2 <- read.dta( 'stata12/HHQuestionnaire_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Questionnaire.W3 <- read.dta( 'stata12/HHQuestionnaire_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
# Household Roster
Household.Roster.W1 <- read.dta( 'stata12/HouseholdRoster_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Roster.W2 <- read.dta( 'stata12/HouseholdRoster_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Household.Roster.W3 <- read.dta( 'stata12/HouseholdRoster_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
# Individual Derived
Individual.Derived.W1 <- read.dta( 'stata12/indderived_W1_Anon_V5.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Individual.Derived.W2 <- read.dta( 'stata12/indderived_W2_Anon_V2.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )
Individual.Derived.W3 <- read.dta( 'stata12/indderived_W3_Anon_V1.2.dta', convert.factors=TRUE, convert.underscore=TRUE, warn.missing.labels=FALSE )

# save the data
save.image('imported.RData')