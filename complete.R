complete <- function(directory, id = 1:332) {
  ## Get list of all filenames in vector
  
  flName <- list.files(directory,full.names = TRUE) ## Get Foldername and Filename
  
  completeCases <- data.frame(); ## initate blank vector
  
  ## Loop files based on id's
  
  for (fl in id){
    
        flData <- read.csv(flName[fl]) ## Read File Data
        casesCount <- nrow(flData[complete.cases(flData),]) ## Count rows where completed cases true.
        completeCases <- rbind(completeCases, c(fl,casesCount)) ## Append findings
    
  }
  
  colnames(completeCases) <- c("id","nobs")  ## Add col header
  completeCases   ## return
}