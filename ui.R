library(shiny)

# Define UI for application that draws a world map
shinyUI(fluidPage(
  
  # Application title
  headerPanel(h1("Wold map of Olympic medals by Year")),
  
  

  # Sidebar with a slider input Olympic Year 
  sidebarLayout(
    sidebarPanel(

      width = 3,
      
            sliderInput("Year", "Select Year:", 
                  min = 1896, max = 2008, value = 1896, step = 4,
                   sep="",  ticks=FALSE),
            
            
            br(),
            br(),
      
      
      img(src="https://upload.wikimedia.org/wikipedia/en/thumb/b/b1/Olympic_Rings.svg/1280px-Olympic_Rings.svg.png",height = 100, width = 200),
      
      br(),
      br(),
      br(),
      br(),
      
      h3("Olympics cancelled due to World Wars"),
      p("There is no data for 1916, 1940 and 1944")
      
      
      
      
      
      
      
    ),
    
    
 
    
    # Show world map for selected year
    mainPanel(
      h3(textOutput("year")),
      h5("Hover mouse over each country for the breakdown of medals won"),
       htmlOutput("TT")
    )
  )
))



