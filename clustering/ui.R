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
                  "mcquitty", "median", "centroid"), selected="complete"),
    tags$hr(),
    checkboxInput(inputId = "showCors",
                  label = strong("Show Correlations"),
                  value = FALSE),
    checkboxInput(inputId = "chooseBreaks",
                  label = strong("Force color key to start at 0"),
                  value = FALSE),
    
    tags$hr(),
    checkboxInput(inputId = "rem",
                  label = strong("Choose Features to Exclude"),
                  value = FALSE),
    uiOutput("condPanel1"),
    ## conditionalPanel(
    ##   condition = "input.rem == true",
    ##   selectizeInput('toRm', "Exclude", choices=sort(rownames(datGlobal)), multiple=TRUE)
    ## ),
    checkboxInput(inputId = "incl",
                  label = strong("Choose Features to Include"),
                  value = FALSE),
    uiOutput("condPanel2")
    ## conditionalPanel(
    ##   condition = "input.incl == true",
    ##   selectizeInput('toIncl', "Include Only", choices=sort(rownames(datGlobal)), multiple=TRUE)
    ## )
    
  ),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Plot", plotOutput('plot1', height = "500px", width = "500px")),
                tabPanel("Summary", verbatimTextOutput("summary") )
      )
    )
  )
)
