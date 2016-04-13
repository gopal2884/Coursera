##Assignment 1 - Only 1 file

setwd("C:/Users/Gopal/Documents/My_Stuff/BigData/2_R_Programming/Week_2/specdata")
getwd()

data<-read.csv("023.csv", header = TRUE, sep =",")

##goodData<- complete.cases(data)

round(mean(data[complete.cases(data), 3]),digits=3)


##Assignment 1 - Multiple Files
rm(list=ls())
setwd("C:/Users/Gopal/Documents/My_Stuff/BigData/2_R_Programming/Week_2")
getwd()

x<-list.files("specdata") 
x## now you have a list of files, if you subset this in a loop you can get the files you require
dat <- data.frame()
for (i in 70:72)
{
        ##print (x[i])
        ##data<-read.csv(x[i], header = TRUE, sep =",")
        dat <- rbind(dat, read.csv(x[i],header = TRUE, sep =","))
}
##goodData<- data[complete.cases(data),]
##goodData
dat[complete.cases(dat), ]
mean(dat[, "nitrate"], na.rm=TRUE)


