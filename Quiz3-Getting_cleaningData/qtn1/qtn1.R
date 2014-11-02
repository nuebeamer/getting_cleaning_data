qz3qtn1<-function(){
    setwd("D:/Nanda/R-programming/Getting_cleaningData/Quiz3-Getting_cleaningData/qtn1")
    df<- read.csv("getdata_data_ss06hid.csv", sep=",", header=TRUE)
    #print(colnames(df))
    clist <- strsplit(colnames(df),"wgtp",  fixed=TRUE)
    print(clist[123])
}
qz3qtn1()