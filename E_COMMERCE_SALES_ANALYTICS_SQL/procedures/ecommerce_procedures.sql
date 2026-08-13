USE ecommerce_analytics;

DROP PROCEDURE IF EXISTS GetCustomerOrders;
DROP PROCEDURE IF EXISTS GetProductSales;
DROP PROCEDURE IF EXISTS GetSalesByDateRange;

DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN p_customer_id INT)
BEGIN
 SELECT order_id,order_date,total_amount,order_status FROM orders
 WHERE customer_id=p_customer_id ORDER BY order_date DESC;
END //

CREATE PROCEDURE GetProductSales(IN p_product_id INT)
BEGIN
 SELECT p.product_name,COALESCE(SUM(oi.quantity),0) AS units_sold,
 COALESCE(SUM(oi.quantity*oi.unit_price-oi.discount_amount),0) AS revenue
 FROM products p LEFT JOIN order_items oi ON p.product_id=oi.product_id
 LEFT JOIN orders o ON oi.order_id=o.order_id AND o.order_status='Delivered'
 WHERE p.product_id=p_product_id GROUP BY p.product_id,p.product_name;
END //

CREATE PROCEDURE GetSalesByDateRange(IN p_start_date DATE,IN p_end_date DATE)
BEGIN
 SELECT COUNT(*) AS order_count,COALESCE(SUM(total_amount),0) AS revenue,
 COALESCE(AVG(total_amount),0) AS average_order_value
 FROM orders WHERE order_date BETWEEN p_start_date AND p_end_date AND order_status='Delivered';
END //

DELIMITER ;
