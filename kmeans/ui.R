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
    selectInput('xcol', 'X Variable', setdiff(names(iris), "Species")),
    selectInput('ycol', 'Y Variable', setdiff(names(iris), "Species"),
                selected=names(iris)[[2]]),
      numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
      checkboxInput(inputId = "indicateSpecies",
                  label = strong("Indicate True Species"),
                  value = FALSE)
  ),
  mainPanel(
    plotOutput('plot1', height = "500px")
  )
))
