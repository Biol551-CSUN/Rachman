### This is my first script
### Created by: Richard Rachman
### Created on: 2/3/2021
#############################################


### Load Library #######
library(tidyverse)
library(here)

###Read in data######
WeightData<-read_csv(here("Week_2","data","weightdata.csv"))


### Data analysis ######

head(WeightData)
tail(WeightData)
View(WeightData)


