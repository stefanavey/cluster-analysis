## UPLOAD ----------------------------------------------------------------------
upload.box <- fluidPage(
  titlePanel("Uploading Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv',
                  'text/comma-separated-values,text/plain',
                  '.csv')),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      ## Tranpose if samples are in rows
      radioButtons('transpose', 'Samples in:',
                   c(Columns=FALSE,
                     Rows=TRUE),
                   TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   ''),
      tags$hr(),
      checkboxInput('log2', 'Log 2 Transform', TRUE)
    ),
    mainPanel(
      dataTableOutput("table")
    )
  )
)


upload <- tabItem(
    tabName = "upload",
    upload.box
    ## fluidRow(
    ##     box(
    ##         plotOutput("plot1", height = 250)),
    ##     box(
    ##         title = "Controls",
    ##         sliderInput("slider", "Number of observations:", 1, 100, 50)
    ##     )
    ## )
)


## CLUSTER ---------------------------------------------------------------------
cluster.box <- fluidPage(
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
                tabPanel("Summary", verbatimTextOutput("summary"))
                )
  )
)

cluster <- tabItem(
    tabName = "cluster",
    cluster.box
)


## ACKNOWLEDGEMENTS ------------------------------------------------------------
acknowledgements <- tabItem(
    tabName = "acknowledgements",
    tags$p("Powered by RStudio Shiny + shinydashboard, Github,
            and Coffee (the caffeinated beverage)."),
    tags$footer(
        tags$p(
            tags$a("Source Code", href = "http://github.com/stefanavey/cluster-analysis")
        ),
        tags$p(
            tags$small(tags$em(
                "Version 0.0.1005 - Last Updated 2015-05-04"
            ))
        )
    )
)


## BODY ------------------------------------------------------------------------
body <- dashboardBody(
    tabItems(
        upload,
        cluster,
        acknowledgements
    )
)
