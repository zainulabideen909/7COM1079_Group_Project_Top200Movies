# Load data
df <- read.csv("D:/7COM1079_Group_Project_Top200Movies/data/Research_question_analysis_movies_cleaned.csv")

# Pearson
pearson <- cor.test(df$Theaters, df$Total.Gross, method = "pearson")
pearson

# Spearman
spearman <- cor.test(df$Theaters, df$Total.Gross, method = "spearman")
spearman


