## Codebook for summary_tidy.txt

### Introduction

This document contains the data dictionary for the dataset summary_tidy.txt. This dataset contains the summarized data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones as per the course project assignment on coursera (getdata-030)

The point of the course project is to show we can merge, clean, rename and summarize data in a tidy fashion.

### Origin

The raw data for the dataset provided here can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data was collected from Samsung Galaxy S II smartphones and a full description can be obtained at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Merging and summarizing data

The raw data files contain several files. The data files used are X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt. 

X_test.txt and X_train.txt contain statistical measures on underlying detailed measures
y_test.txt and y_train.txt contain ids for subjects that were wearing the smartphones
subject_test.txt and subject_train.txt contain classifying integers that correspond to a descriptive activity such as walking and walking upstairs.

The structure of each of these files between test and train are similar. Each of the files is first merged vertically
between test and train, as there is no need for the distinction in this analysis provided here. Subsequently they are joined horizontally to create one large raw datafile.

After the join, activity labels are replaced by human readable descriptions, and the variable names are re-introduced as described in the raw datasets.

As a final step, the mean of each observed variable per subject per activity is calculated, and the tidy dataset is formatted with mean.of.<<varname>>.

### Data dictionary

Variable Name | Role | Type
---|---|---
subject|ID|Integer

Subject is an identifier denoting a unique test subject. It's range is from 1 through 30


Variable Name | Role | Type
---|---|---
activity.label|Classification|Character

activity.label is a character classification variable. It contains the following values:

Value | Description
---- | -----
WALKING | The subject is walking on a flat surface.
WALKING_UPSTAIRS | The subject is walking up stairs.
WALKING_DOWNSTAIRS | The subject is walking down stairs.
LAYING | The subject is laying down.
SITTING | The subject is sitting down.
STANDING | The subject is standing still.



Variable Name | Role | Type
mean.of.tBodyAcc.mean.X|Measurement|Numeric
mean.of.tBodyAcc.mean.Y|Measurement|Numeric
mean.of.tBodyAcc.mean.Z|Measurement|Numeric
mean.of.tBodyAcc.std.X|Measurement|Numeric
mean.of.tBodyAcc.std.Y|Measurement|Numeric
mean.of.tBodyAcc.std.Z|Measurement|Numeric
mean.of.tGravityAcc.mean.X|Measurement|Numeric
mean.of.tGravityAcc.mean.Y|Measurement|Numeric
mean.of.tGravityAcc.mean.Z|Measurement|Numeric
mean.of.tGravityAcc.std.X|Measurement|Numeric
mean.of.tGravityAcc.std.Y|Measurement|Numeric
mean.of.tGravityAcc.std.Z|Measurement|Numeric
mean.of.tBodyAccJerk.mean.X|Measurement|Numeric
mean.of.tBodyAccJerk.mean.Y|Measurement|Numeric
mean.of.tBodyAccJerk.mean.Z|Measurement|Numeric
mean.of.tBodyAccJerk.std.X|Measurement|Numeric
mean.of.tBodyAccJerk.std.Y|Measurement|Numeric
mean.of.tBodyAccJerk.std.Z|Measurement|Numeric
mean.of.tBodyGyro.mean.X|Measurement|Numeric
mean.of.tBodyGyro.mean.Y|Measurement|Numeric
mean.of.tBodyGyro.mean.Z|Measurement|Numeric
mean.of.tBodyGyro.std.X|Measurement|Numeric
mean.of.tBodyGyro.std.Y|Measurement|Numeric
mean.of.tBodyGyro.std.Z|Measurement|Numeric
mean.of.tBodyGyroJerk.mean.X|Measurement|Numeric
mean.of.tBodyGyroJerk.mean.Y|Measurement|Numeric
mean.of.tBodyGyroJerk.mean.Z|Measurement|Numeric
mean.of.tBodyGyroJerk.std.X|Measurement|Numeric
mean.of.tBodyGyroJerk.std.Y|Measurement|Numeric
mean.of.tBodyGyroJerk.std.Z|Measurement|Numeric
mean.of.tBodyAccMag.mean|Measurement|Numeric
mean.of.tBodyAccMag.std|Measurement|Numeric
mean.of.tGravityAccMag.mean|Measurement|Numeric
mean.of.tGravityAccMag.std|Measurement|Numeric
mean.of.tBodyAccJerkMag.mean|Measurement|Numeric
mean.of.tBodyAccJerkMag.std|Measurement|Numeric
mean.of.tBodyGyroMag.mean|Measurement|Numeric
mean.of.tBodyGyroMag.std|Measurement|Numeric
mean.of.tBodyGyroJerkMag.mean|Measurement|Numeric
mean.of.tBodyGyroJerkMag.std|Measurement|Numeric
mean.of.fBodyAcc.mean.X|Measurement|Numeric
mean.of.fBodyAcc.mean.Y|Measurement|Numeric
mean.of.fBodyAcc.mean.Z|Measurement|Numeric
mean.of.fBodyAcc.std.X|Measurement|Numeric
mean.of.fBodyAcc.std.Y|Measurement|Numeric
mean.of.fBodyAcc.std.Z|Measurement|Numeric
mean.of.fBodyAccJerk.mean.X|Measurement|Numeric
mean.of.fBodyAccJerk.mean.Y|Measurement|Numeric
mean.of.fBodyAccJerk.mean.Z|Measurement|Numeric
mean.of.fBodyAccJerk.std.X|Measurement|Numeric
mean.of.fBodyAccJerk.std.Y|Measurement|Numeric
mean.of.fBodyAccJerk.std.Z|Measurement|Numeric
mean.of.fBodyGyro.mean.X|Measurement|Numeric
mean.of.fBodyGyro.mean.Y|Measurement|Numeric
mean.of.fBodyGyro.mean.Z|Measurement|Numeric
mean.of.fBodyGyro.std.X|Measurement|Numeric
mean.of.fBodyGyro.std.Y|Measurement|Numeric
mean.of.fBodyGyro.std.Z|Measurement|Numeric
mean.of.fBodyAccMag.mean|Measurement|Numeric
mean.of.fBodyAccMag.std|Measurement|Numeric
mean.of.fBodyBodyAccJerkMag.mean|Measurement|Numeric
mean.of.fBodyBodyAccJerkMag.std|Measurement|Numeric
mean.of.fBodyBodyGyroMag.mean|Measurement|Numeric
mean.of.fBodyBodyGyroMag.std|Measurement|Numeric
mean.of.fBodyBodyGyroJerkMag.mean|Measurement|Numeric
mean.of.fBodyBodyGyroJerkMag.std|Measurement|Numeric

Each of these variables contains the mean of all observed measures for that subject and activity.label. The description of the underlying measures is (as taken from the README.txt and features_info.txt in the downloaded zipfile):

From the README.txt

> ==================================================================
> Human Activity Recognition Using Smartphones Dataset
> Version 1.0
> ==================================================================
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Università degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws
> ==================================================================
> 
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
> 
> For each record it is provided:
> ======================================
> 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.

From the features_info.txt:

> Feature Selection 
> =================
> 
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> tBodyAcc-XYZ
> tGravityAcc-XYZ
> tBodyAccJerk-XYZ
> tBodyGyro-XYZ
> tBodyGyroJerk-XYZ
> tBodyAccMag
> tGravityAccMag
> tBodyAccJerkMag
> tBodyGyroMag
> tBodyGyroJerkMag
> fBodyAcc-XYZ
> fBodyAccJerk-XYZ
> fBodyGyro-XYZ
> fBodyAccMag
> fBodyAccJerkMag
> fBodyGyroMag
> fBodyGyroJerkMag
> 
> The set of variables that were estimated from these signals are: 
> 
> mean(): Mean value
> std(): Standard deviation

The list of estimated variables continues, but those are not used for this dataset. The unit of measurement of each variable equals what it was in the original dataset.