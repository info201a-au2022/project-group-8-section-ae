library(dplyr)
library(ggplot2)
library(readxl)

#reading and viewing the file

all_weeks_countries <- read.csv("all-weeks-countries.csv")

#finding a dataset that provides us top films in
#the most recent week
films_america <- all_weeks_countries %>% 
  filter(week == max(week)) %>% 
  filter(category == "Films") %>% 
  filter(country_name == "United States") %>% 
  select(show_title,weekly_rank)

#creating the plot for films in america
#code found from: https://r-graph-gallery.com/267-reorder-a-variable-in-ggplot2.html 
film_plot_america <- films_america %>% 
  ggplot( aes(x= reorder(show_title, +weekly_rank), y=weekly_rank)) +
  geom_segment( aes(xend=show_title, yend=0)) +
  geom_point( size=6, color="orange") +
  coord_flip()+
  theme_bw() +
  xlab("Names of Top Ten Films")+
  ylab("Ranking throughout the week(1-10)")+
  ggtitle("Top ten films in America currently")


#viewing plot for america
film_plot_america

#This is a simple chart in which tells us the top ten shows
#and then shows us the ranking it was. So 1st place













