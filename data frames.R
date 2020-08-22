#Method 1
stats<-read.csv(file.choose())
stats
#Method 2
getwd()
setwd("D:\\[DesireCourse.Com] Udemy - R Programming A-ZT R For Data Science With Real Exercises!")
rm(stats)
stats<- read.csv("P2-Demographic-Data.csv")
stats

#----------------------------- Exploring Data

stats
nrow(stats)
ncol(stats)
head(stats,n=10)
tail(stats,n=20)
str(stats)
summary(stats)

#--------------------------- Using the $ sign

stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Birth.rate[3]
stats$Birth.rate
stats[,"Birth.rate"]
levels(stats$Income.Group)

#-------------------------- Operations 

stats[1:10] #subsetting
stats[3:9,]
stats[c(4,100),]

#Remember how the [] works:

is.data.frame(stats[1,]) #no need for drop=F
stats[,1]
is.data.frame(stats[,1])#need for drop=F
is.data.frame(stats[,1,drop=F])

#multiply columns

head(stats)
stats$Birth.rate*stats$Internet.users
stats$Birth.rate+stats$Internet.users

#add columns

head(stats)
stats$MyCalc<-stats$Birth.rate*stats$Internet.users
#test of knowledge
head(stats,n=10)
stats$xyz<-1:5
#remove a column
head(stats)
stats$MyCalc<-NULL
stats$xyz<-NULL

# ----------------------------- Filtering

head(stats)
filter<-stats$Internet.users<2
stats[filter,]
stats[stats$Birth.rate>40&filter,]
stats[stats$Income.Group=="High income",]
levels(stats$Income.Group)
stats[stats$Country.Name=="Malta",]

# ----------------------------- Introduction to qplot

install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data = stats,x=Internet.users)
qplot(data = stats, x=Income.Group,y=Birth.rate)
qplot(data = stats, x=Income.Group,y=Birth.rate,size=I(10))
qplot(data = stats, x=Income.Group,y=Birth.rate,size=I(10),color=I("blue"))
qplot(data = stats, x=Income.Group,y=Birth.rate,geom = "boxplot")
# shape
shape=
# transparency
alpha=
#title
main=
      
# ----------------------------- Homework

stat<-read.csv("P2-Section5-Homework-Data.csv")
head(stat)
filter<-stat$Year==1960
filter1<-stat$Year==2013
data1960=stat[filter,]
data.frame(data1960)
data2013=stat[filter1,]
data.frame(data2013)
df1<-data.frame(Country_Code,Life_Expectancy_At_Birth_1960)
df2<-data.frame(Country_Code,Life_Expectancy_At_Birth_2013)
Mdf1<-merge(data1960,df1,by.x = "Country.Code",by.y = "Country_Code",by.)
head(Mdf1)
Mdf1$Year<-NULL
Mdf1$Fertility.Rate.1960<-Mdf1$Fertility.Rate
Mdf1$Fertility.Rate<-NULL
Mdf2<-merge(data2013,Mdf1)
Mdf2$Year<-NULL
Mdf2$Fertility.Rate.2013<-Mdf2$Fertility.Rate
Mdf2$Fertility.Rate<-NULL
head(Mdf2)
Mdf<-merge.data.frame(Mdf2,Life_Expectancy_At_Birth_2013)
head(Mdf)

qplot(data = Mdf2,x=Fertility.Rate.1960,y=Life_Expectancy_At_Birth_1960,color=Region,
      size=I(5), alpha=I(0.6),main="Life Expectancy vs Fertility (1960)")

qplot(data = Mdf2,x=Fertility.Rate.2013,y=Life_Expectancy_At_Birth_2013,color=Region,
      size=I(5), alpha=I(0.6),main="Life Expectancy vs Fertility (2013)")

# --------------------------------
