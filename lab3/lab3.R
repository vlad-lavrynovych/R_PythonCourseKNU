add2 <- function(x, y) {
  return(x+y)
}
add2(3,2)

above <- function(x, n=10) {
  return(x[x>n])
}
above(c(1,2,3,4,5), 3)

my_ifelse <- function(x, exp, n) {
  result = switch(  
    exp,  
    "<"= x[x<n],  
    ">"= x[x>n],  
    "<="= x[x<=n],  
    ">="= x[x>=n],
    "=="= x[x==n],
     x
  )
  return(result)
}
my_ifelse(c(1,2,3,4,5), ">=", 3)


columnmean <- function(x, removeNA=TRUE) {
    
}

mat2.data <- c(10,11,12,13,NA,15,16,17,NA)
mat2 <- matrix(mat2.data,nrow=3)
mat2
columnmean(mat2)

a <- c(5,15,NA,40)
b <- c(NA,2,NA,8)
df <- data.frame(a,b)
columnmean(df)
