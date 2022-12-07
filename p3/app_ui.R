# ui.R
library(shiny)
library(plotly)

library(shinythemes)

# Define a variable `map_sidebar_content` that is a `sidebarPanel()` for your
# first (map) page that contains:
# An input to select variable to map


# # Define a variable `map_main_content` that is a `mainPanel()` for your
# # first (map) page that contains the `plotlyOutput()` of your map

# # Create a variable `map_panel` that stores a `tabPanel()` for your first page
# # It should include the following:
# -----------------------------MOVIES----------------------------------------
# # first panel !
all_weeks_countries <- read.csv("all-weeks-countries.csv")

all_weeks_countries <- all_weeks_countries %>% 
  mutate(week_new = anydate(week))

films_each_week_10 <- all_weeks_countries %>% 
  group_by(week_new) %>%
  filter(category == "Films") %>% 
  filter(country_name == "United States") %>% 
  select(week_new,show_title,weekly_rank)

date_range <- films_each_week_10 %>% 
  pull(week_new)

date_update <- anydate(date_range)
min_date <- min(date_update)
max_date <- max(date_update)
#creating the plot for films in america
#code found from: https://r-graph-gallery.com/267-reorder-a-variable-in-ggplot2.html 

movie_sidebar_content <- sidebarPanel(
  year_drop_down <- selectInput(
    inputId = "week",
    label = "Weeks",
    choices = unique(date_update)
  )
)

movie_main_content <- mainPanel(
  plotlyOutput("plot")
  
  
)

movie_panel <- tabPanel(
  "Movies",
  titlePanel("Movies"),
  movie_sidebar_content,
  movie_main_content,
  # A `sidebarLayout()` that contains...
  p("This visualization provides us with data from the past year regarding top shows each week. With the option to select a week (within the datasets range) shiny will provide the graph of each film that was ranked from 1-10. This can help provide insight for users into Netflix’s range of films and what the majority of users watch. It provides beneficial data to Netflix; they can analyze and use to produce/add more movies of that specific genre.")
)

# ---------------------------- TV SHOWS ------------------------------------
scatter_sidebar_content <- sidebarPanel(
  input_text <- textInput(
    inputId = "search_show",
    label = "Search for a show's cumulative weeks in top 10",
    value = ""
  )
)

scatter_main_content <- mainPanel(
  plotlyOutput("scatter")
)

popular_tv_panel <- tabPanel(
  "TV Shows",
   titlePanel("TV Shows"),
   scatter_sidebar_content,
  scatter_main_content,
  p(" We included this table because it displays important information about
    the datasets we used. It reveals information about the most popular content on Netflix, 
    such as which shows and films were in the Top 10 on Netflix and for how long.")
)

summary <- tabPanel(
  "Summary",
  titlePanel("Impact of Netflix on Social and Economic Connections"),
  img(src = "https://urldefense.com/v3/__https://images.unsplash.com/photo-1643208589889-0735ad7218f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80__;!!K-Hz7m0Vt54!h6rAtLcIGgX_RcKn6h4JmAjLj037afvx8Id9qq3UyfxKIuQqxpZXgO1Vwx7JLXW7F2GwaB5M3JKJ$ ", height = "400", width = "500"),
  p("Netflix is one of the biggest leading entertainment services in the world.
    Netflix helps circulate money and provides people with one form of entertainment. With Netflix 
    changing lives everyday (socially and economically) it is helpful to understand how by analyzing the data so that it can bring 
    awareness to people. In this project, we studied how the human values of being social, empathetic, and progressive, 
    are all influenced by content online. An example is how people connected online through the pandemic using Netflix 
    Party, now known as Teleparty. The different research questions that were answered were What are some
    frustrations that come up with using different streaming services? How do people choose the best streaming 
    service for themselves/ families? What do they take into consideration and what do you wish Netflix had that other streaming services do?
      What types of films do people most enjoy watching? What makes Netflix different from other streaming services? 
      From asking these questions we were able to analyze data that provides us with the different types of content Netflix 
    offers for each country, different subscription fees that Netflix charges in each country, and financial aspects of Netflix like 
    stocks. In this data, some key findings we found were differnt top ten films that"),
  h3("Netflux"),
  h5("Impact of Netflix on Human Connections"),
  p("
    
    University of Washington- Info 201
    12/4/22
    
    Authors:
      Medha Rawat : mrawat@uw.edu
    Celina Yu:  celinayu@uw.edu
    Lasya Suravajhela: lasya19@uw.edu
    Heena Vahora: vheena@uw.edu "),
  
  h3("Abstract:"), 
  p("
      Our main question is how does Netflix have an impact on the social and economical welfare in the world. This question is important because as there are so many streaming services many people could access, Netflix tends to stay at number 1. We will address these questions by breaking down the best qualities of Netflix and why it has people's grip. 
  "),
  h3("Keywords:"), 
  p("
Entertainment; Streaming services; Top Choice; Netflix "), 
  h3("Introduction:"), 
p("
Our main focus is to understand the social and economic welfare due to Netflix. What movies are the peoples most favorite, what shows provided the most impact especially during recent times, and how much profit the company has made. Netflix is one of the biggest leading entertainment services in the world, meaning Netflix has a heavy impact on the economical aspect. It helps circulate money and provides people with one form of entertainment. Often, we use TV or movies as comfort to get us through difficult times. We plan to address the issue by demonstrating data that can help people emotionally, such as data about comfort shows. Data from multiple different countries will help us create a webpage that provides accurate and factual data. With Netflix changing lives everyday (socially and economically) it is helpful to understand the data, analyze it, and present it so that it can bring awareness to people’s lives.
"),
h3("Human Values"), 
p("

 Our topic is the effect of Netflix and streamed content on the emotional and social lives of humans. In today's world, humans are deeply connected to each other through screens and content. Streaming movies and shows allows humans to spread and share information about different topics and scenarios. In this project, we want to study how the human values of being social, empathetic, and progressive, are all influenced by content online. An example is how people connected online through the pandemic using Netflix Party, now known as Teleparty. The chat features, along with being able to stream content simultaneously, allowed for connectivity and comfort. Humans naturally want to thrive and be educated, and a result is we stream content for entertainment and to better our knowledge. This could be watching a documentary on Netflix or a tutorial on Youtube.
    
    Direct and Indirect Stakeholders 
    
    Direct stakeholders include the users of content on Netflix, such as account owners and families. They have the potential to be directly impacted by Netflix and its streaming availability, as listed in the next subsection of possible harms/benefits. Indirect stakeholders include those who may not use Netflix directly, such as founders, employees, and investors. They are affected by the effect of Netflix and its content on others, including monetary rewards and social impacts (Strategy). Additionally, as creators of the platform, they are impacted by the climate effect, and so are direct stakeholders, or any other inhabitant of the Earth (True Impacts). 
    
    Possible Harms and Benefits Although streamed content can bring people together, and be educational, there are possible harms to the availability of content online. Here are some, listed below: * The amount of horror and dark content can be emotionally difficult for some people * Content can be distracting from other responsibilities, resulting in distance (Dhiman and Malik) * Readily content can be too vulgar and too in-depth for humans, for example the new Jeffrey Dahmer series * Adding on to the point above, this is an example of when capitalism encourages valuing fame and money over acknowledging the wishes of victims' and their families * Too many options and content can be overwhelming and distracting * Can completely change your lifestyle (Dhiman and Malik) However, there are many more possible benefits to be mentioned: * Easily available content can be used as a coping mechanism for those suffering with mental illness and other hardships * Softer shows can be comforting and educational
"),
h3("Problem Domain Citations"), 
p("
Similar paper: Dhiman and Malik, Psychosocial Impact of Web Series and Streaming Content. https://www.globalmediajournal.com/open-access/psychosocial-impact-of-web-series-and-streaming-content-a-study-on-indian-youth.php?aid=90530

Netflix article: Strategy Case Study series. https://www.linkedin.com/pulse/strategy-case-study-series-netflix-effect-leading-disruptive-carl-li

True Impact of Streaming: https://about.netflix.com/en/news/the-true-climate-impact-of-streaming
"),
h3("Research Questions"),
p("
What are some frustrations that come up with using different streaming services?

This question is important because to know what makes Netflix special and why people choose Netflix, we have to understand people's frustrations to see if it’s something that Netflix or their competitors do. What motivates the questions is that if someone doesn't like something, they won't stay. So what is making people stay at Netflix?
      
      How do people choose the best streaming service for themselves/ families? What do they take into consideration and what do you wish Netflix had that other streaming services do?
      
      This question is important to look into because Netflix offers different films for different audiences. We must understand what makes a person choose that platform for themselves or if they chose it for a family and why. What motivates the questions is seeing what age groups or audiences mainly use streaming services.
    
    What types of films do people most enjoy watching?
      
      It is important to see what types of shows and movies people like watching because not every film is on the same service. By finding this out, we are able to see what keeps people connected to Netflix
    
    What makes Netflix different from other streaming services?
      
      There are so many streaming services out there. Why do people choose netflix? What makes them enjoy it over Hulu, Disney +, HBO Max, etc. This is all important to find out and motivates us to find out what it is that Netflix does that makes people happy.
"),    
h3("Dataset:"),
      
p("Dataset One: 
      
      Expected implications:
    
    Some expected implications we see happening are designers and policymakers changing the different frustrations people had to fit more of their needs and preferences. I also see policymakers finding a way to add more films that people enjoy watching or films that give the same feeling as they were describing and comparing different streaming services to Netflix to find their strengths and weaknesses to better improve Netflix over all. After hearing feedback and or a comment, we should aim to find a way that fits those needs and preferences. Even though Netflix is the number one streaming service in the world, there is always room for improvement. Staying at the top, in a positive way,  is always something a company wants. By taking this feedback and research, we are able to figure out how Netflix stays on top and will continue to do so.
    
    Limitations: 
    
    Possible limitations include restrictions on what analysis can be conducted from the available data. Here are more listed below:
      
      Privacy issues on user data being used without consent. People and their streaming habits are used for analysis, whether they are aware or not
    
    Only certain data is available  Some data is private and restricted to the public for viewing
    
    There are much larger socio technical impacts on people and their lives, although Netflix and other available streaming content does have an effect
    
    We want to help meet others' needs and preferences, but we are limited in the amount of impact we can make on others

Some data sets are private, and we cannot use those in our exploration.
  Our problem domain focuses on the effect of Netflix and streamed content on the emotional and social lives of humans. With this data, we were able to find how many subscribers Netflix had each quarter of the year from 2013-2022. Our dataset answers each question by being able to see in what years did Netflix lose its most subscribers and in what year did Netflix gain the most subscribers. From the years we found, we could also find out the different trends and films that were released from Netflix and how that made an impact on Netflix’s overall subscribers.

'Netflix' dataset:
  This data was collected and published by Julia Stoll on October 19th 2022 on the Statistia website. The purpose was to show those interested what Netlifx’s paid subscribers growth looked like over the course of each quarter from 2013-2022. It does not say how the data collection effort was funded but it is likely to benefit Julia Stoll as the publishers and the Statista website since you need a subscription to have access to this data. There was not much information on this topic for us to be able to elaborate on the validity of the data however Statista is a very well known sourced website which validates it to an extent. I obtained the data through searching up the growth of Netflix paid subscribers.
   'Films and TV' dataset: The first data set, https://www.kaggle.com/datasets/mikitkanakia/netflix-top-10-weekly-dataset 
provides us with the type of content Netflix offers for each country. It gives insight to all the directors, actors, and rankings of the tv show or movie. This data set has the knowledge to help us understand how vast and useful Netflix is. The author of this dataset, Mikit Kanakia, provided this dataset to show how the users reacted to certain shows and films within a time frame. The inspiration behind creating this dataset was to analyze the viewership distribution across top 10 movies and tv shows. Along with comparing data with multiple different countries. The author is not going to benefit financially from this dataset. The website the data set was on was validated and was a reputed website that provides all kinds of different data sets; therefore, the information was safe/secure. This can be a great source to branch off with. It can help provide information that we can use to further search for datasets.

  ")

)
# brings together
# Application title

measurement_sidebar_content <- sidebarPanel(
  imput_measurement <-  selectInput(
    inputId = "y_axis_input",
    label = "Netflix Measurement",
    choices = list(
      "Total Subscribers" = "Number.of.Paid.Netflix.Subscribers..in.millions.",
      "Subscriber Change" = "new"),
    selected = "total"
  ),
  radioButtons(
    inputId = "colorchoice",
    label = "Color Choice",
    choices = list(
      "Blue" = "Blue", 
      "Red" = "Red")
  )
  )


measurement_main_content <- mainPanel(
  plotOutput("distPlot")
  )

measurement_panel <- tabPanel(
  "Measurement",
  titlePanel("Measurement"),
  measurement_sidebar_content,
  measurement_main_content,
  # A `sidebarLayout()` that contains...
 
  p("The purpose of this interactive page is to show a digital visualization of both the growth of Netflix's subscriber count from 2013-2022 and also show the change in subscribers from each quarter. As you can see in the Q1 and Q2 of 2022 Netflix was actually facing a loss in subscribers for the first time since 2013. All in all, the purpose of this page is to make it easier for people to visualize data. ")
)

takeaways_panel<- tabPanel(
  "Takeaways",
  titlePanel("Takeaways"),
  p("Some takeaways we got from this project is that we saw some movies on Netflix had stayed popular for a large amount of time, making the trends of film stay longer. This is evidence that people may chose to use Netflix because of the trends the movies bring. 



Another takeaway we found were that in beginning of 2022, Netflix did not make as much they anticipated. But even so, Netflix is always adding new content to its platform, giving people a border option to chose what to watch.



The third takeaway was seeing which TV Shows were on the Top 10 list on Netflix and for how long. This is important because we were able to find the content that the population were enjoying the most. ")
  
)

ui <- navbarPage(
  theme = shinytheme("cerulean"),
  "P3",
  summary,
  popular_tv_panel,
  measurement_panel,
  movie_panel,
  takeaways_panel
)