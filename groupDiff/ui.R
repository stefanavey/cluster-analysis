## shinyUI(bootstrapPage(
##     plotOutput('plot1', height = "500px"),
##     selectInput('xcol', 'X Variable', setdiff(names(iris), "Species")),
##     selectInput('ycol', 'Y Variable', setdiff(names(iris), "Species"),
##                 selected=names(iris)[[2]]),
##     numericInput('clusters', 'Cluster count', 3,
##                  min = 1, max = 9),
##     checkboxInput(inputId = "indicateSpecies",
##                   label = strong("Indicate True Species"),
##                   value = FALSE)
## ))
    
shinyUI(fluidPage(    
  headerPanel(""),
  sidebarPanel(
    selectInput('eb', 'Error Bars', c("None",
                                      "Standard Deviation",
                                      "Standard Error",
                                      "Confidence Interval")
                ),
    numericInput('numObs', 'Number of Observations (per Species)', 50,
                 min = 2, max = 50),
    checkboxInput(inputId = "points",
                  label = "Show All Observations",
                  value = FALSE)
    ),
  mainPanel(
    plotOutput('plot1', height = "500px")
    )
))
