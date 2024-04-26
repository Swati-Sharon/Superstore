
-- To obtain first 5 rows from database
SELECT top 15 *
FROM [SalesAnalysis].[dbo].[superstore]


--2. Total Sales yearwise
SELECT YEAR(Order_Date) AS Year,
SUM(sales) AS Total_Sales
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY YEAR(Order_Date)
ORDER BY Year;

--Note
ALTER TABLE [SalesAnalysis].[dbo].[superstore]
ALTER COLUMN profit DECIMAL(10,4);


 --3 Total Profit yearwise
SELECT YEAR(Order_Date) AS Year,
SUM(profit) AS Total_Profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY YEAR(Order_Date)
ORDER BY Year;

--4. Total Sales and Profit Regionwise
SELECT region,
ROUND(SUM(sales),2) AS Total_Sales,SUM(profit) AS Total_Profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY region
ORDER BY Total_Profit DESC;


--top 10 state by sales and profit
SELECT TOP 10 state,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profits,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS profit_margin
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY state
ORDER BY Total_Profits DESC;

--top 10 city by sales and profit
SELECT TOP 10 CITY,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profits,
ROUND((SUM(Profit)/SUM(Sales))*100,2)AS profit_margin
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY city
ORDER BY Total_Profits DESC;

SELECT Discount, AVG(Sales) AS Avg_Sales
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY Discount
ORDER BY Discount;


--Note
ALTER TABLE [SalesAnalysis].[dbo].[superstore]
ALTER COLUMN discount decimal(10,4);

SELECT category, SUM(discount) AS total_discount
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY category
ORDER BY total_discount DESC;

SELECT category, Sub_Category, SUM(discount) AS total_discount
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY category, Sub_Category
ORDER BY total_discount DESC;

SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit, ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY category
ORDER BY total_profit DESC;

SELECT region, category, SUM(sales) AS Total_Sales, SUM(profit) AS Total_Profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY region, category
ORDER BY total_profit DESC;

Select DISTINCT category
FROM [SalesAnalysis].[dbo].[superstore]

--to obtain highest sales and dprofit per category per state
SELECT state, category, SUM(sales) AS Total_Sales, SUM(profit) AS Total_Profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY state, category
ORDER BY total_profit DESC;


--total sales and total profits of each subcategory with their profit margins
SELECT sub_category, SUM(sales) AS total_sales, SUM(profit) AS total_profit, ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY sub_category
ORDER BY total_profit DESC;
--so copier has highest sales margin in subcategory

--To obtain which subcategory generate highest sales and profit regionwise
SELECT region, category, sub_category, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY region,category, sub_category
ORDER BY total_profit DESC;

--highest total sales and total profits per subcategory statewise
SELECT state, sub_category, SUM(sales) AS total_sales, SUM(profit) AS total_profit,ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY state, sub_category
ORDER BY total_profit DESC;

--least profitable and highest profitable product
SELECT product_name, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY product_name
ORDER BY total_profit DESC;

SELECT product_name, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY product_name
ORDER BY total_profit ASC;

--to obtain segment which makes maximum sales and profit
SELECT segment, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY segment
ORDER BY total_profit DESC;

-----------------------------------------------------------------------------------------------------------------------

--total customer 
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM [SalesAnalysis].[dbo].[superstore]

--total customer yearwise
SELECT YEAR(Order_Date) AS Year,
COUNT(DISTINCT customer_id) AS Total_Customers
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY YEAR(Order_Date)
ORDER BY Year;

--total customer regionwise :
SELECT region, COUNT(DISTINCT customer_id) AS total_customers
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY region
ORDER BY total_customers DESC;


--total customer statewise :
SELECT state, COUNT(DISTINCT customer_id) AS total_customers
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY state
ORDER BY total_customers DESC;

---------------------------------------------------------------------------------------------------------------------

--customer segmentation 
SELECT TOP 15 customer_id,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY customer_id
ORDER BY total_sales DESC;

--------------------------------------------------------------------------------------------------------------------------

--shipping 
SELECT AVG(DATEDIFF(day, order_date, ship_date)) AS avg_shipping_time
FROM [SalesAnalysis].[dbo].[superstore];


-- shipping time in each shipping mode is
SELECT ship_mode,
ROUND(AVG(DATEDIFF(day, order_date, ship_date)), 1) AS avg_shipping_time
FROM [SalesAnalysis].[dbo].[superstore]
GROUP BY ship_mode
ORDER BY avg_shipping_time;
