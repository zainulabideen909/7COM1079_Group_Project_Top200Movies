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

# ===============================
# FIX TOTAL GROSS
# ===============================
df$Total.Gross <- df$Total.Gross %>%
  str_replace_all("[^0-9.]", "") %>%  # remove everything except digits
  as.numeric()


# ===============================
# CLEAN DISTRIBUTOR
# ===============================
df$Distributor <- df$Distributor %>%
  str_replace_all("'-", NA_character_) %>%
  str_trim()

# ===============================
# CLEAN TITLES
# ===============================
df$Title <- df$Title %>% str_squish()

# Save result
write.csv(df, "movies_cleaned.csv", row.names = FALSE)

