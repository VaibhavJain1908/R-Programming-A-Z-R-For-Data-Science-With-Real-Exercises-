first<-c(12,34,56,46)
is.integer(first)
v1<-c(12L,2322L,23L,1324L)
is.array(v1)
rep('*',10)
rep("*",9)

v2=first+v1
first==v2
first<v2
arr=array(10,20,[3])
v3=c(1,2,3)
v4=v3+v1
v5=v1*v2
v6=rnorm(10)
v6
for(i in v6){
  for(j in v5 )
  print('*')
}
rnorm()
c()
seq()
rep()
print()
is.numeric()
is.double()
paste()
is.character()
is.double()
sqrt()
typeof()
is.integer()


ggplot(data=mydata[mydata$carat<2.5,], aes(x=carat, y=price, colour=clarity))+geom_point(alpha=0.1)+geom_smooth()
mydata<-read.csv(file.choose())

#How to take input
a <- readline(prompt = "Enter:")
#Type Converter
a<-as.integer(a)
#Check type
typeof(a)