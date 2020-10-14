pmean <- function(directory, pollutant, ID = 1:332){
  csvFile <- unzip("rprog_data_specdata.zip")
  
  means <- c()
  for(i in ID) {
    means <- rbind(means, mean(read.csv(csvFile[i])[[pollutant]],na.rm = TRUE))
    
  }
  result <- mean(means,na.rm = TRUE)
  return(result)
}



complete <- function(directory, ID = 1:332){
  csvFile <- unzip("rprog_data_specdata.zip")
  
  data <- data.frame()
  for(i in ID) {
    s <- read.csv(csvFile[i][])
    nobs <- sum(complete.cases(s))
    data <- rbind(data, data.frame(i, nobs))
  }
  
  return(data)
}


corr <- function(directory, threshold =0){
    csvFile <- unzip("rprog_data_specdata.zip")
    v <- numeric()
    
  
    for(i in 1:332) {
      s <- read.csv(csvFile[ i])
      
      data <- s[complete.cases(s),]
      
     if(nrow(data) > threshold ){
        v <- c(v, cor(data[,"sulfate"], data[, "nitrate"], use="na.or.complete"))
      }
    
    }
    if(length(v) > 0) return (v)
    return (c())
}
