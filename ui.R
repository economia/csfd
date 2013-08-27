library(shiny)

reziseri <- read.csv('reziseri.csv')

shinyUI(pageWithSidebar(
  
  headerPanel(''),
  
  sidebarPanel(
    
    selectInput("rezie", "Vyberte si režiséra:", 
                choices = levels(factor(reziseri$reziser))),
    
    checkboxInput("chrono", "Řadit filmy chronologicky", FALSE),
    
    helpText("Nápověda: pro rychlé vyhledání režiséra rozklikněte menu a začněte psát jeho příjmení.")
      
  ),
  
  mainPanel(
      
      plotOutput('plotCSFD'),
      
      plotOutput('plotIMDB')
  
  )
    
))
