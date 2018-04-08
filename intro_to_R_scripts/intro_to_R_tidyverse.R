rm(list = ls())
library(tidyverse)
library( gapminder)

head(gapminder )

mean( gapminder$lifeExp )

mean( gapminder$lifeExp[ gapminder$year == 1952 ] )

#  a shell pipe " | " 
# an R pipe " %>% " 

gapminder %>% 
  group_by( year ) %>% 
  summarise( life_exp_mean = mean( lifeExp) ) %>% 
  ggplot( aes( x = year, y = life_exp_mean )) + 
  geom_line() + 
  ylab ( 'mean life expectancy (years)')

# key functions in tidyverse
# group_by
# select 
# filter 
# summarise 
# mutate 

gapminder %>% 
  mutate( GDP = gdpPercap*pop )

gapminder %>% 
  select( country:year ) 

burundi <- 
  gapminder %>% 
  filter( country == 'Burundi')

# tidyr  functions that are really really useful 
#  spread 
#  gather 

burundi_wide <- burundi %>% 
  select( country:lifeExp) %>%
  spread( year, lifeExp)  

burundi_long <- burundi_wide %>% 
  gather( key = year, value = lifeExp, `1952`:`2007`)


