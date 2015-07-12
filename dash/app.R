## app.R ##
library(shiny)
library(shinydashboard)

## Define structure of dashboard
source("header.R") 
source("sidebar.R")
source("body.R")

ui <- dashboardPage(
    skin = "red",
    header, sidebar, body
)

## Define IO
source("server.R") ## function(input, out)

## Run
shinyApp(ui, server)
