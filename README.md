Intelligent Customer Churn Prediction Analysis

Project Overview

The Intelligent Customer Churn Prediction Analysis project is an end-to-end data analytics solution developed using Python, MySQL, SQL, and Tableau. The primary objective of the project is to analyse customer behaviour, identify customers who are at risk of churning, and provide meaningful business insights through interactive visualisations. The project demonstrates the complete analytics lifecycle, beginning with data ingestion and preprocessing, followed by feature engineering, database integration, advanced SQL analysis, and the development of an executive Tableau dashboard. The solution enables organisations to understand customer engagement patterns, monitor churn risk, and support data-driven customer retention strategies.

Project Objectives

The main objective of this project is to build a robust customer churn analytics pipeline that transforms raw customer data into actionable business insights. The project focuses on cleaning and validating customer records, identifying and quarantining invalid data, recalculating AI risk categories using business rules, engineering meaningful customer engagement features, loading the processed data into a MySQL database, performing advanced SQL analysis, and presenting key findings through an interactive Tableau dashboard.

Tools and Technologies

This project was developed using Python for data preprocessing and feature engineering, Pandas and NumPy for data manipulation, SQLAlchemy for database integration, MySQL for relational database management, SQL for business analysis, Tableau Public for dashboard development, and Git and GitHub for version control and project management.

Project Workflow

The project begins by importing the customer churn dataset into Python, where data types are standardised by converting date fields into datetime format and ensuring numerical consistency across financial and behavioural attributes. The dataset is then cleaned by removing duplicate records, correcting inconsistent values, standardising categorical variables, and validating numerical fields to improve overall data quality. Business validation rules are implemented to identify impossible customer behaviours, such as customers recording monthly transactions despite having zero application sessions. These invalid records are separated into a quarantine dataset for auditing purposes while only validated records proceed to further analysis.

Following data validation, the original AI Risk Band is recalculated using predefined business rules based on the Core Feature Score, ensuring consistent customer risk categorisation into High, Medium, and Low risk groups. Additional business-oriented features are then engineered to enhance customer analysis, including Customer Friction Score, Plan Transaction Volatility Index, Credit Score Bands, Income Bands, customer segmentation attributes, and engagement indicators. These engineered features provide richer analytical capabilities for identifying customer behaviour patterns and churn risk.

Once preprocessing is complete, the validated and enriched dataset is securely loaded into a MySQL database using SQLAlchemy, with database credentials managed through environment variables stored in a .env file. The processed dataset is stored in the neobank_customer_churn table, enabling efficient SQL-based analytical processing.

SQL Analysis

Advanced SQL queries are executed directly on the MySQL database to answer key business questions related to customer churn and engagement. The analysis includes identifying customer segments with low deposit coverage and high service friction, detecting customers experiencing friction spikes based on support ticket activity, evaluating feature engagement differences between completed and pending KYC verification statuses, and auditing potential false churn predictions. These queries utilise correlated subqueries, conditional aggregation, and advanced HAVING clauses while adhering to the project constraints of avoiding Common Table Expressions (CTEs) and window functions.

Tableau Dashboard

The final stage of the project involves designing an interactive Tableau dashboard that provides executive-level insights into customer churn and engagement. The dashboard includes KPI cards displaying Average AI Churn Risk Score, Average Core Feature Score, and Average Customer Engagement Rate, along with a monthly churn trend line chart, a Country versus Income Band heatmap, an AI Risk Distribution chart, and interactive filters for exploring customer data across multiple business dimensions. These visualisations enable stakeholders to monitor customer behaviour, identify high-risk customer groups, and analyse engagement trends effectively.

Key Business Insights

The analysis reveals that the majority of customers belong to the Low AI Risk category following the recalculation of business risk rules. Customer churn risk varies across subscription plans, countries, and income groups, while lower Core Feature Scores are strongly associated with increased churn risk. Customers experiencing frequent failed logins and support tickets generally exhibit higher operational friction and are more likely to require intervention. Premium subscription customers typically demonstrate stronger engagement than lower-tier plans, and the interactive dashboard enables users to drill down into customer segments for detailed business analysis.

Project Deliverables

The project deliverables include a comprehensive Python notebook containing data preprocessing, validation, feature engineering, AI risk recalculation, quarantine dataset generation, and MySQL database loading; a SQL script containing advanced analytical queries used to generate business insights; an interactive Tableau dashboard providing executive-level visualisations and KPIs; and a quarantine dataset containing customer records that failed business validation rules and were excluded from the final analytical dataset.

Skills Demonstrated

This project demonstrates practical expertise in data cleaning, data validation, data wrangling, feature engineering, Python programming, business rule implementation, MySQL database integration, SQL query development, conditional aggregation, correlated subqueries, business intelligence, Tableau dashboard development, data visualisation, Git version control, and GitHub project management. It also showcases the ability to build secure and scalable analytics pipelines using industry-standard tools and best practices.

Business Value

The Intelligent Customer Churn Prediction Analysis project provides organisations with valuable insights into customer behaviour, enabling them to identify customers at high risk of churn, monitor engagement levels, evaluate operational friction, assess subscription plan performance, and support strategic customer retention initiatives. By combining automated data preprocessing, advanced SQL analysis, and interactive business intelligence dashboards, the project helps decision-makers make informed, data-driven business decisions.

Future Improvements

Future enhancements to the project include integrating machine learning models for predictive churn classification, automating the complete ETL pipeline, implementing real-time database connectivity, deploying dashboards to Tableau Server or Tableau Cloud, incorporating customer lifetime value prediction, and developing automated churn monitoring and alert systems that proactively notify business users of emerging customer retention risks.

Conclusion

The Intelligent Customer Churn Prediction Analysis project demonstrates a complete end-to-end analytics solution that combines Python-based data engineering, secure database integration, advanced SQL analytics, and interactive Tableau visualisation to solve a real-world customer retention problem. By transforming raw customer data into actionable business insights, the project highlights practical skills in data analytics, business intelligence, database management, and dashboard development, making it highly relevant for modern data analyst and business intelligence roles.
