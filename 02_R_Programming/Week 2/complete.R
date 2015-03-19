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

# Call function
complete("specdata", 23)

#------------------------------------------------------------------------
# Function
#------------------------------------------------------------------------
complete <- function(directory, id = 1:332) {
  
  directory <- "specdata"
  id <- 23

  # Read Directory for gathering all csv-files Names (all Files)
  file_list <- list.files(directory,full.names = FALSE)
    
  #--- Preparations 
  
      # Data Frame creation
      dFrame <- data.frame(row.names ="fileNo","count")
      dFrameTmp <- data.frame()
          
  #--- Loop
  
      # count all rows of file (without NA's)
      dFile    <- read.csv(file_list[id])
      rowCount <- sum(complete.cases(dFile))

      # Extract only the Number out of the filename   
      fileNo   <- substr(file_list[1],1,3)
  
      Temp  <- c(fileNo,rowCount)
#       dFrame  <- rbind(dFrame,Temp)  
      dFrame  <- rbind(Temp,deparse.level = 2)  
      names(dFrame) <- c("id", "nobs")
  
  
  
