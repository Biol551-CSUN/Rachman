###
###
###
##############################

### Libraries
###
#Get the latest Install
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap", ref = "tidyup", force=TRUE)

#Load the library
library("ggmap")
library(tidyverse)
library(here)
library(ggsn)

# data
ChemData<-read_csv(here("Week_7","data","chemicaldata_maunalua.csv"))
head(ChemData)
Oahu<-get_map("Oahu")
