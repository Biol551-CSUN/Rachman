### Underground biochemistry research
### Updated by: Richard Rachman
### Updated on: 2/17/2021

##################################################

### Libraries 
library(tidyverse)
library(here)
library(devtools)
library(viridis)


### Data
chemdata_clean<- chemdata %>% #clean the data and remove the NAs
  filter(complete.cases(.)) %>%
  separate(col = Tide_time,
           into = c("Tide","Time"),
           sep = "_",
           remove= FALSE) 
  view(chemdata_clean)
  
chemdata_day<- chemdata_clean %>% #We are insterested in looking at day time data and don't want to look at percent sgd
  filter(Time == "Day" ) %>%
select(-c("Time", "percent_sgd")) %>%
  rename("Temperature (C)"= Temp_in,
         "Nitrate+Nitrite (umol/L)"= NN,
         "Total Alkalinity (umol/Kg)"= TA,
         "Phosphate (umol/L)"= Phosphate,
         "Salinity (umol/L)" = Salinity,
         "Silcate (umol/L)" = Silicate)

chemdata_day_long<- chemdata_day %>%
  pivot_longer(cols= "Temperature (C)":"Total Alkalinity (umol/Kg)", # the cols you want to pivot
                names_to = "Variables", #names of the new cols with all the column names
                values_to = "Values") #name ofthe new cols with all the values for the variables

chemdata_day_summary<- chemdata_day_long %>% #group the data by season, Tide, and our numbered variables
  group_by(Season, Tide, Variables) %>%
             summarize(means = mean(Values, na.rm = TRUE), #gets mean and var out of the values
                       variation= var(Values, na.rm= TRUE),
                       SEs=sd(Values, na.rm = TRUE)/sqrt(length(na.omit(Values))))
view(chemdata_day_summary)

chemdata_day_summary %>%
  ggplot(aes(fill= Tide, x= Season, y= means)) +
  geom_bar(stat="identity", position= "dodge") +
  facet_wrap(~Variables, scales= "free")+
  labs(y= "Means", title="Water Chemistry by in Different Seasons and High/Low Tides")+
  theme(strip.text.x = element_text(size = 7, colour = "black"))
  



### Code