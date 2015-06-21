## Libraries needed for the script to run
library(dplyr)
library(reshape2)

## Create activity labels lookup; set class for each column
activity <- read.table(file = "activity_labels.txt"
                       ,colClasses = c("numeric", "character"))

## Create feature labels for column header
feature <- read.table(file = "features.txt"
                      ,colClasses = c("numeric","character")
                      ,col.names = c("ID", "Feature"))

## Read the test data in then add the labels to the set
test.data <- read.table(file = "test/Y_test.txt"
                        ,colClasses = "numeric") %>% #bring in activity IDs
        cbind(select(read.table(file = "test/subject_test.txt"
                         ,colClasses = "factor"), Subject = V1)) %>% #add subject IDs
        cbind(read.table(file = "test/X_test.txt"
                                ,colClasses = "numeric"
                                ,col.names = feature$Feature)) %>% #add variables
        merge(activity) %>% #lookup from activity dataset
        rename(Activity = V2, ActivityID = V1) #rename the activity name and ID

## Read the training data in then add the labels to the set
train.data <- read.table(file = "train/Y_train.txt"
                         ,colClasses = "numeric") %>% #bring in activity IDs
        cbind(select(read.table(file = "train/subject_train.txt"
                         ,colClasses = "factor"), Subject = V1)) %>% #add subject IDs
        cbind(read.table(file = "train/X_train.txt"
                                         ,colClasses = "numeric"
                                         ,col.names = feature$Feature)) %>% #add variables
        merge(activity) %>% #lookup from activity dataset
        rename(Activity = V2, ActivityID = V1) #rename the activity name and ID

## Combine the test and training sets into all and subset for
## mean and std measures only
all.data <- rbind(test.data, train.data) #merge test and train data

all.data <- all.data[,c("Activity","Subject")] %>% #select the activity and subject
        cbind(all.data[,(grep("mean()",feature$Feature)+2)]) %>% #combine mean variables
        cbind(all.data[,(grep("std()",feature$Feature)+2)]) #combine standard deviation variables

## Subset for tidy data set
tidy.data <- melt(all.data,id = c("Subject", "Activity")) %>% #convert to key value pair dataset
        dcast(Subject + Activity ~ variable, mean) #collapse variables above using mean

## Create the txt file for upload
write.table(tidy.data, "tidy_data.txt", row.names = FALSE)