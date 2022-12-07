library(dplyr)
library(anytime)
library(tidyverse)
library(stringr)
library(ggplot2)
# Read in data

# download data. read once . paste source from where wd left off
# source("scripts/build_map.R")
# source('scripts/build_scatter.R')
# df <- read.csv('data/electoral_college.csv', stringsAsFactors = FALSE)
# state_codes <- read.csv('data/state_codes.csv', stringsAsFactors = FALSE)
# 
# 

# all_weeks_countries <- read.table("all-weeks-countries.csv", header = TRUE, sep = ",", fill = TRUE)
# View(all_weeks_countries)
all_weeks_countries <- read.csv("all-weeks-countries.csv")
netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-8-section-ae/main/netflix.csv")
temp5 <- netflix$Number.of.Paid.Netflix.Subscribers..in.millions. 
temp6 <- c(1:39)

for (i in 2:39) {
  temp6[i] = temp5[i] - temp5[i - 1]
}

netflix$new <- temp6

all_weeks_countries <- all_weeks_countries %>% 
  mutate(week_new = anydate(week))

#Find a dataframe that will find the top shows 
#in the United States till date 
shows_america <- all_weeks_countries %>% 
  filter(week == max(week, na.rm = FALSE)) %>% 
  filter(category == "TV") %>% 
  filter(country_name == "United States") %>% 
  select(show_title,cumulative_weeks_in_top_10,weekly_rank) 
shows_america

check <- function(data, search){
  if(search != ""){
    shows_america <-shows_america %>%
      filter(show_title == search)
    #   filter(grepl(text(), show_title))
  }
  return(shows_america)
}

films_each_week_10 <- all_weeks_countries %>% 
  filter(category == "Films") %>% 
  filter(country_name == "United States") %>% 
  select(show_title,weekly_rank)

check_movies <- function(data, search){
  if(search != ""){
    films_each_week_10 <-films_each_week_10 %>%
      filter(week_new == search)
    #   filter(grepl(text(), show_title))
  }
  return(films_each_week_10)
}


titlelabs <- list("Number.of.Paid.Netflix.Subscribers..in.millions." = "Total ",
                  "new" = "Change in ")

server <- function(input, output) {
  output$plot <- renderPlotly({
  
    films_each_week_10 <- check_movies(films_each_week_10, 
                           input$week)
    
    film_plot_america <- films_each_week_10 %>% 
      ggplot(aes(x= reorder(show_title, + weekly_rank), y=weekly_rank)) +
      geom_segment(aes( xend=show_title, yend=0)) +
      geom_point(size=6, color = "slateblue2") +
      coord_flip() +
      theme_bw() +
      xlab("Names of Top Ten Films") +
      ylab("Ranking throughout the week(1-10)") +
      ggtitle("Top ten films in America currently")
    
    return(film_plot_america)
  })
  
  output$scatter <- renderPlotly({
    title <- "TV Shows Plot"
    
    shows_america <- check(shows_america, 
                           input$search_show)
    #creating the plot for shows in america
    shows_plot_america <- shows_america %>% 
      ggplot(aes(x= reorder(show_title, +weekly_rank) , y=weekly_rank)) +
      geom_count(aes(color = cumulative_weeks_in_top_10, size = cumulative_weeks_in_top_10))+
      coord_flip()+
      xlab("Names of Top Ten Shows")+
      ylab("Ranking throughout the week(1-10)")+
      ggtitle("Recent Top Ten Shows in America and Time on Charts")+ 
      labs(cumulative_weeks_in_top_10= "Testing")
    #viewing the plot
    return(shows_plot_america)
    # Be sure and return the completed plot!
   
  })
  
  output$distPlot <- renderPlot({
    x <- netflix$Netflix.Quarterly.Subscribers
    x <- factor(x, levels = x)
    netflix_barchart <- ggplot(data = netflix) +
      geom_col(color = input$colorchoice, mapping = aes(x = x, y = !!as.name(input$y_axis_input))) +
      labs(x = "Netflix Quartely Reports 2013-2022", y = "Number of Paid Netflix Subscribers (in millions)") +
      ggtitle(paste0(titlelabs[[input$y_axis_input]], "Netflix Subscriber Count (in Millions)"))
    
    return(netflix_barchart)
  })
}
