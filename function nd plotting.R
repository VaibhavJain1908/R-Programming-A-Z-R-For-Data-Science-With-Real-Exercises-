function(){
  data<-MinutesPlayed
  matplot(t(data),type="b",pch=15:25,col =c(30:40))
  legend("topleft",pch=15:25,legend = Players,col = c(30:40))
}    


myplot<-function(data,rows=1:10){
  Data<-data[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:25,col =c(20:30))
  legend("topleft",pch=15:25,legend = Players[rows],col = c(20:300))
}    
myplot(FieldGoals/Games)

myloop<-function(){
  for(i in v1){
    print(noquote(rep(c("*","$"),each=i)))}
  for(j in v2){
    print(noquote(rep(c("*","$"),each=j)))}
}
myloop()

myplot((Points - FreeThrows)/FieldGoals)

