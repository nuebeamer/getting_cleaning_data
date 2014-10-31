#source.url(url, file = tempfile(), method, ...)
#library(XML)
library(plyr)
require(XML)

setwd("D:\\Nanda\\R-programming\\Quiz1-Getting_CleaningData\\")
destfile <- "baltimorerestaurants.xml"
#url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download.file(url, destfile, method="auto", quiet = FALSE, mode = "w",
#               cacheOK = TRUE,
#               extra = getOption("download.file.extra"))
doc <- xmlParse(destfile)


adoc <- t(xmlToList(xmlRoot(xmlTreeParse(destfile))[[1]]))

mytestlf <- as.data.frame(adoc)

mytestlf <- subset(mytestlf, mytestlf$zipcode=="21231")
nrow(mytestlf)