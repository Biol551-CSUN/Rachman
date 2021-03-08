### join data and stuff
### 2/22/21
### richard rachman

################################

### libraries
library(tidyverse)
library(here)
library(cowsay)

### data
envirodata<- read.csv(here("Week_5","data","site.characteristics.data.csv"))

tpcdata<- read.csv(here("Week_5","data","Topt_data.csv"))

### code
glimpse(envirodata)
glimpse(tpcdata)
envirodata_wide<- envirodata%>%
  pivot_wider(names_from = parameter.measured,
              values_from= values)%>%
  arrange(site.letter)
view(envirodata_wide)
view(tpcdata)
fulldata_left<- left_join(tpcdata, envirodata_wide)%>%
  relocate(where(is.numeric), .after= (where(is.character))) #relocates all numeric data and chacter data
head(fulldata_left)
view(fulldata_left)

fulldata_long<- fulldata_left %>%
  pivot_longer(cols= "E":"substrate.cover", # the cols you want to pivot
               names_to = "Variables", #names of the new cols with all the column names
               values_to = "Values") #names of the new column with all the values
view(fulldata_long)
fulldata_long %>%
  group_by(site.letter,Variables) %>%
  summarise(Param_means = mean(Values, na.rm= TRUE),
            Param_vars = var(Values, na.rm= TRUE))      

T1 <- tibble(Site.ID= c("A","B","C","D"),
Temperature= c(14.1, 16.7, 15.3, 12.8))
T1
T2<- tibble(Site.ID= c("A","B","D","E"),
            pH= c(7.3, 7.8, 8.1, 7.9))
T2
left_join(T1, T2)
right_join(T1, T2)
inner_join(T1,T2)
full_join(T1, T2)
semi_join(T1,T2)
anti_join(T1,T2)

say("Practice must you R", by= "yoda")
