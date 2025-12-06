# ===============================
# 1. Load Libraries
# ===============================
library(dplyr)
library(stringr)
library(lubridate)

# ===============================
# 2. Load Your CSV File
# ===============================
# Change "movies.csv" to your filename
df <- read.csv("D:/7COM1079_Group_Project_Top200Movies/data/Top_200_Movies_Dataset_2023(Cleaned).csv", stringsAsFactors = FALSE)

# FIX THEATERS (correct method)
df$Theaters <- df$Theaters %>%
  str_replace_all(",", "") %>%          # remove commas
  str_replace_all("[^0-9]", "") %>%     # remove non-numeric characters
  na_if("") %>%                         # convert empty to NA
  as.numeric()


