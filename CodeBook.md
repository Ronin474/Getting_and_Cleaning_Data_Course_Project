## Getting and Cleaning Data Course Project - CodeBook

### Description
Additional information on data, variables, attributes, and data transformations performed in the Course Project for the Coursera "Getting and Cleaning Data" course (part of Johns Hopkins University "Data Science" specialization).

### Original Data Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### My Data Information
This section explains data featured in my solution to this project. It is divided in two subsections: first subsection explains data sets that represent results of the analysis (interim data set "mergedSet" and resulting data set "finalSet"), while the second subsection briefly explains "temporary" data that was used during their creation.

#### Results 
**mergedSet**: result of merging the training and the test sets (10299 x 69 dataframe). Features 3 factor variables (subject, activity), and mean values for 66 various sensor measurements originally featured in "mergedSet".
	

**finalSet**: independent tidy data set with the average of each variable aggregated over each activity and each subject (180x68 dataframe). Features 2 factor variables (subject, activity), and mean values for 66 various sensor measurements originally featured in "mergedSet".
* subject: represents 30 persons that participated in the experiment. Factor with 30 levels (subject1, subject2, ..., subject30). Based on data from "subjects".
* activity: represents what activity person was doing during experiment. Factor with 6 levels (walking, walking_upstairs, walking_downstairs, sitting, standing, laying). Based on data from "activities".
* sensor values:
"mean.timebodyacc.mean.x"				"mean.timebodyacc.mean.y"				"mean.timebodyacc.mean.z"
"mean.timebodyacc.stddev.x"				"mean.timebodyacc.stddev.y"				"mean.timebodyacc.stddev.z"
"mean.timegravityacc.mean.x"			"mean.timegravityacc.mean.y"			"mean.timegravityacc.mean.z"
"mean.timegravityacc.stddev.x"			"mean.timegravityacc.stddev.y"			"mean.timegravityacc.stddev.z"
"mean.timebodyaccjerk.mean.x"			"mean.timebodyaccjerk.mean.y"			"mean.timebodyaccjerk.mean.z"
"mean.timebodyaccjerk.stddev.x"			"mean.timebodyaccjerk.stddev.y"			"mean.timebodyaccjerk.stddev.z"
"mean.timebodygyro.mean.x"				"mean.timebodygyro.mean.y"				"mean.timebodygyro.mean.z"
"mean.timebodygyro.stddev.x"			"mean.timebodygyro.stddev.y"          	"mean.timebodygyro.stddev.z"
"mean.timebodygyrojerk.mean.x"			"mean.timebodygyrojerk.mean.y"			"mean.timebodygyrojerk.mean.z"
"mean.timebodygyrojerk.stddev.x"		"mean.timebodygyrojerk.stddev.y"		"mean.timebodygyrojerk.stddev.z"
"mean.timebodyaccmag.mean"				"mean.timebodyaccmag.stddev"			"mean.timegravityaccmag.mean"
"mean.timegravityaccmag.stddev"			"mean.timebodyaccjerkmag.mean"			"mean.timebodyaccjerkmag.stddev"
"mean.timebodygyromag.mean"				"mean.timebodygyromag.stddev"			"mean.timebodygyrojerkmag.mean"
"mean.timebodygyrojerkmag.stddev"		"mean.freqbodyacc.mean.x"				"mean.freqbodyacc.mean.y"
"mean.freqbodyacc.mean.z"				"mean.freqbodyacc.stddev.x"				"mean.freqbodyacc.stddev.y"
"mean.freqbodyacc.stddev.z"				"mean.freqbodyaccjerk.mean.x"			"mean.freqbodyaccjerk.mean.y"
"mean.freqbodyaccjerk.mean.z"			"mean.freqbodyaccjerk.stddev.x"			"mean.freqbodyaccjerk.stddev.y"
"mean.freqbodyaccjerk.stddev.z"			"mean.freqbodygyro.mean.x"				"mean.freqbodygyro.mean.y"
"mean.freqbodygyro.mean.z"				"mean.freqbodygyro.stddev.x"			"mean.freqbodygyro.stddev.y"
"mean.freqbodygyro.stddev.z"			"mean.freqbodyaccmag.mean"				"mean.freqbodyaccmag.stddev"
"mean.freqbodybodyaccjerkmag.mean"		"mean.freqbodybodyaccjerkmag.stddev"	"mean.freqbodybodygyromag.mean"
"mean.freqbodybodygyromag.stddev"		"mean.freqbodybodygyrojerkmag.mean"		"mean.freqbodybodygyrojerkmag.stddev"

#### Datasets used in data transformations
**activities**: represents what activity person was doing during experiment. Based on data from "activity_labels.txt".
Features integer vector ID and factor variable with 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
 
**features**: represents different features of data gathered during experiments. Based on data from "features.txt".
Features integer vector ID and factor variable with 477 levels. Basic information about features is available in "features_info.txt".

**subjects**: IDs of people that volunteered for the experiment.
Features integer vector with values for subject IDs (1-30).

**featureNames**: descriptive names for features used to appropriately label dataset variable names. Derived from data in "features.txt" and go through several transformations in the code.
Firstly they are used as column names for interim "mergedSet", and in the end for resulting "finalSet".
Ending state features character vector with names for tidy data set with the average of each variable.

**extractFeatures**: hold indices of only the measurements on the mean and standard deviation for each measurement.
Features integer vector with 66 values for desired subset.
	
**xTrain**: based on data from "x_train.txt" (7352x66 dataframe).

**yTrain**: based on data from "y_train.txt" (7352x1 dataframe).

**subjectTrain**: based on data from "subject_train.txt" (7352x1 dataframe).

**xTest**: based on data from "x_test.txt" (2947x66 dataframe).

**yTest**: based on data from "y_test.txt" (2947x1 dataframe).

**subjectTest**: Based on data from "subject_test.txt" (2947x1 dataframe).

**trainSet**: holds training portion of the experiment data (70% of the volunteers were selected for generating this data).
Structure of this dataframe is the same as the resulting "mergedSet".

**testSet**: holds testing portion of the experiment data (30% of the volunteers were selected for generating this data).
Structure of this dataframe is the same as the resulting "mergedSet".

### Data transformations performed on original data in Course Project
The attached R script (run_analysis.R) does the following:
**Requirement 1.** Merges the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assign column names and merge to create one data set.

**Requirement 2.** Extracts only the measurements on the mean and standard deviation for each measurement. 
From the raw dataset, only the measurements on the mean and standard deviation for each measurement are extracted.
Subset this data to keep only the necessary columns.

**Requirement 3.** Uses descriptive activity names to name the activities in the data set.

Merge data subset with the activityType table to cinlude the descriptive activity names

**Requirement 4.** Appropriately labels the data set with descriptive variable names.

Use gsub function for pattern replacement to clean up the data labels.

**Requirement 5.** Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject

