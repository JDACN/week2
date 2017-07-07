corr <- function(directory, threshold = 0) {
  
  source("complete.R") # Load complete package 
  
  # get the complete table for analysis
  complete_table <- complete(directory, 1:332)
  nobs <- complete_table$nobs
  
  # find the valid ids
  ids <- complete_table$id[nobs > threshold]
  
  # Generate blank vector placeholder that we update
  corr_vector <- rep(0, length(ids))
  
  # read files and update cor based on valid id's
  
  flName <- list.files(directory,full.names = TRUE) ## Get Foldername and Filename
  j <- 1 #Array index holder
  
  for (fl in ids){
    
    flData <- read.csv(flName[fl]) ## Read File Data
    corr_vector[j] <- cor(flData$sulfate, flData$nitrate, use="complete.obs")
    j <- j + 1
    
  }
  
  # return findings
  corr_vector
  
}