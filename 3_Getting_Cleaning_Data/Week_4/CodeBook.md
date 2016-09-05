# Code Book

This code book summarizes the resulting data fields in `tidy.txt`.

## Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

## Variables included with tidied dataset

For each reading in the tidied dataset, there are 21 features / variables used for describing what is being obtained at this particular time.  These were:

1. `Subject.Number`: The ID of the subject that was wearing the smartphone during a reading
2. `Activity.ID`: The activity that the subject was performing - enumerated between 1 to 6
3. `Activity`: The actual activity that the subject was performed referring to the legend in `activity_labels.txt`
4. `tBodyAccMag-mean()`: The average body acceleration magnitude using the accelerometer
5. `tGravityAccMag-mean()`: The average gravity acceleration magnitude using the accelerometer
6. `tBodyAccJerkMag-mean()`: The average body jerk signal using the accelerometer
7. `tBodyGyroMag-mean()`: The average body acceleration magnitude using the gyroscope
8. `tBodyGyroJerkMag-mean()`: The average jerk signal using the gyroscope
9. `fBodyAccMag-mean()`: Signal 4 after the Fast Fourier Transform (FFT) was applied to it.
10. `fBodyBodyAccJerkMag-mean()`: Signal 6 after the FFT was applied to it
11. `fBodyBodyGyroMag-mean()`: Signal 7 after the FFT was applied to it.
12. `fBodyBodyGyroJerkMag-mean()`: Signal 8 after the FFT was applied to it
13. `tBodyAccMag-std()`: The standard deviation of the acceleration magnitude using the accelerometer
14. `tGravityAccMag-std()`: The standard deviation gravity acceleration magnitude using the accelerometer
15. `tBodyAccJerkMag-std()`: The standard devition of the body jerk signal using the accelerometer
16. `tBodyGyroMag-std()`: The standard deviation body acceleration magnitude using the gyroscope
17. `tBodyGyroJerkMag-std()`: The standard deviation jerk signal using the gyroscope
18. `fBodyAccMag-std()`: Signal 13 after the FFT was applied to it
19. `fBodyBodyAccJerkMag-std()`: Signal 15 after the FFT was applied to it
20. `fBodyBodyGyroMag-std()`: Signal 16 after the FFT was applied to it
21. `fBodyBodyGyroJerkMag-std()`: Signal 17 after the FFT was applied to it
