# week4  
The data  come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The script does following task:
-Merges the training and the test sets to create one data set.
-Extracts only the measurements on the mean and standard deviation for each measurement.
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names.
-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R script use following library: dplyr, data.table, readr, stringr, so make sure you have installed those libraries beforehand.  
  
Some variable names which configure the file path which is selft explained, you should change to match your enviroment  
training_data_file_path <- 'data\\train\\X_train.txt'  
training_label_file_path <- 'data\\train\\y_train.txt'  
training_subject_file_path <- 'data\\train\\subject_train.txt'  
test_data_file_path <- 'data\\test\\X_test.txt'  
test_label_file_path <- 'data\\test\\y_test.txt'  
test_subject_file_path <- 'data\\test\\subject_test.txt'  
features_name_filepath <- 'data\\features.txt'  
labels_name_file_path <- 'data\\activity_labels.txt'  
  
To load training or test data, use the function load_data and pass parameters, it will performs following task:  
1.Read the features names  
2.Standardize the features name (lower case, deduplicate)  
3.Read data  
4.Read label  
5.Read subject  
6.Read label name  
7.Column bind data, label and subject  
8.Merge with labelname to get descriptive label names.  