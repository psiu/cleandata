#Code Book
This document describes transformations performed by the script inside run_analysis.R

The script performs the following actions in order:

1. Load the libraries that are required for this script
2. Establish the constants determining the raw file name and download URL
3. Run the loadRawData helper function
    +Determine if the raw file is present in the working directory
    +Download the dataset if the file does not exist
    +Extract the feature and activity labels
    +Extract the test file set
    +Apply the feature labels to the test file set and replace the activity numbers with descriptive labels
    +Clean up temporary files to minimize memory footprint
    +Repeat for the training file set
4. Merge the training and test data sets
5. Extract the mean and standard deviation measurements from the merged data set
6. Summarize the data by taking the multiple measurements to produce one average of each activity per subject
7. Export the tidy data set to "tidy.txt""