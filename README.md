# 🎬 7COM1079 – Final Group Statistical Analysis Project  
### 📊 Examining the Correlation Between Theatre Count and Box Office Revenue  
**Group ID:** 226A  
**Dataset:** DS056 – Top 200 Movies of 2023  
**University of Hertfordshire, 2025**

---

## 🌟 Project Overview
This repository contains our full statistical analysis project for the module **7COM1079 – Team Research and Development**.  
Our research investigates whether the *number of theatres a movie is released in* significantly influences its *total box office revenue*.  

This project includes:
- Cleaned dataset  
- R scripts for analysis & visualisations  
- Statistical tests (Pearson, Spearman, Regression, BP test)  
- Diagnostic plots  
- Final project report  
- GitHub commit logs for transparency  

---

## 🎯 Research Question
> **Is there a significant positive correlation between the number of theatres a movie opens in and its total gross revenue?**

This question was selected because theatrical reach is a crucial distribution factor that strongly influences commercial movie success.

---

## 🧪 Hypotheses
- **H₀ (Null):** There is no linear correlation between theatre count and total gross revenue (ρ = 0).  
- **H₁ (Alternative):** There is a significant correlation between theatre count and total gross revenue (ρ ≠ 0).

---

## 📂 Repository Structure
## 📂 Repository structure

- **7COM1079-Group-Project**
  - **data/**
    - `Top_200_Movies_Dataset_2023(Cleaned).csv`
    - `Research_question_analysis_movies_cleaned.csv`
  - **analysis/**
    - **graphs/**
      - `hist_gross.png`
      - `hist_theaters.png`
      - `scatter_raw.png`
      - `scatter_log.png`
      - `diagnostic_plots.png`
      - `residuals_vs_fitted.png`
    - **tables/**
      - `stat_results.csv`
  - **scripts/**
    - `cleaning.R`
    - `visualization.R`
    - `statistical_tests.R`
  - **report/**
    - `Final_Report.pdf`
  - `README.md`



---

## 🧹 Data Cleaning Summary
We cleaned theater counts, total gross values, removed symbols, fixed titles, and normalized formatting:

✔ Removed commas and non-numeric characters  
✔ Converted numeric strings to integers  
✔ Standardized titles and distributor names  
✔ Exported a cleaned CSV for analysis  

All steps are fully reproducible in `cleaning.R`.

---

## 📈 Visualisations Included
The analysis includes all required and supplementary plots:

### ✔ Scatter plot with regression line  
Shows the primary relationship between theatres and total gross.

### ✔ Histogram of Total Gross  
Reveals heavy right-skewed revenue distribution.

### ✔ Histogram of Theatres  
Shows bimodal distribution (limited vs wide release).

### ✔ Regression Diagnostic Plots  
- QQ Plot  
- Residuals histogram  
- Residuals vs Fitted  
- Influence & leverage plots  

These validate the regression model assumptions.

---

## 📊 Statistical Methods Applied
| Test | Purpose | Result |
|------|---------|--------|
| **Pearson Correlation** | Linear association | Significant (p < 0.001) |
| **Spearman Correlation** | Monotonic relationship | Significant (p < 0.001) |
| **Simple Linear Regression** | Predicting Gross from Theatres | Significant (p < 0.001) |
| **Log-Linear Regression** | Improved model for skewed data | Highly significant |
| **Breusch–Pagan Test** | Check heteroscedasticity | Passed (p > 0.05) |

---

## 📌 Key Findings
- There is a **strong, statistically significant positive correlation** between the number of theatres and total gross revenue.  
- The log-transformed regression model provides a better fit due to skewness.  
- Diagnostic tests confirm that assumptions (normality, homoscedasticity, linearity) are satisfied.  
- The null hypothesis is **rejected** across all correlation and regression tests.

---

## 👥 Group Members
| Name | Student ID |
|------|------------|
| **Zain ul Abideen** | 25000790 |
| **M. Bilal** | 23098629 |
| **Hamza Ali** | 24097005 |
| **Ali Sufyan** | 25000826 |

---

## 🛠 Tools & Technologies
- **R Language**  
- `dplyr`, `ggplot2`, `lmtest`, `stringr`, `lubridate`  
- CSV data  
- GitHub version control  
- RStudio

---

## 📘 Report Contents (as per module requirement)
1. Introduction  
2. Background Research  
3. Visualisation  
4. Analysis & Statistical Testing  
5. Evaluation  
6. Conclusion  
7. References  
8. Appendices (R Scripts + GitHub Logs)

---

## 🚀 How to Run the Project
```r
# Install required packages
install.packages(c("dplyr","ggplot2","lmtest","stringr","lubridate"))

# Run cleaning
source("scripts/cleaning.R")

# Run visualisations
source("scripts/visualization.R")

# Run full statistical analysis
source("scripts/statistical_tests.R")

📌 GitHub Log Highlights

Our GitHub logs show strong teamwork and equal contributions:

Data cleaning commits

Regression and correlation modelling

Diagnostic plot generation

Report writing updates

This verifies transparency and collaborative work.

🎉 Final Note

This repository demonstrates our full workflow from dataset preprocessing to statistical testing, visualization, and academic reporting.
It reflects the teamwork, analytical skills, and project management techniques learned throughout 7COM1079.


---

# ✅ READY  
If you want, I can also create:

✅ A GitHub banner image  
✅ Badges (build passing, version, contributors)  
✅ A shorter abstract summary  
✅ A professional project logo  
✅ A pinned README GIF with visualization animations  

Just tell me **“add more GitHub design”** and I’ll upgrade it even more.

