library(shiny)

podOboji <- read.csv(file='podOboji.csv')
suma <- read.csv(file='suma.csv')

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    input$zeme
  })
  
  output$graf <- renderPlot({
    
    temp <- podOboji[podOboji$zeme==input$zeme,]
    temp$podil <- temp$pocet/suma$x
    temp <- temp[order(temp$podil, decreasing=T),]
    par(mar = c(8, 6, 4, 2) + 0.1)
    barplot(temp$podil, names.arg=temp$zanr, las=2, ylim=c(0,max(temp$podil)), ylab='Podíl na celosvětové produkci žánru', col='yellow')    
    # text(x=1:length(temp$pocet)*1.19-0.4, y=temp$pocet, temp$pocet, cex=0.8, pos=3)
  
  })
  
})