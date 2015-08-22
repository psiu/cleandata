# Getting and Cleaning Data
### Written for the Coursera Data Science Specialization Course

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The script in this repository will take the raw data collected from the accelerometers of the Samsung Galaxy S smartphone and transform the data set into a clean "tidy" data set.

#### Description of how the raw data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Raw data original source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#### Copy of raw data:
https://github.com/psiu/cleandata/raw/master/getdata-projectfiles-UCI%20HAR%20Dataset.zip

<br>

####The run_analysis.R script in this repository will perform the following

1. Merges the training and the test sets to create one data set
    + Uses descriptive activity names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. From the data set in step 2, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####To run the script
Download run_analysis.R script
Load the script in an R compiler with source("run_analysis.R")
If the raw data is not present in the working directory, the script will download a copy of the raw data automatically

####Output
The tidy set will be written in the working directory as "tidy.txt"

<br>

###Codebook
For additional details on the transformations performed by the script, please see the Codebook.md included in this respository