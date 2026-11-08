library(tidyverse)
library(ggplot2)
library(dplyr)
library(readr)


#---- testing the new merge.csv file ----
merged <- read_csv("merged.csv")

merged %>%
  filter(timestamp > ymd_hms("2025-01-01 00:00:00")) %>%
  ggplot(aes(x = timestamp, y = "beats_per_minute")) +
  geom_line()
 
filtered_merge <- merged %>%
  filter(timestamp > ymd_hms("2025-06-30 00:00:00"), timestamp > ymd_hms("2025-07-26 00:00:00"),between(hour(timestamp), 6, 12))


plot3 <- ggplot(filtered_merge)+
  geom_area(mapping = aes(x = `beats per minute`, y = timestamp, colour = `data source`)) + 
  labs(x = "beats per minute", y = "timestamp in second", title = "Heart Rate", subtitle = "Heart Rate Over A Month")
plot3

#---- some preliminary analysis to see how the data looks ----
day_one <- read_csv("data/raw/heart_rate_2025-07-01.csv")

# seeing change in heart rate over course of day
plot1 <- ggplot(day_one) + 
  geom_area(mapping = aes(x = `beats per minute`, y = timestamp, colour = `data source`)) + 
  labs(x = "beats per minute", y = "timestamp in seconds", title = "Heart Rate", subtitle = "Heart Rate Over the course of 01/07/2025")

 plot1  
 
 # merging multiple files together
 day_two <- read_csv("data/raw/heart_rate_2025-07-02.csv")
 day_three <- read_csv("data/raw/heart_rate_2025-07-03.csv")
 
 combined_table <- bind_rows(day_one, day_two, day_three)
 
 plot2 <- ggplot(combined_table) + 
   geom_area(mapping = aes(x = `beats per minute`, y = timestamp, colour = `data source`)) + 
   labs(x = "beats per minute", y = "timestamp in seconds", title = "Heart Rate", subtitle = "Heart Rate Over the course of 3 days")
 
 plot2  