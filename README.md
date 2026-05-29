# Sales-Data-Analysis-Using-SQL

## Introduction
This project focuses on analyzing a cleaned sales dataset using SQL (MySQL). The objective is to import, clean,
and analyze sales data to generate meaningful business insights. The project demonstrates practical SQL skills
suitable for academic submissions, internships, and entry-level data analyst roles.
## Objectives of the Project
- Import a real-world sales dataset into MySQL
- Design database and table structures
- Resolve date datatype issues
- Perform sales and KPI analysis using SQL
- Extract insights for business decisions
## Tools and Technologies Used
- Database: MySQL
- Interface: MySQL Workbench
- Dataset Format: CSV
- Language: SQL
##  Dataset Description
Dataset Name: Beginner_Sales_Data_CLEANED.csv
Number of Rows: 300
Number of Columns: 13
## Column Description
Order_ID – Unique order identifier
Order_Date – Date of order (DD-MM-YYYY format)
Month_Year – Month and year of order
Year – Year of sale
Month – Month name
Region – Sales region
Category – Product category
Product – Product name
Quantity – Quantity sold
Unit_Price – Price per unit
Discount – Discount applied
Sales_Amount – Final sales value
Customer_ID – Unique customer identifier
##  Database Creation
CREATE DATABASE sales_db;
USE sales_db;
## Table Creation
The Order_Date column was initially stored as VARCHAR to avoid import errors.
CREATE TABLE sales_data (
Order_ID INT,
Order_Date VARCHAR(20),
Month_Year VARCHAR(20),
Year INT,
Month VARCHAR(10),
Region VARCHAR(20),
Category VARCHAR(50),
Product VARCHAR(50),
Quantity INT,
Unit_Price INT,
Discount DECIMAL(4,2),
Sales_Amount DECIMAL(10,2),
Customer_ID INT );
## Data Import
The CSV file was imported using MySQL Workbench Table Data Import Wizard by selecting 'Use Existing Table'
to avoid datatype mismatch issues.
## Date Conversion
ALTER TABLE sales_data ADD order_date_new DATE;
UPDATE sales_data SET order_date_new = STR_TO_DATE(Order_Date, '%d-%m-%Y');
10. SQL Analysis Queries
Total Sales:
SELECT SUM(Sales_Amount) FROM sales_data;
Sales by Region:
SELECT Region, SUM(Sales_Amount) FROM sales_data GROUP BY Region;
Top Products:
SELECT Product, SUM(Sales_Amount) FROM sales_data GROUP BY Product ORDER BY SUM(Sales_Amount)
DESC LIMIT 5;
## KPI Analysis
COUNT(DISTINCT Order_ID) AS Total Orders
COUNT(DISTINCT Customer_ID) AS Total Customers
SUM(Quantity) AS Total Quantity Sold
SUM(Sales_Amount) AS Total Revenue
AVG(Sales_Amount) AS Average Order Value
<img width="1413" height="262" alt="Screenshot 2026-05-29 081352" src="https://github.com/user-attachments/assets/55f82421-4c96-4b65-a2ef-a9c0af3682b9" />
<img width="287" height="184" alt="Screenshot 2026-05-29 081448" src="https://github.com/user-attachments/assets/7ad1515c-f93e-418a-8d9d-92845211298d" />
<img width="340" height="160" alt="Screenshot 2026-05-29 081507" src="https://github.com/user-attachments/assets/d9e206af-c65b-4789-aee6-63e954ff1f23" />
<img width="351" height="227" alt="Screenshot 2026-05-29 081539" src="https://github.com/user-attachments/assets/691b1543-c717-4c46-90c8-3a130a403415" />
<img width="807" height="410" alt="Screenshot 2026-05-29 081651" src="https://github.com/user-attachments/assets/477cec34-8d9b-4a23-bb14-a6496c717e81" />
<img width="696" height="400" alt="Screenshot 2026-05-29 081720" src="https://github.com/user-attachments/assets/15301d36-30ae-4ae8-8f73-cf2bc16af5c5" />
<img width="659" height="389" alt="Screenshot 2026-05-29 081746" src="https://github.com/user-attachments/assets/3d2da33f-aaed-4a2c-a29d-55f37ada228a" />

## Conclusion
This project demonstrates how SQL can be effectively used to clean, manage, and analyze sales data. It builds a
strong foundation for data analysis roles.
