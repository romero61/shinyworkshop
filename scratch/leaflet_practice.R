
# load packages -----------------------------------------------------------
library(tidyverse)
library(leaflet)
# read data ------------------------------------------------------------

filtered_lakes <- read_csv('shinydashboard/data/lake_data_processed.csv')

# practice filtering ------------------------------------------------------

lakes_new <- filtered_lakes |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)
# build leaflet -----------------------------------------------------------

leaflet() |> 
  # add tiles
  addProviderTiles('Esri.WorldImagery') |> 
  # set view over area of interest
  setView(lng = -152, lat = 70, zoom = 6) |> 
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |> 
  # add markers
  addMarkers(data = filtered_lakes,
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             popup = paste(
               'Site Name:', filtered_lakes$Site,
               "<br>",
               "Elevation", filtered_lakes$Elevation, 'meters (above SL)',
               '<br>',
               'Avg Depth', filtered_lakes$AvgDepth, 'meters (above SL)',
               '<br>',
               'Avg Temp', filtered_lakes$AvgTemp, 'deg Celsius'
             ))
