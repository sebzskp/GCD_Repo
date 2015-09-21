# 0. Loading dplyr package
if (require(dplyr) == FALSE) {
    print("script requires dplyr package; proceeding to installation")
    install.packages("dplyr")
    }    
library(dplyr)

# Step 1. Load data into R
SGS_train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
SGS_test_data <- read.table("UCI HAR Dataset/test/X_test.txt")

Subject_ID_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
Subject_ID_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

Activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
Activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")

Activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")

Features <- read.table("UCI HAR Dataset/features.txt")

# Step 2. Merge data and rename variables
# Combine the subject data sets and change the variable name to "Subject_ID"
Subject_ID_All <- rbind(Subject_ID_train, Subject_ID_test)
Subject_ID_All <- rename(Subject_ID_All, Subject_ID = V1)

# Combine the y data sets (the Activities)
Activity_All <- rbind(Activity_train, Activity_test)

# Create a new DF in which the numbers 1:6 in the Y-train file are replaced with
# the real names of the activities performed by the subjects. Label the column
# "Activity"
label_string <- as.vector(Activity_Labels$V2)
Activity_string <- as.vector(Activity_All$V1)
Activity_All_named <- label_string[Activity_string]
Activity_All_named <- as.data.frame(Activity_All_named)
colnames(Activity_All_named) <- "Activity"

# Combine the X_train and X_test data sets and change the variable names using
# the "Features.txt" file
SGS_All_data <- rbind(SGS_train_data, SGS_test_data)
Feature_Vector <- as.vector(Features[,2])
colnames(SGS_All_data) <- Feature_Vector

# Merge all the data frames
BigDF <- cbind(Subject_ID_All,Activity_All_named,SGS_All_data)

# Step 3. Extracts only the data for which the features are means or
# standard deviations (std)
BigDF <- BigDF[, !duplicated(colnames(BigDF))]
BigDF_lite <- select(BigDF, Subject_ID, Activity, contains("mean"), contains("std"))

# Step 4. Create tidy data set with the average of each variable for each
# activity and each subject
BigDF2 <- group_by(BigDF_lite, Subject_ID, Activity)
FinalDF <- summarise_each(BigDF2, funs(mean))

# Step 5. Export FinalDF as a text file
write.table(FinalDF, file = "SGS_Analysis_Tidy.txt", row.names = FALSE) 

