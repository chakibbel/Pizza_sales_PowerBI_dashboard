
-- Calculate the total revenue from pizza sales
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

-- Calculate the average order value by dividing total revenue by the number of distinct orders
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value 
FROM pizza_sales;

-- Calculate the total number of pizzas sold
SELECT SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales;

-- Count the total number of distinct orders
SELECT COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales;

-- Calculate the average number of pizzas per order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Average_pizza_per_order 
FROM pizza_sales;

-- Group orders by day of the week and count the total number of orders per day
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'));

-- Group orders by hour and count the total number of orders per hour
SELECT DATEPART(HOUR, order_time) AS order_hours, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

-- Calculate the total revenue and the percentage of total revenue for each pizza category
SELECT pizza_category, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- Calculate the total revenue for each pizza size and percentage of total revenue
SELECT pizza_size, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size;
