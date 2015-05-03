library(gplots)                         # for heatmap.2
library(RColorBrewer)

shinyServer(function(input, output, session) {

  myData <- reactive({
    ## Update the data with checkbox input
    if(input$update) {
      dat <- datGlobal
      dat
    }
  })

  output$summary <- renderPrint({
    summary(myData())
  })

  ## Combine the selected variables into a new data frame
  selectedData <- reactive({
    myData()[as.numeric(input$rows), as.numeric(input$cols)]
  })

  output$plot1 <- renderPlot({
    myDat <- myData()
    corMat <- cor(myDat, method=input$method)
    op <- par(mar = c(12, 4.1, 2, 15), oma=c(6, 0, 0, 6))
    hmcols <- colorRampPalette(c("white","red"))(256)
    hc <- hclust(as.dist(1-cor(corMat, method="spearman")), method="ward")
    heatmap.2(corMat,
              Colv=as.dendrogram(hc), Rowv=as.dendrogram(hc),
              dendrogram="column", trace="none",
              col=hmcols, scale="none")
    par(op)
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
