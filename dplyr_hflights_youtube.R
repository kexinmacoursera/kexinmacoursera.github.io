## https://www.youtube.com/watch?v=jWjqLW-u3hc
#install packages
library(dplyr)
install.packages("hflights")
library(hflights)
#head packages
head(hflights)
View(hflights)
#store to local dataframe
#tbl_df create a local dataframe
flights<- tbl_df(hflights)
#See more rows
print(flights, n=20)
#View all fight on January 1st
#filter to give condition
filter(flights,flights$Month==1 &flights$DayofMonth==1)
#pipe | for OR condition
filter(flights, flights$UniqueCarrier =='AA'|flights$UniqueCarrier=="UA")
#OR we can use %in%
filter(flights,UniqueCarrier %in% c("AA","UA"))
#Basic way to select columns
flights[,c("DepTime","ArrTime","FlightNum")]
#OR we can use select operator
select(flights,DepTime,ArrTime,FlightNum)
#nesting method to select uniqueCarrier and DepDelay columns
#and filter for delays over 60 mins
gthan60 <- filter(select(flights,UniqueCarrier,DepDelay),DepDelay>60)
#Chaining method
gthan60c <- flights %>%
              select(UniqueCarrier,DepDelay) %>%
              filter(DepDelay > 60)
######################%>% EXAMPLE#########################
x1 <- 1:5; x2 <- 2:6
result1 <- sqrt(sum((x1-x2)^2))
result2 <- (x1-x2)^2 %>% sum() %>% sqrt()
result3 <- sum((x1-x2)^2) %>% sqrt()
##########################################################
flights %>% 
  select(UniqueCarrier,DepDelay) %>% 
  arrange(desc(DepDelay))
#Add COLUMN into data
flights$Speed <- flights$Distance / flights$AirTime*60
showspeed <- flights[,c("Distance","Speed","AirTime")]
#dplyr approach

showspeed1 <- flights %>%
                select(Distance,AirTime) %>%
                mutate(Speed = Distance/AirTime*60)
showspeed1
#Create a table grouped by Dest, and then summarise each group
#by taking the mean of ArrDelay
summarise0 <- flights %>%
                group_by(Dest) %>%
                summarise(avg_delay = mean(ArrDelay,na.rm = TRUE))
#For each carrier, calculate the percentage of flights cancelled or diverted
a <- flights %>%
      group_by(UniqueCarrier) %>%
      summarise_each(funs(mean),Cancelled,Diverted)
?funs
?summarise_each
#For each carrier,calculate the minimum and maximum arrival and departure delays
b <- flights %>%
  group_by(UniqueCarrier) %>%
  summarise_each(funs(min(.,na.rm = TRUE),max(.,na.rm = TRUE)),  # '.'is the placeholder for the data you pass in
                 matches("Delay"))
View(b)
#For each day of the year, count the total number of flights and 
#sort in descending order
# 'n()' function counts the number of rows in a group
# 'n_distinct(vector)" counts the unique items in that vector
c <- flights %>%
   group_by(Month,DayofMonth) %>%
   summarise(flights_count = n()) %>%
   arrange(desc(flights_count))
c

## Same way but using function 'tally'
c1 <- flights %>%
  group_by(Month,DayofMonth) %>%
  tally(sort = TRUE)
?tally
##For each destination, count the total number of flights and 
##the number of distinct planes that flew there
c2 <- flights %>%
  group_by(Dest) %>%
  summarise(flight_count = n(),plane_count = n_distinct(TailNum))
c2
# For each destination, show the nunmber of cancelled and not 
# cancelled flights
flights %>%
  group_by(Dest) %>%
  select(Cancelled) %>%
  table() %>%
  head()