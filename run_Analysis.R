setwd("D:/Nanda/R-programming/Getting_cleaningData/courseAssignment/getdata_projectfiles_UCI HAR Dataset(1)/UCI HAR Dataset")
outputdir <- "../output"
#package(stringr)
library(dplyr)
library(reshape)
# Read column names
getcolnames <- read.delim("features.txt", sep="", header=FALSE )
# subsets to the Name field
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
# select columns for subset
selcolnames <- paste("subject|activity|mean|std", sep="")
xdata <- xdata[,grep(selcolnames, colnames(xdata),ignore.case=TRUE)]
# Match & replace Activity Label
xdata$Activity<-ActivityLabels[match(xdata$Activity, ActivityLabels$id),2]
# create dir, ignore warnings if available
dir.create("output", showWarnings=FALSE)
# Modify columns names to be readable.
xdatacolnames <- colnames(xdata)
xdatacolnames <- gsub(".","", xdatacolnames, fixed=TRUE)
xdatacolnames <- gsub("^t","", xdatacolnames, fixed=FALSE)
xdatacolnames <- gsub("^f","", xdatacolnames, fixed=FALSE)
xdatacolnames <- gsub(".1","", xdatacolnames, fixed=TRUE)
# write table data to file 
write.table(xdata, file="output/tidydata1.txt", append=FALSE, 
            quote=FALSE, sep=" ", eol = "\r\n", dec=".", col.names=xdatacolnames)

# read from tidy data from 4
tidydata <- read.delim(file="output/tidydata1.txt", header=TRUE,  sep="", dec=".",
                       na.strings="NA")
# colscount - not used
colsCount <- NCOL(tidydata)

#ddply & apply col means.
result <- ddply(tidydata, c("Subject","Activity"), function(df)sapply(df[,c(3:colsCount)],mean,na.rm=TRUE ))

# write table to final output.
write.table(result, file="output/tidydata_final.txt", append=FALSE, row.name=FALSE,
            quote=FALSE, sep=" ", eol = "\r\n", dec=".", col.names=xdatacolnames)

