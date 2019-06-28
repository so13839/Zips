# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # title
  titlePanel(title="Car sales"),
  
  # Sidebar with input variables 
  sidebarLayout(
    sidebarPanel( width = 3,
       selectInput(inputId="Month", label="Month", 
                    choices = list("January"="January","February"="February","March"="March",
                                   "April"="April","May"="May","June"="June","July"="July",
                                   "August"="August","September"="September","October"="October",
                                   "November"="November","December"="December"))
          ),
    
    # get plots
    mainPanel(
        plotOutput("bar",height = 400),
        plotOutput("bar2",height = 400)
        )
      

  )
))



