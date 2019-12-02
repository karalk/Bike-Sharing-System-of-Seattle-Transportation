#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Seattle Bike Share"),
  dateRangeInput('date','Date Range:', start = "2014-10-13", end="2017-01-01", min = "2014-10-13", max="2017-01-01", format = "yyyy-mm-dd"),
  # Include radio buttons  (Only one of these can be selected)
  radioButtons("dataSource", "",
               c("Data Source trip" = "DataFiletrip",
                 "Data Source station" = "DataFilestation")),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # This is a slider for the number of bins
      #The value determined here will be used as an input in server.R
      #The minimum is 1
      #The max is 50
      #It starts at a value of 30
      #by default it will grow by 1 but here I specify that it will step by 2
      #
      # The format is 
      #sliderInput(VariableName, Stuff2WriteInTheWebPage, MinimumValue,MaxValue,Default,StepIncrement)
      sliderInput("bins",  #This is the variable name, the value of which is determined by the slider.
                  "Maximum Using Frequency of Each Station:",#Label on the html page
                  min = 1,#minimum for the slider
                  max = 20000,#maximum for the slider
                  value = 6000),#slider increments
      #Now take in some numeric inputs for the x limits.
      # There are 2 input values defining the variables named 'xmin' and 'xmax'
      # Note that a suggested default value is given 
      # The format is 
      #numericInput(VariableNameForServer, Stuff2WriteInTheWebPage, DefaultValue)
      
      #Now let's include a checkbox
      #The usual format exists:
      #checkboxInput(VariableNameForServer, Stuff2WriteInTheWebPage, DefaultValue)
      checkboxInput("AverageLogical", strong("Getting the average value of using frequency for each station?"), FALSE),

      conditionalPanel(
        condition = "input.AverageLogical == true",   
        helpText(HTML("<h3>The average value of using frequency for each station is 4460.</h3>"))  #This is just big text
          
        #
        #
      )
    ),#End of sidepanel
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("Station Using Frequency", plotOutput("distPlot")),
                  tabPanel("Station Information", tableOutput("stationifo")),
                  tabPanel("About",source("about.R")$value()) #This is the new tab with some info
      )
    )
    
  )
))