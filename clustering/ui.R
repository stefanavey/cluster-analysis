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
    selectInput('rows', 'Rows', 1:nrow(dat), selected=1),
    selectInput('cols', 'Columns', 1:ncol(dat), selected=1),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    checkboxInput(inputId = "indicateSpecies",
                  label = strong("Indicate True Species"),
                  value = FALSE)
  ),
  mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Plot", plotOutput('plot1', height = "500px")),
          tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
)
