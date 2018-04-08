
x = c('a', 'b', 'c')
 
cats <- data.frame( coat = c('calico', 'silver', 'aqua'), 
                    weight = c(2.1, 5.0, 3.2),
                    likes_string = c(1, 0, 1))

cats2 <- data.frame( coat = c('calico', 'silver', 'aqua', 'tabby'), 
                    weight = c(2.1, 5.0, 3.2, '3.2 or 4'),
                    likes_string = c(1, 0, 1, 1))


write.csv(cats, file = 'data/feline-data.csv', row.names = F)

cats <- read.csv(file = 'data/feline-data.csv')

cats$coat
cats$weight

paste("my cat's coat is", cats$coat)

cats$coat + cats$weight

class(cats$coat)
typeof(cats$coat)
typeof(cats$weight)

typeof(1:3)
typeof(1+1i)
typeof(TRUE)
typeof("TRUE")

class(cats$coat)
cats$coat_label <- as.character(cats$coat)
typeof(cats$coat)
typeof(cats$coat_label)

cats2

cats2$weight

age <- c(1, 12, 9, 4)
cats2$age <- as.factor(age)
class(cats2$age)
cats2$age

as.numeric(as.character(cats2$age))

levels(cats2$age)

as.numeric(levels(cats2$age)[cats2$age])

as.matrix(cats)

as.data.frame(matrix( c('a','a',3,4), nrow = 2, ncol = 2 ))

1:50

M <- matrix(1:50, nrow = 10, ncol = 5, byrow = T)
colnames(M) <- c('a', 'b', 'c', 'd', 'e')
names(cats) <- c('coat', 'weight', 'likes_string', 'coat_name')

names(cats)
rm(cats)
cats
cbind(cats, 
      name = c('purry', 'kitty', 'meowsers'))

cats

levels(cats$coat) <- c(levels(cats$coat), 'blue')
levels(cats$coat)

cats <- rbind(cats, 
           c('blue', 4.0, 1 ))
cats <- rbind(cats, c('silver', 5.0, 0))

nrow(cats)
cats <- cats[ -5, ]

cats$indoors <- c(T, F, F, NA)

typeof(cats$indoors)

cats <- rbind( cats, c(NA, NA, 1, T))

is.na(cats$coat)

cats$indoors == 1

library(gapminder)

class(gapminder$country)
str(gapminder)
length(gapminder)
typeof(gapminder)

class(gapminder)

nrow(gapminder)
ncol(gapminder)

dim(gapminder)
names(gapminder)
head(gapminder)
tail(gapminder)
head(gapminder, 1)

nrow( gapminder )
gapminder[ floor( nrow( gapminder )/2 ), ]
gapminder[ sample( nrow(gapminder), size = 10) ,  ]




