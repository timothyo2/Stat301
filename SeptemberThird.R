# Author: Timothy , Date: Sep 3 2021, Purpose: Calculate ANNOVA on sample data

library(dplyr) 

PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv" 

data <- read.csv(PATH) %>% select(-X) %>% mutate(poison = factor(poison, ordered = TRUE)) 

#glimpse(data)

#ranks of variable/column poison

levels(data$poison)

# Summary of data

data %>% group_by(poison) %>% summarise( count_poison = n(), mean_time = mean(time, na.rm = TRUE), sd_time = sd(time, na.rm = TRUE) )

# install library ggplot

install.packages("ggplot2")
library(ggplot2)

print(ggplot(data, aes(x = poison, y = time, fill = poison)) + geom_boxplot() + geom_jitter(shape = 15, color = "steelblue", position = position_jitter(0.21)) + theme_classic())

# Perform the one-way ANOVA Test

anova_one_way <- aov(time~poison, data = df) 
print(summary(anova_one_way))
