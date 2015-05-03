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
      checkboxInput('header', 'Header', TRUE),
      ## Tranpose if samples are in rows
      radioButtons('transpose', 'Samples in:',
                   c(Columns=FALSE,
                     Rows=TRUE),
                   FALSE),
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
