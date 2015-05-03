shinyUI(pageWithSidebar(
  headerPanel(""),
  sidebarPanel(
    ## selectInput('xcol', 'X Variable', setdiff(names(iris), "Species")),
    ## selectInput('ycol', 'Y Variable', setdiff(names(iris), "Species"),
    ##             selected=names(iris)[[2]]),
    ## numericInput('clusters', 'Cluster count', 3,
      ##              min = 1, max = 9),
      checkboxInput(inputId = "indicateSpecies",
                    label = strong("Indicate True Species"),
                    value = FALSE),
      checkboxInput(inputId = "missed",
                    label = strong("Toggle All/Misclassified Irises"),
                    value = FALSE),
      checkboxInput(inputId = "boundary",
                    label = strong("Show LDA Decision Boundaries"),
                    value = FALSE)    
  ),
  mainPanel(
    plotOutput('ldaPlot')
  )
))
