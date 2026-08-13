USE ecommerce_analytics;

WITH monthly_sales AS (
 SELECT DATE_FORMAT(order_date,'%Y-%m') AS sales_month,SUM(total_amount) AS revenue,COUNT(*) AS order_count
 FROM orders WHERE order_status='Delivered' GROUP BY DATE_FORMAT(order_date,'%Y-%m')
)
SELECT * FROM monthly_sales ORDER BY sales_month;

WITH customer_sales AS (
 SELECT customer_id,SUM(total_amount) AS lifetime_value,COUNT(*) AS order_count
 FROM orders WHERE order_status='Delivered' GROUP BY customer_id
)
SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,cs.order_count,cs.lifetime_value
FROM customer_sales cs JOIN customers c ON cs.customer_id=c.customer_id ORDER BY lifetime_value DESC;

WITH category_sales AS (
 SELECT c.category_name,SUM(oi.quantity*oi.unit_price-oi.discount_amount) AS revenue
 FROM order_items oi JOIN products p ON oi.product_id=p.product_id JOIN categories c ON p.category_id=c.category_id
 JOIN orders o ON oi.order_id=o.order_id WHERE o.order_status='Delivered' GROUP BY c.category_name
)
SELECT category_name,revenue,ROUND(revenue/SUM(revenue) OVER()*100,2) AS revenue_percentage
FROM category_sales ORDER BY revenue DESC;
