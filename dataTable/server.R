library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(iris)
  })
  
  # Generate an HTML table view of the data
  output$table <- renderDataTable({
    iris
  }, options = list(lengthMenu = c(5, 30, 50, 150), pageLength = 5))
  
})
