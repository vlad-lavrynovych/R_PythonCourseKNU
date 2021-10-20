
pmean <- function(directory, pollutant, id=1:332) {
  files <- list.files(path=directory, pattern = "*.csv", full.names = TRUE) # read file names
  s <- files[id] # filter by ids
  d <- do.call(rbind, lapply(s, read.csv)) # read data frame from filtered files
  print(d)
  col <- d[[pollutant]] # get necessary column
  val <- mean(col, na.rm = TRUE) # get and print mean
  val
  return(val)
}

pmean("specdata", "sulfate", 1:10) # [1] 4.064128

pmean("specdata", "sulfate", 55) # [1] 3.587319

pmean("specdata", "nitrate") # [1] 1.702932


complete <- function(directory, ids) {
  files <- list.files(path=directory, pattern = "*.csv", full.names = TRUE) # read file names
  s <- files[ids] # filter by ids
  id <- c()
  nobs <- c()
  for (j in s) {
    data = read.csv(j) %>% filter(!is.na(sulfate) & !is.na(nitrate))
    id <- append(id, data$ID[1])
    nobs <- append(nobs, nrow(data))
  }
  return(data.frame(id, nobs))
}

complete("specdata", 1)
## id nobs
## 1 1 117
complete("specdata", c(2, 4, 8, 10, 12))
## id nobs
## 1 2 1041
## 2 4 474
## 3 8 192
## 4 10 148
## 5 12 96
complete("specdata", 50:60)
## id nobs
## 1 50 459
## 2 51 193
## 3 52 812
## 4 53 342
## 5 54 219
## 6 55 372
## 7 56 642
## 8 57 452
## 9 58 391
## 10 59 445
## 11 60 448


corr <- function(directory, threshold=0) {
  files <- list.files(path=directory, pattern = "*.csv", full.names = TRUE) # read file names
  files
  c <- c()
  
  for (f in files) {
    d <- read.csv(f) %>% filter(!is.na(sulfate) & !is.na(nitrate))
    if (nrow(d) > threshold){
      c <- append(c, cor(d$sulfate, d$nitrate))
    }
  }
  print(length(c))
  if(length(c)>0) {
    return(c)
  } else {
    return(numeric())
    # return(c())
  }
}

cr <- corr("specdata", 150)
head(cr); summary(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -0.21060 -0.04999 0.09463 0.12530 0.26840 0.76310

cr <- corr("specdata", 400)
head(cr); summary(cr)
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814 0.76312884 -0.15782860
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -0.17620 -0.03109 0.10020 0.13970 0.26850 0.76310

cr <- corr("specdata", 5000)
head(cr); summary(cr) ; length(cr)
## NULL                 ----------- EXAMPLE IS INVALID, ITS JUST VETCOR c(), NOT NUMERIC
## Length Class Mode
## 0 NULL NULL
## [1] 0


