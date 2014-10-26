GettingAndCleaningData
===================
Repo for content related to the Data Science course "Getting And Cleaning Data"

This repository contains the R script "run_analysis.R" that is designed to perform the following:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the  	average of each variable for each activity and each subject.

Steps Involved:
1) Memory clean-up.
2) Load package dependencies. In this case, it loads the package "dplyr".
3) Load the individual input files into memory.
4) Assign column headers for the individual data sets.
5) Join the "y_train"/"y_test" data-sets to "activity_labesl"
6) Extracts only the measurements on the mean and standard deviation for each measurement
from the "x_train/x_test" data sets.
7) Combine the data sets as follows:
	a) subject_test,x_test & y_test are combined column-wise to form 1 data-set called test_data_set
	b) subject_train,x_train & y_train are combined column-wise to form 1 data-set called train_data_set
	c) The 2 data-sets test_data_set and train_data_set are combined row-wise to form the 
	merged_data_set.
8) Using the dplyr functions "group_by" and "summarise_each", the data is aggregated based on subject_id and activity_id to determine the mean of each measure and the result is saved as "final_data_set"
9) The data-set "final_data_set" is written to a flat file titled "TidyOutput.txt"
