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
y_label: Extracted the value of activity names  
name_meanstd: Give names to all the columns  
x_subject: Added subject column to the data sets  
x_average: Grouped and take mean function  
