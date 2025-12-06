# Load data
df <- read.csv("D:/7COM1079_Group_Project_Top200Movies/data/Research_question_analysis_movies_cleaned.csv")

# Pearson
pearson <- cor.test(df$Theaters, df$Total.Gross, method = "pearson")
pearson

# Spearman
spearman <- cor.test(df$Theaters, df$Total.Gross, method = "spearman")
spearman

# Regression (raw)
model_raw <- lm(Total.Gross ~ Theaters, data = df)
summary(model_raw)

# Regression (log model)
df$logGross <- log(df$Total.Gross)
model_log <- lm(logGross ~ Theaters, data = df)
summary(model_log)



