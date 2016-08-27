## packages required ##

suppressPackageStartupMessages(library(googleVis))
library(plyr)
library(shiny)


## Get data

#Read in medals data set
medals <- read.csv("medals.csv", header=T)
#Read in ISO codes to link Olympic country codes (NOC) with country name
iso <- read.csv("isocodes.csv", header=T)

## Prepare data

#Change header name and merge by NOC 
names(iso)[2] <- "NOC"
medalsWiso <- merge(medals, iso, "NOC")

#Change medal name to numeric value in 3 columns (probably a much tidyer way to do this exists)
medalsWiso$Gold <- ifelse(medalsWiso$Medal == "Gold", 1, 0)
medalsWiso$Silver <- ifelse(medalsWiso$Medal == "Silver", 1, 0)
medalsWiso$Bronze <- ifelse(medalsWiso$Medal == "Bronze", 1, 0)


#Summarize data by Edition(Year) and country, adding medal values and including a TOTAL column
mapsummary <- ddply(medalsWiso,.(Edition, Country, ISO.code), summarize,
                    Gold=sum(Gold), 
                    Silver=sum(Medal=Silver), 
                    Bronze=sum(medal=Bronze),
                    total=sum(c(Gold,Silver,Bronze)),
                    combined=paste("Gold:",Gold, " ", "Silver:", Silver, " ", "Bronze:", Bronze))



## Define server logic required to draw map
shinyServer(function(input, output) {
 
  
#Receive slider input for year  
  myYear <- reactive({
    
    input$Year
    
    })
  
  output$year <- renderText({
    paste("Olympic Medals for each competing country in ", myYear())
  })

## Define output     
  output$TT <- renderGvis({

#subset data for selected year        
    mapdata <- mapsummary[mapsummary$Edition==myYear(),]
    
#GoogleVis maps    
    gvisGeoChart(mapdata, locationvar = "Country",
                       colorvar = "total",
                       hovervar = "combined", 
                       options = list(width=1000,height=800,
                 colorAxis="{colors:['#1831C3', '#F70802', '#F7E802']}"))
  })
  
})
