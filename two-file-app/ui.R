# ui <- navbarPage(
#   title = 'LTER Animal Data Explorer',
#   
#   # page 1: intro tabPanel ----
#   tabPanel(title = 'About this App',
#            'background info here'),
#   
#   # END page 1 tabPanel
#   
#   
#   # page 2: data tabPanel ----
#   tabPanel(title = 'Explore the Data',
#            
#            #tabset Panel ----
#            tabsetPanel(
#              # trout tab ----
#              tabPanel(title = "Trout",
#                       
#                       
#                       #trout sidebarLayout ----
#                       sidebarLayout(
#                         # trout plot sidebarPanel ----
#                         sidebarPanel(
#                           # channel type pickerInput ----
#                           pickerInput(
#                             inputId = "channel_type_input",
#                             label = "Select channel type(s):",
#                             choices = unique(clean_trout$channel_type),
#                             options = pickerOptions(actionsBox = TRUE),
#                             selected = c("cascade", "pool"),
#                             multiple = TRUE
#                           ),
#                           # END channel type pickerInput
#                           
#                           # section checkboxGroupButtons ----
#                           checkboxGroupButtons(
#                             inputId = "section_input",
#                             label = "Select a sampling section(s):",
#                             choices = c("clear cut forest", "old growth forest"),
#                             selected = c("clear cut forest", "old growth forest"),
#                             individual = FALSE,
#                             justified = TRUE,
#                             size = "sm",
#                             checkIcon = list(
#                               yes = icon("ok", lib = "glyphicon"),
#                               no = icon("remove", lib = "glyphicon")
#                             )
#                           )
#                           # END section checkboxGroupInput
#                           
#                         )), # END trout plot sidebarPanel
#              ),
#                         
#                         
#                         
#                         
#                         
#                         # trout mainPanel ----
#                         mainPanel(plotOutput(outputId = "trout_scatterplot"))#END trout mainPanel
#                         
#                       
# 
#              # END trout tabPanel
# 
#   
#              
#              #penguin tabPanel ----
#   tabPanel(title = "Penguins",
# 
#            tabPanel(
#              title = "Penguins",
# 
# 
#              #penguin sidebarLayout ----
#              sidebarLayout(
#                sidebarPanel('penguin inputs here'),
#                #END penguuinsidebarpanel
# 
#                # penguin mainPanel ----
#                mainPanel('penguin output here')#END penguin mainPanel
# 
#              )
#            ))
# )))
# # END Penguin tabPanel
# 
# # END tabset Panel
# 
# # End data tabpanel


ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # page 1: intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info here"
           
  ), # END page 1 tabPanel
  
  
  # page 2: data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel ----
           tabsetPanel(
             
             # trout tab ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebar panel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          shinyWidgets::pickerInput(inputId = "channel_type_input",
                                                    label = "Select channel type(s):",
                                                    choices = unique(clean_trout$channel_type),
                                                    options = pickerOptions(actionsBox = TRUE),
                                                    selected = c("C", "S"),
                                                    multiple = TRUE
                          ), # END pickerInput
                          
                          # checkboxGroupButtonInput
                          checkboxGroupButtons(inputId = "section_input", 
                                               label = "Select a sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = c("clear cut forest"),
                                               individual = FALSE, justified = TRUE,
                                               checkIcon = list(yes = icon("ok", lib = "glyphicon"),
                                                                no = icon("remove", lib = "glyphicon")))
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot") |> withSpinner(type = 1, color = "green")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # pengujin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebar ----
                        sidebarPanel(
                          
                          "penguin inputs here"
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin outputs here"
                          
                        ) # END penguin mainPanel
                        
                      ) # END sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END data tabPanel
  
) # END navbarPage