library(shiny)
library(googleVis)

SantaClaraCountyCrimeData3 <- read.csv("/Users/manu/Desktop/MyData/SantaClaraCountyCrimeData3.csv")
Gilroy <- read.csv("/Users/manu/Desktop/MyData/Gilroy.csv")

shinyServer(function(input,output){
  formulaText <- reactive({
   paste(input$city1,"~",input$city2)
  })
 
 
  
  output$caption <- renderText({formulaText()})
  output$gvis <- renderGvis({
  data1<- SantaClaraCountyCrimeData3[City==input$city1,]
  data2<-SantaClaraCountyCrimeData3[City==input$city2,]
  data<-rbind(data1,data2)
  gvisMotionChart(data,idvar="City",timevar="Year")
  })
  

})