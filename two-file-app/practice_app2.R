# library(lterdatasampler)
# library(tidyverse)
# 
# clean_trout <- and_vertebrates |>
#   filter(species == "Cutthroat trout") |>
#   select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) |> 
#   mutate(channel_type = case_when(
#     channel_type == "C" ~ "cascade",
#     channel_type == "I" ~ "riffle",
#     channel_type =="IP" ~ "isolated pool",
#     channel_type =="P" ~ "pool",
#     channel_type =="R" ~ "rapid",
#     channel_type =="S" ~ "step (small falls)",
#     channel_type =="SC" ~ "side channel"
#   )) |> 
#   mutate(section = case_when(
#     section == "CC" ~ "clear cut forest",
#     section == "OG" ~ "old growth forest"
#   )) |> 
#   drop_na()
# 
# 
# 
# 
# # filter
# trout_filterd_df <- 
#   clean_trout %>% 
#   filter(channel_type %in% c('R', 'C'))
# 
# 
# #plot
# 
# ggplot(clean_trout, aes(x = length_mm, y = weight_g, color = channel_type, shape = channel_type)) +
#   geom_point(alpha = 0.7, size = 5) +
#   scale_color_manual(values = c("cascade" = "#2E2585", "riffle" = "#337538", "isolated pool" = "#DCCD7D",
#                                 "pool" = "#5DA899", "rapid" = "#C16A77", "step (small falls)" = "#9F4A96",
#                                 "side channel" = "#94CBEC")) +
#   scale_shape_manual(values = c("cascade" = 15, "riffle" = 17, "isolated pool" = 19,
#                                 "pool" = 18, "rapid" = 8, "step (small falls)" = 23,
#                                 "side channel" = 25)) +
#   labs(x = "Trout Length (mm)", y = "Trout Weight (g)", color = "Channel Type", shape = "Channel Type")

# load libraries ----
library(tidyverse)
library(lterdatasampler)

clean_trout <- and_vertebrates |> 
  filter(species == "Cutthroat trout") |> 
  select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) |> 
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) |> 
  drop_na()


# practice filtereing
trout_filtered_df <- clean_trout |> 
  filter(channel_type %in% c("R", "C")) |> 
  filter(section %in% c("clear cut forest"))

# plot ----
ggplot(trout_filtered_df, aes(x = length_mm, y = weight_g,
                              color = channel_type)) +
  geom_point(alpha = 0.7, size = 5) +
  scale_color_manual(values = c("R" = "blue", "C" = "purple",
                                "S" = "black", "P" = "yellow",
                                "SC" = "pink", "I" = "orange",
                                "IP" = "red"))



