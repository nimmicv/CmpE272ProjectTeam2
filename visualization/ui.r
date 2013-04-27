library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Visualize Data of Santa Clara County !"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
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
                     "Campbell" = "Campbell"))
    ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h2(textOutput("caption")),
    htmlOutput("gvis")
    )
))