
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
typeof(x)
class(x)
str(x)
x

x[1]
x[4]

x[c(2,1,5)]

x[ c(5,5,5) ]

x[ 0 ]
y <- 2
x[ -y  ]

x['a']
x[ c('a', 'c')]
x[ 1 ]

x[ !c(TRUE, FALSE, TRUE, TRUE, FALSE)]

getthesevalues <- x < 7
getthesevalues
 
x[ x < 7 ]

x[ 'a' ]
x[ 1 ]
x[ -1 ]

?'%in%'
  
x[ names(x) %in% c('a', 'c') ] 
x
y <- list( a = 1, b = 2, c = 3, d = 4, e = 5)
x

typeof(y[1])
typeof(x[1])

y[1]
typeof(y[[1]])

y$c
y[[3]]
y[3]


class(my_list)
my_list 
my_list[]


