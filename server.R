library(shiny)
library(datasets)

data <- infert

shinyServer(function(input, output) {
  formulaText <- reactive({
    paste("case ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("case ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=infert)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$caseBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = infert,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$infertPlot <- renderPlot({
    with(data, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
})
