library(dplyr)
library(ggplot2)
library(readxl)


all_weeks_countries <- read.csv("all-weeks-countries.csv")
# View(all_weeks_countries)


#Find a dataframe that will find the top shows 
#in the United States till date 
shows_america <- all_weeks_countries %>% 
  filter(week == max(week)) %>% 
  filter(category == "TV") %>% 
  filter(country_name == "United States") %>% 
  select(show_title,cumulative_weeks_in_top_10,weekly_rank)


#creating the plot for shows in america
shows_plot_america <- shows_america %>% 
  ggplot(aes(x= reorder(show_title, +weekly_rank) , y=weekly_rank)) +
  geom_count(aes(size = cumulative_weeks_in_top_10))+
  coord_flip()+
  xlab("Names of Top Ten Shows")+
  ylab("Ranking throughout the week(1-10)")+
  ggtitle("Recent Top ten shows in America How long it was on Charts")+ 
  labs(cumulative_weeks_in_top_10= "Testing")
#viewing the plot
shows_plot_america

#it is placing each show that, in the most current week in the data set,
#was top ten. The size of the dot shows how long it was in the top ten