data("AirPassengers")
AirPassengers
AP <- AirPassengers
View(AP)
?plot
plot(AP,ylab='Passengers(1000s)',type = "o",pch =20) #type is what type of plot shoud be drawn, pch is type of circle
class(AP) #"ts" means timeseries
start(AP) # first timeseries year and month
end(AP) # end of this timeseries year and month
frequency(AP) #cycle frequency
summary(AP)
cycle(AP)
aggregate(AP)
aggregate(AP, FUN = mean)
plot(aggregate(AP))

boxplot(AP~cycle(AP))
getwd()
setwd("C:/Users/yolof/Desktop") 
webdata <- read.csv("UNRATE.csv") #read data  
webdata2 <- read.csv("CPIAUCSL.csv") #read data

webdata
class(webdata)
Urate <-ts(webdata$VALUE,start = c(1949,1),frequency = 12) #Covert to timeseries data
Urate #start has to be manully put
#Same logical for Irate
Irate <-ts(webdata2$VALUE,start = c(1948,1),frequency = 12)
class(Urate) #check if it is timeseries format
class(Irate)


#Slice a particular month  to start ex.July
Urate.July <- window(Urate,start = c(1980,7),freq = TRUE)
Urate.July

plot(Urate)
plot(Urate.July)
?decompose
decompose(Urate)
plot(decompose(Urate)) #easy to visulize 
