Intelligent Customer Retention Dashboard

Project Overview

This project presents an end-to-end customer retention analytics solution developed using Python, SQL, and Tableau. The objective is to analyse customer behaviour, identify churn risks, and provide interactive business insights that support data-driven decision-making. The project demonstrates the complete analytics lifecycle, beginning with data cleaning and validation, followed by SQL-based analysis and the development of an interactive Tableau dashboard.

Project Objectives

• Clean and preprocess customer data.
• Validate records and quarantine invalid data.
• Perform analytical SQL queries for business insights.
• Build an interactive Tableau dashboard.
• Identify high-risk customer segments.
• Monitor customer engagement and churn trends.

Tools and Technologies

• Python
• Pandas
• NumPy
• SQL (MySQL)
• SQLAlchemy
• Tableau Public
• Git
• GitHub

Project Workflow

Data Collection

The customer engagement dataset was imported into Python for preprocessing and analysis.

Data Cleaning

The dataset was cleaned by handling missing values, removing duplicate records, correcting inconsistent values, and standardising categorical fields. Numerical values were validated to ensure data quality before further analysis.

Data Validation

Business validation rules were implemented to identify invalid records. Records that failed validation were separated into a quarantine dataset for further review while the cleaned dataset was used for analysis.

Feature Engineering

Additional business-friendly features were created to improve reporting and analysis. These included AI Risk Band, Income Band, Credit Score Band, Customer Segmentation, and customer engagement indicators.

Database Integration

The cleaned dataset was successfully uploaded into MySQL using SQLAlchemy. SQL queries were executed directly on the database to perform business analysis and validate insights.

SQL Analysis

Several analytical SQL queries were written to answer business questions such as:

• Identifying margin-eroding campaigns.
• Detecting customer segments with high churn risk.
• Comparing AI recommendations with corrected business recommendations.
• Analysing customer behaviour across different categories.
• Measuring engagement and performance trends.

Tableau Dashboard

An interactive executive dashboard was developed in Tableau Public to visualise customer retention metrics.

The dashboard includes:

• KPI Cards displaying Average Churn Risk, Average Feature Score, and Engagement Rate.
• Monthly Churn Trend Line Chart.
• Country versus Income Band Heatmap.
• AI Risk Distribution Chart.
• Interactive filters for customer exploration.
• Business-focused visualisations supporting customer retention analysis.

Key Business Insights

• Most customers belong to the Low AI Risk category.
• Churn risk varies significantly across different countries and income groups.
• Lower feature engagement is associated with higher customer churn.
• Customer engagement remains relatively high across most customer segments.
• Interactive dashboard filters enable detailed customer analysis based on business dimensions.

Project Deliverables

Python Notebook

Contains data cleaning, preprocessing, feature engineering, and data validation.

SQL Queries

Contains analytical SQL queries used to generate business insights from the cleaned database.

Tableau Dashboard

Provides an interactive business intelligence dashboard with KPIs, trends, heatmaps, and customer segmentation analysis.

Quarantine Dataset

Contains records that failed validation rules and were excluded from the final analysis.

Skills Demonstrated

• Data Cleaning
• Data Validation
• Data Wrangling
• Feature Engineering
• SQL Query Writing
• MySQL Database Integration
• Business Intelligence
• Interactive Dashboard Design
• Data Visualisation
• Git Version Control
• GitHub Project Management

Business Value

This project enables organisations to better understand customer behaviour, identify customers at high risk of churn, monitor engagement levels, and support strategic decision-making through interactive business intelligence dashboards.

Future Improvements

• Develop machine learning models for churn prediction.
• Automate the ETL pipeline.
• Integrate live database connections.
• Deploy dashboards to cloud platforms.
• Add predictive analytics and advanced customer segmentation.

Repository Structure

Intelligent-Customer-Retention-Dashboard

data/
    Customer dataset
    Quarantine dataset

notebooks/
    Python data cleaning notebook

sql/
    SQL analytical queries

tableau/
    Tableau dashboard workbook
    Dashboard screenshot

README.md

requirements.txt

Conclusion

This project demonstrates a complete customer retention analytics solution using Python, SQL, and Tableau. It combines data preprocessing, database management, analytical querying, and interactive visualisation to deliver actionable business insights. The project highlights practical data analytics skills applicable to real-world business intelligence and customer retention scenarios.
