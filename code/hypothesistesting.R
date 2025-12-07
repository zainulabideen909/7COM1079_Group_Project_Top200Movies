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

# ===============================================
# GRAPH 3: QQ Plot
# ===============================================
png(paste0(graphs_path, "qq_plot.png"), width = 1000, height = 700)
qqnorm(res, main = "QQ Plot of Residuals")
qqline(res, col = "red")
dev.off()

# ===============================================
# GRAPH 4: Full 4-panel diagnostic plot
# ===============================================
png(paste0(graphs_path, "diagnostic_plots.png"), width = 1200, height = 1200)
par(mfrow = c(2,2))
plot(model_log)
dev.off()

# ===============================================
# Breusch-Pagan test
# ===============================================
library(lmtest)
bp <- bptest(model_log)


# ===============================================
# Save statistical results table
# ===============================================
results <- data.frame(
  Test = c("Pearson r", "Spearman rho", "Regression Raw", "Regression Log", "Breusch-Pagan p"),
  Statistic = c(
    pearson$estimate,
    spearman$estimate,
    coef(summary(model_raw))[2,1],
    coef(summary(model_log))[2,1],
    bp$p.value
  ),
  p_value = c(
    pearson$p.value,
    spearman$p.value,
    coef(summary(model_raw))[2,4],
    coef(summary(model_log))[2,4],
    bp$p.value
  )
)

write.csv(results, paste0(tables_path, "stat_results.csv"), row.names = FALSE)

