# alternative haven.R
# Bastiaan Quast

# run haven.R up to line 26
# importing all the data

# now subset all to the important variables

## create a list of variables for each type of data.frame
vars_child <- c('hhid', 'pid')

## subset to relevant variables
child1 %<>% subset(select=vars_child)
child2 %<>% subset(select=vars_child)
child3 %<>% subset(select=vars_child)

## add wave indicator
child1 %<>% cbind(wave = 1)
child2 %<>% cbind(wave = 2)
child3 %<>% cbind(wave = 3)

## remove wave indicator from variable names
names(child1) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(child2) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )
names(child3) %<>% 
  as.character() %>%
  gsub(x = ., '^w[1-3].', "" )

## merge
child <- rbind(child1, child2, child3)
