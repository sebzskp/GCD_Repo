---
title: "Readme_Course_Project"
author: "s.thuault"
date: "September 17, 2015"
output: html_document
---
##Introduction##
- You will find 3 files in this repo: the **"README.md"** file that you are currently reading and which explains what is contained in this repo and what each file is about, the **"run_analysis.R"** file, which contains a script to create a tidy data set out of a series of files contained in the "UCI HAR Dataset" folder that you are supposed to have downloaded from the course website, and a **"CodeBook.md"** file, which provides the details of the tidy data set produced by the "run_analysis.R" script. The **"README.md"** file also explains how the script works (see below).

- The "UCI HAR Dataset" contains raw and processed data collected by the accelerometers of the Samsung Galaxy S II smartphone during an experiment with 30 subjects performing 6 types of physical activities (e.g. walking or sitting). In all, 561 types of measurements or "features" (e.g. tBodyAcc-mean()-Z) were recorded/computed in each session. The data are split into train and test sets but also between feature measurements, activity labels and subject identification numbers files and part of the tidy data exercise is to recombine all those sets with the "run_analysis.R" script.

##How the "run_analysis.R" script works##
- The run_analysis.R script assumes that the UCI HAR Dataset folder has been downloaded and is in the working directory. When ready type `source("run_analysis.R")`

- The script requires the `dplyr` package and will load it into R or first download it if needed (downloading the `dplyr` package requires that your computer is connected to the internet). Without the `dplyr` package the script won't run.

- The script was written for R on a PC platform, which means that you might need to chamge the direction of the slashes in the code as the folder path convention might be different on your manchine.

- I will now describe step-by-step how the script works

###Step 0###
- The script will load the `dplyr` package after downloading it if needed.

###Step 1###
- The script will first read and load into R the different pieces of information needed to make a single tidy dataset. This consists of the main test and train data set files ("X_test.txt" and "X_train.txt"), which contain the feature measurements (561 variables), the subject identification number files ("subject_train.txt" and "subject_test.txt"), the activity files ("y_train.txt" and "y_test".txt), in the form of a list of integers, each indicating the activity performed in one row, the activity labels ("activity_labels.txt", e.g 1 = walking), which is essentially the code book for the activity files, and the features list ("features.txt"), which actually lists the names of all 561 features (e.g. angle(Z,gravityMean)).

###Step 2###
- The script will then merge the diferent pieces of information in a single data frame. At the same time, it will rename all the variables/columns with descriptive names, in this case "Subject_ID", "Activity" and each of the "features"" measured. It will also replace all the integers of the Activity entries by their real name e.g. walking instead of 1.

###Step 3###
- The script then extracts only the data for which the features are means or standard deviations (std). To do this it first discards the duplicated features columns because `dplyr` cannot work with duplicates. Please note that the duplicates are not part of the mean or std features so no loss of data here for our purpose. Only 86 "feature"" variables are left in after this step.

###Step 4###
- The script then creates a tidy data set with the average of each variable grouped by activity and subject. For instance, the data will show the average value of the "tBodyAcc-mean()-X"" feature measurements for subject 1 during laying, sitting etc... same thing for subject 2 and so on.

###Step 5###
- In this final step, the script will output the tidy data set created in step 4 to a file called "SGS_Analysis_Tidy.txt", which is basically the final output of this script (180 observations for 88 variables).