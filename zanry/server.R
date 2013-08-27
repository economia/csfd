library(shiny)

podleZanru <- read.csv(file='podleZanru.csv')

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    input$zeme
  })
  
  output$graf <- renderPlot({
    temp <- podleZanru[podleZanru$zanr==input$zanr,]
    plot(x = temp$rok, y = temp$csfd, ylim=c(0,max(temp$csfd)), xlab='', ylab='Natočeno filmů/rok', col='blue', type='o', pch=16)
  })
  
})