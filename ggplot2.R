getwd()
setwd("D:\\[DesireCourse.Com] Udemy - R Programming A-ZT R For Data Science With Real Exercises!")
movies <- read.csv("P2-Movie-Ratings.csv")

#-------------------- Factor

head(movies)
colnames(movies)<-c("Films","Genre","CriticRatings","AudienceRatings","BudgetMillions","Year")
tail(movies)
str(movies)
summary(movies)
movies$Year<-factor(movies$Year)
summary(movies)

#------------------- Aesthetics

library(ggplot2)
ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings))

#add geometry
ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings))+
   geom_point()

#add color
ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                         color=Genre))+
  geom_point()

#add size
ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                         color=Genre,size=Genre))+
  geom_point()

#add size - better way
ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                         color=Genre,size=BudgetMillions))+
  geom_point()

#-------------------- Plotting with layers

p<- ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                             color=Genre,size=BudgetMillions))

#point
p + geom_point()

#lines
p+geom_line()

#multiple layers
p+geom_point()+geom_line()
p+geom_line()+geom_point()

#---------------------- Overriding Aesthetics

q<-ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                            color=Genre,size=BudgetMillions))

#add geom layer
q+geom_point()

#overriding aes

#ex1
q+geom_point(aes(size=CriticRatings))

#ex2
q+geom_point(aes(color=BudgetMillions))

#q remains the same
q+geom_point()

#ex3
q+geom_point(aes(x=BudgetMillions))+
  xlab("BudgetMillions $$$")

#ex4
q+geom_line()+geom_point()
#reducing line size
q+geom_line(size=1)+geom_point()

#------------------- Mapping vs Setting

r<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings))
r+geom_point()

#Add Color
#1. Mapping(What we have done so far)
r+geom_point(aes(color=Genre))
#2. Setting
r+geom_point(color="Dark Blue")
#Error
#r+geom_point(aes(color="Dark Blue"))

#Add size
#1. Mapping
r+geom_point(aes(size=BudgetMillions))
#2. Setting
r+geom_point(size=10)
#Error
#r+geom_point(aes(size=10))

#---------------------- Histograms and Density Charts

s<-ggplot(data=movies,aes(x=BudgetMillions))
s+geom_histogram(binwidth = 10)

#Add color
s+geom_histogram(binwidth = 10,aes(fill=Genre))

#Add Border
s+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")

#sometimes you may need density charts
s+geom_density(aes(fill=Genre))
s+geom_density(aes(fill=Genre),position = "stack")

#-------------------- Starting Layer Tips

t<-ggplot(data=movies,aes(x=AudienceRatings))
t+geom_histogram(binwidth = 10,fill="white",color="blue")

#another way-0----chart
t<-ggplot(data=movies)
t+geom_histogram(binwidth = 10,aes(x=AudienceRatings),fill="white",color="blue")

# chart
t+geom_histogram(binwidth = 10,aes(x=CriticRatings),fill="white",color="blue")

#-------------------- Statistical Transformations

?geom_smooth
u<-ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                            color=Genre))
u+geom_point()+geom_smooth(fill=NA)
#boxplots
u<-ggplot(data = movies,aes(x=Genre,y=AudienceRatings,
                            color=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()
#tip/hack:
u+geom_boxplot(size=1.2)+geom_jitter()
#another way:------chart
u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)
#challenge
u<-ggplot(data = movies,aes(x=Genre,y=CriticRatings,
                            color=Genre))
u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)
 
#--------------------- Using Facets

v<-ggplot(data = movies,aes(x=BudgetMillions))
v+geom_histogram(binwidth = 10,aes(fill=Genre),
                 color="Black")

#facets
v+geom_histogram(binwidth = 10,aes(fill=Genre),
                 color="Black")+
  facet_grid(Genre~.,scales = "free")
 
#scatterplots
w<-ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                            color=Genre))
w+geom_point(size=3)

#facets
w+geom_point(size=3)+
  facet_grid(Genre~.)

w+geom_point(size=3)+
  facet_grid(.~Year)

w+geom_point(size=3)+
  facet_grid(Genre~Year)

w+geom_point(size=3)+
  geom_smooth()+
  facet_grid(Genre~Year)
  
w+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)
 
#------------------ Coordinates

m<-ggplot(data = movies,aes(x=CriticRatings,y=AudienceRatings,
                            size=BudgetMillions,
                            color=Genre))
m+geom_point()

m+geom_point()+
  xlim(50,100)+
  ylim(50,100)

#won't work well always
n<-ggplot(data = movies,aes(x=BudgetMillions))
n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")

n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  ylim(0,50)

#instead - zoom:
n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  coord_cartesian(ylim=c(0,50))

#improved.....
w+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)+
  coord_cartesian(ylim=c(0,100))

#---------------- Perfecting by adding Themes

o <- ggplot(data = movies,aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre),color="Black")

h

#axes labels
h + 
  xlab("Money Axis")+
  ylab("Number of Movies")

#label formatting
h + 
  xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(color="DarkGreen",size=30),
        axis.title.y = element_text(color="Red",size=30))

#tick mark formatting      
h + 
  xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(color="DarkGreen",size=30),
        axis.title.y = element_text(color="Red",size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))
           
#legend formatting
h + 
  xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(color="DarkGreen",size=30),
        axis.title.y = element_text(color="Red",size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#title
h + 
  xlab("Money Axis")+
  ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(color="DarkGreen",size=30),
        axis.title.y = element_text(color="Red",size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="DarkBlue",
                                  size=40,
                                  family="Comic Sans MS"))

library(extrafont)
font_import()
loadfonts(device = "win")
y

#----------------------- Homework

setwd("D:\\[DesireCourse.Com] Udemy - R Programming A-ZT R For Data Science With Real Exercises!")
movies <- read.csv("Section6-Homework-Data.csv")

head(movies)
colnames(movies)<-c("DayOfWeek","Director","Genre","MovieTitle","ReleaseDate","Studio","AdjustedGrossMillions","BudgetMillions","GrossMillions","IMDBrATINGS","MovieLensRatings","OverseasMillions","OverseasPer","ProfitMillions","ProfiPer","Runtime(min)","UsMillions","GrossPerUs")
str(movies)
summary(movies)
filt <- (movies$Genre == "action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")
filt2 <- (movies$Studio == "Buena Vista Studios") | (movies$Studio == "WB") | (movies$Studio == "Fox") | (movies$Studio == "Universal") | (movies$Studio == "Sony") | (movies$Studio == "Paramount Pictures")

mov<-movies[filt & filt2,]
mov
summary(mov)

p<-ggplot(data = mov,aes(x=Genre,y=GrossPerUs))
p

q<-p+geom_jitter(aes(size=BudgetMillions,color=Studio))+geom_boxplot(alpha=0.7,outlier.color = NA)
q

q<-q+
  xlab("Genre")+
  ylab("Gross % US")+
  ggtitle("Domestic % by Genre")
q

q<-q+
  theme(plot.title = element_text(size=40),
               axis.title.x = element_text(color="Blue",size=30),
               axis.title.y = element_text(color="Blue",size=30),
               axis.text.x = element_text(size=20),
               axis.text.y = element_text(size=20),
               
               legend.title = element_text(size=20),
               legend.text = element_text(size=10),
               text=element_text(family = "Comic Sans MS"))
q$labels$size="Budget $M"
q

#--------------------------------
