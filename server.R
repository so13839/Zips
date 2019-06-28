# This is the server logic of a Shiny web application. You can run the application by clicking 'Run App' above.
library(readxl)
library(shiny)
library(ggplot2)

data <- read_excel("Data.xlsx", sheet=1)

# Define server logic
server <- function(input,output){
  
  reactive_data = reactive({
    selected_month = input$Month
    return(data[data$Month==selected_month,])
    
  })
  
  output$bar <- renderPlot({
    
   ggplot(reactive_data(), aes(x=factor(Zip), y=Used_Car_sold)) + geom_bar(stat="identity", fill = "blue", position = "dodge") +
      xlab("") + ylab("") + ggtitle("Used Cars Sold") + geom_text(aes(label=Used_Car_sold), position=position_dodge(width=0.9), vjust=-0.25) +
      theme(axis.text.x = element_text(size = 12, angle = 60))
  })
  output$bar2 <- renderPlot({
    
    ggplot(reactive_data(), aes(x=factor(Zip), y=New_Car_Sold)) + geom_bar(stat="identity", position="dodge", fill = "red") +
      xlab("ZIP") + ylab("") + ggtitle("New Cars Sold") + geom_text(aes(label=New_Car_Sold), position=position_dodge(width=0.9), vjust=-0.25) +
      theme(axis.text.x = element_text(size = 12, angle = 60))
  })
}
