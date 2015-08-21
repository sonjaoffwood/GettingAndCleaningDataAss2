##The following script transforms the data from Assignment 2 of the Coursera Getting and Cleaning Data Course into a tidy data set.
#load libraries
library(plyr)
library(reshape2)

##Read in original data 
	wd=getwd()
#read in header names
	setwd(paste(wd,"/UCI HAR Dataset",sep=""))
	ft=readLines("features.txt")
#read in train data
	setwd(paste(wd,"/UCI HAR Dataset/train",sep=""))
	trainx=read.table("X_train.txt", header=FALSE)
	trainy=read.table("y_train.txt", header=FALSE)
	trains=read.table("subject_train.txt", header=FALSE)
	train=cbind(trains,trainx,trainy)
#read in test data
	setwd(paste(wd,"/UCI HAR Dataset/test",sep=""))
	testx=read.table("X_test.txt", header=FALSE)
	testy=read.table("y_test.txt", header=FALSE)
	tests=read.table("subject_test.txt", header=FALSE)
	test=cbind(tests,testx,testy)
#combine train and test data and give columns names
	total=rbind(train,test)
	names(total)=c("subject", as.list(ft), "activity")

#pull out only columns with the word "mean" or "std" in the column name
t1= total[,grepl("mean\\(\\)", names(total))]
t2= total[,grepl("std\\(\\)", names(total))]
t=cbind(total$subject,t1,t2,total$activity)
names(t)=c("subject",as.list(names(t1)), as.list(names(t2)), "activity")

#Label activities with sensible names
t$activity= as.factor(t$activity)
levels(t$activity)=c("Walking", "Walking Upstairs","Walking Downstairs", "Sitting","Standing","Laying")

#Change names to be more consistent and sensible
x=names(t)
x=gsub(".* ", "", x)
x=gsub("mean\\(\\)","mean", x)
x=gsub("std\\(\\)","std", x)
names(t)=x

#melt and cast data to create a tidy data set
data_melt = melt(t, id = c("subject","activity"), measure.vars = c(x[3:length(x)-1]))
data_cast = dcast(data_melt, subject + activity ~ variable, value.var = "value", mean)

#Create a textfile with the tidy data saved in the original working directory
setwd(wd)
write.table(data_cast, "finaldata.txt",row.name=FALSE)
