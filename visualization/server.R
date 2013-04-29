library(shiny)
library(googleVis)
library(datasets)

SantaClaraCountyCrimeData3 <- read.csv("SantaClaraCountyCrimeData3.csv")
Gilroy <- read.csv("/Users/manu/Desktop/MyData/Gilroy.csv")

shinyServer(function(input,output){
  formulaText <- reactive({
   paste(input$city1,"~",input$city2)
  })
 
 
  
  output$caption <- renderText({formulaText()})
  output$gvis <- renderGvis({
  data1<- SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city1,]
  data2<-SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city2,]
  data<-rbind(data1,data2)
  gvisMotionChart(data,idvar="City",timevar="Year")
  })
  output$help <- renderText({formulaText()})
  output$basePlot <-renderPlot({
    plot(SantaClaraCountyCrimeData3)
  })
  
  output$gvis1 <- renderGvis({
    SantaClaraData2 <- read.csv("SantaClaraCountyCrimeData3.csv")
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
    write.csv(data, file ="prediction.csv")
    test<-read.csv("prediction.csv")
    gvisMotionChart(test, idvar = "City", timevar = "year")
  })
  

})