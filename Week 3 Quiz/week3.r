
head(df,n=3)
tail(df,n=3)
summary(df)
str(df)


quantile(df$col,na.rm=T)
# quantile by probabilities; 50% is median
quantile(df$col,probs=c(0.5,0.75,0.9))

# if there's any missing value, will show NA and "table" will count missing values
table(df$col,useNA="ifany")

# table col1 by col2
table(df$col1,df$col2)

# count all missing values
sum(is.na(df$col))
# check if there's any missing value
any(is.na(df$col))
# check against certain condition
all(df$col>0)

# break down missing value for each column
colSum(is.na(df))
# check if there's any missing value
all(colSums(is.na(df))==0)

# any values in col falls in criteria
table(df$col %in% c("abc"))
table(df$col %in% c("abc","edf"))

df[df$col %in% c("abc","edf"),]

# cross tabs
tb<- xtabs(Freq ~ Gender + Admit, data=df)
# flat tables
ftable(tb)

# file size
print(object.size(df),units="Mb")


# create categorical variables
df$col_group = cut(df$col,breaks=quantile(df$col))
table(df$col_group)


library(Hmisc)
df$col_group1 = cut2(df$col,g=4)
table(df$col_group)


library(Hmisc)
library(plyr)
df2 = mutate(df,col_group=cut2(col,g=4))
table(df2$col_group)


# common transformations

abs(x)
sqrt(x)

# round up to integer 
ceiling(x)

# round down to integer 
floor(x)

round(x,digits=n)

# = round but count from first digits (ignore decimal)
signif(x,digits=n)

cos(x)
sin(x)
log(x)
log2(x)
log10(x)

# exponentiating
exp(x)




# reshaping data

mtcars$carname<- rownames(mtcars)
# id variables in id. all other variables will be melt
carMelt<- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))

# put cyl in rows on left side, and all other variables in right columns
cylData<- dcast(carMelt,cyl ~ variable)

# take mean of all other variables
cylData<- dcast(carMelt,cyl ~ variable, mean)


# averaging values
head(InsectSprays)
# sum up counts of spray by different sprays
tapply(InsectSprays$count,InsectSprays$spray,sum)

# split and apply combine 
# get list of counts for each spray
spIns <- split(InsectSprays$count,InsectSprays$spray)

# count for sum
sprCount <- lapply(spIns,sum)
# combine method 1
unlist(sprCount)
# combine method 2
sapply(spIns,sum)


# another way - plyr package
# ddply(data,.(variable),summarize,sum=sum())
ddply(InsectSprays,.(spray),summarize,sum=sum(count))


# creating a new variable
# ave 
spraySums<- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)



# other functions
# casting as multi-dimensional arrays
acast()

# faster reordering without using order() commands
arrange()

# add new variables
mutate()


# merging data
# merge based on id; all=TRUE means including all rows not existed in another data set
merge(df1,df2,by.x="id1",by.y="id2",all=TRUE)

# merge all common column names
intersect(names(df2),names(df1))
# may create rows with many NAs
merge(df1,df2,all=TRUE)


# faster but less featured way: plyr
# assume both df has id variable
arrange(join(df,df2),id)

# multiple data sets/frames
dflist = list(df1,df2,df3)
join_all(dfList)



