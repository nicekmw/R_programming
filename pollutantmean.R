## Week2 Quiz 2 (Programming Assignment)


  ##'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ##'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" of "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE : Do not round the result!

pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  datas <- data.frame()
    for (i in id){
      datas <- rbind(datas, read.csv(files[i]))
    }
    mean(datas[,pollutant], na.rm=1)
  }


  
source("pollutantmean.R")
  pollutantmean("specdata", "sulfate", 1:10)
  pollutantmean("specdata", "nitrate", 70:72)
  pollutantmean("specdata", "nitrate", 23)
  