###this is making a ggplot
###Date created: 2/8/2021
###Creator: Rchard Rachman

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
ggplot(data=penguins,
       mapping= aes(x=bill_depth_mm,
                    y=bill_length_mm,
                    group=species,
                    color=species))+
  geom_point()+
  geom_smooth(method="lm")+
  labs(x="Bill depth (mm)",
       y="Bill length (mm)")+
  scale_color_manual(values = cal_palette("sierra1")) +
  theme_bw() +
 theme_classic()+
  theme(axis.title = element_text(size = 20,
         color = "red"),
        panel.background = element_rect(fill = "linen"))+
   ggsave(here("Week_3","Output","penguin.png"),
          width = 7, height = 5) 
?theme
ggsave


penguins <- penguins %>% mutate(sex = fct_recode(sex, 
                                                 "Male" = "male", 
                                                 "Female" = "female"))

penguins %>% filter(sex == "Male" | sex == "Female") %>% 
  filter(species == "Adelie") %>% 
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

       

