#installing appropirate packages 
install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)


#viewing file 
netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-8-section-ae/main/netflix.csv")
View(netflix)


#creating plot for this specfic dataset from statista {https://www.statista.com/statistics/250934/quarterly-number-of-netflix-streaming-subscribers-worldwide/}
x <- netflix$Netflix.Quarterly.Subscribers
x <- factor(x, levels = x)
netflix_barchart <- ggplot(data = netflix) +
  geom_col(mapping = aes(x = x, y = Number.of.Paid.Netflix.Subscribers..in.millions.)) +
  labs(x = "Netflix Quartely Reports 2013-2022", y = "Number of Paid Netflix Subscribers (in millions)")
View(netflix_barchart)
