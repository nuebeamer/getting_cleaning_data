setwd("D:\\Nanda\\R-programming\\Quiz2-Getting_CleaningData\\")
library(sqldf)
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
acs <- read.csv(URL)
#sqldf("select pwgtp1 from acs where AGEP < 50")
# ##sdata <- read.csv2.sql(file, sql = "select pwgtp1 from acs where AGEP < 50", header = TRUE, sep = ";", 
#               row.names, eol, skip, filter, nrows, field.types, comment.char, 
#               colClasses, dbname = tempfile(), drv = "SQLite", ...) 
# print(sdata)

# URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# DF25 <- read.csv(URL, nrows = 25)
# DF25$Date <- as.Date(DF25$Date)
sqldf("select distinct AGEP from acs order by agep")