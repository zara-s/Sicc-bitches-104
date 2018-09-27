library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/Sicc-bitches-104")

fertility <- read_csv("new fertility (Cut Down 36).csv")
lifeexpectancy <- read_csv("new life expectancy (Cut Down 36).csv")
education <- read_csv("new primary (Cut Down 36).csv")

fertility1 <- fertility %>%
  gather("Date", "Value", c(-'CountryName'))

lifeexpectancy1 <- lifeexpectancy %>%
  gather("Date", "Value", c(-'CountryName'))

education1 <- education %>%
  gather("Date", "Value", c(-'CountryName'))

# Rename a column in R
#colnames(data)[colnames(data)==“old_name”] <- “new_name”

colnames(fertility1)[colnames(fertility1)=="Value"] <- "Fertility"
colnames(lifeexpectancy1)[colnames(lifeexpectancy1)=="Value"] <- "LifeExpectancy"
colnames(education1)[colnames(education1)=="Value"] <- "Primary"

LeftJoin <- fertility1 %>% 
  left_join(lifeexpectancy1, by="Date") %>% 
  left_join(education1, by="Date") %>% 
  select(Date, 'CountryName', Fertility, LifeExpectancy, Primary)

LeftJoin2 <-  LeftJoin %>% 
  gather(key, value, c(-Date, -'CountryName'))

#LeftJoin3 <- LeftJoin2 [which(LeftJoin$Date > 2013),]

#LeftJoin4 <- LeftJoin [which(LeftJoin$Date > 2013),]

ggplot(data = fertility1, aes(Date, Fertility, color = CountryName)) + 
  geom_point()



#ggplot(data = LeftJoin4, aes(Fertility)) +
  #geom_bar()

#ggplot (data = LeftJoin4, aes(Fertility)) +
  #geom_histogram(mapping = aes(x = Fertility)) +
  #facet_wrap(~'Country Name')

#ggplot (data = fertility1, aes(Date, Fertility)) +
  #geom_line()

#ggplot(data = LeftJoin4) +
  #geom_bar(mapping = aes(x = Fertility, y = Date), stat = "identity")


  