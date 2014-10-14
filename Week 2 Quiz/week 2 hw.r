# Q1 (not working)

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.

# myapp <- oauth_app("gacd", "cc18c9e05cb05c347eef","c50df5d2df3029832a7151bc11c503d31cebd711")

myapp <- oauth_app("github", "ClientID", "ClientSecret")


# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
# req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
req <- GET("https://api.github.com/rate_limit", config(token = github_token))

stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)


# Q2 
if(!file.exists("Week 1 Quiz")){dir.create("Week 2 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(URL,destfile="./Week 2 Quiz/q2.csv")

acs<- read.csv(file="./Week 2 Quiz/q2.csv")


# alternative answer

library(sqldf)
setwd("~/Desktop/Online Coursera/Coursera-Getting-and-Cleaning-Data/week2/data/")
acs <- read.csv("./getdata-data-ss06pid.csv", header=T, sep=",")
head(acs)
sqldf("select pwgtp1 from acs where AGEP < 50")
# Problem 3.
sqldf("select distinct AGEP from acs")
length(unique(acs$AGEP)) # 91





# Q4
library(httr)
con= url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

sapply(htmlCode[c(10, 20, 30, 100)], nchar)

if (FALSE){
poor answer:

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

}

# Q5
if(!file.exists("Week 1 Quiz")){dir.create("Week 2 Quiz")}
URL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for'
download.file(URL,destfile="./Week 2 Quiz/q5")

df<- read.fwf(file="./Week 2 Quiz/q5",skip=4,widths=c(1,9,rep(c(5,4,4),4)))

# get non-empty columns
list<- c()
for (i in 1:ncol(df)) {
	ifelse(!is.na(df[1,i]),
		list<- append(list,i),
		"")
}

df<- df[,list]

# sum the fourth column
sum(df[,4])

