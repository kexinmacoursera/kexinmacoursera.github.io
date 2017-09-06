x <- 1:20
cutx <- cut(x,c(5,10))  #group and cut numbers into categories
cutx1 <- cut(x,c(0,5,10,15,20))  #group into 0-5,5-10,10-15,15-20
cutx1
dataframe1 <- data.frame(x,cutx1)  #dataframe create different with table function
dataframe1 
table1 <- table(x,cutx1)
table1
#rename the group 1) need to create name vectors
tablename <- c("zero to five","five to ten","ten to fifteen","fifteen to twenty")
tablename
cutx1 <- cut(x,c(0,5,10,15,20),labels = tablename)
cutx1
#If only want to break into certain number of groups ex n=3
tablename2 <- c("first part","second part","third part")
cutx2 <- cut(x,3,labels = tablename2)

y <- data.frame(number=x,cutx1,cutx2)
y
