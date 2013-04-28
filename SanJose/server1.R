library(shiny)
library(googleVis)
library(datasets)
shinyServer(function(input,output)
{
  SantaClaraData2 <- read.csv ("C:/visualization/SantaClaraCountyCrimeData3.csv")
formulaText <- reactive({
  paste(input$city)
})

output$caption1 <- renderText({formulaText()})
output$gvis1 <- renderGvis({
  
  test.frame <- SantaClaraData2 [, 1:5]
  mod1 <- lm(Population ~ Year + City, data=test.frame) 
  mod2 <- lm(propertyCrime~Year+City, data=test.frame)
  mod3 <- lm(UnemploymentRate ~ Year+City, data=test.frame)
  data1 <-SantaClaraData2$City
  data2 <-SantaClaraData2$Year
  data3<- SantaClaraData2$Population
  data4<- SantaClaraData2$propertyCrime
  data5<-SantaClaraData2$UnemploymentRate
  alldata <- data.frame (data1,data2,data3,data4,data5)
  test.frame1 <- alldata
  test.frame2 <- alldata
  test.frame3 <- alldata
  test.frame1 <- data.frame(City= input$city, Year= 2012:2016, Population=0)
  test.frame2 <-data.frame(City= input$city, Year= 2012:2016, propertyCrime=0)
  test.frame3 <-data.frame(City= input$city, Year= 2012:2016, UnemploymentRate=0)
  population.frame1 <- predict.lm(mod1,test.frame1)
  propertyCrime.frame2 <- predict.lm(mod2,test.frame2)
  UnemploymentRate.frame3 <- predict.lm(mod3,test.frame3)
  data <- data.frame (City = input$city, year = 2012:2016, Population = population.frame1[1:5], propertyCrime = propertyCrime.frame2[1:5], UnemploymentRate = UnemploymentRate.frame3[1:5])
  write.csv(data, file = "C:/Users/Shruthi/Desktop/SanJose/prediction.csv")
  test<-read.csv("C:/Users/Shruthi/Desktop/SanJose/prediction.csv")
  gvisMotionChart(test, idvar = "City", timevar = "year")
})})