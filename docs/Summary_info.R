library(dplyr)
library(tidyverse)
netflix_df <- read.csv("all-weeks-countries.csv")
View(netflix_df)
netflix_fee <- read.csv("netflix price in different countries.csv")
View(netflix_fee)
netflix_stock <- read.csv("NFLX.csv")
View(netflix_stock)
    
# Movie that stayed on Netflix's 10 top viewed the longest
movie_that_stayed_10_on_netflix_longest <- netflix_df %>%
  filter(category == "Films") %>%
  filter(cumulative_weeks_in_top_10 == max(cumulative_weeks_in_top_10, na.rm = TRUE)) %>%
  pull(show_title)

# Show's that stayed on Netflix's 10 top viewed the longest
show_that_stayed_10_on_netflix_longest <- netflix_df %>%
  filter(category == "TV") %>%
  filter(cumulative_weeks_in_top_10 == max(cumulative_weeks_in_top_10, na.rm = TRUE)) %>%
  pull(show_title)

# Country with lowest subscription fee
country_with_lowest_fee_on_netflix_subscription <- netflix_fee %>%
  filter(Cost.Per.Month...Basic.... == min(Cost.Per.Month...Basic...., na.rm = TRUE)) %>%
  pull(Country)

# Country with highest subscription fee
country_with_highest_fee_on_netflix_subscription <- netflix_fee %>%
  filter(Cost.Per.Month...Basic.... == max(Cost.Per.Month...Basic...., na.rm = TRUE)) %>%
  pull(Country)

# The number of dates from 2002 to 2021 calcated
number_dates_collected_from_02_21 <- nrow(netflix_stock[as.Date(netflix_stock$Date) >= "2002-01-01" & as.Date(netflix_stock$Date) <= "2020-12-31" ,]) 
  
  

  
  
  
  
  
  summary_info <- list() #values you are calculating
summary_info$num_observations <- nrow(netflix_df)
summary_info$observations_from_us <- netflix_df %>% 
  filter(country_name == "United States")
nrow()

summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)
