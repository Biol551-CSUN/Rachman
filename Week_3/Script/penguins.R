###this is making a penguin data
###Date created: 2/8/2021
###Creator: Rchard Rachman and group

####################################

###Load Library
library(tidyverse)
library(ggplot2)
library(palmerpenguins)
library(praise)
library(devtools)
library(calecopal)
library(ggthemes)
library(here)
library(viridis)
library(hrbrthemes)

###Load data set
glimpse(penguins)
view(penguins)


###Graph the data set

##Change the name of the penguins in the data set

penguins <- penguins %>% mutate(sex = fct_recode(sex, 
                                                 "Male" = "male", 
                                                 "Female" = "female"))


penguins %>% filter(sex == "Male" | sex == "Female") %>% 
  filter(species == "Adelie") %>% 
  ## seperate males and females
  ggplot(aes(x=sex, y=body_mass_g, fill=sex)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_bw() +
  theme(strip.background = element_rect(fill = "white", color = "white"),
        legend.position="none",
        plot.title = element_text(size=20)
  ) +
  facet_grid(~island) + 
  labs(y="Body Mass (g)", x="Sex", 
       title="Adelie Penguins Body Mass by Island")

       
## I'm not sure if I can put hashtags and comments betwix my ggplot directions, but I figure I can do it after
