rm(list=ls())
setwd("C:/Users/Gopal/Documents/My_Stuff/BigData/2_R_Programming/Week_2")

pollutantmean <- function(directory = "specdata", pollutant = "nitrate", id = 1:332)
{
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        setwd(file.path(getwd(), directory))
        x<-list.files(getwd())
        ## now you have a list of files, if you subset this in a loop you can get the files you require
        dat <- data.frame()
        ## Go through each file and bind the records to perform some actions
        for (i in id)
        {
                dat <- rbind(dat, read.csv(x[i],header = TRUE, sep =","))
        }
        ##now we need only the complete records, no NA's
        dat[complete.cases(dat), ]
        
        setwd("..")
        round(mean(dat[, pollutant], na.rm=TRUE), digits = 3)
        
}

## Tests

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate", 23)

pollutantmean("specdata", "nitrate")

