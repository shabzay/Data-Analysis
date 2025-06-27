-- EXPLORING THE MENU ITEMS TABLE
USE restaurant_db;
-- view Menu Items
SELECT * FROM menu_items;
-- find the number of Items on the menu table
SELECT COUNT(*) FROM menu_items;
-- Least and most Expensive Items on the menu
SELECT * FROM menu_items ORDER BY price ASC LIMIT 1;
SELECT * FROM menu_items ORDER BY price DESC LIMIT 1;

-- How many Italian dishes are on the Menu
SELECT COUNT(*) FROM menu_items
WHERE category= "Italian";

-- What are the least and most expensive Italian dishes on the Menu
SELECT * FROM menu_items WHERE category= "Italian" ORDER BY price ASC LIMIT 1;
SELECT * FROM menu_items WHERE category= "Italian" ORDER BY price DESC LIMIT 1;

-- How many dishes are in  each category
SELECT category, COUNT(category) AS num_cat FROM menu_items GROUP BY category;

-- What is the avgerage dish price within each category
SELECT category, AVG(price) AS avg_cat FROM menu_items GROUP BY category;

