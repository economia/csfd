library(shiny)

podleZeme <- read.csv(file='podleZeme.csv')

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    input$zeme
  })
  
  output$graf <- renderPlot({
    temp <- podleZeme[podleZeme$zeme==input$zeme,]
    plot(x = temp$rok, y = temp$csfd, ylim=c(0,max(temp$csfd)), xlab='', ylab='Natočeno filmů/rok', col='red', type='o', pch=16)
  })
  
})