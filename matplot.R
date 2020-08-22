Games
FieldGoals
round(FieldGoals/Games)
matplot(FieldGoals)
matplot(t(FieldGoals),type="b",pch=15:25,col =c(30:40))
legend("topleft",pch=15:25,legend = Players,col = c(30:40))
?matplot
matplot(t(mydata),type="b")
?matplot


mydata
#subsetting
Games[c(1,10),]
Games[1:4,0:10]
Games[1,]
Games[,1, drop=F]

data<-MinutesPlayed
matplot(t(data),type="b",pch=15:25,col =c(30:40))
legend("topleft",pch=15:25,legend = Players,col = c(30:40))

data<-MinutesPlayed[1,,drop=F]
matplot(t(data),type="b",pch=15:25,col =c(30:40))
legend("topleft",pch=15:25,legend = Players[1],col = c(30:40))
#----------------------------------------
