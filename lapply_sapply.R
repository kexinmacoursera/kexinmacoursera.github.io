library(MASS)
DataFrame <- birthwt
DataFrame
#row wise mean row is 1 column is 2
?apply
a1 <- apply(DataFrame,1,mean)
str(a1) #1:189 rows of obs
a1[1] #output gives you name of the column and mean value
# what if we want to know the name only
names(a1[1])
# column wise
a2 <-apply(DataFrame,2,mean)
a2

##lapply function(retunrs the list in output) lapply is colunm wise
l1 <-lapply(DataFrame,mean)
str(l1)
# If you want to access the value in that list
l1[[1]]
# If you want to access the value in that list without fullname
as.numeric(l1[1:4])
# sapply (not return the list)
s1 <- sapply(DataFrame,mean)
s1
l1
str(s1)
str(l1)
