library(data.table)
library(dplyr)

#############################
## Constants and controls
rawDataFile <- "getdata-projectfiles-UCI HAR Dataset.zip"
downloadURL <- "https://github.com/psiu/cleandata/raw/master/getdata-projectfiles-UCI%20HAR%20Dataset.zip"

#############################
## Helper functions

loadRawData <- function() {
    ## If raw data file does ont exist, download the data file
    if(!file.exists(rawDataFile)){
        download.file(downloadURL, rawDataFile)
    }
    activity <- read.table(unz(rawDataFile, "UCI HAR Dataset/activity_labels.txt"))[,2] ##Second column has the actual labels
    features <- read.table(unz(rawDataFile, "UCI HAR Dataset/features.txt"))[,2] ##Second column has the actual labels
    
    ## Load test set into memory
    test_subject <- read.table(unz(rawDataFile, "UCI HAR Dataset/test/subject_test.txt"))
    test_x <- read.table(unz(rawDataFile, "UCI HAR Dataset/test/X_test.txt"))
    test_y <- read.table(unz(rawDataFile, "UCI HAR Dataset/test/y_test.txt"))
    
    ## Build test data set
    ## Uses descriptive activity names to name the activities in the data set via "as.character(activity[test_y$V1])"
    test_data <- cbind(as.character(activity[test_y$V1]),test_subject$V1, test_x)
    ## Appropriately labels the data set with descriptive variable names
    colnames(test_data) <- c("Activity","Subject", as.character(features))
    
    ## Memory clean up
    remove(test_subject)
    remove(test_x)
    remove(test_y)
    
    ## Train set, load into memory
    train_subject <- read.table(unz(rawDataFile, "UCI HAR Dataset/train/subject_train.txt"))
    train_x <- read.table(unz(rawDataFile, "UCI HAR Dataset/train/X_train.txt"))
    train_y <- read.table(unz(rawDataFile, "UCI HAR Dataset/train/y_train.txt"))
    
    ## Build train data set
    ## Uses descriptive activity names to name the activities in the data set via "as.character(activity[train_y$V1])"
    train_data <- cbind(as.character(activity[train_y$V1]),train_subject$V1, train_x)
    ## Appropriately labels the data set with descriptive variable names
    colnames(train_data) <- c("Activity","Subject", as.character(features))
    
    ## Memory clean up
    remove(train_subject)
    remove(train_x)
    remove(train_y)
}


##############################
## 1. Merges the training and the test sets to create one data set
##  + Uses descriptive activity names to name the activities in the data set
##  + Appropriately labels the data set with descriptive variable names

loadRawData()
merged_data <- rbind(test_data, train_data)


##############################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement

merged_data <- merged_data[,grepl("Activity|Subject|mean|std", colnames(merged_data))]


##############################
## 3. From the data set in step 2, creates a second, independent tidy data set with the average of each variable for each activity and each subject
grp <- group_by(merged_data, Activity, Subject)
tidy <- summarise_each(grp, funs(mean))

##############################
## Output the tidy data file as specified with write.table and row.names=FALSE

write.table(tidy, "tidy.txt", row.names = FALSE)