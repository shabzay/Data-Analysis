-- EXPLORING THE ORDER_DETAILS TABLE
USE restaurant_db;
SELECT * FROM order_details;
-- What is the date range for orders in the table
SELECT MAX(order_date), MIN(order_date) FROM order_details;

-- The number of orders were made within the date range
SELECT COUNT(DISTINCT order_id) FROM order_details; 

-- Number of items ordered
SELECT COUNT(DISTINCT order_details_id) FROM order_details; 

-- Which orders had the most number of items
SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details 
GROUP BY order_id 
ORDER BY num_order DESC; 

-- How many orders had more than 12 items
SELECT COUNT(*) count_orders FROM (SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details 
GROUP BY order_id 
HAVING num_items>12) AS num_order; 