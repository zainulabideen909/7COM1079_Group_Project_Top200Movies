# ===============================================
# Load data
# ===============================================
df <- read.csv("D:/7COM1079_Group_Project_Top200Movies/data/Research_question_analysis_movies_cleaned.csv")

# Create paths
analysis_path <- "D:/7COM1079_Group_Project_Top200Movies/analysis/"
graphs_path   <- paste0(analysis_path, "graphs/")
tables_path   <- paste0(analysis_path, "tables/")

dir.create(graphs_path, showWarnings = FALSE)
dir.create(tables_path, showWarnings = FALSE)

# ===============================================
# Correlation tests
# ===============================================
pearson  <- cor.test(df$Theaters, df$Total.Gross, method = "pearson")
spearman <- cor.test(df$Theaters, df$Total.Gross, method = "spearman")

# ===============================================
# Regression models
# ===============================================
model_raw <- lm(Total.Gross ~ Theaters, data = df)

df$logGross <- log(df$Total.Gross)
model_log <- lm(logGross ~ Theaters, data = df)

res <- residuals(model_log)

# ===============================================
# Save GRAPH 1: Histogram
# ===============================================
png(paste0(graphs_path, "hist_residuals.png"), width = 1000, height = 700)
hist(res,
     main = "Histogram of Residuals",
     xlab = "Residuals",
     breaks = 20)
dev.off()

# ===============================================
# GRAPH 2: Residuals vs Fitted
# ===============================================
png(paste0(graphs_path, "residuals_vs_fitted.png"), width = 1000, height = 700)
plot(fitted(model_log), res,
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals")
abline(h = 0, col = "red")
dev.off()

