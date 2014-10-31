library("httr")
library(XML)
qurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
x <- read.fwf(file=url(qurl),skip=4,widths=c(12, 7,4, 9,4, 9,4, 9,4))
             sum(x[,4])
