# cleandata
Coursera Getting and Cleaning Data coursework

Description of how the raw data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw data original source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Copy of raw data:
https://github.com/psiu/cleandata/raw/master/getdata-projectfiles-UCI%20HAR%20Dataset.zip

The run_analysis.R script in this project will perform the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.