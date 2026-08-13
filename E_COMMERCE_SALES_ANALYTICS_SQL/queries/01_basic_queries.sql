USE ecommerce_analytics;
SELECT * FROM customers;
SELECT * FROM products ORDER BY unit_price DESC;
SELECT * FROM orders ORDER BY order_date DESC;
SELECT * FROM orders WHERE order_status='Delivered';
SELECT product_name,unit_price,stock_quantity FROM products WHERE stock_quantity<100 ORDER BY stock_quantity;
