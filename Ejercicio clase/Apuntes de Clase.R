# Clase de 16/02/2017 
x <- 1
print(x)
x
msg <- "Hola"
msg
X <- #esta expresi�n est� incompleta
  
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

# clase del 24 de febrero
str(file)

con <- url("http://www.fcfm.buap.mx/")
x <- readLines(con,7)
x

x <- c("a","b","c","c","d","e")
x
x[1]
x[4]
x[1:3]
x[1:5]
x[6:2]
x[c(1,3,5)]
x[x>"b"]

u <- x == "c"|x == "d"
u
x[u]

x <- list(foo=1:4, bar=0.6)
a <- x[1]
b <- x[[1]]
c <- x$foo

x["bar"]
x[["bar"]]
u <- "bar"
x[u]
x[[u]]
x$u

#03/03/2017 


airquality
complete.cases(airquality)
sum(complete.cases(airquality))
sum(!complete.cases(airquality))

x <- airquality[complete.cases(airquality),]
nrow(x)

dim(x)[1]

x <- 1:4
y <- 6:9
z <- 2:3
f <- 1:3
x+y
x*y
x>2
x>=2
x/y
x+z
x/z
f+x

x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)
x
y
x*y
x %*% y
y %*% x

#ESTRUCTURAS

if (treu) {
  #instruccion
  #instruccion
  #instruccion
}

x <- 10
y <- 10
if(x>3){
  y <- 10
} else {
  y <-0
}
x

y <- if (x>3){
  10
} else {
  0
}
y

for(i in 1:10) {
  print(i)
}

x <- c("a","b","c","d")

for(i in 1:4){
  print(x[i])
}
for(i in seq_along(x)){
  print(x[i])
}
for(letra in x){
  print(letra)
}
for(i in 1:4)print(x[i])


x <- matrix(1:6,2,3)
 for(i in seq_len(nrow(x))){
   for(j in seq_len(ncol(x))){
     print(x[i,j])
   }
 }


# clase 07/03/2017  
set.seed(1)
len <- c()
for(i in 1:100){
z <- 5
 contador <- 1
 vector <- c()
 while((z >= 3 && z <= 10) && contador < 100){
   vector <- c(vector,z)
   moneda <- rbinom(1,1,0.5)
    if (moneda == 1) {
      z <- z + 1
    } else{
      z <- z - 1
    }
   contador <- contador + 1
 }
len <- c(len,length(vector)) 
}
len




