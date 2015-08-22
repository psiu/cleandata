#Code Book
<hr>
###This document describes transformations performed by the script inside run_analysis.R

<hr>

##Contents of the data set

The data was collected as the result of the experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

####For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####The data set includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

####The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

####Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

####Signal types

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

####The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

<hr>

##Transformations

###The script performs the following actions in order:

1. Load the libraries that are required for this script
2. Establish the constants determining the raw file name and download URL
3. Run the loadRawData helper function
    + Determine if the raw file is present in the working directory
    + Download the dataset if the file does not exist
    + Extract the feature and activity labels
    + Extract the test file set
    + Apply the feature labels to the test file set and replace the activity numbers with descriptive labels
    + Clean up temporary files to minimize memory footprint
    + Repeat for the training file set
4. Merge the training and test data sets
5. Extract the mean and standard deviation measurements from the merged data set
6. Summarize the data by taking the multiple measurements to produce one average of each activity per subject
7. Export the tidy data set to "tidy.txt""

<hr>

## Output results

####Here is a small sample of the tidy data in a table:

Activity | Subject | tBodyAcc-mean()-X | tBodyAcc-mean()-Y | tBodyAcc-mean()-Z
---------|---------|-------------------|-------------------|------------------
LAYING | 1 | 0.22159824394 | -0.0405139534294 | -0.11320355358
LAYING | 2 | 0.281373403958333 | -0.0181587397583333 | -0.107245610416667 
LAYING | 3 | 0.275516852741935 | -0.0189556785048387 | -0.101300477506452
LAYING | 4 | 0.263559214981481 | -0.0150031841055556 | -0.110688150314815 
LAYING | 5 | 0.278334325576923 | -0.0183042123269231 | -0.107937603673077

####The output file follows "tidy" data principles in which:

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

Each observation in the table contains a descriptive activity label, the subject in which the data was collected from, and the averaged values for each of the mean and standard deviation variables.