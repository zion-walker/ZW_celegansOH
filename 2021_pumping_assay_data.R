library(readr)
library(dplyr)
library(stats)
library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(viridis)

setwd("~/ZW_OHlab/fall2021/ZW_celegansOH")

# Load in data set
pumping_data_2021 <- read_csv("pharyngeal_pumping_data.csv")
# Statistics
median(pumping_data_2021$`Adlt_daf-2;daf-16::AID_ppm`)
pumping_data_2021 <- na.omit(pumping_data_2021)
median(pumping_data_2021$`dauer_daf-2;daf-16::AID_ppm`)
median(pumping_data_2021$`dauer_daf-2_ppm`)

# create a new data frame
pumping_data <- read_csv("Book2.csv")

#boxplot
pumping_data %>%
  ggplot( aes(x=name, y=ppm, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11),
    axis.title.y = element_text(size=11) 
  ) +
  ggtitle("Pharyngeal pumping in DAF-2 mutant C. elegans") +
  xlab("") +
  ylab("Pharyngeal Pumps Per Minute                ")
