df <- data.frame(x =1:3, y=c('a','b','c'))
summary(df)
str(df)   #data.frame default turn strings into factors
df <- data.frame(x =1:3, y=c('a','b','c'),stringsAsFactors = FALSE)
str(df)
typeof(df) #type
class(df)  #class

cbind(df,data.frame(z = 3:1)) # Add column to df
rbind(df,data.frame(x =10, y='z'))

df<-data.frame(x =1:3)
df$y <-list(1:2,1:3,1:4)
df
data.frame(x=1:3,y=list(1:2,1:3,1:4))
#how to solve problem?
dfl <- data.frame(x=1:3,y=I(list(1:2,1:3,1:4)))
dfl
?I()  #chage the class of an object to indicate that it should be treated as "as is"

x <- c(2.1,4.2,3.3,5.4)
x[c(3,1)]
x[c(2.1,2.9)]  # Real number are silently truncated to integers

#Logical vectors
x[c(TRUE,TRUE,FALSE,FALSE)] #Choose the TRUE ones
x[x > 3] # Greater than 3
x[c(TRUE,FALSE)] #will recycled to be the same length
#Equivalent to 
x[c(TRUE,FALSE,TRUE,FALSE)]
x[]
#Matrix
a <- matrix(1:9,nrow = 3)
a
colnames(a) <-c("A","B","C")    #Colnames is to give name for matrix
a[1:2,]
#Data.Frame
df <-data.frame(x=1:3,y=3:1,z=letters[1:3])
df[df$x ==2,]
df[c(1,3),]

x <- c(1:5);
x[NA]

