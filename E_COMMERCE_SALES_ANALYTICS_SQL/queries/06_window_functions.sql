USE ecommerce_analytics;

WITH product_sales AS (
 SELECT p.product_id,p.product_name,SUM(oi.quantity*oi.unit_price-oi.discount_amount) AS revenue
 FROM order_items oi JOIN products p ON oi.product_id=p.product_id JOIN orders o ON oi.order_id=o.order_id
 WHERE o.order_status='Delivered' GROUP BY p.product_id,p.product_name
)
SELECT product_id,product_name,revenue,RANK() OVER(ORDER BY revenue DESC) AS revenue_rank FROM product_sales;

WITH customer_sales AS (
 SELECT customer_id,SUM(total_amount) AS total_spend FROM orders
 WHERE order_status='Delivered' GROUP BY customer_id
)
SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,cs.total_spend,
DENSE_RANK() OVER(ORDER BY cs.total_spend DESC) AS customer_rank
FROM customer_sales cs JOIN customers c ON cs.customer_id=c.customer_id;

WITH monthly_sales AS (
 SELECT DATE_FORMAT(order_date,'%Y-%m') AS sales_month,SUM(total_amount) AS revenue
 FROM orders WHERE order_status='Delivered' GROUP BY DATE_FORMAT(order_date,'%Y-%m')
)
SELECT sales_month,revenue,LAG(revenue) OVER(ORDER BY sales_month) AS previous_month_revenue,
ROUND((revenue-LAG(revenue) OVER(ORDER BY sales_month))/NULLIF(LAG(revenue) OVER(ORDER BY sales_month),0)*100,2) AS growth_percent
FROM monthly_sales;

WITH product_sales AS (
 SELECT p.product_id,p.product_name,p.category_id,SUM(oi.quantity*oi.unit_price-oi.discount_amount) AS revenue
 FROM order_items oi JOIN products p ON oi.product_id=p.product_id JOIN orders o ON oi.order_id=o.order_id
 WHERE o.order_status='Delivered' GROUP BY p.product_id,p.product_name,p.category_id
), ranked AS (
 SELECT *,ROW_NUMBER() OVER(PARTITION BY category_id ORDER BY revenue DESC) AS rn FROM product_sales
)
SELECT r.product_name,c.category_name,r.revenue FROM ranked r JOIN categories c ON r.category_id=c.category_id WHERE r.rn<=3;
