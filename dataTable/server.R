library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output) {

  ## Generate a summary of the data
  output$summary <- renderPrint({
    summary(dat)
  })

  ## Generate an HTML table view of the data
  output$table <- renderDataTable({
    dat
  }, options = list(lengthMenu = c(5, 30, 50, 150), pageLength = 5))

})
