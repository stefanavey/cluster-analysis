library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
    
  # Application title
  titlePanel(""),
  
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel("Data Table", dataTableOutput("table")),
          tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
)
