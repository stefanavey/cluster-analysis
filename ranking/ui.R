shinyUI(fluidPage(
  headerPanel(""),
  sidebarPanel(
    checkboxInput(inputId = "update",
                  label = strong("Update Data After Upload (Required)"),
                  value = FALSE),
    uiOutput("sample1"),
    uiOutput("sample2")
  ),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Feature Ranking", dataTableOutput("rankTable")))
    )
  )
)
