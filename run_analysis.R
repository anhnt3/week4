library(dplyr)
library(data.table)
library(readr)
library(stringr)

# setting input parameters
training_data_file_path <- 'data\\train\\X_train.txt'
training_label_file_path <- 'data\\train\\y_train.txt'
training_subject_file_path <- 'data\\train\\subject_train.txt'
test_data_file_path <- 'data\\test\\X_test.txt'
test_label_file_path <- 'data\\test\\y_test.txt'
test_subject_file_path <- 'data\\test\\subject_test.txt'
features_name_filepath <- 'data\\features.txt'
labels_name_file_path <- 'data\\activity_labels.txt'

# load data, label and subject file and return dataframe which contain data,label,subject
load_data <- function(data_file_path, label_file_path, subject_file_path,labels_name_file_path, data_column_expression = ".*(mean|std).*")
{
    # read the features names
    features_names <- read.csv(features_name_filepath, sep = ' ', header = FALSE, col.names = c("no","name"))
    # standardize comname by removing special character and lower the character
    colNames <- str_to_lower(str_replace_all(as.vector(features_names$name), "[()\\-,]",""))
    # because some colname is duplicate so append index number to column name to make sure column name is unique
    colNames <- paste(colNames,as.character(features_names$no),sep='')

    # read data
    data <- fread(data_file_path, sep = ' ', header = FALSE, col.names = colNames)
    data <- select(data, matches(data_column_expression))

    # read label
    label <- fread(label_file_path, sep = ' ', header = FALSE, col.names = c("label"))
    
    # read subject
    subject <- fread(subject_file_path, sep = ' ', header = FALSE, col.names = c("subject"))
    
    # read activity name
    label_name <- fread(labels_name_file_path, sep = ' ', header = FALSE, col.names = c("label","labelname"))
    
    result <- cbind(data,label,subject)
    
    result <- merge(result, label_name, by = "label")
    
    
    result
}

# load training data
training <- load_data(training_data_file_path,training_label_file_path,training_subject_file_path,labels_name_file_path)

# load test data
test <- load_data(test_data_file_path,test_label_file_path,test_subject_file_path,labels_name_file_path)

# merge two data
merged_data <- rbind(training, test)

# group by subject and label then apply mean function
tidy_data <- merged_data %>% group_by(subject,labelname) %>% summarise_all( mean)
write.table(tidy_data, "tidy_data.csv", row.names = FALSE, sep = ',' , append = FALSE)


