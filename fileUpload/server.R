library(shiny)

shinyServer(function(input, output) {
  # output$contents
  output$table <- renderDataTable({

    ## input$file1 will be NULL initially. After the user selects
    ## and uploads a file, it will be a data frame with 'name',
    ## 'size', 'type', and 'datapath' columns. The 'datapath'
    ## column will contain the local filenames where the data can
    ## be found.

    inFile <- input$file1

    ## dat is assigned to global environment using <<- operator
    ## so other apps can use it!
    if (is.null(inFile)) {
      dat <<- NULL
      return(dat)
    }

    dat <- read.csv(inFile$datapath, header=input$header, sep=input$sep,
                    quote=input$quote)
    if(input$transpose) {
      cnames <- colnames(dat)
      dat <- as.data.frame(t(dat))
      rownames(dat) <- cnames
    }
    rownames(dat) <- dat[,1]
    dat <<- dat[,-1]
    return(dat)

  }, options = list(lengthMenu = c(5, 30, 50, 100), pageLength = 5))
})
