qz3qtn2<- function(){
setwd("D:/Nanda/R-programming/Getting_cleaningData/Quiz3-Getting_cleaningData/qtn2")
df<- read.csv("getdata_data_GDP.csv", sep=",", header=TRUE, skip=4)

df <- df[1:190,]
#print(head(df,10))
df[[5]] <- lapply(df[[5]], function(df1){gsub(",","", df1, fixed=TRUE);})
#print(df[[5]])
mgdp <- mean(as.numeric(df[[5]]), na.rm=TRUE)
print(mgdp) # result for Qtn2
colnames(df) <- c("countrycode","Sno","","CountryNames","GDP")
countryNames <- df$CountryNames
#print(countryNames)
countryNames[grep("^United",countryNames, value=FALSE)]
 #grep("^United",countryNames, fixed=TRUE)   

}
qz3qtn2()