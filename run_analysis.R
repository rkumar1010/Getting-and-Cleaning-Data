library(plyr)
library(sqldf)

# Read the training and test data sets

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Merge x data set for test and training
x <- rbind(x_train, x_test)

# Merge y data set for test and training
y <- rbind(y_train, y_test)

# Merge subject data set for test and training
subject <- rbind(subject_train, subject_test)


# Extract only the measurements on the mean and standard deviation for each measurement
feat <- read.table("features.txt")

# get variables from features with mean() or std() in their names
mean_std <- sqldf("select feat.V1
     FROM feat
     WHERE feat.V2 like '%mean%'
	 OR    feat.V2 like '%std%'")
	 
mean_std_var <- unlist(mean_std)

# Keep data only for columns with mean and std in name
x_mean_std <- x[, mean_std_var]

# Label the data sets with descriptive variable names
names(x_mean_std) <- feat[mean_std_var, 2]


# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y[, 1] <- activities[y[, 1], 2]

# descriptive column name for activity
names(y) <- "activity"


# Appropriately label the data set with descriptive variable names

# descriptive column name for subject
names(subject) <- "subject"

# bind all the data in a single data set
allData <- cbind(x, y, subject)


# Create a second, independent tidy data set with the average of each variable for each activity and each subject

averageData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:86]))

write.table(averageData, "averageData.txt", row.name=FALSE)
