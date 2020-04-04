#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Covid19 Cases - Confirmed, Deaths, Recovered"),
    p("Data taken from below JHU repo on 4th April and massaged to use in this shiny app."),
    a("https://github.com/CSSEGISandData/COVID-19"),

    # Sidebar with a selection input
    sidebarLayout(
        sidebarPanel(
          h3("Show Proportion of Death/Recovered"),
          selectInput(
            "subset",
            NULL,
            choices = c(
              "Deaths" = 1,
              "Recovered" = 2
            ),
            selected = 2
          ),
          h5("Instructions:"),
          p("1. Plot shows some of the most affected countries due to COVID19 virus"),
          p("2. App uses plotly to create interactive bar plot"),
          p("3. By default it shows number of confirmed and recovered cases"),
          p("4. To make the app reactive you can select the option above to see number of Deaths instead of recovered cases"),
          p("5. You can also switch back to see recovered cases and plot will be updated"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
         
            plotlyOutput("plot1")
            
        )
    )
))
