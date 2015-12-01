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

# Parse and filter data for males
sex_values = c("M")
m <- surveys %>% # created object m
  filter(sex %in% sex_values)%>% # removed all sexes but male
  filter(!is.na(weight)) %>% # filter out NAs for weight
  filter(!is.na(hindfoot_length))%>% # filter out NAs for hindfoot_length
  group_by(sex, species_id) # group by sex and species_id
# Relationship of Hindfoot length and Weight for Males of Various Species
pdf ("figures/Male_weight_HFlength.pdf") # save to pdf in figures
ggplot(data = m, aes(x = weight, y = hindfoot_length, color = species)) + geom_point() + facet_wrap(~ sex) + xlab("Weight (g)") + ylab("Hindfoot length (mm)") + ggtitle("Relationship of Hindfoot length and Weight for Males")
dev.off()

# Parse and filter data for males
sex_val = c("M")
b <- surveys %>% # created object b
  filter(sex %in% sex_val)%>% # removed all sexes but male
  filter(!is.na(weight))%>% # removed all missing weights
  select(weight, year, species)%>% # selected columns weight, year, and species only
  filter(species == "albigula") # removed all species but albigula
# Distribution of Weight for Males in species "Albigula"
pdf("figures/Male_weight_Histogram.pdf") # save to pdf in figures
ggplot(b, aes(x = weight)) + geom_histogram(binwidth = 5, aes(fill = ..count..)) + scale_fill_gradient("Count", low = "green", high = "red") + xlab("Weight (g)") + ylab("Count of Rodents") + ggtitle("Distribution of Weight for Males in Albigula")
dev.off()

# parse and filter data for males and females
sex_val = c("M", "F")
c <- surveys %>% # created object c
  filter(sex %in% sex_val)%>% # removed all sexes but male and female
  filter(!is.na(weight))%>% # removed all missing weights
  select(weight, year, species, month, sex)%>% # selected columns weight, year, and species only
  filter(species == "albigula")%>% # removed all species albigula
  filter(year == 2000) # filtered for only year 2000
# Comparison of Weight distribution between Males and Females in 2000 for genus Albigula
pdf("figures/MaleFemale_weight_boxplot.pdf") # save on pdf in figures
ggplot(data = c, aes(x = month, y = weight, color = sex)) + geom_boxplot() + facet_wrap(~sex) + xlab("Months") + ylab("Weight (g)") + ggtitle("Comparison of Weight distribution between Males and Females in 2000")
dev.off()

# parse and filter data for males and females
sex_val = c("M", "F")
  e <- surveys %>% # created object e
  filter(sex %in% sex_val)%>% # removed all sexes but male and female
  select(sex, species, year, weight)%>% # selected columns for sex, species, year, weight
  filter(species == "albigula")%>%
  filter(!is.na(weight))%>% # removed missing weights
  filter(year == 2000) # filtered for only year 2000

test <- t.test(weight ~ sex, data=e) # t-test comparing weights bewteen males and females in 2000
test # look at fit

