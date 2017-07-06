pollutantmean <- function(directory, pollutant, id = 1:332) {
  # find the mean from given input
  
  ## Get list of all filenames in vector
  
  flName <- list.files(directory,full.names = TRUE) ## Get Foldername and Filename
  
  ## Loop files based on id's
  
  for (fl in id){
   
    #print(flName[fl])
    ## Read File and append to data.frame
    if (exists("fileData")){
        fileData <- rbind(fileData , read.csv(flName[fl]))
    }
    else{
      fileData <- read.csv(flName[fl])  ## First read
    }
      
  }
  
  ## Select our column
  d <- fileData[,pollutant]
  
  ## Remove all NA
  d <- d[!is.na(d)]
  
  ## Calculate Mean
  mean(d)
}
