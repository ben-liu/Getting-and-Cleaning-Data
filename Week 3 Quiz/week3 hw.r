# week 3 quiz

# setwd("C:/Users/Harry Samsung Laptop/Downloads/ben.liu's work/Coursera/Getting and Cleaning Data/")
# setwd("C:/Users/Ben/Google Drive/Coursera/Getting and Cleaning Data/")
# load("C:/Users/Ben/Google Drive/Coursera/Getting and Cleaning Data/.RData")



# Q1
if(!file.exists("Week 3 Quiz")){dir.create("Week 3 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(URL,destfile="./Week 3 Quiz/q1.csv")

q1<- read.csv(file="./Week 3 Quiz/q1.csv")

agricultureLogical = which(q1$AGS==6 & q1$ACR==3)

head(agricultureLogical,n=3)



# Q2
install.packages("jpeg")
library(jpeg)

# url ="https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
img<- readJPEG("./Week 3 Quiz/Q2.jpg",native=T)
quantile(img,probs=c(0.3,0.8))


# Q3

if(!file.exists("Week 3 Quiz")){dir.create("Week 3 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(URL,destfile="./Week 3 Quiz/q3a.csv")
q3a<- read.csv(file="./Week 3 Quiz/q3a.csv")

URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(URL,destfile="./Week 3 Quiz/q3b.csv")
q3b<- read.csv(file="./Week 3 Quiz/q3b.csv",skip=2)
# remove irrelevant rows and columns
q3b<- q3b[-c(1:2),-c(3,4,6:10)]
names(q3b) <- c("CountryCode","Ranking","USDmillion")

df<- merge(q3a,q3b,by="CountryCode",all=T)

df<- subset(df,Ranking!="")

# eliminate non numeric rows
df$Ranking<- as.character(df$Ranking)
df<- df[grep("^[1-9]",df1$Ranking),]

df$Ranking<- as.numeric(df$Ranking)
df<- df[order(df$Ranking,decreasing=T),]

# observe existence of NA 
table(df$Long.Name,useNA="ifany")


# Q4

mean(df[df$Income.Group %in% c("High income: OECD"),]$Ranking)
mean(df[df$Income.Group %in% c("High income: nonOECD"),]$Ranking)


# Q5
df1<- df[,c("CountryCode","Income.Group","Ranking")]

# install.packages("Hmisc")
library(Hmisc)
df1$rank_group = cut(df1$Ranking,breaks=5)
table(df1$rank_group,df1$Income.Group)

