###
###
###

### libraries
library(tidyverse)
library(maps)
library(mapproj)
library(here)
library(installr)
updater()

### data

popdata<-read.csv((here("Week_7", "data", "CApopdata.csv")))
star<-read.csv((here("Week_7", "data", "stars.csv")))
world<- map_data("world")
head(world)
usa<- map_data("usa")
head(usa)
states<- map_data("state")
head(states)
county<- map_data("county")
head(county)
california<-map_data("california")
head(popdata)


### code

ggplot()+
         geom_polygon(data=world, aes(x=long, y= lat, group=group, fill= region),
                      color= "black")+
  guides(fill= FALSE)+
  theme_minimal()+
  theme(panel.background = element_rect(fill= "lightblue"))+
  coord_map(projection= "mercator",
            xlim=c(-180,180))

#make it sinusoidal

ggplot()+
  geom_polygon(data=world, aes(x=long, y= lat, group=group, fill= region),
               color= "black")+
  guides(fill= FALSE)+
  theme_minimal()+
  theme(panel.background = element_rect(fill= "lightblue"))+
  coord_map(projection= "sinusoidal",
            xlim=c(-180,180))
## just California

CA_data<- states%>%
  filter(region== "california")

ggplot()+
  geom_polygon(data=CA_data, aes(x=long, y= lat, group=group),
               color= "black")+
  theme_minimal()+
  theme(panel.background = element_rect(fill= "lightblue"))+
  coord_map(projection= "albers", lat0= 34, -118)

# california pop data

CApop_county<-popdata%>%
  select("subregion"= County,Population) %>%
           inner_join(county) %>%
           filter(region== "california")
head(CApop_county)

ggplot()+
  geom_polygon(data=CApop_county, aes(x=long, y= lat, group=group,
                                      fill= Population),
               color= "black")+
  theme_void()+
  coord_map(projection= "albers", lat0= 34, -118)+
  scale_fill_gradient(trans= "log10")

# sea stars and human pop

head(stars)

ggplot()+
  geom_polygon(data=CApop_county, aes(x=long, y= lat, group=group,
                                      fill= Population),
               color= "black")+
  geom_point(data= star,
             aes(x= long,
                 y= lat,
                 size= star_no))+
  theme_void()+
  coord_map(projection= "albers", lat0= 34, -118)+
  scale_fill_gradient(trans= "log10")+
  labs(size= "# stars/m2")+
  ggsave(here("Week_7","output","CApop.pdf"))

         