library("httr")
library(XML)
qurl <- "http://biostat.jhsph.edu/~jleek/contact.html"
con=url(qurl)
html <- readLines(con, n=100)
#content2 <- content(html,as="text")
#parsedHtml <- htmlParse(content2,asText=TRUE)
print(nchar(html[10]))
print(nchar(html[20]))
print(nchar(html[30]))
print(nchar(html[100]))

close(con)
