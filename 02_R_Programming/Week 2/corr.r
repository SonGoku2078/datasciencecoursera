# # 
#
# 1. Write a function that takes a directory of data files and a threshold
# 2. for complete cases and 
# 3. calculates the correlation between sulfate and nitrate for monitor locations 
# 4. where the number of completely observed cases (on all variables) 
#    is greater than the threshold. 
# 5. The function should return a vector of correlations for the monitors that meet 
#    the threshold requirement. 
# 6. If no monitors meet the threshold requirement, 
#    then the function should return a numeric vector of length 0. 


curr("specdata", 5)

#------------------------------------------------------------------------
# Function
#------------------------------------------------------------------------
corr <- function(directory, threshold = 0) {
  directory <- "specdata"
  as.character(directory)
    
  # Read Directory for gathering all csv-files Names (all Files)
    file_list <- list.files(directory,full.names = TRUE)
  # get number of files for loop
    iFiles <- nrow(as.matrix(file_list))
    BigOneFile <- data.frame()
    
  
  # loop trouh all files
  for(i in ifiles) {
    i<-2
    dFile <- read.csv(file_list[i])
    dFileCleanIndex <- complete.cases(dFile)
    dFile[dFileCleanIndex,]
    BigOneFile <- rbind(BigOneFile,dFile[dFileCleanIndex,])
    
  #     calculate corellation
    
      nitrat  
    sulfat   <- c(nobs,sum(complete.cases(dFile)))
    
    
    # Extract only the Number out of the filename   
    id     <- c(id,as.numeric(substr(file_list[i],10,12)))
    
  }
  
  
  # Read all specific Files (Monitor) based on "id"
  for(i in id) {
    csvTemp <- read.csv(file_list[i])
    csvData <- c(csvTemp)
  } 
  # 
  #         # Extract single Column, eighter "nitrate" or "sulfate" via Col_id
  #          csvDataSingleCol <- csvData[Col_id]
  
  # Calculate the Median
  if (pollutant =="nitrate") x <- csvData$nitrate
  if (pollutant =="sulfate") x <- csvData$sulfate
  
  mean(x,na.rm = TRUE)
}