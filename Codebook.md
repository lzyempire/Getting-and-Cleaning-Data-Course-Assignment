# Variable Description
## Data Sets read from Sumsung Data files directly
activity_labels: read from activity_labels.txt  
features: read from features.txt  
subject_test: read from subject_test.txt  
subject_train: read from subject_train.txt  
x_test: read from x_test.txt  
x_train: read from x_train.txt  
y_test: read from y_test.txt  
y_train: read from y_train.txt  
## Data Sets created
subject: merge from subject_test and subject_train.  
x: merge from x_test and x_train.  
y: merge from y_test and y_train.  
seq_meanstd: The sequence of features with the mean and standard deviation variables  
x_meanstd: The set with the mean and standard deviation variables  
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
