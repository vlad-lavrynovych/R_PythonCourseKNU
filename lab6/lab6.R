m <- matrix(rnorm(50), ncol=5, nrow=10) #1
m
apply(m,2,max) #2
apply(m,2,mean) #3
apply(m,1,min) #4
apply(m, 2, sort) #5

count <- function(c) {
  return(length(c[c<0]))
}

apply(m, 2, count) #6

apply(m, 2, function(c) (length(c[c>2])>0)) #7

list1 <- list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))
list1
sum(lapply(list1, sum)$observationA, lapply(list1, sum)$observationB) #8

lapply(list1, range) #9


data <- InsectSprays
sprays <- unique(data$spray)
sprays
sapply(sprays, function(spray1, data)  mean(data[data$spray == spray1, 1]), data) #10
