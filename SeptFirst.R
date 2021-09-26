#Author: Timothy, Date: Spetember 1, Purpose: Calculate ANOVA on sample data 

#Load library called dplyr

library(dplyr)

#This is a link to the data

PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv" #save to a variable called path


#Read the data from the website page

df <- read.csv(PATH) %>% select(-X) %>% mutate(poison = factor(poison, ordered = TRUE)) 

#print out data

glimpse(df)