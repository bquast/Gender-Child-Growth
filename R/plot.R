# plot.R
# 
# Bastiaan Quast
# bquast@gmail.com

# libraries
library(ggplot2)
library(dplyr)

# data
load(file = 'data/merged.RData')

# children living with man 60-65
NIDS %>%
  filter( !is.na(c_woman) ) %>%
  group_by(wave, c_woman) %>%
  summarise(man_60_65=sum(man_60_65)) %>%
  ggplot(aes(x=wave, y=man_60_65, colour=c_woman)) %+% 
  geom_line() %+%
  scale_colour_brewer(palette='Set1')

# weight for age
NIDS %>%
  group_by(wave, man_60_65) %>%
  summarise( zwfa=mean(zwfa, na.rm=TRUE) ) %>%
  ggplot( aes(x=wave, y=zwfa, fill=man_60_65) ) %+%
  geom_bar(stat='identity') %+% 
  facet_grid(~man_60_65) %+%
  scale_fill_brewer(palette='Set1')

# weight for age II
NIDS %>%
  group_by(wave, man_60_65) %>%
  summarise( zwfa=mean(zwfa, na.rm=TRUE) ) %>%
  ggplot( aes(x=wave,y=zwfa, fill=man_60_65)) %+%
  geom_area(position="identity") %+% 
  facet_grid(~man_60_65) %+%
  scale_fill_brewer(palette='Set1')

# height for age
NIDS %>%
  group_by(wave, man_60_65) %>%
  summarise( zhfa=mean(zhfa, na.rm=TRUE) ) %>%
  ggplot( aes(x=wave, y=zhfa, fill=man_60_65) ) %+%
  geom_bar(stat='identity') %+% 
  facet_grid(~man_60_65) %+%
  scale_fill_brewer(palette='Set1')
