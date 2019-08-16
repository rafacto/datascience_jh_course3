library(dplyr)

dir.create("./course3project")
setwd("./course3project")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip")
unzip("dataset.zip")

traindata <- read.table("./UCI HAR Dataset/train/X_train.txt", na.strings = c("", "NA"))
trainlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")

testdata <- read.table("./UCI HAR Dataset/test/X_test.txt", na.strings = c("", "NA"))
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")

# 1. Merges the training and the test sets to create one data set
data <- rbind(traindata, testdata)
labels <- rbind(trainlabels, testlabels)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
varnames <- read.table("./UCI HAR Dataset/features.txt")
meanstdindxs <- grep("mean\\()|std\\()", varnames[,2])
meanstddata <- data[,meanstdindxs]

# 3. Uses descriptive activity names to name the activities in the data set
activitynames <- read.table("./UCI HAR Dataset/activity_labels.txt")
getactname <-  function (x) {
  i <- match(x, activitynames[, 1])
  activitynames[i, 2]
}
labelnames <- lapply(labels, getactname)
meanstddata <- cbind(labelnames, meanstddata)

# 4. Appropriately labels the data set with descriptive variable names
meanstdvarnames <- varnames[meanstdindxs,2]
names(meanstddata) <- c("Activity", as.character(meanstdvarnames))

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# 5.1 Getting training and testing subjects and adding them as a column to the dataset
trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjects <- rbind(trainsubjects, testsubjects)
meanstddata <- cbind(meanstddata, subjects)
names(meanstddata)[ncol(meanstddata)] <- "Subject"

# 5.2 Grouping data by activity and status and calculating the mean
tidydata <- meanstddata %>% group_by(Activity, Subject) %>% summarise_all(mean)

# 5.3 Exporting the data to a file
write.table(tidydata, file = "tidydata.txt", quote = FALSE)
