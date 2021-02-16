###penguin manipulation
### created by Richard Rachman
### 2/15/2021
#############################

### libraries
library(palmerpenguins)
library(tidyverse)
library(here)
library(viridis)

### dataset

glimpse(penguins)

### functions

penguins %>% 
  drop_na(sex) %>%
  group_by(species, island, sex) %>%
  summarise(mean_body_mass = mean(body_mass_g, na.rm= TRUE),
             var_body_mass = var(body_mass_g, na.rm= TRUE))

penguins %>%
  filter(sex =="female") %>%
  mutate(log_body_mass = log(body_mass_g)) %>%
  select(species, island, sex, log_body_mass) %>%
  ggplot(aes(x=island, y=log_body_mass, fill=species)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_bw() +
  theme(strip.background = element_rect(fill = "white", color = "white"),
        legend.position="right",
        plot.title = element_text(size=20)) +
  labs(y="Log Body Mass", x="Island", 
       title="Female Penguins Mass by Island",
       fill= "Species")+
  ggsave(here("Week_4", "output","Penguin_Plot.png"))

