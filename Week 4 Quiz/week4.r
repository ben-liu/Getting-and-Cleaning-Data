# fixing character vectors

# change all variables to lower case
tolower(name(df1))

# split variables with separator e.g. a dot
splitNames<- strsplit(names(df),"\\.")

# take first elements of all 
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

# remove first underscore "_"
sub("_","",TestString)
# remove all underscores "_"
gsub("_","",TestString)


# finding values
# show location of searched text
grep("abc",df$col)

# count findings under True or False
table(grepl("abc",df$col))
# subset findings
df1<- df[grepl("abc",df$col),]


# return the actual value where "abc" appears
grep("abc",dfgrep("abc",df$col,value=TRUE)

# if not appear, will show integer(0)
# if return 0, value does not appear
length(grep("abc",df$col))


# other string function
# return number of characters in the string
nchar("abc")

# take out part of string: text, start position, end position
substr("abc",1,2)

# combine two strings; default sep parametre is space
paste("abc","edf")

# combine with no space in between
paste0("abc","edf")

# trim off empty spaces in string
str_trim("abc    ")


if(FALSE){
	names of varaibles should be:
	all lower cases when possible
	descriptive
	not duplicated
	not have underscores, dots, white spaces

	variables with character values:
	should usually be made into factor variables 
	should be descriptive (use TRUE/FALSE rather than 1/0, male/female vs 0/1 or m/f)
}


# regular expressions

if(FALSE){

^i think
matches the beginning of line

morning$
matches last word in a line

[Bb][Uu][Ss][Hh]
matches all versions of Bush

^[Ii] am
matches at begining of line, either lower case or capital

^[0-9][a-zA-Z]
matches line beginning with above; order doesnt matter

[^?.]$
any line ending without ? or .
^ means not in this expressions

. is used to refer to any character
9.11
match anything like 9-11, 9.11, 9/11, 9:11, 911, etc

abc|edf
means alternatives

^[Gg]ood|[Bb]ad
look for good at beginning of line, but bad in any places

^([Gg]ood|[Bb]ad)
find both at beginning of line

? means optional
[Gg]eorger ([Ww]\.)? [Bb]ush
match with or without W. ; \ makes . not a metacharacter

. and + indicate repetitions; 
* means any number of items, including none;
+ means at least one item 
(.*) match all contents in brackets

[0-9]+ (.*) [0-9]+
at least 1 number, followed by any number of characters, followed by at least 1 number

[Bb]ush( .+[^ ]+ +){1,5} debate bush followed by 1 space, and any none space,
and 1 space, repeted for 1-5 times; ie look for 5 words between bush and
debate

more characters: and
m,n : at least m but not mroe than n matches
m : exactly m matches
m, : at least m matches


 +([a-zA-Z]+) +\1 + 
space, at least 1 characters, at least 1 space, repeated the same phrase before


^ always match the longest possible strings
^s(.*) s
start with an s and end with an s


^s(.*?)s$
s, a smaller number of characters (not the longest), s in the end of string


useful for unfriendly sources (where not csv)
use with fucntions grep,grepl,sub,gsub

}


# date
date()

# won't give time
Sys.Date()


format (d1,"%a %b %d")
if (FALSE) {
	%d: day as number 0-31
	%a: abbreviated weekday
	%A: unabbreviated weekday
	%m: month 0-12
	%b: abbreviated month
	%B: unabbreviated month
	%y: 2 digits year
	%Y: 4 digits year

}

# creating dates
x="1jan1960"; z=as.Date(x,"%d%b%Y")
as.numeric(z[1]-z[2])
weekday()
month()


library(lubridate)
ymd("20141231")
mdy("12312014")
dmy()

ymd_hms("2014-12-31 10:51:13")
ymd_hms("2014-12-31 10:51:13",tz="Pacific/Auckland")

?Sys.timezone


if(FALSE){

gapminder.org
asdfree.com
infochimps.com/marketplace
kaggle.com


collections by data scientist

bitly.com/bundles/hmason/1
delicious.com/pskomoroch/dataset
www.quora.com/Jeff-Hammerbacher/introduction-to-Data-Science-Data-Sets
www.kdnuggets.com/gps.html
blog.mortardata.com/post/67652898761/6-dataset-lists-curated-by-data-scientist

standford large network data
UCi machine learning
KDD nugets 6-dataset-lists-curated-by-data-scientist
CMU statlib
gene expression omnibus


APIs
twitterR
RPLoS
rOpenSci
RFacebook
RGoogleMaps


}


