
data <- read.csv("hw1_data.csv")
print(data)

colnames(data) # what are names of columns

head(data, n=6) # first 6 rows

nrow(data) # get number of rows

tail(data, n=10) # print 10 last rows

o <- data$Ozone
o
length(o[is.na(o)]) # number of na values

mean(o, na.rm=TRUE) # mean excluding na

s <- data[which(data$Ozone>31 & data$Temp>90), ] # subset on multiple conditions
s
mean(s$Solar.R) # mean of subset

j <- data[data$Month == 6,]
j
mean(j$Temp) # mean for Temp of June


m <- data[data$Month == 5,]
m
max(m$Ozone) # max including na
max(m$Ozone[!is.na(m$Ozone)]) # max ignoring na
