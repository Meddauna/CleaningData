library(dplyr)

#requires that test and training data is in the working directory in their respective folders

#Loading x_labels which gives us the column labels for the x_test and x_train data sets
x_labels<-read.table("features.txt",stringsAsFactors = FALSE)
#labeling the table headers for x_labels
names(x_labels)=c("colnum","xlabels")
#cleaning the names in the x_labels table to get rid of punctuation for task 4
x_labels<-mutate(x_labels,xlabels=x_labels<-sapply(x_labels[,2],function(x){gsub("-|\\(|\\)|,","",x)}))


#loading activity labels table
activitylabels<-read.table("activity_labels.txt",stringsAsFactors = FALSE)
#naming the activity labels table columns for task 4
names(activitylabels)=c("activity_num", "activity_name")

#loading the subjects from the test and train data sets
testsubjects<-read.table("./test/subject_test.txt")
trainsubjects<-read.table("./train/subject_train.txt")

#combining the test and train subjects into a single subjects table
subjects<-rbind(testsubjects,trainsubjects)
#labeling the table column for task 4
names(subjects)="Subjects"

#loading the "X" tables from the test and train data sets
x_test<-read.table("./test/X_test.txt")
x_train<-read.table("./train/X_train.txt")

#combining the test and train "X" into a single "X" table
x<-rbind(x_test,x_train)
#using the cleaned x_labels table to apply column names to the "X" table for task 4
names(x)=x_labels[,2]

#loading the activity tables from the test and train data sets
activitytest<-read.table("./test/y_test.txt")
activitytrain<-read.table("./train/y_train.txt")

#combining the test and train activtity tables into a single activity table for task 3
activity<-rbind(activitytest, activitytrain)
#labeling the activity table column
names(activity)="activity_number"
#adding a new column to activity table with the descriptive names from the activity labels table
#using sapply to keep order instead of merge which reorders
activity<-mutate(activity,activity_name=sapply(activity,function(x){activitylabels[x,2]}))

#creating the master data set, this fullfills task 1
fulldata<-cbind(subjects,activity,x)


#finding the columns from full table that has mean and std to extract for task 2
interestingcolumns<-grep("mean|std", names(fulldata))

#creating a table of only the interesting columns for task 2 
#as well as the subject number and task number and description to be able to complete task 5
interestingdata<-fulldata[,c(1:3,interestingcolumns)]

#summarizing the data by subject and task groups for task 5
interestingsummary<-interestingdata %>% group_by(Subjects,activity_number, activity_name) %>% summarize_all(mean)

