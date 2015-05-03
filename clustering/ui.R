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
    checkboxInput(inputId = "update",
                  label = strong("Update Data After Upload (Required)"),
                  value = FALSE),
    selectInput('method', 'Correlation Method',
                c("pearson", "kendall", "spearman"), selected="pearson"),
    selectInput('distMethod', 'Distance Method for Clustering',
                c("euclidean", "maximum", "manhattan", "canberra",
                  "binary", "minkowski"), selected="manhattan"),
    selectInput('clustMethod', 'Agglomeration Method for Clustering',
                c("complete", "ward", "single", "average",
                  "mcquitty", "median", "centroid"), selected="complete")
  ),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Plot", plotOutput('plot1', height = "500px", width = "500px")),
                tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
)
