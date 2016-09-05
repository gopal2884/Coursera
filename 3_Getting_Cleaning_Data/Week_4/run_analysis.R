#Get and Set your working directory

######getwd()

######setwd("C:/Users/Gopal/Documents/My_Stuff/Repo/3_Getting_Cleaning_Data/Week 4 Assignment")

######Repo_Path <- getwd()

#Ensure that the plyr package is installed
if (!("plyr" %in% rownames(installed.packages())) ) {
        print("Installing plyr package")
        install.packages("plyr")
        library(plyr)
}
{library(plyr)}
               
#Download the data files

# Load required data
## 1- Read Activity Labels
###levels of Varible Activity come from "activity_labels.txt"
Activity_Labels <- read.table("./data/activity_labels.txt")

## 2 - Read feature labels
###Names of Varibles Features come from "features.txt"
Features_Names <- read.table("./data/features.txt")

## 3 Read the Activity, subject and features files


###values of Varible Subject consist of data from "subject_train.txt" and subject_test.txt"
Train_Subject <- read.table("./data/train/subject_train.txt")

Test_Subject <- read.table("./data/test/subject_test.txt")

###Values of Varible Activity consist of data from "Y_train.txt" and "Y_test.txt"
Train_Activity <- read.table("./data/train/y_train.txt")                                  

Test_Activity <- read.table("./data/test/y_test.txt")

###Values of Varibles Features consist of data from "X_train.txt" and "X_test.txt"
Train_Features <- read.table("./data/train/X_train.txt")

Test_Features <- read.table("./data/test/X_test.txt")

## 4 test and training data now has to be merged 

Subject <- rbind(Train_Subject, Test_Subject)
Activity<- rbind(Train_Activity, Test_Activity)
Features<- rbind(Train_Features, Test_Features)

## 5 Give each variable a name

names(Subject)<-c("subject")
names(Activity)<- c("activity")
names(Features)<- Features_Names$V2

## 5 Merge all columns to get all data into the Data dataframe
CombinedData <- cbind(Subject, Activity)
Data <- cbind(Features, CombinedData)


## 6 get the mean and standard deviation of the featurebanes
FeatureNamesMeanStd<-Features_Names$V2[grep("mean\\(\\)|std\\(\\)", Features_Names$V2)]

## 7 We have to bind subject and activity selected names of the features

Names<-c(as.character(FeatureNamesMeanStd), "subject", "activity" )

## we can now subset this data to only include the selected names of the features
SubsetData<-subset(Data,select=Names)


## we are factoring the data here by activity and then providing those with the corresponding activity labels found in the activitylables file
SubsetData$activity<-factor(SubsetData$activity)
SubsetData$activity<- factor(SubsetData$activity,labels=as.character(Activity_Labels$V2))


## Providing useful labels
##Anything starting with a Gyro is Gyroscope to Accelerometer
names(SubsetData)<-gsub("Gyro", "Gyroscope", names(SubsetData))
##Anything starting with a Mag is Magnitude to Accelerometer
names(SubsetData)<-gsub("Mag", "Magnitude", names(SubsetData))
##Anything starting with a BodyBody is Body to Accelerometer
names(SubsetData)<-gsub("BodyBody", "Body", names(SubsetData))
##Anything starting with a t is rename to time
names(SubsetData)<-gsub("^t", "time", names(SubsetData))
##Anything starting with a f is rename to frequency
names(SubsetData)<-gsub("^f", "frequency", names(SubsetData))
##Anything starting with a Acc is rename to Accelerometer
names(SubsetData)<-gsub("Acc", "Accelerometer", names(SubsetData))


# Create tidyData file.
Data2<-aggregate(. ~subject + activity, SubsetData, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)

