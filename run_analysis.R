######################################################
###### Course Project Getting and Cleaning Data ######
######################################################

# Loading libraries used 
library(RCurl)
library(plyr)

# Before starting I have created a folder to save the data needed for the project
# and set the path to run into the scrip. Please be aware of changing the path in which 
# you have saved your files in your computer.
# My path: "C:/Users/Alejandro-Casa/Documents/Coursera/GettingandCleaningData/Course_Project/UCI_HAR_Dataset"

path <- "C:/Users/Alejandro-Casa/Documents/Coursera/GettingandCleaningData/Course_Project/UCI_HAR_Dataset"
setwd(path)
# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(dataFile, "UCI-HAR-dataset.zip", method="wininet")
# unzip('./UCI-HAR-dataset.zip')

#### First task: join the train and test sets to create one data set.
# According the "README.txt" only files "X_text.txt" in both ,train and test folders, 
# contains sets of data which variables are listed in "features.txt". Therefore, 
# I only join these to files into one. We can check it by reading into R the
# txt files. For instance: "features.txt" has 561 objects that correspond to 
# the 561 variables of "x.train.txt".

# Selection of train and test files; reading both tables using read.table
path_test <- paste (path, "test/X_test.txt", sep = "/", collapse = NULL)
path_train <- paste (path, "train/X_train.txt", sep = "/", collapse = NULL)

x.test <- read.table(path_test)
x.train <- read.table(path_train)

# Please notice that both are already data.frames ("class(x.test)")

# 2. Merge the data in one data.frame
data_join = rbind(x.test,x.train)

# Alternatively as a list
# data_join1 = list(x.test,x.train)

#### Second Task: Extraction of the measurements on the mean and standard deviation for each measurement. 
# Here we have to extract from "data_join" the variables which give values of mean and standard deviation, 
# according the guidelines given in "features_info.txt"
path_features <- paste (path, "features.txt", sep = "/", collapse = NULL)
x.features <- read.table(path_features)

# Identification of variables with mean values. ("grep" function returns factors)
x_mean <- grep("\\b-mean()\\b", x.features[,2])

# Identification of variables with standard deviation values ("grep" function returns factors)
x_std <- grep("\\b-std()\\b", x.features[,2])

# Getting only the variables with mean and std from data.frame object calculated at the end of First task
data_join_mean = data_join[,x_mean]
data_join_std = data_join[,x_std]

#### Third task:  Use of descriptive activity names to name the activities in the data set.
# We have six activities according to "activities_labels.txt". In file "y_test.txt" and 
# "y_train.txt", each activity is assigned to the objects (rows) listed in "x_train.txt" 
# and "x_test.txt". What I have to do is to link those activity names to data_join set (variable).
path_activity <- paste (path, "activity_labels.txt", sep = "/", collapse = NULL)
path_test_y <- paste (path, "test/y_test.txt", sep = "/", collapse = NULL)
path_train_y <- paste (path, "train/y_train.txt", sep = "/", collapse = NULL)

x.activity <- read.table(path_activity)
y.test <- read.table(path_test_y)
y.train <- read.table(path_train_y)

# Naming labels with activities
for (i in 1:length(y.test[,1])){
     if (y.test[i,1] == 1){
          y.test[i,1] <- toString(x.activity[1,2])
     }else if (y.test[i,1] == 2){
          y.test[i,1] <- toString(x.activity[2,2])
     }else if (y.test[i,1] == 3){
          y.test[i,1] <- toString(x.activity[3,2])
     }else if (y.test[i,1] == 4){
          y.test[i,1] <- toString(x.activity[4,2])
     }else if (y.test[i,1] == 5){
          y.test[i,1] <- toString(x.activity[5,2])
     }else {
          y.test[i,1] <- toString(x.activity[6,2])
     }
}

for (i in 1:length(y.train[,1])){
     if (y.train[i,1] == 1){
          y.train[i,1] <- toString(x.activity[1,2])
     }else if (y.train[i,1] == 2){
          y.train[i,1] <- toString(x.activity[2,2])
     }else if (y.train[i,1] == 3){
          y.train[i,1] <- toString(x.activity[3,2])
     }else if (y.train[i,1] == 4){
          y.train[i,1] <- toString(x.activity[4,2])
     }else if (y.train[i,1] == 5){
          y.train[i,1] <- toString(x.activity[5,2])
     }else {
          y.train[i,1] <- toString(x.activity[6,2])
     }
}

# Now I am going to name the data set "data_join_mean" and "data_join_std" as follows: 
# a) I will add a column to include the name of the activity for each measurement
# b) Each column will be labeled with the variable name

# Row activity name
row_names <- rbind(y.test,y.train)

# Column variable name
column_name_mean1 <- c("Activity - Test Data", unlist(lapply(x.features[c(x_mean),2], as.character)))
column_name_mean2 <- c("Activity - Train Data", unlist(lapply(x.features[c(x_mean),2], as.character)))
column_name_std1 <-  c("Activity - Test Data", unlist(lapply(x.features[c(x_std),2], as.character)))
column_name_std2 <-  c("Activity - Train Data", unlist(lapply(x.features[c(x_std),2], as.character)))

# Adding row name and column name to data set
data_set_mean <- cbind(row_names,data_join_mean)
data_set_std <- cbind(row_names,data_join_std)
data_set_mean <- rbind(column_name_mean1,data_set_mean[1:length(x.test[,1]),], column_name_mean2, data_set_mean[(length(x.test[,1])+1):length(data_set_mean[,1]),])
data_set_std <- rbind(column_name_std1,data_set_std[1:length(x.test[,1]),], column_name_std2, data_set_std[(length(x.test[,1])+1):length(data_set_std[,1]),])

# Final Tidy data set
complete_data_set <- cbind(data_set_mean,data_set_std)

#### Fourth task: Appropriately labels the data set with descriptive variable names. 
# It was already done in Third task

#### Fifth Task: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Arrange the data in order to be able to calculate the mean of each variable according to the activity.

# Creating object with Mean values
test_data1 <- cbind(y.test,data_join_mean[1:length(x.test[,1]),])
test_data2 <- cbind(y.train,data_join_mean[length(x.test[,1])+1:length(x.train[,1]),])
# Creating object with Standard desviation values
test_data3 <- cbind(y.test,data_join_std[1:length(x.test[,1]),])
test_data4 <- cbind(y.train,data_join_std[length(x.test[,1])+1:length(x.train[,1]),])
# calculating mean for each activity
aggdata_mean_test <-aggregate(test_data1[,2:34], by=list(test_data1$V1), FUN=mean, na.rm=TRUE)
aggdata_mean_train <-aggregate(test_data2[,2:34], by=list(test_data2$V1), FUN=mean, na.rm=TRUE)
aggdata_std_test <-aggregate(test_data3[,2:34], by=list(test_data3$V1), FUN=mean, na.rm=TRUE)
aggdata_std_train <-aggregate(test_data4[,2:34], by=list(test_data4$V1), FUN=mean, na.rm=TRUE)

# Merging previous values
subset_join_mean <- rbind(column_name_mean1,aggdata_mean_test,column_name_mean2,aggdata_mean_train)
subset_join_std <- rbind(column_name_std1,aggdata_std_test,column_name_std2,aggdata_std_train)

# Final subset
complete_subset <- cbind(subset_join_mean,subset_join_std)

# Writing table
write.table(complete_subset, file = "subset_point5.txt",row.name=FALSE, col.name=FALSE)