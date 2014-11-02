qz3qtn4<- function(){
setwd("D:/Nanda/R-programming/Getting_cleaningData/Quiz3-Getting_cleaningData/qtn2")
df<- read.csv("getdata_data_GDP.csv", sep=",", header=TRUE, skip=4)
dfeds <- read.csv("getdata_data_EDSTATS_Country.csv", sep=",", header=TRUE)

dfgdp <- df[1:190,]
dfgdp[[5]] <- lapply(dfgdp[[5]], function(df1){gsub(",","", df1, fixed=TRUE);})
#print(colnames(dfeds))
colnames(dfgdp) <- c("abbr","Sno","X.3","CountryNames","GDP", "X.6", "X.7", "X.8","X.9","X.10")
#print(colnames(dfgdp))
dfgdpeds <- as.data.frame(merge(dfgdp, dfeds, 
                by=intersect(dfgdp$abbr, dfeds$CountryCode), 
                by.x="abbr", by.y="CountryCode", sort=TRUE, row.names=null))

findstr <- "Fiscal Year end: June"
dfsubset <- dfgdpeds[grep(findstr,dfgdpeds$Special.Notes, 
                          ignore.case=TRUE, fixed=FALSE),]
#print(colnames(dfsubset))
print(dfsubset[,c(1,4,19)])
print(nrow(dfsubset))
}
qz3qtn4()