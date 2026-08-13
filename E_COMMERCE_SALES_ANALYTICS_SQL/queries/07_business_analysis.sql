USE ecommerce_analytics;

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COUNT(o.order_id) AS order_count,SUM(o.total_amount) AS total_spend
FROM customers c JOIN orders o ON c.customer_id=o.customer_id WHERE o.order_status='Delivered'
GROUP BY c.customer_id,customer_name ORDER BY total_spend DESC LIMIT 10;

SELECT product_name,stock_quantity FROM products WHERE stock_quantity<100 ORDER BY stock_quantity;

SELECT p.product_name,SUM(oi.quantity) AS units_sold,
SUM(oi.quantity*(oi.unit_price-p.cost_price)-oi.discount_amount) AS estimated_profit
FROM order_items oi JOIN products p ON oi.product_id=p.product_id JOIN orders o ON oi.order_id=o.order_id
WHERE o.order_status='Delivered' GROUP BY p.product_id,p.product_name ORDER BY estimated_profit DESC;

SELECT p.product_name,COUNT(r.review_id) AS review_count,ROUND(AVG(r.rating),2) AS average_rating
FROM products p LEFT JOIN reviews r ON p.product_id=r.product_id GROUP BY p.product_id,p.product_name
ORDER BY average_rating DESC;

SELECT o.order_id,s.expected_delivery,s.actual_delivery,DATEDIFF(s.actual_delivery,s.expected_delivery) AS days_late
FROM shipping s JOIN orders o ON s.order_id=o.order_id WHERE s.actual_delivery>s.expected_delivery;

SELECT order_status,COUNT(*) AS order_count,SUM(total_amount) AS order_value FROM orders GROUP BY order_status;

SELECT shipping_city,COUNT(*) AS orders,SUM(total_amount) AS revenue
FROM orders WHERE order_status='Delivered' GROUP BY shipping_city ORDER BY revenue DESC;

SELECT SUM(discount_amount) AS total_discount
FROM order_items oi JOIN orders o ON oi.order_id=o.order_id WHERE o.order_status='Delivered';

SELECT COUNT(*) AS repeat_customers FROM (
 SELECT customer_id FROM orders WHERE order_status='Delivered' GROUP BY customer_id HAVING COUNT(*)>1
) x;

SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,COALESCE(SUM(o.total_amount),0) AS total_spend,
CASE WHEN COALESCE(SUM(o.total_amount),0)>=20000 THEN 'VIP'
WHEN COALESCE(SUM(o.total_amount),0)>=10000 THEN 'High Value'
WHEN COALESCE(SUM(o.total_amount),0)>0 THEN 'Regular' ELSE 'No Purchase' END AS customer_segment
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id AND o.order_status='Delivered'
GROUP BY c.customer_id,customer_name ORDER BY total_spend DESC;
