library(dplyr)
library(ggplot2)

View(all_weeks_countries)

#We are creating a df with all the countries in the data
#set. We will use this to then pull top film.
unique_countries <- all_weeks_countries %>% 
  select(country_name) %>% 
  unique()
#Find a dataframe that will find the top shows 
#in the United States till date 
shows_america <- all_weeks_countries %>% 
  filter(week == max(week)) %>% 
  filter(category == "TV") %>% 
  filter(country_name == "United States") %>% 
  select(show_title,cumulative_weeks_in_top_10,weekly_rank)
#finding a dataset that provides us top films in
#the most recent week
films_america <- all_weeks_countries %>% 
  filter(week == max(week)) %>% 
  filter(category == "Films") %>% 
  filter(country_name == "United States") %>% 
  desc(cumulative_weeks_in_top_10) %>% 
  select(show_title,cumulative_weeks_in_top_10)

#finding the range of the data set, seeing how 
#many weeks there are
unique_weeks <- all_weeks_countries %>% 
  select(week) %>% 
  unique()

film_plot_america <- films_america %>% 
  ggplot(aes(x= cumulative_weeks_in_top_10, y=show_title)) +
  desc()+
  geom_col() 

film_plot_america

shows_plot_america <- shows_america %>% 
  ggplot(aes(x= weekly_rank, y=show_title)) +
  geom_count(aes(size=cumulative_weeks_in_top_10))
shows_plot_america
#
#
#
#
#