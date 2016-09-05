The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new - tidy - dataset which may be used for further analysis.

The data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


The original dataset included the following data:
=======================================================
- 'features.txt': List of all features.

- 'activity_labels.txt': List of class labels and their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': ID's of subjects in the training data

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': ID's of subjects in the training data

Please download this data here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip:


A brief description of the script:
==================================
The run_analysis.R script merges data from a number of .txt files and produces a tidy data set which may be used for further analysis.

- First it checks to see if the required "plyr" has been installed and then loads the "plyr" package.

- It then reads all required .txt files and labels the datasets (Please ensure that the data folder is downloaded and contains all files listed above in it)

- It then binds the subject, activity and feature data 

- Using the "grep" function, all the columns with mean() and std() values are extracted and then a new data frame, including only the "activity_id", the "subject_id" and the mean() and std() columns, is created    

- then the data are factored by activity and then providing those with the corresponding activity labels found in the activitylables file

- Lastly, we make sure we provide useful labels for all the columns.


How to use the script:
=====================================

Once the user has cloned the folder to their computer, the working directory should be set to this directory.  Once the working directory is set, the user has to download the data required to run the script. This is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Once downloaded please unzip it and copy all text files and folders to a folder in the working directory called data. Then all you have to do is run the `run_analysis.R` script file.  In `RStudio` or in the `R` environment that is included in the `R` distribution, you simply have to source the file:

    source("run_analysis.R")
