server <- function(input, output) {


# filtered lake data ------------------------------------------------------

  filtered_lakes <- reactive({
    lake_data |> 
      filter(AvgTemp >= input$elevation_slider_input[1] & input$elevation_slider_input[2])
    
  })
  
  
# build leaflet map -------------------------------------------------------
  output$lake_map <- renderLeaflet({
    
    # build leafletmap
    leaflet() |>
      # add tiles
      addProviderTiles('Esri.WorldImagery') |>
      # set view over area of interest
      setView(lng = -152, lat = 70, zoom = 6) |>
      # add mini map
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |>
      # add markers
      addMarkers(
        data = filtered_lakes(),
        lng = filtered_lakes()$Longitude,
        lat = filtered_lakes()$Latitude,
        popup = paste(
          'Site Name:',
          filtered_lakes()$Site,
          "<br>",
          "Elevation",
          filtered_lakes()$Elevation,
          'meters (above SL)',
          '<br>',
          'Avg Depth',
          filtered_lakes()$AvgDepth,
          'meters (above SL)',
          '<br>',
          'Avg Temp',
          filtered_lakes()$AvgTemp,
          'deg Celsius'
        )
      )
    
  })
  
  
  
  
  
}