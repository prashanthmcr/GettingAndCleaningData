#Clearing the environment
rm(list = ls())

#loading the required packages
library("dplyr")


# Loading the individual files into memory

#Loading the features data set
features <- read.table("./features.txt")

#Loading the activity data set
activity_labels <- read.table("./activity_labels.txt")

#Loading the "test" data sets
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

#Loading the "train" data sets
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

## Assigning column headers for the individual data sets.
colnames(features) <- c("feature_id","feature_name")
colnames(activity_labels) <- c("activity_id","activity_name")
colnames(subject_test) <- c("subject_id")
colnames(subject_train) <- c("subject_id")
colnames(x_test) <- features$feature_name
colnames(x_train) <- features$feature_name
colnames(y_test) <- c("activity_id")
colnames(y_train) <- c("activity_id")

#Joining the "y_train"/"y_test" data-sets to "activity_labesl"
y_train <- inner_join(y_train,activity_labels)
y_test <- inner_join(y_test,activity_labels)

#Extracts only the measurements on the mean and standard deviation for each measurement
extracts <- grep("mean|std",features$feature_name)
extract_x_test <- x_test[,extracts]
extract_x_train <- x_train[,extracts]

#Combining the data-sets
test_data_set <- cbind(subject_test,y_test,extract_x_test)
train_data_set <- cbind(subject_train,y_train,extract_x_train)

#Merging the data sets
merged_data_set <- rbind(test_data_set,train_data_set)

final_data_set <- merged_data_set %>% group_by(activity_id,subject_id) %>% summarise_each(funs(mean))

write.table(final_data_set,"./TidyOutput.txt", row.name=FALSE)