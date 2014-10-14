
# setwd("C:/Users/Ben/Google Drive/Coursera/Getting and Cleaning Data/")
# load("C:/Users/Ben/Google Drive/Coursera/Getting and Cleaning Data/.RData")


# Q1
if(!file.exists("Week 4 Quiz")){dir.create("Week 4 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(URL,destfile="./Week 4 Quiz/q1.csv")

q1<- read.csv(file="./Week 4 Quiz/q1.csv")

result<- strsplit(names(q1),"wgtp")
result[123]

# alternative
strsplit(names(data)[123], "wgtp")


# Q2

URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(URL,destfile="./Week 4 Quiz/q2.csv")
q2<- read.csv(file="./Week 4 Quiz/q2.csv",skip=2)
q2<- q2[-c(1:2),-c(3,6:10)]
names(q2) <- c("CountryCode","Ranking","countryNames","GDP")
# extract relevant section
df<- q2[grepl("^[0-9]",q2$Ranking),]
df$GDP<- gsub("\\,","",df$GDP)
df$GDP<- as.numeric(df$GDP)
mean(df$GDP)

# alternative
gdpData <- read.csv("./data/gdp.csv")
cleanedData <- gsub(",", "", gdpData[5:194, 5])
numData <- as.numeric(cleanedData)
mean(numData) 

# Q3
length(grep("^United",df$countryNames))

# alternative
countryNames <- gdpData[5:194,4]
regexec("^United", countryNames)


# Q4
if(!file.exists("Week 4 Quiz")){dir.create("Week 4 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(URL,destfile="./Week 4 Quiz/q4a.csv")
q4a<- read.csv(file="./Week 4 Quiz/q4a.csv",skip=2)
q4a<- q4a[-c(1:2),-c(3,6:10)]
names(q4a) <- c("CountryCode","Ranking","countryNames","GDP")
q4a<- q4a[grepl("^[0-9]",q4a$Ranking),]


URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(URL,destfile="./Week 4 Quiz/q4b.csv")
q4b<- read.csv(file="./Week 4 Quiz/q4b.csv")

df<- merge(q4a,q4b,by="CountryCode")


df$Special.Notes<- as.character(df$Special.Notes)
df1<- df[grepl("^(Fiscal year end: )",df$Special.Notes),]
table(grepl("June",df1$Special.Notes))

# alternative
a <- as.character(mergedData[,13])
length(grep("Fiscal year end: June", a))

# Q5

# install.pacakges("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

# check for NA rows
table(!is.na(amzn$AMZN.Open))

# install.packages("lubridate")
library(lubridate)

weekday<- weekdays(sampleTimes)

df<- data.frame(sampleTimes,weekday)
df$year<- year(df$sampleTimes)
df1<- subset(df,year==2012)
nrow(df1)
table(df1$weekday=="Monday")


# alternative
length(sampleTimes)
bool1 <- year(sampleTimes) == 2012
length(sampleTimes[bool1]) # 250
bool2 <- weekdays(sampleTimes)=="Monday"
length(sampleTimes[bool1 & bool2]) # 47
