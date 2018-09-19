# install.packages("mvtnorm")

library(mvtnorm)
dmvnorm(c(1,2,2), mean = rep(0,3), sigma = diag(c(1,1,1)), log = FALSE )
# Cran kan bruges til at finde pakker til R

# rmarkdwn::rander("markdown_example.Rmd")
# library(help = "mvtnorm")´


s <- 0
for (i in 1:10){
  s <- s + i
}
s

x = -3
if (x<0) {
  signx = -1 
} else{
  if (x==0){
    signx = 0
  } else{
    signx = 1
  }
}
signx

signfct <- function(x){
  signx <- 0
  if (x<0){
    signx <- -1
  }
  if (x>0){
    signx <- 1
  }
  return(signx)
}

signfct(-1);
sign(-1);
sign((-1):3)
signfct((-1):3)


#Exercises:
# Produkt at indgangene i en vektor
prod1 <- function(y){
  sum <- 1
  a <- length(y)
  for (i in 1:length(y)){
    sum <- y[i]*sum
  }
  return(sum) 
}

e <- c(1,2,3)
prod1(e)
prod(e)

# 2) Fibonacci
fibo = function(n){
  if (n != round(n)){
    stop("Brug et heltal")
  }
  if (n < 2){
    f <-  n
  }
  if (n == 2){
    f <- c(1,1)
  }
  if (n <  1){
    stop("Dit n skal være større end 0")
  }
  if (n>2){
    f = rep(0,n)
    f[1] = f[2] = 1
      for (i in 3:n){
        f[i] = f[i-2]+f[i-1]
      }
  }
return(f)
}

fibo(30)

#' I) Consider the built-in dataset `cars`
#'     a) Make the design matrix X for a simple linear regression for `cars` (`dist` as a function of `speed`).
X = cbind(c(rep(1,nrow(cars))),cars$speed)
y = (cars$dist)

#'     b) Estimate beta. Plot the data and the estimated line in the same figure. 
#'     (hint: the function `abline` is useful for plotting the line)
B <- solve(t(X) %*% X, t(X) %*% y)
B
#'     c) Estimate sigma^2.
sigma <- (t(y-X%*%B)%*%(y-X%*%B))/(nrow(cars)-(ncol(cars))
sigma
plot(cars$speed, cars$dist)
                                   
abline(B[1],B[2])
                                   
sigmaianden <- (t(y-X%*%B)%*%(y-X%*%B))/(nrow(cars)-(ncol(cars)))
sigmaianden       

#' II) Maybe a second order polynomial is better at capturing the relation between speed and distance?
#' Redo exercise I with a second order polynomial. (Hint: `curve` may be useful)
j <- B[1] + B[2]*X
