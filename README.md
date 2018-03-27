# Getting-and-Cleaning-Data-Course-Assignment
## How this run_analysis.R works
First, you should have the "UCI HAR Dataset" in your R software working directory. 
Then, source this "run_analysis.R". 
After a few second script running, it would return the final clean data set. 
And here is how the script works acturally: 
1. Read all the txt files incuding test and train data of x, y, and subject, features, and activity labels. 
2. Merge the test and train data sets to one for each of x, y, and subject. 
3. Extract the mean and standard deviation measurements in variables of x. 
4. Tidy all the names and labels to the data sets of x. 
5. Create a second, independent tidy data set.
