USE ecommerce_analytics;

SELECT o.order_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,o.order_date,o.total_amount,o.order_status
FROM orders o JOIN customers c ON o.customer_id=c.customer_id;

SELECT p.product_name,c.category_name,p.brand,p.unit_price,p.stock_quantity
FROM products p JOIN categories c ON p.category_id=c.category_id;

SELECT o.order_id,p.product_name,oi.quantity,oi.unit_price,oi.discount_amount
FROM order_items oi JOIN orders o ON oi.order_id=o.order_id JOIN products p ON oi.product_id=p.product_id;

SELECT o.order_id,s.courier,s.expected_delivery,s.actual_delivery,s.shipping_status
FROM shipping s JOIN orders o ON s.order_id=o.order_id;
