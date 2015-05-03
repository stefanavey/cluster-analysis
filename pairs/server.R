shinyServer(function(input, output) {

  output$pairs_plot <- renderPlot({

    ggpairs(iris, axisLabels="show", params=c(binwidth=input$bw)) + theme_bw()

  })
})
