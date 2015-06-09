library(shiny)

shinyServer(function(input, output) {
  output$contents <- renderTable({

    inFile <- input$file1

    if (is.null(inFile)) {
      return(NULL)
    }

    dat <- read.csv(inFile$datapath, header=input$header, sep=input$sep,
                    quote=input$quote, check.names=FALSE)
    rownames(dat) <- dat[,1]
    dat <- dat[,-1]
    if(input$transpose) {
      cnames <- colnames(dat)
      dat <- as.data.frame(t(dat))
      rownames(dat) <- cnames
    }
    if(input$log2) {
      dat <- log2(dat+1)
    }
    datGlobal <<- dat
    return(dat)
  })

  output$table <- renderDataTable({

    ## input$file1 will be NULL initially. After the user selects
    ## and uploads a file, it will be a data frame with 'name',
    ## 'size', 'type', and 'datapath' columns. The 'datapath'
    ## column will contain the local filenames where the data can
    ## be found.

    inFile <- input$file1

    if (is.null(inFile)) {
      return(NULL)
    }

    dat <- read.csv(inFile$datapath, header=input$header, sep=input$sep,
                    quote=input$quote, check.names=FALSE)
    rownames(dat) <- dat[,1]
    dat <- dat[,-1]
    if(input$transpose) {
      cnames <- colnames(dat)
      dat <- as.data.frame(t(dat))
      rownames(dat) <- cnames
    }
    if(input$log2) {
      dat <- log2(dat+1)
    }
    datGlobal <<- dat
    return(dat)

  }, options = list(lengthMenu = c(5, 30, 50, 100), pageLength = 5))
})
