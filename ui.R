library(shiny)

# Define UI for application that plots random distributions 
shinyUI(div(style="background-image: url('http://2.bp.blogspot.com/_oigT0GOX_oY/TUaTLM1xBlI/AAAAAAAAAXs/i6atDqKiSM0/s1600/The-best-top-desktop-blue-wallpapers-blue-wallpaper-blue-background-hd-6.jpg')",pageWithSidebar(

# Application title
div(style = "text-align:center;color:white;text-shadow:5px 5px 5px blue",headerPanel("Visualize and Predict Crime of Santa Clara County !")), 
# Sidebar with a slider input for number of observations
sidebarPanel( tags$head(
tags$style(type='text/css', ".span4 { margin-top:23px; }"),
tags$style(type='text/css', ".well { background-color:lightsteelblue; }")
),
selectInput("Choice",
"Select your Choice",
                            list("Visualize" = 1,
                                "Predict" = 2)
                            ),
                        conditionalPanel(condition<-"input.Choice==2",selectInput("city", 
                                "Select City",
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
                                    "Sunnyvale" = "Sunnyvale"))),
                        conditionalPanel(condition<-"input.Choice==1",selectInput("city1", 
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
                                        "Sunnyvale" = "Sunnyvale"))),

                        conditionalPanel(condition<-"input.Choice==1",selectInput("city2", 
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
                                        "Campbell" = "Campbell"))),
                        helpText("Note:All the data collected are real data from FBI websites."),
                        p(style="text-decoration:underline","The CrazyRacoon Team"),
                        a(href="http://in.linkedin.com/pub/nimmi-cv/14/714/292", target="_blank", "Nimmi, "),
                        a(href="http://in.linkedin.com", target="_blank", "Priyanka, "),
                        a(href="http://www.linkedin.com/pub/shruthi-raghunath/8/261/52a", target="_blank", "Shruthi, "),
                        a(href="http://in.linkedin.com", target="_blank", "Veenu"),
                        p(style="text-decoration:underline","Our Guide"),
                        a(href="http://www.linkedin.com/in/ranjanr", target="_blank", "Rakesh Ranjan")

#submitButton("Update View")
                        ),

# Show a plot of the generated distribution
                        mainPanel(
                                conditionalPanel(condition<-"input.Choice==1",div(style="color:white",p(textOutput("caption")),htmlOutput("gvis"))),
                                conditionalPanel(condition<-"input.Choice==2", htmlOutput("gvis1"))

                                )
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         )))
