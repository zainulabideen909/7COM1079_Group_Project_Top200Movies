# Load libraries
library(ggplot2)
library(dplyr)

# Load cleaned data
movies <- read.csv("D:/7COM1079_Group_Project_Top200Movies/data/Research_question_analysis_movies_cleaned.csv")

# Ensure numeric columns are correct
movies$Theaters <- as.numeric(gsub(",", "", movies$Theaters))
movies$Total.Gross <- as.numeric(gsub(",", "", movies$Total.Gross))

# -------------------------------
# Graph 1: Histogram of Total Gross
# -------------------------------
hist_gross <- ggplot(movies, aes(x = Total.Gross)) +
  geom_histogram(binwidth = 5000000, fill = "steelblue", color = "black") +
  labs(title = "Histogram of Total Gross", x = "Total Gross ($)", y = "Count") +
  theme_minimal()

ggsave("graphs/hist_gross.png", hist_gross, width = 8, height = 5, dpi = 300)


# -------------------------------
# Graph 2: Histogram of Theaters
# -------------------------------
hist_theaters <- ggplot(movies, aes(x = Theaters)) +
  geom_histogram(binwidth = 200, fill = "tomato", color = "black") +
  labs(title = "Histogram of Theaters", x = "Number of Theaters", y = "Count") +
  theme_minimal()

ggsave("graphs/hist_theaters.png", hist_theaters, width = 8, height = 5, dpi = 300)

# -------------------------------
# Graph 3: Scatter Plot (Theaters vs Total Gross)
# -------------------------------
scatter_raw <- ggplot(movies, aes(x = Theaters, y = Total.Gross)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Scatter Plot: Theaters vs Total Gross", x = "Theaters", y = "Total Gross ($)") +
  theme_minimal()

ggsave("graphs/scatter_raw.png", scatter_raw, width = 8, height = 5, dpi = 300)


# -------------------------------
# Graph 4: Scatter Plot (Log scale Y)
# -------------------------------
scatter_log <- ggplot(movies, aes(x = Theaters, y = Total.Gross)) +
  geom_point(color = "darkblue") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  scale_y_log10() +
  labs(title = "Scatter Plot: Theaters vs Total Gross (Log Y)", x = "Theaters", y = "Total Gross (log $)") +
  theme_minimal()

ggsave("graphs/scatter_log.png", scatter_log, width = 8, height = 5, dpi = 300)

# -------------------------------
# Graph 5: Boxplot of Total Gross (Optional)
# -------------------------------
boxplot_gross <- ggplot(movies, aes(y = Total.Gross)) +
  geom_boxplot(fill = "purple", color = "black") +
  labs(title = "Boxplot of Total Gross", y = "Total Gross ($)") +
  theme_minimal()

ggsave("graphs/boxplot_gross.png", boxplot_gross, width = 6, height = 5, dpi = 300)

# -------------------------------
# Graph 6: Regression Diagnostics (Theaters ~ Total Gross)
# -------------------------------
lm_model <- lm(Total.Gross ~ Theaters, data = movies)
png("graphs/diagnostics.png", width = 800, height = 600)
par(mfrow=c(2,2))
plot(lm_model)
dev.off()



