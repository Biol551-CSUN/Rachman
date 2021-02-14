###this is making a ggplot
###Date created: 2/8/2021
###Creator: Rchard Rachman

####################################

###Load Library
library(tidyverse)
library(ggplot2)
library(palmerpenguins)


###Load data set
glimpse(penguins)

### Data analysis
ggplot(data = penguins,
       aes(x=bill_depth_mm,
                            y=bill_length_mm,
           color=species,
           size=body_mass_g,
           alpha=flipper_length_mm))+
  geom_point()+
  labs(title="Bill depth and length",
       subtitle="Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x="Bill Depth in (mm)",
       y="Bill Length in (mm)",
       color="Species",
       size="Body Mass in (g)",
       caption= "Source: Palmer Station LTR/Palmer Penguins Package")+
  scale_color_viridis_d()
### facet
ggplot(penguins,
       aes(x=bill_depth_mm,
           y=bill_length_mm))+
  geom_point()+
  facet_wrap(~species)
