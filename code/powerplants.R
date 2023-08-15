# everything in this is an r-code chunk except the comments

## Data Wrangling and Viz

library(tidyverse)
library(here)
library(janitor)

plants <- read_csv(here("data", "power_plants.csv")) %>% 
  clean_names()

alabama_plants <- plants %>% 
  filter(state_name == "Alabama" | state_name == "alabama") # only keeps plants in Alabama

alabama_plot <- ggplot( data = alabama_plants,
        aes(x = install_mw,
            y = total_mw)) + 
  geom_point()

ggsave(here::here("figs", "alabama_plot.png"), height = 6, width = 7)

