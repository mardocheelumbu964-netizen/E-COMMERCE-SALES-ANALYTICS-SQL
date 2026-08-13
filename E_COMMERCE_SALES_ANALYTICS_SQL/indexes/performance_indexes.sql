USE ecommerce_analytics;

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date_status ON orders(order_date,order_status);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_payments_method_status ON payments(payment_method,payment_status);
CREATE INDEX idx_shipping_status ON shipping(shipping_status);
CREATE INDEX idx_reviews_product ON reviews(product_id);
