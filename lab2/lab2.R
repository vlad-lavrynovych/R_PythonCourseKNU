v <- rnorm(100)
v
print(v[10])
print(v[(10:20)])
print(head(v, n=1))
print(head(v[seq(20, length(v))], n=10))
print(v[v>0])


y <- data.frame(a = rnorm(100), b = 1:100,
                cc = sample(letters, 100, replace = TRUE))
y
print(tail(y, n=10))
print(y[10:20,])
print(y[10, 2])
data.frame(y$cc)

c <- c(1, 2, 3, NA, 4, NA, 5, NA)
c
print(c[!is.na(c)])
mean(c, na.rm=TRUE)
mean(c, na.rm=FALSE)