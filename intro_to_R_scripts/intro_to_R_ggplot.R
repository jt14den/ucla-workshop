
rm(list = ls())

library(ggplot2)
library(gapminder)

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp) ) +
  geom_point()

?geom_hline
head(gapminder)

ggplot( data = gapminder, 
        aes( x = year, 
             y = lifeExp, 
             color = continent,
             group = country)) + 
  geom_line()


p <- ggplot( data = gapminder, 
        aes( x = gdpPercap, 
             y = lifeExp ))  + 
  geom_point() + 
  ylab('Life Expectancy in years') + 
  xlab('GDP per capita ($)') + 
  scale_x_log10() + 
  facet_wrap( ~ continent, ncol = 1)


p + 
  geom_smooth( method = 'lm') + 
  annotate(geom = 'text', 
           x = 1000, 
           y = 60, 
           label = 'R^2 = 0.8')


ggsave(filename = 'figs/life_expectancy_gdp.pdf', 
       plot = p, width = 10, height = 8)





  



