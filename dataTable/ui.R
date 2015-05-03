library(shiny)

# Define UI for random distribution application
shinyUI(fluidPage(

  # Application title
  titlePanel("Data"),

  sidebarLayout(
    sidebarPanel(
      checkboxInput('run', 'Data Uploaded', FALSE)
    ),

    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Data Table", dataTableOutput("table")),
          tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
))
