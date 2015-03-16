

data <- read.csv("001.csv")
data <- read.csv("002.csv")
data

files_list <- list.files(directory);
files_list
i <- 1
for (i in 1:332) {
        print(i)
        fullData <- read.csv(files_list[i])        
        i <= i + 1
}
fullData

for 


#--------------------------------
# Inputs 
#--------------------------------

# Add Directory Path Variable
directory <- "/Users/alexHaeuenstien/Documents/Git_Repos/datasciencecoursera/02_R_Programming/Week 2/specdata"

# Define Pullant (sulfate = 2, nitrate = 3)
pollutant <- "sulfate"

# Define Monitor ID
id <- 1:10 

# Call function
pollutantmean("specdata", "sulfate", 1)


#------------------
# Function
pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        if (pollutant =="nitrate") Col_id <- 3
        if (pollutant =="sulfate") Col_id <- 2
        
        # Read Directory with all csv-files Names
        
        files_list <- list.files("specdata/")
        
        id <- 1
        # get specific file(Monitor) based on "id"
        csvData <- read.csv("001.csv")
        csvData
        
        
        # Get rid of all NA values
        withOutNA_csvData <- complete.cases(csvData)
        csvDataCleaned <- csvData[withOutNA_csvData,]
        
        # calculate MEAN based on "pullant" number
        sapply(csvDataCleaned[Col_id], mean)
        
}
# to do:
#               1. Write a function 'pollutantmean' 
# 2. that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
#               3. function takes three arguments: 'directory', 'pollutant', and 'id'. 
#               4. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
#                  particulate matter data from the directory specified in the 'directory' argument 
#               5. and returns the mean of the pollutant across all of the monitors, 
#               6. ignoring any missing values coded as NA. 
# 7. The function that you write should be able to match this output
# 8. Please save your code to a file named pollutantmean.R.