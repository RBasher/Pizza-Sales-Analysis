--1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
--2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
--3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
--4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM  [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
--5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
--B. Hourly Trend for Total Pizzas Sold
SELECT DATEPART(HOUR, order_time) as order_hours, SUM(quantity) as total_pizzas_sold
from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)
--C. Weekly Trend for Orders

SELECT 
    DATEPART(ISO_WEEK, order_date) AS WeekNumber,
    YEAR(order_date) AS Year,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
   [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]

GROUP BY 
    DATEPART(ISO_WEEK, order_date),
    YEAR(order_date)
ORDER BY 
    Year, WeekNumber;
--D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales])  AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]

GROUP BY pizza_category;

--E. % of Sales by Pizza Size
SELECT pizza_size, 
CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
GROUP BY pizza_size
ORDER BY pizza_size;

--F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
--G. Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]

GROUP BY pizza_name
ORDER BY Total_Revenue DESC;
--H. Bottom 5 Pizzas by Revenue
select top 5 pizza_name,sum(total_price)as Rev
from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
group by pizza_name
order by Rev
--I. Top 5 Pizzas by Quantity
select top 5 pizza_name,sum(quantity) as Total_Pizza
from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
group by pizza_name
order by Total_Pizza DESC;
--J. Top 5 Pizzas by Quantity
select top 5 pizza_name,sum(quantity) as Total_Pizza
from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
group by pizza_name
order by Total_Pizza ;
-- K. Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(distinct order_id) AS Total_Orders
from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Orders DESC
--L. Borrom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(distinct order_id) AS Total_Orders
from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Orders;

select * from [dbo].[pizza_sales_excel_file.xlsx - pizza_sales]
