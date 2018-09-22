library(tidyverse)
library(lubridate)

fertility <- read_csv("new fertility.csv")
lifeexpectancy <- read_csv("new life expectancy.csv")
education <- read_csv("new primary.csv")

fertility1 <- fertility %>%
  gather("Date", "Value", c(-'Country Name'))

lifeexpectancy1 <- lifeexpectancy %>%
  gather("Date", "Value", c(-'Country Name'))

education1 <- education %>%
  gather("Date", "Value", c(-'Country Name'))


# Rename a column in R
#colnames(data)[colnames(data)==“old_name”] <- “new_name”

colnames(fertility1)[colnames(fertility1)=="Value"] <- "Fertility"
colnames(lifeexpectancy1)[colnames(lifeexpectancy1)=="Value"] <- "Life Expectancy"
colnames(education1)[colnames(education1)=="Value"] <- "Primary"

LeftJoin <- fertility1 %>% 
  left_join(lifeexpectancy1, by="Date") %>% 
  left_join(education1, by="Date") %>% 
  select(Date, Fertility, 'Life Expectancy', Primary)
