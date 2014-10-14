# week 1 quiz

# setwd("C:/Users/Harry Samsung Laptop/Downloads/ben.liu's work/Coursera/Getting and Cleaning Data/")


# Q1
if(!file.exists("Week 1 Quiz")){dir.create("Week 1 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(URL,destfile="./Week 1 Quiz/q1.csv")
# in Mac, add argument: method="curl"
q1<- read.csv(file="./Week 1 Quiz/q1.csv")
nrow(subset(q1,VAL>=24))


rm(list=ls())

# list.files("./data")
# dateDownloaded <- date()
# dateDownloaded

# Q3
if(!file.exists("Week 1 Quiz")){dir.create("Week 1 Quiz")}
# downloaded file is corrupted
URL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"
download.file(URL,destfile="./Week 1 Quiz/Q3.xlsx")
# in Mac, add argument: method="curl"
# install.packages("xlsx")
# install.packages("XLConnect")

library(xlsx)
dat <- read.xlsx("./Week 1 Quiz/Q3.xlsx",sheetIndex=1,colIndex=7:15,rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T) 


# library(XLConnect)
# q3<- loadWorkbook("./Week 1 Quiz/Q3.xlsx",create=T)
rm(list=ls())


# Q4
if(!file.exists("Week 1 Quiz")){dir.create("Week 1 Quiz")}
URL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(URL,destfile="./Week 1 Quiz/Q4.xml")

# install.packages("XML")
library("XML")
doc<- xmlTreeParse("./Week 1 Quiz/Q4.xml",useInternal=T)

if (FALSE) {
poor answer

list<- xpathSApply(rootNode,"//zipcode",xmlValue)
tb<- table(list)
df<- data.frame(tb)
subset(df,list==21231)

}

sum(xpathSApply(rootNode, "//zipcode", xmlValue)==21231) # 127


# rootNode<- xmlRoot(doc)
# xmlName(rootNode)
# names(rootNode)

# xmlSApply(rootNode,xmlValue)
# xpathSApply(rootNode,"//name",xmlValue)
# xpathSApply(rootNode,"//li[@class='zipcode']",xmlValue)

rm(list=ls())


# Q5
if(!file.exists("data")){dir.create("data")}
URL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(URL,destfile="./Week 1 Quiz/Q5.csv")

# install.packages(data.table)
library(data.table)
DT<- fread("./Week 1 Quiz/Q5.csv")

# not really working
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])


# alternative solution
# option A for example
# run code for 100 times; record start time and end time; diff is the running time
st = proc.time()
for (i in 1:100){
  sapply(split(DT$pwgtp15,DT$SEX),mean)
}
print (proc.time() - st)



rm(list=ls())
