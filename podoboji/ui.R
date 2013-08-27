library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel('Jaké žánry se nejčastěji točí v dané zemi?'),
  
  sidebarPanel(
    
    selectInput('zeme', 'Země:', 
                list('Československo' = 'CS',
                     'Česká republika' = 'CZ',
                     'Čína' = 'CN',
                     'Dánsko' = 'DN',
                     'Francie' = 'FR',
                     'Indie' = 'IN',
                     'Itálie' = 'IT',
                     'Japonsko' = 'JP',
                     'Mexiko' = 'MX',	
                     'Německá demokratická republika' = 'DV',
                     'Německo' = 'DE',
                     'Polsko' = 'PL',
                     'Rakousko' = 'AT',
                     'Rumunsko' = 'RO',
                     'Rusko' = 'RU',
                     'Slovensko' = 'SK',
                     'Sovětský svaz' = 'SS',
                     'Spojené státy' = 'US',
                     'Spolková republika Německo' = 'DZ',
                     'Švédsko' = 'SE',
                     'Velká Británie' = 'UK'
                ))
  
  ),
  
  mainPanel(
    
    plotOutput('graf')
  )
  
))