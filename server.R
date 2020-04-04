#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    library(readr)
    covid19 <- read_csv("covid19_4Apr.csv")
    covid19 <- subset(covid19, Deaths>200)
    
    selectedData <- reactive({
      if(input$subset=="1"){
        names(covid19)[3] <- "Selected"
        names(covid19)[5] <- "NotSelected"
      } else if (input$subset == "2"){
        names(covid19)[5] <- "Selected"
        names(covid19)[3] <- "NotSelected"
      }
        
      return(covid19)
    })

    output$plot1 <- renderPlotly({
      
      selectedData() %>% plot_ly() %>%
      add_trace(x = ~Country_Region, y = ~Confirmed, type = 'bar',
                                name = "Confirmed",
                               marker = list(color = 'rgb(158,202,225)',
                                             line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%

        add_trace(x = ~Country_Region, y = ~Selected, type = 'bar',
                                name = ifelse(input$subset==1,"Deaths","Recovered"),
                               marker = list(color = ifelse(input$subset==1,'rgb(225,0,0)','rgb(58,200,225)'),
                                             line = list(color = 'rgb(8,48,107)', width = 1.5)))  %>% 
     layout(title = "Covid19 Data",
                            barmode = 'group',
                            xaxis = list(title = "Country"),
                            yaxis = list(title = "Cases"))
    })

})
