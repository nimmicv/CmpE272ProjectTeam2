wd<-getwd()
setwd(wd)

library(shiny)
library(googleVis)
library(datasets)

SantaClaraCountyCrimeData3 <- read.csv("SantaClaraCountyCrimeData3.csv")

shinyServer(function(input,output){
  formulaText <- reactive({
    paste("You are currently exploring SantaClaraCounty crime data")
  })
  
  
  
  output$caption <- renderText({formulaText()})
  
  output$gvis2 <- renderGvis({
    data1<- SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city1,]
    data2<-SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city2,]
    data<-rbind(data1,data2)
    gvisTable(data)
  })
  
  output$gvis <- renderGvis({
    data1<- SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city1,]
    data2<-SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city2,]
    data<-rbind(data1,data2)
    gvisMotionChart(data,idvar="City",timevar="Year")
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste(input$city1,"-",input$city2, '.csv', sep='') },
    content = function(file) {
      data1<- SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city1,]
      data2<-SantaClaraCountyCrimeData3[SantaClaraCountyCrimeData3$City==input$city2,]
      data<-rbind(data1,data2)
      write.csv(data, file)
    }
  )
  
  output$gvis1 <- renderGvis({
    SantaClaraData2 <- read.csv("SantaClaraCountyCrimeData3.csv")
    test.frame <- SantaClaraData2 [, 1:6]
    mod1 <- lm(Population ~ Year + City, data=test.frame) 
    mod2 <- lm(propertyCrime~Population+Year+City, data=test.frame)
    mod3 <- lm(UnemploymentRate ~ propertyCrime+Year+City, data=test.frame)
    data1 <-SantaClaraData2$City
    data2 <-SantaClaraData2$Year
    data3<- SantaClaraData2$Population
    data4<- SantaClaraData2$propertyCrime
    data5<-SantaClaraData2$Unemployment
    alldata <- data.frame (data1,data2,data3,data4,data5)
    test.frame1 <- alldata
    test.frame2 <- alldata
    test.frame3 <- alldata
    test.frame1 <- data.frame(City= input$city, Year= 2012:2016, Population=0)
    population.frame1 <- predict.lm(mod1,test.frame1)
    test.frame2 <-data.frame(City= input$city, Year= 2012:2016,Population=population.frame1, propertyCrime=0)
    propertyCrime.frame2 <- predict.lm(mod2,test.frame2)
    test.frame3 <-data.frame(City= input$city, Year= 2012:2016,propertyCrime=propertyCrime.frame2, Unemployment=0)
    UnemploymentRate.frame3 <- predict.lm(mod3,test.frame3)
    data <- data.frame (City = input$city, year = 2012:2016, Population = population.frame1[1:5], propertyCrime = propertyCrime.frame2[1:5], UnemploymentRate = UnemploymentRate.frame3[1:5])
    write.csv(data, file ="prediction.csv")
    test<-read.csv("prediction.csv")
    
    gvisMotionChart(test[,2:ncol(test)], idvar = "City", timevar = "year")
  })
  
  
})