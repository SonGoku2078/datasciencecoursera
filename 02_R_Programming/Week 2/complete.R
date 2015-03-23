###########################################################################################
# to do:
#   1. read set of file based on "id" from input / function call
#   2. create dataframe
#   3. filter out NA's
#   4. per file count all rows (without NA's) 
#   5. print out 
#     a.) column 1. file Number
#     b.) column 2. row count (3.)
###########################################################################################  

setwd("C:/Users/ahau/Documents/datasciencecoursera/02_R_Programming/Week 2/")

# Call function
complete("specdata", 10:33)

#------------------------------------------------------------------------
# Function
#------------------------------------------------------------------------
complete <- function(directory, fileId = 1:332) {
  
  # Read Directory for gathering all csv-files Names (all Files)
  file_list <- list.files(directory,full.names = TRUE)
    
  #--- Preparations 
  
      id        <- vector()
      nobs      <- vector()
  
  
  #--- Loop -------------------------------------------------------------
  
  for(i in fileId) {
  
  # count all rows of file (without NA's)
      dFile  <- read.csv(file_list[i])
      nobs   <- c(nobs,sum(complete.cases(dFile)))
        
  
  # Extract only the Number out of the filename   
      id     <- c(id,as.numeric(substr(file_list[i],10,12)))
  
  } # eoLoop
  
  # Move Vectors into DataFrame   
  dFrame <- as.data.frame(cbind(id,nobs))
  dFrame
} # eoFunction
