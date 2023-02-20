# server <- function(input, output) {
#   # filter trout data ----
#   trout_filtered_df <- reactive({
#     clean_trout |>
#       filter(channel_type %in% c(input$channel_type_input))
#     
#   })
#   
#   # trout scatterplot ----
#   output$trout_scatterplot <- renderPlot({
#     ggplot(
#       trout_filtered_df(),
#       aes(
#         x = length_mm,
#         y = weight_g,
#         color = channel_type,
#         shape = channel_type
#       )
#     ) +
#       geom_point(alpha = 0.7, size = 5) +
#       scale_color_manual(
#         values = c(
#           "cascade" = "#2E2585",
#           "riffle" = "#337538",
#           "isolated pool" = "#DCCD7D",
#           "pool" = "#5DA899",
#           "rapid" = "#C16A77",
#           "step (small falls)" = "#9F4A96",
#           "side channel" = "#94CBEC"
#         )
#       ) +
#       scale_shape_manual(
#         values = c(
#           "cascade" = 15,
#           "riffle" = 17,
#           "isolated pool" = 19,
#           "pool" = 18,
#           "rapid" = 8,
#           "step (small falls)" = 23,
#           "side channel" = 25
#         )
#       ) +
#       labs(
#         x = "Trout Length (mm)",
#         y = "Trout Weight (g)",
#         color = "Channel Type",
#         shape = "Channel Type"
#       ) +
#       myCustomTheme
#     
#   })
#   
# } # END server

server <- function(input, output) {
  
  # trout df ----
  trout_filtered_df <- reactive({
    
    validate(
      need(length(input$channel_type_input) > 0, "Select at least one channel type."),
      need(length(input$section_input) > 0, "Select at least one forest section.")
    )
    
    clean_trout |> 
      filter(channel_type %in% c(input$channel_type_input)) |> 
      filter(section %in% c(input$section_input))
    
  })
  
  # plot trout ----
  output$trout_scatterplot <- renderPlot({
    
    ggplot(trout_filtered_df(), aes(x = length_mm, y = weight_g,
                                    color = channel_type)) +
      geom_point(alpha = 0.7, size = 5) +
      scale_color_manual(values = c("R" = "blue", "C" = "purple",
                                    "S" = "black", "P" = "yellow",
                                    "SC" = "pink", "I" = "orange",
                                    "IP" = "red"))
    
  }, alt = "some alt text will live here"
  
  )
  
}