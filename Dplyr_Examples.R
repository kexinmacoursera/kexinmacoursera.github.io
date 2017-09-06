## http://www.listendata.com/2016/08/dplyr-tutorial.html
library(dplyr)
library(data.table)
library(tcltk)
mydata1 <- tk_choose.files(caption = "sampledata.csv")
mydata <- fread(mydata1)
sample_n(mydata,4)    #sample n rows from a table
sample_frac(mydata,0.2) #sample % of data from a table
x1 <- distinct(mydata)  #Remove duplicates
x2 <- distinct(mydata,.keep_all = TRUE) #Keep all if true, keep all variables in. If a combination of is not distinct, this keeps the first row of values
x2 <- distinct(mydata,Index,Y2010,.keep_all = TRUE) #keep_all means keep all column, default is only keep Y2010
mydata2 <- select(mydata,State:2008) #state:2008 it is a range of columns. 
mydata <- select(mydata,-State) #Remove state column
#Select data starts with an alphabet
mydata3 <- select(mydata,starts_with("Y")) #Column start with letter Y
#Select data starts without an alphabet
mydata33 <- select(mydata,-starts_with("Y"))
#Select variables contain "I' in their names
mydata4 <- select(mydata,contains("I"))
#How to rename variables
mydata6 <-rename(mydata,Index1=Index) #Remeber left side is new name
#Filter rows
mydata7 <-filter(mydata,Index=="A") #same as "where"statment in sql
#Multiple selection criteria
mydata7 <-filter(mydata,Index %in% c("A","C"))  #Only select A,C from index 
#'And' Condition in selection criteria
mydata8 <-filter(mydata,Index %in% c("A","C") &Y2002>=1300000)
mydata8
#'OR' condition in selection 
mydata9 <-filter(mydata,Index %in% c("A","C")|Y2002>=1300000)
# NOT condition
mydata10 <- filter(mydata,!Index %in% c("A","C"))
#Contains condition
mydata10 <-filter(mydata,grepl("Ar",State))
#EXAMPLE 23
# %>% its like subquery in sql
dt1 <- sample_n(select(mydata,Index,State),10)
#OR
dt <- mydata %>% select(Index,State) %>% sample_n(10)
#Example 27
#In this case, we are computing mean of variables Y2014 and 
#Y2015 by variable Index. Then sort the result by calculated mean 
#variable Y2015.
ex27 <- mydata %>%  group_by(Index) %>%
  summarise(Mean_2014 = mean(Y2014,na.rm=TRUE),
            Mean_2015 = mean(Y2015,na.rm=TRUE)) %>%
  arrange(desc(Mean_2015))
#Create new variable by using mutate 
mydata28 <- mutate(mydata,change = Y2015/Y2014)
mydata
#Example 35 Applying interesect
mtcars$model <-rownames(mtcars)
first <- mtcars[1:20,]
second <- mtcars[10:32,]
intersect <- intersect(first,second)
#Applying Union
x <- data.frame(ID=1:6,ID1=1:6)
y <- data.frame(ID=1:7, ID1=1:7)
union(x,y)
union_all(x,y)   #union_all allows duplicated rows to combine
#Row appear in one table but not in other table
setdiff(x,y) #result is 0 because all x are exit in y
setdiff(y,x) #result is 1 because exit in y not x
#If..else statement
#if_else(condition,true,false,missing=NULL)
df <-c(-10,2,NA)
if_else(df<0,"negative","positive",missing="missing value")
#Use if else create new variable
df <- data.frame(x=c(1,5,6,NA))
df %>% mutate(newvar=if_else(df<5,x+2,x+1,0))
#Nested if else
mydf <-data.frame(x=c(1:5,NA))
mydf %>% mutate(newvar=if_else(is.na(x),"I am missing",
          if_else(x==1,"I am one",
          if_else(x==2,"I am two",
          if_else(x==3,"I am three","Others")))))
#Example 40 bind 
df1 <- data.frame(ID=1:6,x=letters[1:6])
df2 <- data.frame(ID=7:12,x=letters[7:12])
xy <- bind_rows(df1,df2)
#Equivalent to ..
xye <-rbind(df1,df2)
