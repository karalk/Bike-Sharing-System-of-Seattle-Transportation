#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  trip = read.csv("2016-12_trip_data.csv")
  station = read.csv("2016-12_station_data.csv")
  

  bike_startdate = as.character(trip$starttime)
  bike_startdate = gsub("\\s+.*", "", bike_startdate)
  bike_startdate = as.Date(bike_startdate, "%m/%d/%Y")
  trip$starttime = bike_startdate
  
  bike_stopdate = as.character(trip$stoptime)
  bike_stopdate = gsub("\\s+.*", "", bike_stopdate)
  bike_stopdate = as.Date(bike_stopdate, "%m/%d/%Y")
  trip$stoptime = bike_stopdate
  
  
   
  output$distPlot <- renderPlot({
    
   
    x=table(trip[trip$starttime>=min(input$date)&trip$starttime<=max(input$date), "from_station_id"])
    barplot(x[x<input$bins], las=2)
    
    if(input$AverageLogical){

      abline(h=4460)
    
      }else{
      
      x = table(trip$from_station_id)
      barplot(x[x<input$bins], las=2,main='Using Frequencies of stations', xlab='Station ID',cex.names = 0.8)  
        
    }
    
    

  })
  
  
  output$stationifo <- renderTable({
    
    x = table(trip$from_station_id)
    station = read.csv("2016-12_station_data.csv")
    station[station$station_id %in% c(names(x[x<input$bins])),]
    

    

  })
  
  
  
})