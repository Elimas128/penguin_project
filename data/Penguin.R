# install tidyverse

install.packages("tidyverse")
library(tidyverse)

#read table

penguins <- read.table("data/penguin_data.txt", header=TRUE)


model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)

#create ggplot

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  stat_smooth(method = "lm")    #lines - "lm" = linear model, aes= aestetic = how the graph is going to look like

#save plot

ggsave("figs/1_flipper_bodymass_regression.png") 

#subset for female penguins 
penguins_female <- subset(penguins, sex == "female")


#save the female penguins as a dataset 
write_tsv(penguins_female, "results/1_penguin_female_only.txt")
