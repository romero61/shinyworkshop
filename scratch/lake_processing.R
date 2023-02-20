# load packages -----------------------------------------------------------


library(tidyverse)
library(leaflet)

# read in data ------------------------------------------------------------

lake_monitoring_data <- read_csv('raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv')

# calculate average -------------------------------------------------------


avg_depth_temp <- lake_monitoring_data |> 
  select(Site, Depth, BedTemperature) |> 
  filter(Depth != 'NaN') |> 
  drop_na(BedTemperature) |> 
  group_by(Site) |> 
  summarize(
    AvgDepth = round(mean(Depth),1),
    AvgTemp = round(mean(BedTemperature), 1)
    )

# update lake monitoring --------------------------------------------------

lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

unique_lakes <- lake_monitoring_data |> 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) |> 
  distinct()


# export data -------------------------------------------------------------

write_csv(unique_lakes, 'shinydashboard/data/lake_data_processed.csv')
