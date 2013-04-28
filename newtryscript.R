SantaClaraData2 <- read.csv ("C:/visualization/SantaClaraCountyCrimeData3.csv")
attach (SantaClaraData2)
head (SantaClaraData2)
SantaClaraData2
#robberyrate <- (SantaClaraData2$Robbery/SantaClaraData2$Population)*100
test.frame <- SantaClaraData2 [, 1:3]
mod <- lm(Population ~ Year + City, data=test.frame) 
print(mod)
plot (mod) 
summary(mod)
data1 <-SantaClaraData2$City
data2 <-SantaClaraData2$Year
data3<- SantaClaraData2$Population
test.frame <- data.frame( City= NULL,Year= 2012,2013,2014,2015,2016)
population.frame <- predict.lm(mod,test.frame)
summary(population.frame)
data.frame (data1,data2,data3)
test.frame <- data.frame
test.frame <- data.frame(City= "San Jose", Year= 2012:2016, Population=0)
population.frame <- predict.lm(mod,test.frame)
population.frame
lm(totalcrime~year+Population)
data <- data.frame (City ="SanJose", year = 2012:2016, Population = population.frame[1:5])
write.csv(data, file = "C:/Users/Shruthi/Desktop/prediction.csv")
test<-read.csv("C:/Users/Shruthi/Desktop/prediction.csv")
test
library(googleVis)
M1<- gvisMotionChart(test, idvar = "City", timevar = "year")
> plot(M1)
