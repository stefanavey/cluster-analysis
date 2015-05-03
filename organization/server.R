library(shiny)

## Define server logic for random distribution application
df <- data.frame(ID = letters[1:20],
                 score = round(rnorm(20, 70, 10), 0))

shinyServer(function(input, output) {
  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(df)
  })
  
  # Generate an HTML table view of the data
  output$table <- renderDataTable({
    df
  }, options = list(lengthMenu = c(5, 30, 50, 150), pageLength = 5))
  
})
