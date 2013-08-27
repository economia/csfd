library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel('Kdy zažil který žánr svou zlatou éru?'),
  
  sidebarPanel(
    
    selectInput('zanr', 'Žánr:', 
                list('Akční' = 'AKCNI',
		     'Animovaný' = 'ANIME',
		     'Dobrodružný' = 'DOBRO',
                     'Dokumentární' = 'DOKUM',
                     'Drama' = 'DRAMA',
                     'Experimentální' = 'EXPER',
                     'Fantastický' = 'FANTA',
                     'Film-noir' = 'FNOIR',
                     'Historický' = 'HISTO',
                     'Horor' = 'HOROR',
                     'Hudební' = 'HUDEB',
                     'Katastrofický' = 'KATAS',
                     'Komedie' = 'KOMED',
                     'Krimi' = 'KRIMI',
                     'Muzikál' = 'MUZIK',
                     'Mysteriózní' = 'MYSTE',
                     'Poetický' = 'POETA',
                     'Pohádka' = 'POHAD',
                     'Psychologický' = 'PSYCH',
                     'Rodinný' = 'RODIN',
                     'Romantický' = 'ROMAN',
                     'Sci-fi' = 'SCIFI',
                     'Sportovní' = 'SPORT',
                     'Thriller' = 'THRIL',
                     'Válečný' = 'VALEC',
                     'Western' = 'WESTE',
                     'Životopisný' = 'ZIVOT'
                     ))
  
  ),
  
  mainPanel(
    
    plotOutput('graf')
  )
  
))