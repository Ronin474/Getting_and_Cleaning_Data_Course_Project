## Introduction

This assignment uses data from the [UC Irvine Machine Learning Repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), a popular repository for machine learning datasets. 
* Dataset: [Human Activity Recognition Using Smartphones Data Set] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Description: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

#### How to use run_analysis.R
- Download and unzip the original dataset (folder `UCI HAR Dataset`) in your local drive -> this directory now serves as your "working directory".
- Put script **run_analysis.R** to working directory (as already mentioned above, this directory must include folder `UCI HAR Dataset`).
- To run the script in RStudio, set your working directory appropriately, and simply source **run_analysis.R**. After running, the script produces two important data sets (interim "mergedSet" and "finalSet", described in more detail in CodeBook.md)
and writes single .txt file (`tidyset.txt`; 222 KB in size, features 181 rows (header + 180 data rows)) to the working directory.
- Average script run-time is cca 30 seconds, although this varies based on system specifications.
- For loading resulting `tidyset.txt` into RStudio, use the following code: `df <- read.table("./tidyset.txt", header = T, sep = ",")`.

#### Additional Info
You can find additional information about data, variables, attributes, and data transformations in the **CodeBook.md**.
