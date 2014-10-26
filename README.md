
Getting and Cleaning Data Project - Srinivasan

run_analysis.R

The script (run_analysis.R) does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. From the dataset in step 4, Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

When the script is run the following messages will be displayed

	[1] "Features.txt table loaded succesfully ...."
	[1] "X_train.txt table loaded succesfully ...."
	[1] "y_train.txt table loaded succesfully ...."  
	[1] "activity_labels.txt table loaded succesfully ...."  
	[1] "subject_train.txt table loaded succesfully ...."  
      [1] "Table Train formed succesfully ...."  
      [1] "X_test.txt table loaded succesfully ...."  
	[1] "y_test.txt table loaded succesfully ...."  
	[1] "subject_test.txt table loaded succesfully ...."  
	[1] "Table Test formed succesfully ...."  
	[1] "Train and Test tables merged succesfully ...."  
	[1] "Extracted table of Mean and Standard deviation columns ...."  
	[1] "Changed the lables with descriptive column names ...."  
	[1] "Successfully created the tidy data set ...."  


For details of data sets and transformation please refer to CodeBook.md

