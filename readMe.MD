---
title: "run_Analysis"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
# Read the package for the working directory set as follows
# Please change the working directory before running this code.
setwd("D:/Nanda/R-programming/Getting_cleaningData/courseAssignment/getdata_projectfiles_UCI HAR Dataset(1)/UCI HAR Dataset")
# Output directory path.
outputdir <- "../output"
#package(stringr)
# Use packages dplyr, reshape
library(dplyr)
library(reshape)
# Read column names from Features file
getcolnames <- read.delim("features.txt", sep="", header=FALSE )
# subset & get the Name field
getcolnames<- getcolnames[[2]]

# read all Subject train Data
subjectTrainData <- read.table("train/subject_train.txt", sep="", header=FALSE, col.names="Subject")
# read activity Labels
ActivityLabels <- read.table("activity_labels.txt", sep="", header=FALSE, col.names=c("id","Activity"))
# get all training data
xTraindata <- read.table("train/x_train.txt", sep="", header=FALSE, col.names=getcolnames)
# Get all activity
yTrainActivity <- read.table("train/y_train.txt", col.names="Activity")
# bind columns for train
xTraindata <- cbind(subjectTrainData, yTrainActivity,xTraindata)
# read Subject Test data
subjectTestData <- read.table("test/subject_test.txt", sep="", header=FALSE, col.names="Subject")
# read Test Data
xTestData <- read.table("test/x_test.txt", sep="", header=FALSE, col.names=getcolnames)
# read activity data for test
yTestActivity <- read.table("test/y_test.txt", col.names="Activity")
# bind columns for test
xTestData <- cbind(subjectTestData, yTestActivity, xTestData)
# bind rows for Test & Train
xdata <- rbind(xTraindata, xTestData)
# select columns for subset - contains only Subject, Activity, Mean & STD calcualted fields by using GREP
selcolnames <- paste("subject|activity|mean|std", sep="")
xdata <- xdata[,grep(selcolnames, colnames(xdata),ignore.case=TRUE)]
# Match & replace Activity Label from 1 to 6 to appropriate label from the activity label dataset
xdata$Activity<-ActivityLabels[match(xdata$Activity, ActivityLabels$id),2]
# create dir, ignore warnings if available
dir.create("output", showWarnings=FALSE)
# Modify columns names to be readable by removing unnecessary ".", leading or trailing "f" or "t"
xdatacolnames <- colnames(xdata)
xdatacolnames <- gsub(".","", xdatacolnames, fixed=TRUE)
xdatacolnames <- gsub("^t","", xdatacolnames, fixed=FALSE)
xdatacolnames <- gsub("^f","", xdatacolnames, fixed=FALSE)
xdatacolnames <- gsub(".1","", xdatacolnames, fixed=TRUE)
# write table data to file 
write.table(xdata, file="output/tidydata1.txt", append=FALSE, 
            quote=FALSE, sep=" ", eol = "\r\n", dec=".", col.names=xdatacolnames)

# read from tidy data from output folder in the step above.
tidydata <- read.delim(file="output/tidydata1.txt", header=TRUE,  sep="", dec=".",
                       na.strings="NA")
# colscount - not used
colsCount <- NCOL(tidydata)

#ddply & apply col means for columns excluding Activity & Subject.
result <- ddply(tidydata, c("Subject","Activity"), function(df)sapply(df[,c(3:colsCount)],mean,na.rm=TRUE ))

# write table to final output file.
write.table(result, file="output/tidydata_final.txt", append=FALSE, row.name=FALSE,
            quote=FALSE, sep=" ", eol = "\r\n", dec=".", col.names=xdatacolnames)
