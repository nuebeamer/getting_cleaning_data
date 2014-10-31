#source.url(url, file = tempfile(), method, ...)
#library(XML)
library(data.table)
require(data.table)
require(stats)
setwd("D:\\Nanda\\R-programming\\Quiz1-Getting_CleaningData\\")
destfile <- "getdata_data_ss06pid.csv"
#url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download.file(url, destfile, method="auto", quiet = FALSE, mode = "w",
#               cacheOK = TRUE,
#               extra = getOption("download.file.extra"))

DT <- fread(destfile, sep = ",", header= TRUE) 
#print(head(DT))
#lapply(split(pre, pre$SEX), function(x){rowMeans(x[[,34]])})


putm <- proc.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
print(proc.time()-ptm)


putm <- proc.time()
tapply(DT$pwgtp15,DT$SEX,mean)
print(proc.time()-ptm)

putm <- proc.time()
DT[,mean(pwgtp15),by=SEX]
print(proc.time()-ptm)
