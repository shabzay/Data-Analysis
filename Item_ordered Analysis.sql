-- ANALYZE CUSTOMER BEHAVIOR
USE restaurant_db;
-- Combine the menu_items and order_details tables into a single table.alte
SELECT * FROM menu_items; 
SELECT * FROM order_details;

SELECT * FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
    
-- What were the least and most ordered items and what categories were they in?
SELECT item_name, COUNT(order_id) AS num_purchases FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    GROUP BY item_name
    ORDER BY num_purchases ASC LIMIT 1;
    
SELECT item_name, COUNT(order_id) AS num_purchases FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    GROUP BY item_name
    ORDER BY num_purchases DESC LIMIT 1;
    
-- What were the top five orders that spent the most money?
SELECT order_id, SUM(price) AS total_amt FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    GROUP BY order_id ORDER BY total_amt DESC LIMIT  5;
    
-- View the details of the highest spend order. What insights can you gather from the results?
SELECT order_id, category, COUNT(item_id) FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    WHERE order_id = 440
    GROUP BY order_id, category
    ORDER BY category ASC; 
    
-- View the highest top five  spend orders. What insights can you gather from the results
    SELECT order_id, category, COUNT(item_id) FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    WHERE order_id IN (440, 2075, 1957,330, 2675)
    GROUP BY order_id, category; 
    
    -- In conclusion, the Italian item category is having the highest order 
    -- and the Restaurant needs to increase the production of the items for productivity
    
  SELECT order_id, SUM(price) FROM order_details od 
    LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id WHERE order_id = 440 GROUP BY order_id; 