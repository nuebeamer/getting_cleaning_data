library(quantmod)
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn) 
print(class(sampleTimes))
#sampleTimes <- as.date(sampleTimes)
#weekdays(sampleTimes)
#sample2012 <- if(year(sampleTimes)==2012  && weekdays(sampleTimes)=="Monday")
sample2012 <- sampleTimes[sampleTimes > "2011-12-31" & sampleTimes < "2013-1-1"]
sample2012Mon <- sample2012[weekdays(sample2012)=="Monday"]
print(paste(length(sample2012),",",length(sample2012Mon)))