library(shiny)

shinyUI(fluidPage(
  titlePanel("Uploading Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv',
                  'text/comma-separated-values,text/plain',
                  '.csv')),
      tags$hr(),
      checkboxInput('log2', 'Log 2 Transform', TRUE),
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
                   '')
    ),
    mainPanel(
      dataTableOutput("table")
    )
  )
))
