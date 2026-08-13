USE ecommerce_analytics;

SELECT product_id,product_name,unit_price FROM products
WHERE unit_price>(SELECT AVG(unit_price) FROM products);

SELECT product_id,product_name FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM reviews);

SELECT customer_id,CONCAT(first_name,' ',last_name) AS customer_name FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,SUM(o.total_amount) AS total_spend
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
WHERE o.order_status='Delivered'
GROUP BY c.customer_id,customer_name
HAVING SUM(o.total_amount)>(SELECT AVG(x.spend) FROM
 (SELECT SUM(total_amount) AS spend FROM orders WHERE order_status='Delivered' GROUP BY customer_id) x);
