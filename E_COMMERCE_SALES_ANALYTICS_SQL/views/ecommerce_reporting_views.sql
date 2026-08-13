USE ecommerce_analytics;

CREATE OR REPLACE VIEW vw_order_details AS
SELECT o.order_id,o.order_date,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
p.product_name,cat.category_name,oi.quantity,oi.unit_price,oi.discount_amount,
(oi.quantity*oi.unit_price-oi.discount_amount) AS line_total,o.order_status
FROM orders o JOIN customers c ON o.customer_id=c.customer_id
JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id
JOIN categories cat ON p.category_id=cat.category_id;

CREATE OR REPLACE VIEW vw_customer_sales AS
SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,c.city,
COUNT(o.order_id) AS order_count,COALESCE(SUM(o.total_amount),0) AS total_spend,
COALESCE(AVG(o.total_amount),0) AS average_order_value
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id AND o.order_status='Delivered'
GROUP BY c.customer_id,customer_name,c.city;

CREATE OR REPLACE VIEW vw_product_performance AS
SELECT p.product_id,p.product_name,cat.category_name,p.unit_price,p.stock_quantity,
COALESCE(SUM(oi.quantity),0) AS units_sold,
COALESCE(SUM(oi.quantity*oi.unit_price-oi.discount_amount),0) AS revenue
FROM products p JOIN categories cat ON p.category_id=cat.category_id
LEFT JOIN order_items oi ON p.product_id=oi.product_id
LEFT JOIN orders o ON oi.order_id=o.order_id AND o.order_status='Delivered'
GROUP BY p.product_id,p.product_name,cat.category_name,p.unit_price,p.stock_quantity;
