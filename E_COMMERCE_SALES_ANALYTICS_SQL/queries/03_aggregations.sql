USE ecommerce_analytics;

SELECT SUM(total_amount) AS total_revenue FROM orders WHERE order_status IN ('Delivered','Shipped');

SELECT ROUND(AVG(total_amount),2) AS average_order_value FROM orders WHERE order_status='Delivered';

SELECT c.category_name,SUM(oi.quantity*oi.unit_price-oi.discount_amount) AS revenue
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
JOIN categories c ON p.category_id=c.category_id JOIN orders o ON oi.order_id=o.order_id
WHERE o.order_status='Delivered' GROUP BY c.category_name ORDER BY revenue DESC;

SELECT p.product_name,SUM(oi.quantity*oi.unit_price-oi.discount_amount) AS revenue,SUM(oi.quantity) AS units_sold
FROM order_items oi JOIN products p ON oi.product_id=p.product_id JOIN orders o ON oi.order_id=o.order_id
WHERE o.order_status='Delivered' GROUP BY p.product_id,p.product_name ORDER BY revenue DESC;

SELECT payment_method,COUNT(*) AS transactions,SUM(amount) AS total_amount
FROM payments GROUP BY payment_method ORDER BY total_amount DESC;

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COUNT(o.order_id) AS orders,SUM(o.total_amount) AS total_spend
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_id,customer_name ORDER BY total_spend DESC;
