## survey project in R

# install and load library
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# data download
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")
# data import/load
surveys <- read.csv('data/portal_data_joined.csv')

## explore distribution of weight for each species

# data parsing

# build figure

## comparison of weight over time period
## relationship between species and hindfoot_length
## distribution of hindfoot_length for males for specific species (Do males have similar hindfoot_lengths to females)
## distribution of hindfoot_length for females for specific species
## comparison of sex and hindfoot_length or weight

