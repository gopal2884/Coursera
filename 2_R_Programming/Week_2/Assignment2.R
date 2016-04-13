setwd("C:/Users/Gopal/Documents/My_Stuff/BigData/2_R_Programming/Week_2")
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # set working directory

        setwd(file.path(getwd(), directory))
        x<-list.files(getwd()) ## now you have a list of files, if you subset this in a loop you can get the files you require
        dat <- data.frame
        
        ##Need to know size of matrix
        id_length <- length(id)
        
        complete_data <- rep(0, id_length)
        j <- 1
        
        ## In the loop we are checking each file and how many complete cases there are
        for (i in id)
        {
                dat <- read.csv(x[i],header = TRUE, sep =",")
                complete_data[j] <- sum(complete.cases(dat))
                j =j+1
        }
        
        ## Need to do this to run the function multiple times.
        setwd("..")
        result <- data.frame(id = id, nobs = complete_data)
        return(result)
}

## To test the function
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)