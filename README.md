# 🏦 Banking Loan Default Risk Analytics Pipeline

## 📌 Project Overview
End-to-end data engineering project that ingests 10,000
loan applicant records through an Azure cloud pipeline,
applies SQL-based risk scoring, and visualizes banking
risk metrics in an interactive Power BI dashboard.

## 🎯 Business Problem
A bank needs to identify which loan applicants are most
likely to default so it can make smarter lending decisions
and reduce its Non-Performing Asset (NPA) rate.

## 🏗️ Architecture
Excel CSV → Azure Blob Storage → Azure Data Factory
→ Azure SQL Database → SQL Views → Power BI Dashboard

## 🛠️ Tech Stack
| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning and validation |
| Azure Blob Storage | Raw data cloud storage |
| Azure Data Factory | Automated ingestion pipeline |
| Azure SQL Database | Structured data warehouse |
| Power BI | Interactive dashboard |

## 📊 Dashboard Preview

### Executive Summary
![Executive Summary](executive_summary.png)

### NPA Analysis
![NPA Analysis](npa_analysis.png)

### Credit Score Analysis
![Credit Score Analysis](credit_score_analysis.png)

### Default Trends
![Default Trends](default_trends.png)

## 📁 Files in This Repository
| File | Description |
|---|---|
| 01_create_table.sql | Creates loan_applicants table |
| 02_add_columns.sql | Adds DTI and EMI columns |
| 03_vw_risk_scoring.sql | Risk score 0-100 per customer |
| 04_vw_npa_by_employment.sql | NPA rate by employment type |
| 05_vw_credit_band_analysis.sql | Defaults by credit score band |
| 06_vw_loan_purpose_analysis.sql | Risk by loan purpose |
| 07_vw_city_risk.sql | Geographic risk distribution |
| 08_vw_monthly_trend.sql | Monthly default rate trend |
| loan_data_clean.csv | 10,000 synthetic loan records |
| Banking_Risk_Dashboard.pbix | Power BI dashboard file |

## 🔍 Key Business Insights
1. Unemployed applicants have significantly higher
   NPA rate than Salaried applicants
2. Credit scores below 550 drive majority of defaults
3. Business loans carry highest default rate by purpose
4. DTI ratio above 0.6 strongly predicts loan default
5. Customers with 3 or more existing loans default most

## ▶️ How to Reproduce
1. Download loan_data_clean.csv from this repository
2. Create Azure Storage Account and upload CSV to Blob
3. Create Azure SQL Database
4. Run SQL scripts 01 and 02 in Query Editor
5. Set up Azure Data Factory pipeline (Blob to SQL)
6. Run SQL scripts 03 to 08 to create analytical views
7. Open Power BI Desktop and connect to Azure SQL
8. Load all 6 views and build the dashboard

## 👤 Author
Rydham Jadhav
LinkedIn: linkedin.com/in/RydhamJadhav
GitHub: github.com/rydhamjadhav
