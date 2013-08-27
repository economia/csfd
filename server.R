library(shiny)

reziseri <- read.csv('reziseri.csv')

shinyServer(function(input, output) {
  
  output$plotCSFD <- renderPlot({
    csfd <- reziseri$csfd[reziseri$reziser==input$rezie]
    imdb <- reziseri$imdb[reziseri$reziser==input$rezie]
    nazvy <- paste(reziseri$jmeno[reziseri$reziser==input$rezie], reziseri$rok[reziseri$reziser==input$rezie], sep=', ')
    nazvyX <- paste(reziseri$name[reziseri$reziser==input$rezie], reziseri$rok[reziseri$reziser==input$rezie], sep=', ')
    
    if (input$chrono) {
      csfd <- rev(csfd)
      nazvy <- rev(nazvy)
    } else {
      nazvy <- nazvy[order(csfd)]
      csfd <- csfd[order(csfd)]
    }
    
    if(length(csfd) %in% 1:20) {
      par(cex=1)
      ypsilon <- 1:length(csfd)*1.2-0.5
      mezera <- 0.2  
      popisek <- 0.9
    }
    
    if(length(csfd) %in% 21:35) {
      par(cex=0.9)
      ypsilon <- 1:length(csfd)*1.2-0.5
      mezera <- 0.2  
      popisek <- 0.8
    } 
    
    if(length(csfd) %in% 36:50) {
      par(cex=0.8)
      ypsilon <- 1:length(csfd)*1.3-0.5
      mezera <- 0.3 
      popisek <- 0.7
    } 
    
    if(length(csfd) %in% 51:70) {
      par(cex=0.7)
      ypsilon <- 1:length(csfd)*1.5-0.5
      mezera <- 0.5 
      popisek <- 0.8
    }
    
    sirka <- max(sapply(nazvy, FUN=nchar), sapply(nazvyX, FUN=nchar))/2
    par(mar = c(2,sirka,1,1) + 0.1)
    
    barplot(csfd, names.arg=nazvy, space=mezera, horiz=T, xpd=F, xlim=c(min(csfd,imdb)*0.9, max(csfd,imdb)*1.1), las=1, col='red')
    text(x=csfd, y=ypsilon, labels=csfd, pos=4, cex=popisek, col='red')
  })
  
  output$plotIMDB <- renderPlot({
    csfd <- reziseri$csfd[reziseri$reziser==input$rezie]
    imdb <- reziseri$imdb[reziseri$reziser==input$rezie]
    nazvy <- paste(reziseri$name[reziseri$reziser==input$rezie], reziseri$rok[reziseri$reziser==input$rezie], sep=', ')
    nazvyX <- paste(reziseri$jmeno[reziseri$reziser==input$rezie], reziseri$rok[reziseri$reziser==input$rezie], sep=', ')
   
    if (input$chrono) {
      imdb <- rev(imdb)
      nazvy <- rev(nazvy)
    } else {
      nazvy <- nazvy[order(imdb)]
      imdb <- imdb[order(imdb)]
    }
  
    if(length(imdb) %in% 1:20) {
      par(cex=1)
      ypsilon <- 1:length(imdb)*1.2-0.5
      mezera <- 0.2  
      popisek <- 0.9
    }
       
    if(length(imdb) %in% 21:35) {
      par(cex=0.9)
      ypsilon <- 1:length(imdb)*1.2-0.5
      mezera <- 0.2  
      popisek <- 0.8
    } 
       
    if(length(imdb) %in% 36:50) {
      par(cex=0.8)
      ypsilon <- 1:length(imdb)*1.3-0.5
      mezera <- 0.3 
      popisek <- 0.7
    } 
    
    if(length(imdb) %in% 51:70) {
      par(cex=0.7)
      ypsilon <- 1:length(imdb)*1.5-0.5
      mezera <- 0.5 
      popisek <- 0.8
    }
    
    sirka <- max(sapply(nazvy, FUN=nchar), sapply(nazvyX, FUN=nchar))/2
    par(mar = c(2,sirka,1,1) + 0.1)
    barplot(imdb, names.arg=nazvy, space=mezera, horiz=T, xpd=F, xlim=c(min(csfd,imdb)*0.9, max(csfd,imdb)*1.1), las=1, col='black')
    text(x=imdb, y=ypsilon, labels=imdb, pos=4, cex=popisek, col='black')
  })
  
})