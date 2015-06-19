#### Experiments Description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% 
the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating
variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### Measurements provided for train and test sets:

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.

#### Acknowledgement:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#### Descriptionof the measurements calculated in the script:

The following features can be found after running the script:

1. tBodyAcc-XYZ            
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. fBodyAcc-XYZ
7. fBodyAccJerk-XYZ
8. fBodyGyro-XYZ
9. tBodyAccMag
10. fBodyAccJerkMag

The intitial "t" and "f" stand for time and frequency measured by accelerometer "acc" and gyroscope "Gyro". The body "Body" and gravity "Gravity" acceleration have been stored in different feature. Features with "-XYZ" indicates that the three-axis can be found separately, for instance, tBodyAcc-X, tBodyAcc-Y and tBodyAcc-Z. The magnitude of these three-dimensional signals can be found in features tBodyAccMag and tBodyAccJerkMag. 

The principal outcome of the script are the variables "complete_data_test" and "Complete_subset". This two data.frames include:
1. "complete_data_test": mean value "mean()" and the satandard deviation "std()" observations of each feature by activities (Please check file "activity_labels" inlcuded in the zip file).
2. "Complete_subset": average of the observations by activity.
