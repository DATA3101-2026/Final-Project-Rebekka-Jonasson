library(tidyverse)
library(ggplot2)
library(dplyr)

#---- some preliminary analysis to see how the data looks ----
day_one <- read_csv("heart_rate_2025-07-01.csv")

# seeing change in heart rate over course of day
plot1 <- ggplot(day_one) + 
  geom_area(mapping = aes(x = `beats per minute`, y = timestamp, colour = `data source`)) + 
  labs(x = "beats per minute", y = "timestamp in seconds", title = "Heart Rate", subtitle = "Heart Rate Over the course of 01/07/2025")

 plot1  
 
 # merging multiple files together
 day_two <- read_csv("heart_rate_2025-07-02.csv")
 day_three <- read_csv("heart_rate_2025-07-03.csv")
 
 combined_table <- bind_rows(day_one, day_two, day_three)
 
 plot2 <- ggplot(combined_table) + 
   geom_area(mapping = aes(x = `beats per minute`, y = timestamp, colour = `data source`)) + 
   labs(x = "beats per minute", y = "timestamp in seconds", title = "Heart Rate", subtitle = "Heart Rate Over the course of 3 days")
 
 plot2  