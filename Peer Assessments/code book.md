# Getting and Cleaning Data - Project Code Book


This is the code book for the R script written as part of course project.

Data is obtained from the following source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 


## Variables description
- Signals
	- prefix
		- **t**: time domain signals
		- **f**: frequency domain signals
	- signal separation
		- **Body**: body signals
		- **Gravity**: gravity signals
	- accelerometer and gyroscope
		- **Acc**: accelerometer
		- **Gyro**: gyroscope
	- measurement
		- **Jerk**: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
		- **Mag**: the magnitude of these three-dimensional signals were calculated using the Euclidean norm
	- 3-axial signals in these directions
		- **X**
		- **Y**
		- **Z**
- Set of variables
	- **Mean**: mean value
	- **SD**: standard deviation

## Data description
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Data cleaning processes
1. Raw data from *train* folder is imported. X_train.txt, y_train.txt and subject_train.txt are read into R with variable names *TrainData*, *TrainLabel*, and *TrainSubject*. Repeat for *test* folder. Variable names are *TestData*, *TestLabel*, and *TestSubject*. 
2. Combine data sets from train and test folders and create a variable called *MergeData*. Repeat for Subject (*MergeSubject*) and Label (*MergeLabel*). 
3. Read *features.txt* to obtain Feature Selection and select only mean and standard derivation as requested in the project. Filter the dataset and preserve only relevant columns.
4. Read *activity_labels.txt* to obtain 6 activities that match with label values. Change to lower case for better recognition. Substitute values in *MergeLabel* with activity names
5. Combine *MergeSubject*,*MergeLabel*,and *MergeData*. Replace "mean()" and "std()" in raw data with "Mean" and "SD". Assign features as header of data frame *Merge*.
6. Reshape the data frame to obtain a second, independent tidy data set with the average of each variable for each activity and each subject. Write data frame to table *tidy_data.txt*. 

