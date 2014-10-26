CodeBook.md
==============

The data used for performing the analysis as a part of this activity comes from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the files used as a part of this activity comes from the following location:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This respository contains the following files:
1. run_analysis.R -- The actual R script used for processing the data and producing the final output.
2. ReadMe.md -- The markdown file that provides a brief over-view on how to run the file "run_analysis.R"
3. CodeBook.md -- This file

**Transformations:**

The list of transformations performed on the input files have also been detailed in the file ReadMe.md.
1. In order to consider only those variables that have a mean or std, I ran a grep on the column names for x_train/x_test to identify the columns that had "mean" or "std". 
2. The files "y_test/y_train" were joined with "activity_labels" to obtain the activity names.
3. For each data-set (train/test):
  * The subject_test/train, x_test/train & y_test/train were column bound.
  * This was then followed up with the 2 separate data sets being row bound.
4. The final data set was then grouped by subject_id and activity_id to determine the mean for each measure. 
5. The data was then written to the file "TidyOutput.txt"

