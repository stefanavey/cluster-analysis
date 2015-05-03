shinyServer(function(input, output, session) {

  ## output$summary <- renderPrint({
  ##   head(dat)
  ## })

  ## Combine the selected variables into a new data frame
  selectedData <- reactive({
    dat[as.numeric(input$rows), as.numeric(input$cols)]
  })

  output$summary <- renderPrint({
    head(selectedData())
  })

  clusters <- reactive({
    kmeans(selectedData()[,c(input$xcol, input$ycol)], input$clusters)
  })

  pch <- reactive({
    if(input$indicateSpecies) {
      as.numeric(selectedData()$Species)
    } else {
      20
    }
  })

  ## output$plot1 <- renderPlot({
  ##   par(mar = c(5.1, 4.1, 0, 1))
  ##   plot(selectedData()[,c(input$xcol, input$ycol)],
  ##        col = clusters()$cluster,
  ##        pch = pch(),
  ##        cex = 3)
  ##   points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  ##   if(input$indicateSpecies) {
  ##     legend("topleft", unique(as.numeric(selectedData()$Species)), unique(as.character(selectedData()$Species)), pch=unique(as.numeric(selectedData()$Species)))
  ##   }
  ## })

})
