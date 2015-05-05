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

  ## Create 2 output panels that depend on the data passed in
  output$condPanel1 <- renderUI({
    conditionalPanel(
      condition = "input.rem == true",
      selectizeInput('toRm', "Exclude",
                     choices=sort(rownames(myData())),
                     multiple=TRUE)
    )
  })
  output$condPanel2 <- renderUI({
    conditionalPanel(
      condition = "input.incl == true",
      selectizeInput('toIncl', "Include Only",
                     choices=sort(rownames(myData())),
                     multiple=TRUE)
    )
  })


  output$summary <- renderPrint({
    summary(myData())
  })


  ## Combine the selected variables into a new data frame
  selectedData <- reactive({
    features <- rownames(myData())
    if (input$rem && input$incl) {
      stop("Cannot select both features to include and features to exclude")
    }
    if(input$rem) {
      features <- setdiff(features, input$toRm)
    } else if(input$incl) {
      features <- input$toIncl
    }
    myData()[features, ]
  })

  output$plot1 <- renderPlot({
    selDat <- selectedData()
    corMat <- cor(selDat, method=input$method)
    op <- par(mar = c(12, 4.1, 2, 15), oma=c(6, 0, 0, 6))
    hmcols <- colorRampPalette(c("white","red"))(256)
    hc <- hclust(dist(corMat, method=input$distMethod),
                 method=input$clustMethod)
    ## hc <- hclust(dist(t(selDat), method=input$distMethod),
    ##              method=input$clustMethod)
    ## hc <- hclust(as.dist(1-cor(corMat, method="spearman")), method=input$clustMethod)
    heatmap.2(corMat,
              Colv=as.dendrogram(hc), Rowv=as.dendrogram(hc),
              dendrogram="column", trace="none",
              col=hmcols, scale="none")
    par(op)
  })
})
