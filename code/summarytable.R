# ===============================
# 1. Load Libraries
# ===============================
library(dplyr)
library(stringr)
library(lubridate)

# ===============================
# 2. Load Your CSV File
# ===============================

df <- read.csv("D:/7COM1079_Group_Project_Top200Movies/movies_cleaned.csv", stringsAsFactors = FALSE)

# Convert columns to numeric (if not already)
df$Theaters <- as.numeric(gsub(",", "", df$Theaters))
df$Total.Gross <- as.numeric(gsub(",", "", df$Total.Gross))

# Summary table
summary_table <- data.frame(
  Variable = c("Theaters", "Total.Gross"),
  Min = c(min(df$Theaters, na.rm = TRUE),
          min(df$Total.Gross, na.rm = TRUE)),
  Max = c(max(df$Theaters, na.rm = TRUE),
          max(df$Total.Gross, na.rm = TRUE)),
  Mean = c(mean(df$Theaters, na.rm = TRUE),
           mean(df$Total.Gross, na.rm = TRUE)),
  Median = c(median(df$Theaters, na.rm = TRUE),
             median(df$Total.Gross, na.rm = TRUE)),
  Std_Dev = c(sd(df$Theaters, na.rm = TRUE),
              sd(df$Total.Gross, na.rm = TRUE))
)

# Save to CSV
write.csv(summary_table, "D:/7COM1079_Group_Project_Top200Movies/summary.csv", row.names = FALSE)

# View the summary table
print(summary_table)
