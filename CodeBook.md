# Variables

This repo describes the variables used in run_analysis.R script for the Coursera course project - Getting and Cleaning Data

* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* x, y and subject contain merge data set(s) for further analysis.
* feat contains the correct names for the features dataset
* mean_std (dataset) and mean_std_var (numeric vector) which contain variables from features with mean() or std() in their names
* x_mean_std has data for columns with mean and std in name
* activities contain the labels of all activities
* allData contains merged data for x, y and subject
* Finally, new tidy dataset (averageData) is created which contains the averages data for all relevant activities which are stored in averageData.txt file
