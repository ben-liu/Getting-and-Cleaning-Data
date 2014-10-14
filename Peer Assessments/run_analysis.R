# Merges the Training and the Test sets to create one data set.

# setwd("C:/Users/Ben/Google Drive/Coursera/Getting and Cleaning Data/Peer Assessments/UCI HAR Dataset/")

# load train set of data 
TrainData <- read.table("./train/X_train.txt")
TrainLabel <- read.table("./train/y_train.txt")
TrainSubject <- read.table("./train/subject_train.txt")

# load test set of data
TestData <- read.table("./test/X_test.txt")
TestLabel <- read.table("./test/y_test.txt") 
TestSubject <- read.table("./test/subject_test.txt")

# combine train and test sets of data
dim(TrainData)
dim(TestData)
MergeData <- rbind(TrainData, TestData)

dim(TrainLabel)
dim(TestLabel)
MergeLabel <- rbind(TrainLabel, TestLabel)

dim(TrainSubject)
dim(TestSubject)
MergeSubject <- rbind(TrainSubject, TestSubject)

dim(MergeData)
dim(MergeLabel) # row index
dim(MergeSubject) 

# Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./features.txt")
# table(is.na(features&V2))
dim(features) # column index
ExtractColIndex<- grep("mean\\(|std\\(",features$V2)
MergeData<- MergeData[,ExtractColIndex]

# Uses descriptive activity names to name the activities in the data set
Activity<- read.table("./activity_labels.txt") # name for column index
Activity[,2]<- tolower(gsub("\\_"," ",Activity[,2]))

# substitute label with activity names
MergeLabel[,1]<- Activity[MergeLabel[,1],2]

Merge<- cbind(MergeSubject,MergeLabel,MergeData)

# Appropriately labels the data set with descriptive variable names. 
list<- features[ExtractColIndex,2]
list<- gsub("\\(\\)","",list)
list<- gsub("\\-std","SD",list)
list<- gsub("\\-mean","Mean",list)
ColNames<- c("Subject","Activity",list)
names(Merge)<- ColNames


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
temp<- melt(Merge,id=1:2)
tidy<- dcast(temp,Subject + Activity ~ variable , mean)

write.table(tidy, "tidy_data.txt",row.names=FALSE)


