library(shiny)

# Define UI for application that plots random distributions 
shinyUI(div(style="background-image: url('http://2.bp.blogspot.com/_oigT0GOX_oY/TUaTLM1xBlI/AAAAAAAAAXs/i6atDqKiSM0/s1600/The-best-top-desktop-blue-wallpapers-blue-wallpaper-blue-background-hd-6.jpg')",
            pageWithSidebar(
  
  # Application title
  headerPanel("Visualize Data of Santa Clara County !"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    tags$head(
      tags$style(type="text/css", "select { max-width: 200px; }"),
      tags$style(type="text/css", "textarea { max-width: 185px; }"),
      tags$style(type="text/css", ".jslider { max-width: 200px; }"),
      tags$style(type='text/css', ".well { max-width: 310px;background-color: re }"),
      tags$style(type='text/css', ".span4 { max-width: 310px; }")
    ),
    
     selectInput("city1", 
                "Select City 1",
                list(
                  "Campbell" = "Campbell",
                  "Gilroy" = "Gilroy", 
                  "Los Altos" = "Los Altos",
                  "Los Gatos" = "Los Gatos",
                  "Milpitas" = "Milpitas",
                  "Morgan Hill" = "Morgan Hill",
                  "Mountain View" = "Mountain View",
                  "Santa Clara" = "Santa Clara",
                  "San Jose" = "San Jose",
                  "Sunnyvale" = "Sunnyvale")),
    
    selectInput("city2", 
                "Select City 2",
                list(
                  
                  "Gilroy" = "Gilroy", 
                  "Los Altos" = "Los Altos",
                  "Los Gatos" = "Los Gatos",
                  "Milpitas" = "Milpitas",
                  "Morgan Hill" = "Morgan Hill",
                  "Mountain View" = "Mountain View",
                  "Santa Clara" = "Santa Clara",
                  "San Jose" = "San Jose",
                  "Sunnyvale" = "Sunnyvale",
                  "Campbell" = "Campbell")),
    helpText("Note:All the data collected are real data from FBI websites."),
    
    submitButton("Update View"),
    
    selectInput("city", 
                "Select City to Predict",
                list(
                  "Campbell" = "Campbell",
                  "Gilroy" = "Gilroy", 
                  "Los Altos" = "Los Altos",
                  "Los Gatos" = "Los Gatos",
                  "Milpitas" = "Milpitas",
                  "Morgan Hill" = "Morgan Hill",
                  "Mountain View" = "Mountain View",
                  "Santa Clara" = "Santa Clara",
                  "San Jose" = "San Jose",
                  "Sunnyvale" = "Sunnyvale")),
    submitButton("Predict")
  ),
   
    
  # Show a plot of the generated distribution
  mainPanel(
    p(textOutput("caption")),
    htmlOutput("gvis"),
    
    p(textOutput("caption1")),
    htmlOutput("gvis1")
    )
    )))