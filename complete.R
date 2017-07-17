
  ##'directory' is a character vector of length 1 indicating
  ##'the location of the CSV files
  ##'
  ##'id' is an integer vector indicating the monitor ID numbers
  ##'to be used
  ##'
  ##'Return a data frame of the form:
  ##'id nobs
  ##'1 117
  ##'2 1041
  ##'...
  ##'where 'id' is the monitor ID number and 'nobs' is the
  ##'number of complete cases


complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.names = 1)
  
  complete_files <- data.frame(id=integer(), nobs=integer())
  
  for (i in 1:length(id)) {
    complete_files[i,1] <- id[i]
    complete_files[i, 2] <- sum(complete.cases(read.csv(files[id[i]])))
  }
  complete_files
}

source("complete.R")
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
