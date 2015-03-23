
# Call function
pollutantmean("specdata", "sulfate", 1:11)

#------------------------------------------------------------------------
# Function
#------------------------------------------------------------------------
pollutantmean <- function(directory, pollutant, id = 1:332) 
  {
        # Preparation of internal values
          if (pollutant =="nitrate") Col_id <- 3
          if (pollutant =="sulfate") Col_id <- 2
          
          as.character(directory)

          
        # Read Directory for gathering all csv-files Names (all Files)
          file_list <- list.files(directory,full.names = TRUE)

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