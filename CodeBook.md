---
title: "CodeBook_GCD"
author: "s.thuault"
date: "September 20, 2015"
output: html_document
---
###Introduction###
- The "UCI HAR Dataset" contains raw and processed data collected by the accelerometers of the Samsung Galaxy S II smartphone during an experiment with 30 subjects performing 6 types of physical activities (e.g. walking or sitting). In all, 561 types of measurements or "features" (e.g. tBodyAcc-mean()-Z) were originally recorded/computed in each session. Each individual participated to multiple sessions. 

- The "run_analysis.R" script produces a tidy data set in the form of a space-delimited text file called "SGS_Analysis_Tidy.txt". This tidy data set presents only a subset of the original "features", those that were means or standard deviations types. Each value of the tidy data set is the processed average of the original values grouped by subject and activity type. The resulting tidy data set has 180 observations and 88 variables. So the data themselves are means of means and means of std.

- The run_analysis.R script assumes that the UCI HAR Dataset folder has been downloaded and is in the working directory. When ready type `source("run_analysis.R")`

- The script will output a text file called "SGS_Analysis_Tidy.txt" and in R the related object is called "FinalDF". **As per the tidy data principles, the table will list one observation per variable per row and one variable per column. In addition, each column will get an explanatory variable name.**

###Data Variables###
- **Subject_ID** : This integer variable is the identification number of the subject from which the other measurements were made. As there were 30 subjects in total, this variable takes integer values between 1 and 30.

- **Activity** : This factor variable described the physical activity performed by the subject when the measurements were made. It is either one of the six following values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

- **"Features" variables in columns 3-88** : These column labels are self-explanatory (see more info below) but each value (numerical) is a mean of the original data grouped by individual subject and activity type. In row 1 for instance, are reported the averages of 86 "features" measurements for subject 1, while s/he was laying.

From the original dataset:

*"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag"*

###Units###
- Subject_ID and Activity are factors and therefore categorical values that are unitless.

- The "Features" variables' units are not clear from the information that was provided in the "UCI HAR Dataset" but g was listed as the unit used for all raw measurments (sensor accelerations / inertial measurements) so this is likely the same for the "features" variables.