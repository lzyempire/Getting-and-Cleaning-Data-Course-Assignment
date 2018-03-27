#Read all .txt files
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Merge the training and the test sets to create one data set
subject <- rbind(subject_test, subject_train)
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)

#Extract the mean and standard deviation measurements
library(dplyr)
library(stringr)

seq_meanstd <- grep("mean\\(\\)|std\\(\\)", features[, 2]) #The sequence of features with the mean and standard deviation variables
x_meanstd <- select(x, seq_meanstd) # The set with the mean and standard deviation variables

#Use descriptive activity names to name the activities in the data set
y_label <- cbind(y, activity_labels[y[, 1], 2]) #Extract the value of activity names
x_meanstd <- cbind(y_label[, 2], x_meanstd) #Add a column to the data sets

#Label the data set with descriptive variable names
name_meanstd <- gsub("\\(\\)", "", features[seq_meanstd, 2]) 
name_meanstd <- gsub("-", "_", name_meanstd) #Eliminate "()" and substitute "-" to "_"
names(x_meanstd) <- c("Activity", name_meanstd) #Give names to all the columns

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
x_subject <- cbind(subject, x_meanstd) #Add subject column to the data sets
x_average <- aggregate(x_subject[, 3:66], by = list(x_subject[, 1], x_subject[, 2]), FUN = "mean") #Group and take mean function
colnames(x_average)[1:2] <- c("Subject", "Activity") #Label the grouped column names
write.table(x_average, file = "x_average.txt", row.names = FALSE)
