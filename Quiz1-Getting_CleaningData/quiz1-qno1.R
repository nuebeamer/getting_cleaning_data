setwd("D:\\Nanda\\R-programming\\Quiz1-Getting_CleaningData\\")
#require("XLConnect")
filenam <- "getdata_data_ss06hid.csv"
filedata <- as.data.frame(read.csv(filenam))
filesubdata <- as.data.frame(subset(filedata, filedata$VAL==24))
print(NROW(filesubdata))
