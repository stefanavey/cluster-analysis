shinyUI(bootstrapPage(
    plotOutput(outputId = "pairs_plot", height = "700px"),
    sliderInput(inputId = "bw",
        label = "Bandwidth:",
        min = 0.1, max = 2, value = .2, step = 0.1)
))
