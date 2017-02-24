# Clase de 16/02/2017 
x <- 1
print(x)
x
msg <- "Hola"
msg
X <- #esta expresión está incompleta
  
x <- 1:20
x <- 1:50
a <- 1
b <- 1L
# funcion class(x) para saber qe tipo de atomicas (clase) es.


#Creacion de vectores

#con la funcion "vector"
mi_vector <- vector("integer",5)

#con la funcion "c"

x1 <- c(0,5,0,6)
x2 <- c(TRUE,FALSE)
x3 <- c(T,F)
x4 <- c("a","b","c")
x5 <- 9:29
x6 <- c(2+1i,3-5i,3.14+1.186i)

y1 <- c(1.7,"a")
y2 <- c(TRUE,2)
y3 <- c("a", TRUE)

v <- c(0:6)

t <- c(7.5,9.9,3.54)

m <- matrix(1:6,nrow=2,ncol=3,byrow=TRUE)
m
attributes(m)

class(m)
n <- matrix(1:6,2,3,byrow = FALSE)
n
m <- 1:10
dim(m)
m
dim(m)<- c(2,5)
m
dim(m) <- c(5,2)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

x <- factor(c("yes","yes","no","yes","no"))
x
table(x)
unclass(x)

# Clase 21/02/2017

X <- c(1,2,NA,10,3,NaN)
is.na(X)
is.nan(X)
?data.frame

x <-data.frame(foo=1:4,bar=c(T,T,F,T))
x
nrow(x)
ncol(x)

x <- 1:3
names(x)
names(x) <- c("Edick","nacho", "juan")
names(x)
x

y <- 1:6
y
dim(y) <-c(2,3)
y

x <- list(a=1,b=2,c=3)
x

m <- matrix(1:4,2,2)
m

dimnames(m)
dimnames(m) <- list(c("a","b"),c("c","d"))
m

?read.table
?read.csv

?sapply

#Clase 23/02/2016

y <- data.frame(a=1,b="a")
dput(y)
dput(y,"y.R")
?dput
getwd()
dget("y.R")
rm(y)
y <- dget("y.R")

x <- "Programacion Actuarial III"
y <- data.frame(a=1:10,b="a")
dump(c("x","y"), file="data.R")

x
y

source("data.R")








