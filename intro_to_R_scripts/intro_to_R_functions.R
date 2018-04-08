
a <- 10
b <- 1

a + b

my_sum <- function( x, y ){
  the_sum <- x + y
  return(the_sum)
}

my_sum(y = a, x = b)



fahr_to_kelvin <- function(temp){ 
  kelvin <- ((temp-32)*(5/9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(-200)

kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  return(celsius)
}

fahr_to_celsius <- function(temp){
  # convert Fahrenheit to celsius
  # check 
  new_temp <- kelvin_to_celsius(fahr_to_kelvin(temp)) 
  return(new_temp)
}

fahr_to_celsius('thirty-two')

library(gapminder)
gapminder1 <- gapminder

calcGDP <- function( dat, pop_col, gdpPercap_col ){ 
  gdp <- dat[ , pop_col]*dat[ , gdpPercap_col]
  dat$GDP <- gdp[ , 1]
  return(dat)
}
names(gapminder1)
gapminder1 <- calcGDP(dat = gapminder1, pop_col = 'pop', gdpPercap_col = 'gdpPercap' )

head( gapminder1 )

x <- 'pop'

class( gapminder[, 'pop']*gapminder[ , 'gdpPercap'] ) 

best_practice <- c("Write", "programs", "for", "people", "not", "computers")

fence <- function(text, wrapper = '***' ){ 
  paste(wrapper, paste(text, collapse = ' '), wrapper)
}

fence(text = best_practice, wrapper = '!!!')

"*** write programs for people not computers ***"



