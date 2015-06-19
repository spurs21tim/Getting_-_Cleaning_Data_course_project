#### Course Project Getting and Cleaning Data

The following explanation has been included in the R code to help readers to understand the aim
of each code line.Be aware to load al the necesary libraries to run the code without error messages. 

Before starting I have created a folder to save the data needed for the project
and set the path to run into the scrip. Please be aware of changing the path in which 
you have saved your files in your computer.
My path: "C:/~~/Coursera/GettingandCleaningData/Course_Project/UCI_HAR_Dataset"

#### First taks: Merges the training and the test sets to create one data set;
Accordign the "README.txt" only files "X_text.txt" in both, train and test folders, 
contains sets of data which variables are listed in "feautres.txt". Therefore, 
I only merge this to files into one. We can check that by reading into R the
txt files. For instance: "features.txt" have 561 objectes that coressponds to 
the 561 varaibles of "x.train.txt".

# Steps: 
## 1. Selection of train and test files and reading both tables (read.table)
## 2. Merge the data in one data.frame

#### Second Task: Extracts only the measurements on the mean and standard deviation for each measurement.
# Here we have to extrack from "data_join" the variables which gives values of mean and standard deviation, 
# according the guidelines given in "features_info.txt"

#Steps:
# 1. Identification of variables with mean values. ("grep" function returns factors)
# 2. Identification of variables with standard deviation values ("grep" function returns factors)
# 3. Getting only the varaibles with mean and std from data.frame object calculated at the end of First task 

#### Third task: Uses descriptive activity names to name the activities in the data set
# We have six activities according to "activities_labels.txt". In file "y_test.txt" and 
# "y_train.txt", each activity is assigned to the objects (rows) listed in "x_train.txt" 
# and "x_test.txt". What I have to do is to link those activity names to data_join set

#Steps:
# 1. Naming labels with activities
# 2. Name the data set "data_join_mean" and "data_join_std" as follows: 
## a) I will add a column to include the name of the activity for each measurement
## b) Each column will be labeled with the variable name
# 3. Adding row name and column name to data set
# 4. Final Tidy data

#### Fourth task: Appropriately labels the data set with descriptive variable names. 
# It was already done in Third task

#### Fiveth Task: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# I have arrange the data in order to be able to calculate the mean of each varaible according to the activitiy

#Steps:
# 1. Creating object with Mean values
# 2. Creating object with Standard desviation values
# 3. Calculation of mean of each variable for each activity
# 4. Merging previous values
# 5. Final subset
# 6. Writing table
