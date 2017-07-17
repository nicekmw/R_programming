## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'threshold' is a numeric vector of length 1 indicating the number of completely observed observations (on all variables) required to compute the correlation between nitrate and sulfate; the default is 0
## return a numeric vector of correlations 
## Note : do not round the result!

corr <- function(directory, threshold = 0) {
  id = 1:332
  filename <- list.files(directory, full.names = TRUE)
  
  result <-vector(mode="numeric", length=0)
  
  for(i in seq(filename)) {
    airquality <- read.csv(filename[i])
    good <- complete.cases(airquality)
    airquality <- airquality[good, ]
    if (nrow(airquality) > threshold) {
      # We need [[]] around pollutant instead of [] since airquality["sulfate"]
      # is a data.frame but we need a vector here. Hence, [[]]. Please note thatusing either
      #[[]] or [] gives the same results as the test cases
      correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
      result <- append(result, correlation)
      #print(correlation)
    }
  }
  result
}

source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
