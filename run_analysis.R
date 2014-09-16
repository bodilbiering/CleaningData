#Assignment:
#You should create one R script called run_analysis.R that does the following. 
#1:Merges the training and the test sets to create one data set.
#2:Extracts only the measurements on the mean and standard deviation for each measurement. 
#3:Uses descriptive activity names to name the activities in the data set
#4:Appropriately labels the data set with descriptive variable names. 
#5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#load dplyr package
library(dplyr)

#download and unzip data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/SmartphoneData", method = "curl")
dateDownloaded <- date()
unzip("./data/SmartphoneData", exdir="./data")

#get the featurenames
featureNames <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("featurenr","featurename"))
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("activitynr", "label"))

#combine testdata into one frame
test_subject <-  read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "activity")
testdata <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = featureNames$featurename)
testres <- cbind(test_subject, test_activity, testdata)

#combine traindata into one frame
train_subject <-  read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "activity")
traindata <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = featureNames$featurename)
trainres <- cbind(train_subject, train_activity, traindata)

#combine test and train dataframes
res <- rbind(testres, trainres)
#
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
meanStdNames <- grep("Mean|mean|Std|std", names(res))
res2 <- res[,c(1,2,meanStdNames)]
#3. Uses descriptive activity names to name the activities in the data set
activities <- sapply(res2$activity, function(x) activityLabels[x,"label"])
#4 clean up labels, i.e., lowercase, no dots or parenthesis.
names(res2) <- gsub("[.]|[(]|[)]", "", convertednames) %>% 
               tolower

#5: Group by subject, group by activity, take mean for each var in these groups
tidymean <- group_by(res2, subject, activity) %>%
            summarise_each(funs(mean))

#todo: 
#codebook
#take the swirl again to see if improvements can be made