install.packages('tidyverse')
library(tidyverse)

mydata <- 
  read_csv("Water System Summary_20221007.csv", show_col_types=F)

mydata$x <- 
  mydata$`Number of Violations`

mydata <- 
  mydata %>% 
  drop_na(x)


obs1 <- 
    mydata$x %>% 
      min() 

obs2 <- 
  mydata$x %>% 
    sample(1)


focusdata <- 
  mydata %>% 
    filter(between(x,obs1,obs2))

mydata %>% 
  ggplot(aes(x)) + 
    geom_histogram(fill="blue") + 
    geom_histogram(data = focusdata, fill="green")
  
