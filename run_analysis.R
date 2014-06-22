################################################
## GETTING AND CLEANING DATA - COURSE PROJECT ##
################################################

#  You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

######################################################################################################################

# reading in the training data
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

# reading in the test data
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("./UCI HAR Dataset/test/x_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# extracting feature list (# 561) from features.txt and setting column names for easier manipulation
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(features)  = c("featureID", "featureName")

# only the mean and standard deviation for each measurement (Requirement #2)
# these include features with "-mean()" or "-std()" in their name (# 66), not "-meanFreq()" (additional # 13)
# extractFeatures holds indices of these activities
extractFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$featureName)

# descriptive names for features
featureNames <- features$featureName[extractFeatures]
featureNames <- gsub("\\(|\\)", "", featureNames)
featureNames <- gsub("-", ".", featureNames)
featureNames <- tolower(featureNames)
featureNames <- gsub("std","stddev", featureNames)
featureNames <- gsub("^t","time", featureNames)
featureNames <- gsub("^f","freq", featureNames)

# further refining training and test data only by desired features
# appropriately labelling dataset with descriptive variable names (Requirement #4)
# ref: last slide of the lecture "Editing Text Variables" (week 4)
xTrain <- xTrain[, extractFeatures]
colnames(xTrain) <- featureNames
xTest <- xTest[, extractFeatures]
colnames(xTest) <- featureNames

# bindind training and test data
trainSet <- cbind(subjectTrain, rep("train", nrow(subjectTrain)), yTrain, xTrain)
colnames(trainSet)[1:3] <- c("subject", "data.type", "activity")
testSet <- cbind(subjectTest, rep("test", nrow(subjectTest)), yTest, xTest)
colnames(testSet)[1:3] <- c("subject", "data.type", "activity")

# creating merged set (still not in its final form)
mergedSet <- rbind(trainSet, testSet)

# subjects
subjects <- sort(unique(mergedSet$subject))

# extracting activity list (# 6) from activity_labels.txt and setting column names for easier manipulation
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activities)  = c("activityID", "activityName")

# assigning descriptive activity names that will be used in tidy dataset (Requirement #3)
activityNames <- tolower(activities$activityName)

# merged dataset (Requirement #1)
mergedSet$activity <- as.factor(mergedSet$activity)
levels(mergedSet$activity) <- activityNames
mergedSet$subject <- as.factor(mergedSet$subject)
levels(mergedSet$subject) <- paste("subject", subjects, sep = "")

# second (tidy) data set with the average of each variable for each activity and each subject (Requirement #5)
finalSet <- aggregate(mergedSet[, -c(1:3)], by = list(mergedSet$subject, mergedSet$activity), mean)
featureNames <- paste("mean.", featureNames, sep = "")
colnames(finalSet) <- c(c("subject", "activity"), featureNames)

# creating txt file for online submission
write.table(finalSet, "./tidyset.txt", sep = ",", row.names = F)