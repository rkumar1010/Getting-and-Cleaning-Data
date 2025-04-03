# Getting and Cleaning Data

This is the course project for the Getting and Cleaning Data course. The script run_analysis.R performs the following steps described in the course project instructions.

1. Download the dataset if it does not already exist in the working directory

2. Merges the training and the test sets to create one data set
  * Read the test data sets in x_test, y_test and subject_test
  * Read the train data sets in x_train, y_train and subject_train
  * Merge x data set for test and training
  * Merge y data set for test and training
  * Merge subject data set for test and training

3. Extracts only the measurements on the mean and standard deviation for each measurement
  * Read features.txt which provide names of all features/measurements
  * get measurement names (mean_std_var) from features with mean or std in their names

  * Keep data only for columns with mean and std in name in x_mean_std
  * Label the data sets with descriptive variable names

4. Use descriptive activity names to name the activities in the data set
  * Read activities labels from activity_labels.txt
  * update y data set with correct activity names
  * Give descriptive column name for activity

5. Appropriately label the data set with descriptive variable names
  * Give descriptive column name for subject

6. From the data set in step 4, creates a second, independent tidy data set with the average of each
variable for each activity and each subject
  * bind all the data in a single data set (allData)
  * use ddply() from the plyr package to apply colMeans() to create averages for all activities
  * Write newly created tidy data set to a text file 


The end result is shown in the file `averageData.txt`.
