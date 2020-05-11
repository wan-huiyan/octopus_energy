library(plotly)
library(curl)
library(lubridate)
library(tidyverse)
library(jsonlite)

#curl_download("sk_live_a1cQCGjQlvbQCOsLcRCVrimn:" "https://api.octopus.energy/v1/electricity-meter-points/2700003645222/meters/19L2761452/consumption/")
#raw <- read.table("consumption.log")

consumption <- fromJSON("energy.json")

consumption_df <- consumption$results %>%
  mutate(interval_start = ymd_hms(interval_start) + hours(1),
         interval_end = ymd_hms(interval_end) + hours(1),
         date = date(interval_start)) %>%
  group_by(date) %>%
  mutate(records = n()) %>%
  filter(records == 48)

unit_rate <- fromJSON("unit_rate.json")

unit_rate_df <- unit_rate$results %>%
  mutate(valid_from = ymd_hms(valid_from) + hours(1),
         valid_to = ymd_hms(valid_to) + hours(1),
         date = date(valid_from)) %>%
  group_by(date) %>%
  mutate(records = n()) %>%
  filter(records == 47)

plot_ly(consumption_df,
        x = ~interval_start,
        y = ~consumption) %>%
  add_bars()
