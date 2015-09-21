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

- **"Features" variables in columns 3-88** : These column labels are self-explanatory but each value (numerical) is a mean of the original data grouped by individual subject and activity type. In row 1 for instance, are reported the averages of 86 "features" measurements for subject 1, while s/he was laying.

###Units###
- Subject_ID and Activity are factors and therefore categorical values that are unitless.

- The "Features" variables' units are not clear from the information that was provided in the "UCI HAR Dataset" but g was listed as the unit used for all raw measurments (sensor accelerations / inertial measurements) so this is likely the same for the "features" variables.