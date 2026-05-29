CREATE DATABASE sales_db;
USE sales_db;
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
    Customer_ID INT
);
SELECT COUNT(*) FROM sales_data;
SELECT * FROM sales_data LIMIT 5;
ALTER TABLE sales_data ADD order_date_new DATE;
SET SQL_SAFE_UPDATES = 0;

UPDATE sales_data
SET order_date_new = STR_TO_DATE(Order_Date, '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;
SELECT Order_Date, order_date_new FROM sales_data LIMIT 5;

-- sum of sales --
SELECT SUM(Sales_Amount) AS Total_Sales
FROM sales_data;

-- sales by region --
SELECT Region, SUM(Sales_Amount) AS Region_Sales
FROM sales_data
GROUP BY Region
ORDER BY Region_Sales DESC;

-- Sales by Category --
SELECT Category, SUM(Sales_Amount) AS Category_Sales
FROM sales_data
GROUP BY Category order by Category_sales desc;

-- Top 5 Products by Sales --
SELECT Product, SUM(Sales_Amount) AS Product_Sales
FROM sales_data
GROUP BY Product
ORDER BY Product_Sales DESC
LIMIT 5;

use sales_db;
-- Monthly Sales Trend --
SELECT Year, Month_Year, SUM(Sales_Amount) AS Monthly_Sales
FROM sales_data
GROUP BY Year, Month_Year
ORDER BY Year , Month_Year ;


-- Average Discount by Category --
SELECT Category, AVG(Discount) AS Avg_Discount
FROM sales_data
GROUP BY Category;

-- Customers with Highest Purchase Value --
SELECT Customer_ID, SUM(Sales_Amount) AS Total_Spent
FROM sales_data
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 5;

-- Orders After a Specific Date (Now Works!) --
SELECT *
FROM sales_data
WHERE order_date_new >= '2024-03-01';

SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Sales_Amount) AS Total_Revenue,
    ROUND(AVG(Sales_Amount),2) AS Avg_Order_Value
FROM sales_data;


