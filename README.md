# week4
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