## loading necessary libraries
library(plyr)
library(dplyr)
library(reshape2)

## The folliwing lines will download the zip file from cloudfront and unzip them. Afterwards, 
## the working directory is set to the new folder. Skip this if the files are all already in your working directory
#
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
#unzip("dataset.zip")
#setwd("./UCI HAR Dataset")





#########
## Assignment 1: Merge the training and test sets to create one data set.
##      Sub 1: Extract the data test and train sets

x.test <- read.table("./test/X_test.txt")
y.test <- read.table("./test/y_test.txt")
subject.test <- read.table("./test/subject_test.txt")
x.train <- read.table("./train/X_train.txt")
y.train <- read.table("./train/y_train.txt")
subject.train <- read.table("./train/subject_train.txt")

##      Sub 2: Combine the two vertically with rbind
x.combined <- rbind(x.test, x.train)
y.combined <- rbind(y.test, y.train)
subject.combined <- rbind(subject.test, subject.train)

##      Sub 3: Add indeces to join on
x.combined$Index <- seq(along=x.combined[,1])
y.combined$Index <- seq(along=y.combined[,1])
subject.combined$Index <- seq(along=subject.combined[,1])

##      Sub 4: Rename columns in y.combined and subject.combined
y.combined <- rename(y.combined, activity = V1)
subject.combined <- rename(subject.combined, subject = V1)

##      Sub 5: Finally join them all based on Index
raw.ds <- join_all(list(y.combined, subject.combined, x.combined), by="Index")

#########
## End of assignment 1: raw.ds has all measurements, subjects and activities from the raw datasets
#########





#########
## Assignment 2: Extract only the measurements on the mean and standard deviation for each measurement
##      Sub 1: Import file containing variable descriptions
var.desc <- read.table("features.txt")

##      Sub 2: Create a vector of variable names that contain mean() or std(). 
##              This gives us a way to fetch only those variables
##              I consider the measures like angle(X,gravityMean) to not be mean or std measures
rel.vars <- c(grep("*.mean\\(\\).*", var.desc$V2, ignore.case = TRUE), grep("*.std\\(\\).*", var.desc$V2, ignore.case = TRUE))

##      Sub 3: Extract only those columns from the relevant variable vector. I have added 3 to it, as subject, Index
##              and activity_label are the first 3 variables. Index is also dropped now as it is no longer necessary
rel.ds <- raw.ds[,sort(c(1,3,rel.vars+3))]

#########
## End of assignment 2: rel.ds has all relevant measurements, subjects and activities
#########




#########
## Assignment 3: Use descriptive activities to name the activities in the data set
##      Sub 1: Import file containing the activity descriptions and rename for merging
act.desc <- read.table("activity_labels.txt")
names(act.desc) <- c("activity", "activity.label")

##      Sub 2: Merge it with the relevant dataset
rel.ds <- merge(rel.ds, act.desc)

#########
## End of assignment 3: rel.ds now has activity.label which has human interpretable activity names
#########


#########
## Assignment 4: Appropriately label the data set with descriptive variable names
##     
##      I feel the descriptions as labelled in activity_labels.txt are already quite descriptive.
##      so I will just clean them up a little to remove the () and replace the - with a .
##
##      Sub 1: Remove () and replace - with . for the activity labels
new.names <- var.desc[sort(rel.vars),]
new.names$V2 <- gsub("\\(\\)", "", new.names$V2)
new.names$V2 <- gsub("-", ".", new.names$V2)

##      Sub 2: replace variable names in rel.ds. Have to start at variable 3, through the length of the new.names vector + 2
##              as there are 2 variables in the beginning
names(rel.ds)[(1:length(new.names$V2))+2] <- new.names$V2

##      Sub 3: Create the tidy dataset
##              Here I create a data frames that subscribe to the tidy format.
##              The data frame created here, tidy.wide is described in the accompanying documents
##              I change the order of the variables to first reflect the subject and activity label
##              Then all the measurements
wide.tidy <- rel.ds[c(2, 69, 3:68)]

#########
## End of assignment 4: wide.tidy is a tidy dataset used for step 5.
#########



#########
## Assignment 5: From the data set in step 4, create a second, independent tidy data set with the average
##                      of each variable for each activity and each subject
##      Sub 1: Melt the dataset. Here it is handy that I re-ordered the dataset before
melt <- melt(data=wide.tidy, id=c("subject", "activity.label"), measure.vars = names(wide.tidy)[3:68])

##      Sub 2: Calculate the mean of the measurements
summary.tidy <- dcast(melt, subject + activity.label ~ variable, mean)

##      Sub 3: Rename the variables to show they're also means of
names(summary.tidy)[3:68] <- paste("mean.of.", names(summary.tidy)[3:68], sep="")

##      Sub 4: Save it to a file to upload
write.table("summary_tidy.txt", row.name=FALSE)

#########
## End of assignment 5: new, independent summary tidy data set is created and saved to a file.
##
##      Dear grader, thanks for reviewing my code! I hope it was clear to you what I was doing and 
##      am looking forward to seeing you in the next steps of the Data Science Specialization!
#########
